-- FORMATION SQL 21/04/2025--
-- ** Application Leçon 1 **

-- Q1) Affichez tous les employés de la table employes
SELECT *
FROM Employes ;

-- Q2) Afficher uniquement les colonnes Prénom, Nom, Pays des employés
SELECT Prenom, Nom, Pays
FROM Employes;

-- Q3) Selectionner tous les employés dont le pays est la RDC
SELECT * 
FROM Employes 
WHERE Pays = 'RDC';


-- Q4) Afficher les employés ayant un salaire supérieur à 90.000
SELECT * 
FROM Employes 
WHERE Salaire > 90000;


-- Q5) Lister les employés ayant été ambauché après le 1er Janvier 2020
SELECT * 
FROM Employes 
WHERE DateEmbauche > '2020-02-01';


-- Q6) Afficher les employés dont le prénom commence par la lettre "A"
SELECT * 
FROM Employes 
WHERE Prenom LIKE 'A%'


-- Q6) Bis- Afficher les employés dont le prénom Contient la lettre "A"
SELECT * 
FROM Employes 
WHERE Prenom LIKE '%A%'


-- Q6) Bis2- Afficher les employés dont le prénom se termine par la lettre "A"
SELECT * 
FROM Employes 
WHERE Prenom LIKE '%A'


-- Q7) Séléctionner les employés qui travaillent dans le département Informatique ou Finance
SELECT * 
FROM Employes 
WHERE Departement= 'Informatique' OR Departement= 'Finance' ;


-- Q8) Afficher les employés ayant un salaire entre 50.000 et 100.000
SELECT * 
FROM Employes 
WHERE Salaire BETWEEN 50000 AND 100000;


-- Q9) Afficher les employés dont le poste contient le mot "Manager"
SELECT * 
FROM Employes 
WHERE Poste LIKE '%Manager%';


-- Q10) Lister les employés dont l'évaluation de performance est différente de 5
SELECT * 
FROM Employes 
WHERE EvaluationPerformance != '5'

-- Autre méthode
SELECT * 
FROM Employes 
WHERE EvaluationPerformance <> '5'



-- Q11) Sélectionner les employés ayant été embauchés en 2021 (Année)
SELECT * 
FROM Employes 
WHERE YEAR(DateEmbauche)= '2021'


-- Q11) Bis_ Sélectionner les employés ayant été embauchés en Janvier (Mois)
SELECT * 
FROM Employes 
WHERE MONTH(DateEmbauche)= '01'


-- Q11) Bis2_ Sélectionner les employés ayant été embauchés le 23 (Jour)
SELECT * 
FROM Employes 
WHERE DAY(DateEmbauche)= '23'


-- Q12) Afficher les employéqs qui viennent de France, Belgique ou Etats-Unis
SELECT * 
FROM Employes 
WHERE Pays= 'France' OR Pays='Belgique' OR Pays='États-Unis';


-- Q12) Bis_Afficher les employéqs qui viennent de France, Belgique ou Etats-Unis
SELECT * 
FROM Employes 
WHERE Pays IN ('France', 'Belgique', 'États-Unis');


-- Q13) Afficher les employés avec les 5 salaires les plus élevés
SELECT * 
FROM Employes 
ORDER BY Salaire DESC
LIMIT 5;


-- Q13) Bis_Afficher tous les employés en fonction des salaires croissants
SELECT * 
FROM Employes 
ORDER BY Salaire

-- Autre méthode
SELECT * 
FROM Employes 
ORDER BY Salaire ASC


-- Q13) Bis2_Afficher tous les employés en fonction des salaires décroissants
SELECT * 
FROM Employes 
ORDER BY Salaire DESC


-- Q14) Afficher tous les employés en fonction de leur date d'embauche dans l'ordre droissant
SELECT * 
FROM Employes 
ORDER BY DateEmbauche ;

-- Autre méthode
SELECT * 
FROM Employes 
ORDER BY DateEmbauche ASC;


-- Q15) Affichez les 3 premiers employés selon leur performances descendantes
SELECT *
FROM employes
ORDER BY EvaluationPerformance DESC 
LIMIT 3;


-- Q16) Calculer le salaire total de tous les employés ou masse salariale
SELECT SUM(Salaire) AS Salaire_Total
FROM employes


-- Q17) Calculer le salaire moyen des employés du département informatique
SELECT AVG(Salaire) AS Salaire_Moyen_Dep_INFO
FROM employes  
WHERE Departement= 'Informatique'


