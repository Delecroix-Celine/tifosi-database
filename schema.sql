-- -----------------------------------------------------
-- 1. CRÉATION DE LA BASE ET DE L'UTILISATEUR
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tifosi;

-- Création de l'utilisateur 'tifosi' avec accès local
CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'MonMotDePasseSecurise123!';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

-- -----------------------------------------------------
-- 2. CRÉATION DES TABLES (SCHÉMA)
-- -----------------------------------------------------

-- Table : marque
CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_marque)
) ENGINE=InnoDB;

-- Table : boisson
CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL,
    PRIMARY KEY (id_boisson),
    CONSTRAINT fk_boisson_marque FOREIGN KEY (id_marque) REFERENCES marque(id_marque) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table : Client
CREATE TABLE client (
    id_client INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE, -- Sécurité : email unique pour les connexions
    code_postal INT NOT NULL,
    PRIMARY KEY (id_client)
) ENGINE=InnoDB;

-- Table : menu
CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id_menu)
) ENGINE=InnoDB;

-- Table : focaccia
CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    id_menu INT NOT NULL, -- Migration de la relation 1,1 'est constitué'
    PRIMARY KEY (id_focaccia),
    CONSTRAINT fk_focaccia_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table : ingredient
CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_ingredient)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- 3. TABLES DE LIAISON (ASSOCIATIONS N,N)
-- -----------------------------------------------------

-- Table de liaison : comprend (entre ingredient et focaccia)
CREATE TABLE comprend (
    id_ingredient INT,
    id_focaccia INT,
    quantite INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_ingredient, id_focaccia),
    CONSTRAINT fk_comprend_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient) ON DELETE CASCADE,
    CONSTRAINT fk_comprend_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table de liaison : achete (entre Client et menu)
CREATE TABLE achete (
    id_client INT,
    id_menu INT,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu, date_achat), -- Clé composite incluant la date si un client peut acheter le même menu plusieurs jours
    CONSTRAINT fk_achete_client FOREIGN KEY (id_client) REFERENCES client(id_client) ON DELETE CASCADE,
    CONSTRAINT fk_achete_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table de liaison : contient (entre menu et boisson)
CREATE TABLE contient (
    id_menu INT,
    id_boisson INT,
    PRIMARY KEY (id_menu, id_boisson),
    CONSTRAINT fk_contient_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE,
    CONSTRAINT fk_contient_boisson FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson) ON DELETE CASCADE
) ENGINE=InnoDB;