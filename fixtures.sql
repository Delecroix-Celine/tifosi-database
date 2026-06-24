USE tifosi;

-- ==============================================================================
-- 1. NETTOYAGE DES TABLES (Pour éviter les doublons)
-- ==============================================================================
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE comprend;
TRUNCATE TABLE contient;
TRUNCATE TABLE achete;
TRUNCATE TABLE focaccia;
TRUNCATE TABLE ingredient;
TRUNCATE TABLE boisson;
TRUNCATE TABLE marque;
TRUNCATE TABLE menu;
TRUNCATE TABLE client;
SET FOREIGN_KEY_CHECKS = 1;

-- ==============================================================================
-- 2. ALIMENTATION DES TABLES INDÉPENDANTES
-- ==============================================================================

-- Insertion des marques
INSERT INTO marque (id_marque, nom) VALUES 
(1, 'Coca-cola'),
(2, 'Cristalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- Insertion des menus
INSERT INTO menu (id_menu, nom, prix) VALUES 
(1, 'Menu Standard', 12.50),
(2, 'Menu Gourmand', 15.00);

-- Insertion des ingrédients (Tes 25 vrais ingrédients)
INSERT INTO ingredient (id_ingredient, nom) VALUES 
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base Tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chevre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');

-- ==============================================================================
-- 3. ALIMENTATION DES TABLES DÉPENDANTES (Clés étrangères requises)
-- ==============================================================================

-- Insertion des boissons
INSERT INTO boisson (id_boisson, nom, id_marque) VALUES 
(1, 'Coca-cola zéro', 1),
(2, 'Coca-cola original', 1),
(3, 'Fanta citron', 1),
(4, 'Fanta orange', 1),
(5, 'Capri-sun', 1),
(6, 'Pepsi', 4),
(7, 'Pepsi Max Zéro', 4),
(8, 'Lipton zéro citron', 4),
(9, 'Lipton Peach', 4),
(10, 'Monster energy ultra gold', 3),
(11, 'Monster energy ultra blue', 3),
(12, 'Eau de source', 2);

-- Insertion des 8 focaccias réelles
INSERT INTO focaccia (id_focaccia, nom, prix, id_menu) VALUES 
(1, 'Mozaccia', 9.80, 1),
(2, 'Gorgonzollaccia', 10.80, 2),
(3, 'Raclaccia', 8.90, 1),
(4, 'Emmentalaccia', 9.80, 1),
(5, 'Tradizione', 8.90, 1),
(6, 'Hawaienne', 11.20, 2),
(7, 'Américaine', 10.80, 2),
(8, 'Paysanne', 12.80, 2);

-- ==============================================================================
-- 4. LIAISONS ENTRE LES TABLES (Table intermédiaire comprend)
-- ==============================================================================

INSERT INTO comprend (id_focaccia, id_ingredient, quantite) VALUES 
-- 1. Mozaccia
(1, 5, 1),  -- Base Tomate
(1, 25, 1), -- Mozarella
(1, 9, 1),  -- Cresson
(1, 13, 1), -- Jambon fumé
(1, 1, 1),  -- Ail
(1, 3, 1),  -- Artichaut
(1, 7, 1),  -- Champignon
(1, 18, 1), -- Parmesan
(1, 20, 1), -- Poivre
(1, 16, 1), -- Olive noire

-- 2. Gorgonzollaccia
(2, 5, 1),  -- Base Tomate
(2, 11, 1), -- Gorgonzola
(2, 9, 1),  -- Cresson
(2, 1, 1),  -- Ail
(2, 7, 1),  -- Champignon
(2, 18, 1), -- Parmesan
(2, 20, 1), -- Poivre
(2, 16, 1), -- Olive noire

-- 3. Raclaccia
(3, 5, 1),  -- Base Tomate
(3, 22, 1), -- Raclette
(3, 9, 1),  -- Cresson
(3, 1, 1),  -- Ail
(3, 7, 1),  -- Champignon
(3, 18, 1), -- Parmesan
(3, 20, 1), -- Poivre

-- 4. Emmentalaccia
(4, 6, 1),  -- Base crème
(4, 10, 1), -- Emmental
(4, 9, 1),  -- Cresson
(4, 7, 1),  -- Champignon
(4, 18, 1), -- Parmesan
(4, 20, 1), -- Poivre
(4, 15, 1), -- Oignon

-- 5. Tradizione
(5, 5, 1),  -- Base Tomate
(5, 25, 1), -- Mozarella
(5, 9, 1),  -- Cresson
(5, 12, 1), -- Jambon cuit
(5, 7, 1),  -- Champignon
(5, 18, 1), -- Parmesan
(5, 20, 1), -- Poivre
(5, 16, 1), -- Olive noire
(5, 17, 1), -- Olive verte

-- 6. Hawaienne
(6, 5, 1),  -- Base Tomate
(6, 25, 1), -- Mozarella
(6, 9, 1),  -- Cresson
(6, 4, 1),  -- Bacon
(6, 2, 1),  -- Ananas
(6, 19, 1), -- Piment
(6, 18, 1), -- Parmesan
(6, 20, 1), -- Poivre
(6, 16, 1), -- Olive noire

-- 7. Américaine
(7, 5, 1),  -- Base Tomate
(7, 25, 1), -- Mozarella
(7, 9, 1),  -- Cresson
(7, 4, 1),  -- Bacon
(7, 21, 1), -- Pomme de terre
(7, 18, 1), -- Parmesan
(7, 20, 1), -- Poivre
(7, 16, 1), -- Olive noire

-- 8. Paysanne
(8, 6, 1),   -- Base crème
(8, 8, 1),   -- Chèvre
(8, 9, 1),   -- Cresson
(8, 21, 1),  -- Pomme de terre
(8, 13, 1),  -- Jambon fumé
(8, 1, 1),   -- Ail
(8, 3, 1),   -- Artichaut
(8, 7, 1),   -- Champignon
(8, 18, 1),  -- Parmesan
(8, 20, 1),  -- Poivre
(8, 16, 1),  -- Olive noire
(8, 14, 1);  -- Oeuf