-- Q18) Déterminer le nombre total d'employés
SELECT COUNT(ID) AS Nombre_employés
FROM employes  
WHERE Departement= 'Informatique'

-- Autre méthode
SELECT COUNT(*) AS Nombre_employés
FROM employes


-- Q19) Afficher le salaire minimum et maximum des employés
SELECT MIN(Salaire) AS Salaire_Minimum, MAX(Salaire) AS Salaire_Maximum
FROM employes;


-- Q20) Afficher le nombre d'employés dans chaque département
SELECT Departement, COUNT(*) AS Nmbre_Employés_Dep
FROM employes
GROUP BY  Departement
WHERE Departement


-- Q21) Afficher le Salaire moyen par pays
SELECT Pays, AVG(Salaire) AS Salaire_Moyen_Pays
FROM employes
GROUP BY  Pays


-- Q22) Lister les département ayant plus de 3 employés
SELECT Departement, COUNT(*) AS Nbre_Employés
FROM employes
GROUP BY Departement 
HAVING COUNT(*) > 3;


-- Q23) Afficher les pays où le salaire moyen est supérieur à 70.000 et classez ces pays par ordre alphabétique
SELECT Pays, AVG(Salaire) AS Salaire_Moyen_Pays
FROM employes
GROUP BY Pays
HAVING Salaire_Moyen_Pays > 70000
ORDER BY Pays;


-- Q24) Ajouter un nouvel employé dans la table employé
INSERT INTO employes (ID, Prenom, Nom, Email, Telephone, Poste, Departement, Salaire, DateEmbauche, EvaluationPerformance, Pays)
VALUES (31, 'Michel', 'Tamba', 'micheltamba@yahoo.fr', '+226-90-45-45-45', 'Analyste', 'Finances', 60000, '2025-01-20', 4, 'Congo')


-- Q25) Mettez à jour le salaire de l'employé ayant l'ID=5 pour qu'il soit égal à 80.000
UPDATE employes 
SET Salaire=80000 
WHERE ID=5;


-- Q26) Modifier le département des employés travaillant comme dévelopeur pour qu'il devienne développement
UPDATE employes 
SET Departement= 'Développement'
WHERE Poste= 'Dévelopeur';*/ -- PROBLEME A CE NIVEAU



-- Q27) Sélectionner les employés ayant été embauchés dans les 5 dernière années
SELECT * 
FROM Employes 
WHERE DateEmbauche >=DATE_SUB(CURDATE(), INTERVAL 5 YEAR);


-- Q28) Sélectionner les employés qui ne sont pas évalués à 5 mais gagnent plus de 100000
SELECT * 
FROM Employes 
WHERE EvaluationPerformance !=5 AND Salaire > 100000;


-- Q29) Afficher les employés travaillant dans un département dont le salaire total dépasse 200000
SELECT Nom, Prenom, Salaire, Departement
FROM Employes 
WHERE Departement IN (
    SELECT Departement
    FROM Employes 
    GROUP BY Departement
    HAVING SUM(Salaire) > 200000 );


-- Q30) Lister les employers dont l'E-mail contient "gmail"
SELECT * 
FROM employes 
WHERE Email LIKE '%gmail%'


-- **************** FIN Leçon 1 ***********************



         -- ** Application Leçon 2 **
CREATE DATABASE EntrepriseGlobatech ;
USE entrepriseglobatech ;
CREATE TABLE Employés (
id_employé INT PRIMARY KEY,
prénom VARCHAR(50),
nom VARCHAR(50),
salaire DECIMAL(10,2),
date_embauche DATE);

CREATE TABLE Seconde_Table (
ID_Individus INT PRIMARY KEY,
Nom VARCHAR(100),
Prenom VARCHAR(30),
Ville VARCHAR(15)
);

-- Voir toutes les tables contenues dans la base de données
SHOW TABLES; 

-- Description d'une table
DESCRIBE employés ;

-- Modifions une table existente (Ajour de nouvelle colonne ou variable dans la BD)
ALTER TABLE Employés ADD Poste VARCHAR(50);
DESCRIBE employés;

-- Modifier le contenu d'une table quelconque
ALTER TABLE Employés MODIFY salaire DECIMAL(12,2);
DESCRIBE employés;

-- Suprimer une colonne/Variable de la BD
ALTER TABLE Employés DROP COLUMN poste;
DESCRIBE Employés ;

