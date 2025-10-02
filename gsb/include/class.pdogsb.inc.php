<?php

class PdoGsb{   		
      	private static $serveur='mysql:host=localhost';
      	private static $bdd='dbname=gsbextranet';   		
      	private static $user='root' ;    		
      	private static $mdp='' ;	
	private static $monPdo;
	private static $monPdoGsb=null;

    private function __construct() {
        try {
            PdoGsb::$monPdo = new PDO(
                PdoGsb::$serveur.';'.PdoGsb::$bdd, 
                PdoGsb::$user, 
                PdoGsb::$mdp,
                [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
            ); 
            PdoGsb::$monPdo->query("SET NAMES utf8");
        } catch (PDOException $e) {
            die('Erreur de connexion : ' . $e->getMessage());
        }
    }

    public function __destruct() {
        PdoGsb::$monPdo = null;
    }

    public static function getPdoGsb() {
        if (PdoGsb::$monPdoGsb == null) {
            PdoGsb::$monPdoGsb = new PdoGsb();
        }
        return PdoGsb::$monPdoGsb;  
    }

    public function checkUser(string $login, string $pwd): bool {
        $pdo = PdoGsb::$monPdo;
        $stmt = $pdo->prepare("SELECT motDePasse FROM medecin WHERE mail = :login AND token IS NULL");
        $stmt->bindValue(':login', $login, PDO::PARAM_STR);

        if ($stmt->execute()) {
            $unUser = $stmt->fetch();
            if (is_array($unUser) && $pwd == $unUser['motDePasse']) {
                return true;
            }
        }
        return false;
    }

    public function donneLeMedecinByMail(string $login): ?array {
        $pdo = PdoGsb::$monPdo;
        $stmt = $pdo->prepare("SELECT id, nom, prenom, mail FROM medecin WHERE mail = :login");
        $stmt->bindValue(':login', $login, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC) ?: null;
    }

    public function tailleChampsMail(): int {
        $stmt = PdoGsb::$monPdo->prepare(
            "SELECT CHARACTER_MAXIMUM_LENGTH 
             FROM INFORMATION_SCHEMA.COLUMNS
             WHERE table_name = 'medecin' AND COLUMN_NAME = 'mail'"
        );
        $stmt->execute();
        $result = $stmt->fetch();
        return (int)$result[0];
    }

    public function creeMedecin(string $email, string $mdp): bool {
        $stmt = PdoGsb::$monPdo->prepare(
            "INSERT INTO medecin(id, mail, motDePasse, dateCreation, dateConsentement) 
             VALUES (NULL, :leMail, :leMdp, NOW(), NOW())"
        );
        $stmt->bindValue(':leMail', $email, PDO::PARAM_STR);
        $stmt->bindValue(':leMdp', $mdp, PDO::PARAM_STR);
        return $stmt->execute();
    }

    public function testMail(string $email): bool {
        $stmt = PdoGsb::$monPdo->prepare(
            "SELECT COUNT(*) as nbMail FROM medecin WHERE mail = :leMail"
        );
        $stmt->bindValue(':leMail', $email);
        $stmt->execute();
        $result = $stmt->fetch();
        return $result['nbMail'] > 0;
    }

    public function connexionInitiale(string $mail): bool {
        $medecin = $this->donneLeMedecinByMail($mail);
        if (!$medecin) return false;
        return $this->ajouteConnexionInitiale((int)$medecin['id']);
    }

    public function ajouteConnexionInitiale(int $id): bool {
        $stmt = PdoGsb::$monPdo->prepare(
            "INSERT INTO historiqueconnexion (idMedecin, dateDebutLog, dateFinLog)
             VALUES (:leMedecin, NOW(), NOW())"
        );
        $stmt->bindValue(':leMedecin', $id, PDO::PARAM_INT);
        return $stmt->execute();
    }

    public function donneInfosMedecin(int $id): ?array {
        $stmt = PdoGsb::$monPdo->prepare(
            "SELECT id, nom, prenom FROM medecin WHERE id = :lId"
        );
        $stmt->bindValue(':lId', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC) ?: null;
    }

    public function rehashMotsDePasse(): void {
        $stmt = PdoGsb::$monPdo->query("SELECT id, motDePasse FROM medecin");
        $medecins = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($medecins as $m) {
            if (strlen($m['motDePasse']) < 60) {
                $hash = password_hash($m['motDePasse'], PASSWORD_DEFAULT);
                $upd = PdoGsb::$monPdo->prepare("UPDATE medecin SET motDePasse = :hash WHERE id = :id");
                $upd->execute([':hash' => $hash, ':id' => $m['id']]);
                echo "Mot de passe du médecin mis à jour.\n";
            }
        }
    }

    public function droitPortabilite($userId) {
        $stmt = PdoGsb::$monPdo->prepare(
            "SELECT nom, prenom, mail, dateNaissance, dateConsentement FROM medecin WHERE id = :id"
        );
        $stmt->bindValue(':id', $userId, PDO::PARAM_INT);
        $stmt->execute();
        $data=$stmt->fetch(PDO::FETCH_ASSOC);   
        return $data;
    }
}
?>