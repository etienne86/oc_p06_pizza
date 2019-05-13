-- 1. Afficher le contenu (panier) d’une commande
-- Exemple avec la commande '1000000001'
SELECT Commande_client.num AS num_cmd,
       Pizza.type AS pizza,
       Ligne_panier.quantite AS quantite,
       Pizza.tarif AS prix
FROM Ligne_panier
INNER JOIN Commande_client ON Ligne_panier.commande_client_num = Commande_client.num
INNER JOIN Pizza ON Ligne_panier.pizza_id = Pizza.id
WHERE Commande_client.num = '1000000001';

-- 2. Afficher la liste des pizzas disponibles à un point de vente
-- Exemple avec le point de vente n°3
SELECT Point_de_vente.id AS pt_vente, Pizza.type AS pizza
FROM Pizza_disponible
INNER JOIN Point_de_vente ON Point_de_vente.id = Pizza_disponible.point_de_vente_id
INNER JOIN Pizza ON Pizza.id = Pizza_disponible.pizza_id
WHERE Point_de_vente.id = 3 AND Pizza_disponible.disponible = TRUE;

-- 3. Afficher la liste des clients enregistrés
SELECT Client.nom, Client.prenom, Client.identifiant
FROM Client;

-- 4. Afficher l’historique des commandes d’un client
-- Exemple avec le client n°5
SELECT Client.id AS client_id, Commande_client.num AS num_cmd,
       Commande_client.montant, Commande_client.annulee,
       DATE(Commande_client.date_heure_promis) AS date_cmd
FROM Commande_client
INNER JOIN Client ON Commande_client.client_id = Client.id
WHERE Client.id = 5;

-- 5. Afficher l’historique des pizzas commandées par un client
-- Exemple avec le client n°5
SELECT Client.id AS client_id, Pizza.type AS pizza,
       Commande_client.annulee,
       DATE(Commande_client.date_heure_promis) AS date_cmd
FROM Commande_client
INNER JOIN Client ON Commande_client.client_id = Client.id
INNER JOIN Ligne_panier ON Ligne_panier.commande_client_num = Commande_client.num
INNER JOIN Pizza ON Pizza.id = Ligne_panier.pizza_id
WHERE Client.id = 5;

-- 6. Afficher l’historique des pizzas commandées pour l’ensemble des points de vente
SELECT Pizza.type AS pizza, COUNT(Ligne_panier.quantite) AS nombre
FROM Ligne_panier
RIGHT JOIN Pizza ON Ligne_panier.pizza_id = Pizza.id
GROUP BY pizza;

-- 7. Afficher l’historique des pizzas commandées dans un point de vente
-- Exemple avec le point de vente n°1
SELECT Point_de_vente.id AS pt_vente, Pizza.type AS pizza, COUNT(Ligne_panier.quantite) AS nombre
FROM Ligne_panier
RIGHT JOIN Pizza ON Ligne_panier.pizza_id = Pizza.id
LEFT JOIN Commande_client ON Commande_client.num = Ligne_panier.commande_client_num
LEFT JOIN Point_de_vente ON Commande_client.point_de_vente_id = Point_de_vente.id
WHERE Point_de_vente.id = 1
GROUP BY pt_vente, pizza;

-- 8. Afficher le chiffre d’affaires par point de vente, sur un mois donné
-- Exemple avec le mois d'avril 2019
SELECT CONCAT(EXTRACT(MONTH FROM Commande_client.date_heure_promis),
              '-',
              EXTRACT(YEAR FROM Commande_client.date_heure_promis)) AS date_ventes,
       Commande_client.Point_de_vente_id AS pt_vente,
       SUM(Commande_client.montant) AS ventes
FROM Commande_client
WHERE EXTRACT(MONTH FROM Commande_client.date_heure_promis) = 4
    AND EXTRACT(YEAR FROM Commande_client.date_heure_promis) = 2019
    AND Commande_client.annulee = FALSE
GROUP BY date_ventes, pt_vente;

-- 9. Afficher la recette d’une pizza
-- Exemple avec la pizza n°5
SELECT Ingredient.nom_ingredient, Recette.quantite, Ingredient.unite
FROM Recette
INNER JOIN Ingredient ON Ingredient.id = Recette.ingredient_id
WHERE Recette.pizza_id = 5;

-- 10. Afficher l’en-cours à un point de vente
-- Exemple avec le point de vente n°1
SELECT En_cours_pizza.point_de_vente_id AS pt_vente,
       Pizza.type, En_cours_pizza.attente_preparation,
       En_cours_pizza.en_preparation, En_cours_pizza.en_cuisson,
       En_cours_pizza.pret_a_servir, En_cours_pizza.client_servi
FROM En_cours_pizza
INNER JOIN Pizza ON Pizza.id = En_cours_pizza.pizza_id
WHERE En_cours_pizza.point_de_vente_id = 1
ORDER BY En_cours_pizza.attente_preparation, En_cours_pizza.en_preparation,
    En_cours_pizza.en_cuisson, En_cours_pizza.pret_a_servir;

-- 11. Afficher la liste des ingrédients en rupture de stock
SELECT Stock.point_de_vente_id AS pt_vente, Ingredient.nom_ingredient AS ingredient, Stock.stock_courant AS stock
FROM Stock
INNER JOIN Ingredient ON Ingredient.id = Stock.ingredient_id
WHERE Stock.stock_courant = 0;

-- 12. Afficher la liste des ingrédients avec stock courant sous le stock de sécurité
SELECT Stock.point_de_vente_id AS pt_vente, Ingredient.nom_ingredient AS ingredient,
       Stock.stock_courant, Stock.stock_secu
FROM Stock
INNER JOIN Ingredient ON Ingredient.id = Stock.ingredient_id
WHERE Stock.stock_courant < Stock.stock_secu
GROUP BY pt_vente, Ingredient.nom_ingredient,Stock.stock_courant, Stock.stock_secu
ORDER BY pt_vente;

-- 13. Afficher la liste des ingrédients avec stock projeté sous le stock de sécurité
SELECT Stock.point_de_vente_id AS pt_vente, Ingredient.nom_ingredient AS ingredient,
       Stock.stock_courant, Stock.stock_projete, Stock.stock_secu
FROM Stock
INNER JOIN Ingredient ON Ingredient.id = Stock.ingredient_id
WHERE Stock.stock_courant < Stock.stock_secu
GROUP BY pt_vente, Ingredient.nom_ingredient,Stock.stock_courant, Stock.stock_projete, Stock.stock_secu
ORDER BY pt_vente;

-- 14. Afficher la liste des ingrédients commandés en attente de réception (commande en cours)
SELECT Ligne_cmd_marchandise.point_de_vente_id AS pt_vente,
       Ingredient.nom_ingredient,
       Ligne_cmd_marchandise.quantite,
       Ingredient.unite,
       Ligne_cmd_marchandise.ouverte
FROM Ligne_cmd_marchandise
INNER JOIN Ingredient ON Ingredient.id = Ligne_cmd_marchandise.ingredient_id
WHERE Ligne_cmd_marchandise.ouverte = TRUE;

-- 15. Afficher la liste des pizzas indisponibles pour l’ensemble des points de vente
SELECT Pizza_disponible.point_de_vente_id, Pizza.type, Pizza_disponible.disponible
FROM Pizza_disponible
INNER JOIN Pizza ON Pizza.id = Pizza_disponible.pizza_id
WHERE Pizza_disponible.disponible = FALSE;

-- 16. Afficher le taux de commandes annulées, par point de vente




































