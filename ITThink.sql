-- Craetion de database
CREATE DATABASE ITThink;
USE ITThink;
-- Creation des tables 
# table d'utilisateurs
CREATE TABLE utilisateurs(
	id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    nom_utilisateur VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(128) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(10)
);
#table categorie
CREATE TABLE categories(
	id_categorie INT PRIMARY KEY AUTO_INCREMENT,
    nom_categorie VARCHAR(50) NOT NULL
);
#table sous_categories
CREATE TABLE sousCategories(
	id_sous_categorie INT PRIMARY KEY AUTO_INCREMENT,
    nom_sous_categorie VARCHAR(50) NOT NULL,
    id_categorie INT,
    FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie)
);
#projects table
CREATE TABLE projects(
	id_project INT AUTO_INCREMENT PRIMARY KEY,
    titre_projet VARCHAR(50) NOT NULL,
    description_projet VARCHAR(300),
    id_categorie INT,
    FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie),
    id_sous_categorie INT,
    FOREIGN KEY (id_sous_categorie) REFERENCES sousCategories(id_sous_categorie),
    id_utilisateur INT,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);
#freelances table 
CREATE TABLE freelances(
	id_freelance INT PRIMARY KEY AUTO_INCREMENT,
    nom_freelance VARCHAR(50) NOT NULL,
    competences VARCHAR(400) NOT NULL,
    id_utilisateur INT, 
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);
CREATE TABLE offres(
	id_offre INT AUTO_INCREMENT PRIMARY KEY,
    montant DECIMAL(10, 2) NOT NULL,
    delai DATETIME NOT NULL, 
    id_freelance INT,
    FOREIGN KEY (id_freelance) REFERENCES freelances(id_freelance),
    id_project INT,
    FOREIGN KEY (id_project) REFERENCES projects(id_project)
);
#temoignage table
CREATE TABLE temoignage(
	id_temoignage INT AUTO_INCREMENT PRIMARY KEY,
    commentaire VARCHAR(400) NOT NULL,
    id_utilisateur INT,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);
SELECT * FROM temoignage;