-- Suprimer une table de la BD // Attention cette commande (DROP) est irréversibles
DROP TABLE seconde_table;
SHOW TABLES; 

-- Language de manipulation des données (DML): INSERT / DELETE / UPDATE
SELECT * 
FROM Employés ;
-- Insérons de nouvelles informations dans la table employés
INSERT INTO Employés (id_employé, prénom, nom, salaire, date_embauche)
VALUES (2, 'Oscar', 'Aksanti', 3000.00, '2023-01-10'),
(3, 'Chantal', 'Akonate', 600.00, '2022-01-07'),
(4, 'Paul', 'Traore', 800.00, '2021-05-03'),
(5, 'Julie', 'TASKI', 450.00, '2024-10-28') ;

-- Mettons à jour/modifions les informations sur le salaire de l'indivivu de clé unique "1" dans la BD
UPDATE Employés
SET salaire = 5000.00
WHERE id_employé = 1;

-- Suprimons plutot un ligne ou un individu de la BD
DELETE FROM Employés WHERE id_employé = 1;

-- Suprimons les données d'une table tout en conservant sa structure (C'est-à dire que toute la BD sera suprimée mais les différentes variables seronts conservées)
TRUNCATE TABLE Employés;


-- LES JOINTURES (JOINS)



USE formationsqltableau_lecon1; /*Changement de BD*/


-- LES FONCTIONS DE CHAINE : CONCAT / LOWER / UPPER / LENGTH / TRIM / SUBSTRING
SELECT Prenom, Nom, CONCAT(Prenom, '-', Nom) AS Nom_Complet
FROM employes;

-- Mettre les modalités en "MAJUSCULES"
SELECT Prenom, UPPER(Prenom) AS Prenom_Majuscule
FROM employes;

-- Mettre les modalités en "Minuscules"
SELECT Prenom, LOWER(Prenom) AS Prenom_Minuscules
FROM employes;

-- Compter le nombre de caractères d'une modalité / LENGTH
SELECT Prenom, LENGTH(Prenom) AS Nb_Caractères
FROM employes;

-- Suprimer des "Espaces" au debut ou à la fin d'un chaine de caractères / TRIM
SELECT Prenom, TRIL(Prenom) AS Prénom_Nettoyé
FROM employes;

-- Extraction d'une partie d'une chaine de caractères / SUBSTRING
SELECT Prenom, SUBSTRING(Prenom, 2, 3)
FROM employes;



-- LES FONCTIONS DATE

-- Connaitre la date actuelle via une synthaxe                                                                                                                                                                                                                                                      
SELECT NOW() AS date_actuelle;

-- Insérer Jour/Mois/Année
SELECT DATE_FORMAT(DateEmbauche, '%Y-%m-%d') AS Date_Complete,
    DAY(DateEmbauche) AS Jour,
    MONTH(DateEmbauche) AS Mois,
    YEAR(DateEmbauche) AS Annee
FROM Employes;

-- Ajouter ou extraire des jours, des mois ou des années à une date existente (DATE_ADD et DATE_SUB)
SELECT DATE_ADD(NOW(), INTERVAL 30 DAY) AS date_plus_30; /*Ajout de 30 jours à la date actuelle*/ 
SELECT DATE_SUB(NOW(), INTERVAL 3 YEAR) AS date_moins_3_ans;  /*Soustraction de 3 ans à la date actuelle*/

-- Calcul du nombre de jours depuis l'embauche d'un empoyé
SELECT Prenom, Nom, DATEDIFF(NOW(), DateEmbauche) AS jours_depuis_embauche
FROM Employes;

SELECT Departement, Prenom, Nom
FROM employes
JOIN Départements;

-- **************** FIN Leçon 2 ***********************


             -- ** Application Leçon 3 **
-- 1) Les sous requêtes
  -- a)- Sous-requête dans la clause " WHERE "
    -- QUESTION: Trouver tous les employés dont le salaire est supérieur à la moyenne des salaires dans l'entreprise.

SELECT AVG(Salaire) AS Salaire_Moyen
FROM employes ;  -- (R=76314.596452) 

SELECT *
FROM employes 
WHERE Salaire > '76314.596452'; 

SELECT *
FROM employes 
WHERE Salaire > (SELECT AVG(Salaire) AS Salaire_Moyen FROM employes) ; 

SELECT Prenom, Nom, Salaire
FROM Employes
WHERE Salaire > (SELECT AVG(Salaire) FROM Employes); 
*/

  -- b)- Sous-requête dans la clause " FROM "
    -- QUESTION: Déterminer le salaire moyen par département en utilisant une sous-requête dans la clause FROM.
