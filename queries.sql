USE tifosi;

-- ==============================================================================
-- Requête 1 : Afficher la liste des noms des focaccias par ordre alphabétique croissant
-- ==============================================================================
SELECT nom 
FROM focaccia 
ORDER BY nom ASC;

-- ==============================================================================
-- Requête 2 : Afficher le nombre total d'ingrédients
-- ==============================================================================
SELECT COUNT(*) AS total_ingredients 
FROM ingredient;

-- ==============================================================================
-- Requête 3 : Afficher le prix moyen des focaccias
-- ==============================================================================
SELECT ROUND(AVG(prix), 2) AS prix_moyen_focaccia 
FROM focaccia;

-- ==============================================================================
-- Requête 4 : Afficher la liste des boissons avec leur marque, triée par nom de boisson
-- ==============================================================================
SELECT b.nom AS nom_boisson, m.nom AS nom_marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;

-- ==============================================================================
-- Requête 5 : Afficher la liste des ingrédients pour une Raclaccia
-- ==============================================================================
SELECT i.nom AS nom_ingredient
FROM ingredient i
JOIN comprend c ON i.id_ingredient = c.id_ingredient
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
WHERE f.nom = 'Raclaccia';

-- ==============================================================================
-- Requête 6 : Afficher le nom et le nombre d'ingrédients pour chaque focaccia
-- ==============================================================================
SELECT f.nom AS nom_focaccia, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
LEFT JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom;

-- ==============================================================================
-- Requête 7 : Afficher le nom de la focaccia qui a le plus d'ingrédients
-- ==============================================================================
SELECT f.nom AS nom_focaccia
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY COUNT(c.id_ingredient) DESC
LIMIT 1;

-- ==============================================================================
-- Requête 8 : Afficher la liste des focaccia qui contiennent de l'ail
-- ==============================================================================
SELECT f.nom AS nom_focaccia
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom LIKE '%ail%';

-- ==============================================================================
-- Requête 9 : Afficher la liste des ingrédients inutilisés
-- ==============================================================================
SELECT i.nom AS ingredient_inutilise
FROM ingredient i
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_focaccia IS NULL;

-- ==============================================================================
-- Requête 10 : Afficher la liste des focaccia qui n'ont pas de champignons
-- ==============================================================================
SELECT nom AS nom_focaccia
FROM focaccia
WHERE id_focaccia NOT IN (
    SELECT c.id_focaccia 
    FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom LIKE '%champignon%'
);