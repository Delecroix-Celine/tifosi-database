# Tifosi - Système de Gestion de Base de Données (MySQL)

Ce projet a été réalisé dans le cadre de la conception d'une base de données dynamique et locale pour le restaurant de Street-Food italien **Le Tifosi**. L'objectif est de structurer, alimenter et requêter les données concernant les focaccias, les ingrédients, les marques et les boissons du restaurant.

---

## 📂 Structure du Projet

Le dépôt est organisé de la manière suivante :
* `schema.sql` : Script de création de la base de données `tifosi`, de l'utilisateur dédié et de la structure des tables (MPD).
* `fixtures.sql` : Script d'alimentation contenant l'ensemble des données de test issues des fichiers Excel fournis.
* `queries.sql` : Script regroupant les 10 requêtes de vérification demandées dans le brief de mission.
* `README.md` : Ce fichier guide et le rapport d'exécution des requêtes.

---

## ⚙️ Installation et Déploiement Local

Pour déployer la base de données sur votre environnement local MySQL :

1. **Exécuter le schéma** (crée la BDD, l'utilisateur `tifosi` et les tables) :
   ```bash
   mysql -u root -p < schema.sql