SELECT Departement, Salaire
FROM Employes ;

SELECT Departement, AVG(Salaire) AS Salaire_Moyen_Dep
FROM (SELECT Departement, Salaire FROM Employes) AS SubQuery
GROUP BY Departement;

  -- c)- Sous-requête dans la clause " SELECT "
    -- QUESTION: Déterminer le salaire moyen de tous les employés dans le même pays qu'un employé spécifique.
SELECT Prenom, Nom, Salaire, 
(SELECT AVG(Salaire) FROM Employes WHERE Pays = E.Pays) AS Salaire_Moyen_Pays
FROM Employes E
WHERE E.Prenom = 'Fabrice';

  -- d)- Sous-requête dans la clause " IN "
    -- QUESTION: Déterminer les employés dont le salaire est supérieur à celui de certains autres employés sélectionnés par un critère spécifique.
SELECT Prenom, Nom, Salaire
FROM Employes
WHERE Salaire > (SELECT Salaire FROM Employes WHERE Departement = 'IT' AND Salaire > 40000);

-- 2) Expressions Table Communes (CTE) " WITH "
WITH Nom_CTE AS (
-- Sous-requête qui définit la CTE
SELECT Colonne1, Colonne2
FROM Table
WHERE Condition)
    
-- Requête principale qui utilise la CTE
SELECT *
FROM Nom_CTE;





-- **************************************************************************************


-- CI-DESSOUS LES CODES POUR TP DU COURS INTRODUCTIF SQL
DROP DATABASE IF EXISTS `formationSQLTableau_lecon1`;
CREATE DATABASE IF NOT EXISTS `formationSQLTableau_lecon1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `formationSQLTableau_lecon1`;

CREATE TABLE Employes (
    ID INT PRIMARY KEY,
    Prenom VARCHAR(50),
    Nom VARCHAR(50),
    Email VARCHAR(100),
    Telephone VARCHAR(20),
    Poste VARCHAR(50),
    Departement VARCHAR(50),
    Salaire DECIMAL(10, 2),
    DateEmbauche DATE,
    EvaluationPerformance INT,
    Pays VARCHAR(50)
);

INSERT INTO Employes VALUES 
(1, 'Fabrice', 'Mutombo', 'fabrice.mutombo@gmail.com', '+243-811-123-456', 'Consultant', 'Finance', 118364.22, '2018-09-24', 2, 'RDC'),
(2, 'Fatou', 'Diop', 'fatou.diop@yahoo.com', '+221-78-456-7890', 'Développeur', 'Marketing', 31816.73, '2022-12-08', 3, 'Sénégal'),
(3, 'Aïssatou', 'Traoré', 'aissatou.traore@hotmail.com', '+225-07-456-1234', 'Consultante', 'Informatique', 105015.32, '2016-12-22', 4, 'Côte d’Ivoire'),
(4, 'Blaise', 'Ngoma', 'blaise.ngoma@exemple.com', '+243-812-789-456', 'Stagiaire', 'Informatique', 73687.95, '2020-07-26', 5, 'RDC'),
(5, 'Yassine', 'El Fassi', 'yassine.elfassi@gmail.com', '+212-06-123-7890', 'Designer', 'Opérations', 75700.8, '2018-01-11', 2, 'Maroc'),
(6, 'Mariam', 'Coulibaly', 'mariam.coulibaly@gmail.com', '+223-76-123-4567', 'Développeuse', 'Marketing', 115347.76, '2024-12-22', 4, 'Mali'),
(7, 'Dieudonné', 'Tshisekedi', 'dieudo.tshisekedi@exemple.com', '+243-813-456-789', 'Développeur', 'Informatique', 112556.95, '2016-10-15', 5, 'RDC'),
(8, 'Jacqueline', 'Abdoulaye', 'jacqueline.abdoulaye@exemple.com', '+228-90-123-4567', 'Développeuse', 'Informatique', 113483.58, '2018-10-07', 5, 'Togo'),
(9, 'Amadou', 'Cissé', 'amadou.cisse@yahoo.com', '+223-70-789-1234', 'Manager', 'Ressources Humaines', 75038.94, '2017-10-23', 5, 'Mali'),
(10, 'Chantal', 'Koffi', 'chantal.koffi@gmail.com', '+225-08-789-1234', 'Consultante', 'Ventes', 71006.17, '2018-01-08', 3, 'Côte d’Ivoire'),
(11, 'Adama', 'Sangaré', 'adama.sangare@exemple.com', '+223-65-456-1234', 'Consultant', 'Finance', 60185.82, '2020-07-28', 1, 'Mali'),
(12, 'Bintou', 'Diallo', 'bintou.diallo@hotmail.com', '+224-622-123-456', 'Stagiaire', 'Ventes', 77656.06, '2016-10-15', 2, 'Guinée'),
(13, 'Jean-Luc', 'Mokonzi', 'jeanluc.mokonzi@exemple.com', '+243-815-123-456', 'Consultant', 'Marketing', 61662.32, '2024-09-01', 2, 'RDC'),
(14, 'Amina', 'Benali', 'amina.benali@gmail.com', '+213-05-123-7890', 'Manager', 'Ventes', 102146.3, '2021-02-14', 2, 'Algérie'),
(15, 'Thierno', 'Ba', 'thierno.ba@gmail.com', '+221-77-789-1234', 'Développeur', 'Ressources Humaines', 90778.52, '2022-05-11', 5, 'Sénégal'),
(16, 'Luc', 'Durand', 'luc.durand@gmail.com', '+33-6-12-34-56-78', 'Analyste', 'Finance', 85000.50, '2019-04-10', 4, 'France'),
(17, 'Sophie', 'Dubois', 'sophie.dubois@outlook.com', '+32-474-12-34-56', 'Consultante', 'Informatique', 92000.00, '2021-06-15', 3, 'Belgique'),
(18, 'Hery', 'Rakoto', 'hery.rakoto@yahoo.fr', '+261-32-12-34-56', 'Responsable Marketing', 'Marketing', 65000.75, '2020-02-20', 4, 'Madagascar'),
(19, 'Clarisse', 'Ndikumana', 'clarisse.ndikumana@exemple.com', '+257-79-12-34-56', 'Développeuse Web', 'Informatique', 48000.60, '2018-11-01', 5, 'Burundi'),
(20, 'Yao', 'Komlan', 'yao.komlan@exemple.com', '+228-98-76-54-32', 'Consultant', 'Gestion', 54000.90, '2017-09-12', 4, 'Togo'),
(21, 'Ali', 'Mahamadou', 'ali.mahamadou@exemple.com', '+227-96-12-34-56', 'Analyste de Données', 'Informatique', 47000.00, '2016-05-30', 5, 'Niger'),
(22, 'Fatima', 'Djimadoum', 'fatima.djimadoum@exemple.com', '+235-99-12-34-56', 'Ingénieure Réseaux', 'Informatique', 49000.40, '2019-12-10', 4, 'Tchad'),
(23, 'Emily', 'Johnson', 'emily.johnson@gmail.com', '+1-202-555-0173', 'Data Scientist', 'Informatique', 120000.00, '2020-07-22', 5, 'États-Unis'),
(24, 'Alex', 'Smith', 'alex.smith@exemple.ca', '+1-613-555-0198', 'Analyste BI', 'Marketing', 82000.30, '2021-10-05', 3, 'Canada'),
(25, 'Pierre', 'Martin', 'pierre.martin@gmail.com', '+33-7-98-76-54-32', 'Chef de Projet', 'Opérations', 87000.00, '2017-02-18', 4, 'France'),
(26, 'Chantal', 'Van der Berg', 'chantal.berg@exemple.be', '+32-476-54-32-10', 'Développeuse Front-End', 'Informatique', 75000.25, '2022-03-30', 3, 'Belgique'),
(27, 'Jean', 'Randriamampianina', 'jean.randria@exemple.mg', '+261-33-12-34-56', 'Admin Systèmes', 'Informatique', 59000.00, '2021-12-12', 4, 'Madagascar'),
(28, 'Aimé', 'Ndayizeye', 'aime.ndayizeye@exemple.bi', '+257-78-34-12-56', 'Designer Graphique', 'Marketing', 40000.50, '2018-07-08', 5, 'Burundi'),
(29, 'Kossi', 'Mensah', 'kossi.mensah@exemple.tg', '+228-90-54-32-10', 'Spécialiste Logistique', 'Opérations', 52000.75, '2019-06-15', 4, 'Togo'),
(30, 'Aminatou', 'Idrissa', 'aminatou.idrissa@exemple.ne', '+227-94-54-32-10', 'Responsable Qualité', 'Opérations', 62000.90, '2020-09-25', 3, 'Niger'




