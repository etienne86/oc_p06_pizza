-- Data insertion into db_pizza

-- Please select the database 'db_pizza' in pgAdmin before executing these SQL requests


-- Customers

INSERT INTO Client
    (
        identifiant,
        mdp_chiffre,
        nom,
        prenom,
        telephone,
        authentifie
    )
VALUES
    (
        'jean.bon@mail.com',
        'abcdefghijklmnopqrstuvwxyz0123456789abcd',
        'BON',
        'Jean',
        '0123456789',
        FALSE
    ),
    (
        'francois.pignon@mail.com',
        'abcdefghijklmnopqrstuvwxyz0123456789efgh',
        'PIGNON',
        'François',
        '0102030405',
        FALSE
    ),
    (
        'sacha.touille@mail.com',
        'abcdefghijklmnopqrstuvwxyz0123456789ijkl',
        'TOUILLE',
        'Sacha',
        '0655778899',
        TRUE
    ),
    (
        'francoise.pignonne@mail.com',
        'abcdefghijklmnopqrstuvwxyz0123456789mnop',
        'PIGNONNE',
        'Françoise',
        '0102030406',
        TRUE
    ),
    (
        'sagra.touille@mail.com',
        'abcdefghijklmnopqrstuvwxyz0123456789qrst',
        'TOUILLE',
        'Sagra',
        '0655778800',
        FALSE
    );   


-- Stores

INSERT INTO Point_de_vente
    (
        adresse_numero,
        adresse_voie,
        adresse_code_postal,
        adresse_ville,
        adresse_pays,
        delai
    )
VALUES
    (
        '10',
        'avenue de l''impasse',
        '12345',
        'Louin',
        'France',
        0
    ),
    (
        '999',
        'rue de la tour du chateau du bois',
        '12345',
        'Louin',
        'France',
        0
    ),
    (
        ' ',
        'lieu dit la pizzeria',
        '12345',
        'Louin',
        'France',
        0
    );


-- Delivery addresses

INSERT INTO Adresse_livraison
    (
        adresse_numero,
        adresse_voie,
        adresse_code_postal,
        adresse_ville,
        adresse_pays
    )
VALUES
    (
        '10',
        'avenue de l''impasse',
        '12345',
        'Louin',
        'France'
    ),
    (
        '9',
        'rue de la tour du chateau du bois',
        '12345',
        'Louin',
        'France'
    ),
    (
        ' ',
        'lieu dit la pizzeria',
        '12345',
        'Louin',
        'France'
    ),
    (
        '1',
        'rue du pont',
        '12345',
        'Louin',
        'France'
    ),
    (
        '1918',
        'boulevard de l''armistice',
        '12345',
        'Louin',
        'France'
    ),
    (
        '1945',
        'avenue de la victoire',
        '12345',
        'Ailleurs',
        'France'
    );


-- Pizzas

INSERT INTO Pizza (type, tarif)
VALUES ('Reine', 8.0),
       ('Chorizo', 8.5),
       ('Royale', 9.0),
       ('Océane', 9.5),
       ('Forestière', 10.0),
       ('Fromagère', 10.5),
       ('Napolitaine', 11.0),
       ('Spéciale', 11.5),
       ('Régionale', 12.0),
       ('Paysanne', 12.5);


-- Food

INSERT INTO Ingredient (nom_ingredient, unite, lot_commande)
VALUES ('pate à pizza', 'pc', 100),
       ('sauce tomate', 'g', 5000),
       ('fromage', 'g', 10000),
       ('épaule', 'g', 1000),
       ('chorizo', 'g', 1000),
       ('champignons', 'g', 3000),
       ('moules, crevettes, coques', 'g', 1000),
       ('persil', 'g', 100),
       ('ail', 'g', 100),
       ('crème fraîche', 'g', 3000),
       ('bleu d''auvergne', 'g', 500),
       ('anchois', 'g', 500),
       ('olives', 'g', 500),
       ('oeuf', 'pc', 12),
       ('câpres', 'g', 500),
       ('fromage de chèvre', 'g', 500),
       ('lardons', 'g', 500);


-- Employees

INSERT INTO Employe
    (
        identifiant,
        mdp_chiffre,
        nom,
        prenom,
        telephone,
        authentifie,
        mail,
        alerte_sms,
        alerte_mail,
        role,
        point_de_vente_id
    )
VALUES
    (
        'linda.lacheffe',
        '0123abcdefghijklmnopqrstuvwxyz0123456789',
        'LACHEFFE',
        'Linda',
        '0606660666',
        FALSE,
        'linda.lacheffe@oc-pizza.com',
        TRUE,
        TRUE,
        'gérant',
        NULL
    ),
    (
        'luigi.bonnepate',
        '4567abcdefghijklmnopqrstuvwxyz0123456789',
        'BONNEPATE',
        'Luigi',
        '0110011001',
        TRUE,
        'luigi.bonnepate@oc-pizza.com',
        FALSE,
        FALSE,
        'pizzaïolo',
        1
    ),
    (
        'tony.deroux',
        '8901abcdefghijklmnopqrstuvwxyz0123456789',
        'DEROUX',
        'Tony',
        '0612233445',
        TRUE,
        'tony.deroux@oc-pizza.com',
        FALSE,
        FALSE,
        'livreur',
        1
    );    


-- Customers orders

INSERT INTO Commande_client
    (
        num,
        client_id,
        point_de_vente_id,
        a_livrer,
        adresse_livraison_id,
        delai_livraison,
        date_heure_cmd_validee,
        date_heure_promis,
        montant,
        mode_paiement,
        payee,
        validee,
        payee_en_ligne,
        annul_ou_modif_en_cours,
        modifiee,
        annulee,
        soldee,
        en_preparation
    )
VALUES
    (
        '1000000001',
        1,
        3,
        TRUE,
        4,
        6,
        '2019-04-24 11:15:30.000000+02',
        '2019-04-24 12:06:00.000000+02',
        35.0,
        'carte bancaire',
        TRUE,
        TRUE,
        TRUE,
        FALSE,
        TRUE,
        FALSE,
        TRUE,
        FALSE
    ),
    (
        '1000000002',
        2,
        1,
        TRUE,
        5,
        4,
        '2019-04-25 19:35:12.000000+02',
        '2019-04-25 20:09:00.000000+02',
        10.5,
        'espèces',
        TRUE,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE,
        FALSE
    ),
    (
        '1000000003',
        3,
        2,
        FALSE,
        2,
        0,
        '2019-04-26 19:05:45.000000+02',
        '2019-04-26 19:30:00.000000+02',
        20.5,
        'chèque',
        TRUE,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE,
        FALSE
    ),
    (
        '1000000004',
        5,
        1,
        FALSE,
        1,
        0,
        '2019-04-29 18:50:00.000000+02',
        '2019-04-29 19:30:00.000000+02',
        34.5,
        'carte bancaire',
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE,
        TRUE,
        FALSE
    ),
    (
        '1000000005',
        5,
        1,
        FALSE,
        1,
        0,
        '2019-04-29 19:05:00.000000+02',
        '2019-04-29 19:40:00.000000+02',
        22.5,
        'carte bancaire',
        TRUE,
        TRUE,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        TRUE,
        FALSE
    ),
    (
        '1000000006',
        3,
        2,
        FALSE,
        2,
        0,
        '2019-04-30 19:45:30.000000+02',
        '2019-04-30 20:10:00.000000+02',
        12.5,
        'carte bancaire',
        TRUE,
        TRUE,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000007',
        4,
        2,
        TRUE,
        6,
        11,
        '2019-04-30 19:44:00.000000+02',
        '2019-04-30 20:26:00.000000+02',
        13.0,
        'carte bancaire',
        TRUE,
        FALSE,
        TRUE,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE
    ),
    (
        '1000000008',
        2,
        1,
        FALSE,
        1,
        0,
        '2019-04-30 19:46:00.000000+02',
        '2019-04-30 20:20:00.000000+02',
        31.5,
        '',
        FALSE,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000009',
        5,
        1,
        FALSE,
        1,
        0,
        '2019-04-30 19:47:00.000000+02',
        '2019-04-30 20:25:00.000000+02',
        9.0,
        'carte bancaire',
        TRUE,
        TRUE,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        FALSE
    ),
    (
        '1000000010',
        1,
        3,
        FALSE,
        3,
        0,
        '2019-04-30 19:48:00.000000+02',
        '2019-04-30 20:45:00.000000+02',
        27.5,
        '',
        FALSE,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    );


-- Shopping carts lines

INSERT INTO Ligne_panier (commande_client_num, pizza_id, quantite)
VALUES ('1000000001', 1, 1),
       ('1000000001', 2, 2),
       ('1000000001', 3, 1),
       ('1000000002', 4, 1),
       ('1000000003', 5, 1),
       ('1000000003', 6, 1),
       ('1000000004', 7, 1),
       ('1000000004', 8, 1),
       ('1000000004', 9, 1),
       ('1000000005', 7, 1),
       ('1000000005', 8, 1),
       ('1000000006', 10, 1),
       ('1000000007', 9, 1),
       ('1000000008', 4, 1),
       ('1000000008', 6, 1),
       ('1000000008', 8, 1),
       ('1000000009', 3, 1),
       ('1000000010', 2, 1),
       ('1000000010', 3, 1 ),
       ('1000000010', 5, 1);


-- Pizza recipes

INSERT INTO Recette (pizza_id, ingredient_id, quantite)
VALUES (1, 1, 1),
       (1, 2, 50),
       (1, 3, 100),
       (1, 4, 50),
       (2, 1, 1),
       (2, 2, 50),
       (2, 3, 100),
       (2, 5, 50),
       (3, 1, 1),
       (3, 2, 50),
       (3, 3, 100),
       (3, 4, 50),
       (3, 6, 50),
       (4, 1, 1),
       (4, 2, 50),
       (4, 3, 100),
       (4, 7, 200),
       (4, 8, 10),
       (4, 9, 10),
       (5, 1, 1),
       (5, 2, 50),
       (5, 3, 100),
       (5, 6, 50),
       (5, 8, 10),
       (5, 9, 10),
       (5, 10, 50),
       (6, 1, 1),
       (6, 2, 50),
       (6, 3, 100),
       (6, 11, 100),
       (7, 1, 1),
       (7, 2, 50),
       (7, 3, 100),
       (7, 8, 10),
       (7, 12, 20),
       (7, 13, 25),
       (8, 1, 1),
       (8, 2, 50),
       (8, 3, 100),
       (8, 4, 50),
       (8, 6, 50),
       (8, 12, 20),
       (8, 14, 1),
       (9, 15, 10),
       (9, 1, 1),
       (9, 2, 50),
       (9, 3, 100),
       (9, 4, 50),
       (9, 10, 50),
       (9, 16, 100),
       (10, 1, 1),
       (10, 2, 50),
       (10, 3, 100),
       (10, 4, 50),
       (10, 10, 50),
       (10, 14, 1),
       (10, 17, 100);


-- Food stocks

INSERT INTO Stock (point_de_vente_id, ingredient_id, stock_secu, stock_courant, stock_projete)
VALUES (1, 1, 100, 50, 46), -- order in progress
       (1, 2, 5000, 3000, 2800), -- order in progress
       (1, 3, 10000, 12000, 11600),
       (1, 4, 1000, 1800, 1700),
       (1, 5, 1000, 1900, 1900),
       (1, 6, 3000, 4000, 3900),
       (1, 7, 1000, 1750, 1550),
       (1, 8, 100, 136, 126),
       (1, 9, 100, 150, 140),
       (1, 10, 3000, 5500, 5500),
       (1, 11, 500, 700, 600),
       (1, 12, 500, 800, 780),
       (1, 13, 500, 750, 750),
       (1, 14, 12, 19, 18),
       (1, 15, 500, 900, 890),
       (1, 16, 500, 800, 800),
       (1, 17, 500, 600, 600),
       (2, 1, 100, 150, 149),
       (2, 2, 5000, 8000, 7950),
       (2, 3, 10000, 3000, 2900), -- order in progress
       (2, 4, 1000, 800, 750), -- eorder in progress
       (2, 5, 1000, 1800, 1800),
       (2, 6, 3000, 5100, 5100),
       (2, 7, 1000, 1450, 1450),
       (2, 8, 100, 128, 128),
       (2, 9, 100, 150, 150),
       (2, 10, 3000, 5500, 5450),
       (2, 11, 500, 550, 550),
       (2, 12, 500, 600, 600),
       (2, 13, 500, 950, 950),
       (2, 14, 12, 15, 14),
       (2, 15, 500, 650, 650),
       (2, 16, 500, 730, 730),
       (2, 17, 500, 670, 670),
       (3, 1, 100, 124, 121),
       (3, 2, 5000, 6500, 6350),
       (3, 3, 10000, 12000, 11700),
       (3, 4, 1000, 1330, 1280),
       (3, 5, 1000, 900, 850), -- order in progress
       (3, 6, 3000, 1990, 1890), -- order in progress
       (3, 7, 1000, 0, 0), -- order in progress -- STOCK 0
       (3, 8, 100, 136, 126),
       (3, 9, 100, 119, 109),
       (3, 10, 3000, 4560, 4510),
       (3, 11, 500, 650, 650),
       (3, 12, 500, 980, 980),
       (3, 13, 500, 770, 770),
       (3, 14, 12, 13, 13),
       (3, 15, 500, 910, 910),
       (3, 16, 500, 820, 820),
       (3, 17, 500, 840, 840);


-- Food orders lines

INSERT INTO Ligne_cmd_marchandise
    (
        num,
        point_de_vente_id,
        ingredient_id,
        quantite,
        annulee,
        ouverte,
        soldee
    )
VALUES
    (
        '5000000001',
        1,
        5,
        1000,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '5000000002',
        1,
        6,
        3000,
        FALSE,
        FALSE,
        TRUE
    ),
        (
        '5000000003',
        2,
        2,
        5000,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '5000000004',
        2,
        6,
        3000,
        FALSE,
        FALSE,
        TRUE
    ),
        (
        '5000000005',
        3,
        12,
        500,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '5000000006',
        3,
        15,
        500,
        FALSE,
        FALSE,
        TRUE
    ),
        (
        '5000000007',
        3,
        14,
        12,
        TRUE,
        FALSE,
        FALSE
    ),
    (
        '5000000008',
        3,
        16,
        500,
        TRUE,
        FALSE,
        FALSE
    ),
    (
        '5000000009',
        1,
        1,
        100,
        FALSE,
        TRUE,
        FALSE
    ),
    (
        '5000000010',
        1,
        2,
        5000,
        FALSE,
        TRUE,
        FALSE
    ),
    (
        '5000000011',
        2,
        3,
        10000,
        FALSE,
        TRUE,
        FALSE
    ),
    (
        '5000000012',
        2,
        4,
        1000,
        FALSE,
        TRUE,
        FALSE
    ),
    (
        '5000000013',
        3,
        5,
        1000,
        FALSE,
        TRUE,
        FALSE
    ),
    (
        '5000000014',
        3,
        6,
        3000,
        FALSE,
        TRUE,
        FALSE
    ),
    (
        '5000000015',
        3,
        7,
        2000,
        FALSE,
        TRUE,
        FALSE
    );


-- Available pizzas

INSERT INTO Pizza_disponible (pizza_id, point_de_vente_id, disponible)
VALUES (1, 1, TRUE),
       (2, 1, TRUE),
       (3, 1, TRUE),
       (4, 1, TRUE),
       (5, 1, TRUE),
       (6, 1, TRUE),
       (7, 1, TRUE),
       (8, 1, TRUE),
       (9, 1, TRUE),
       (10, 1, TRUE),
       (1, 2, TRUE),
       (2, 2, TRUE),
       (3, 2, TRUE),
       (4, 2, TRUE),
       (5, 2, TRUE),
       (6, 2, TRUE),
       (7, 2, TRUE),
       (8, 2, TRUE),
       (9, 2, TRUE),
       (10, 2, TRUE),
       (1, 3, TRUE),
       (2, 3, TRUE),
       (3, 3, TRUE),
       (4, 3, FALSE), -- unavailable
       (5, 3, TRUE),
       (6, 3, TRUE),
       (7, 3, TRUE),
       (8, 3, TRUE),
       (9, 3, TRUE),
       (10, 3, TRUE);


-- Food receipts lines

INSERT INTO Ligne_rcpt_marchandise
    (
        num,
        ligne_cmd_marchandise_num,
        point_de_vente_id,
        ingredient_id,
        quantite,
        commentaire
    )
VALUES
    (
        '7000000001',
        '5000000002',
        1,
        6,
        2000,
        'partiel'
    ),
    (
        '7000000002',
        '5000000002',
        1,
        6,
        1000,
        'solde suite au partiel'
    ),
    (
        '7000000003',
        '5000000001',
        1,
        5,
        1000,
        ''
    ),
    (
        '7000000004',
        '5000000006',
        3,
        15,
        30,
        ''
    ),
    (
        '7000000005',
        '5000000005',
        3,
        12,
        50,
        ''
    ),
    (
        '7000000006',
        '5000000003',
        2,
        2,
        5000,
        ''
    ),
    (
        '7000000007',
        '5000000004',
        2,
        6,
        3000,
        ''
    );


-- Deliveries to customers

INSERT INTO Livraison_client (commande_client_num, adresse_livraison_id, date_heure_livraison)
VALUES ('1000000001', 4, '2019-04-24 12:06:00.000000+02'),
       ('1000000002', 5, '2019-04-25 20:09:00.000000+02'),
       ('1000000007', 6, '2019-04-30 20:26:00.000000+02');


-- Pizzas in progress

INSERT INTO En_cours_pizza
    (
        commande_client_num,
        point_de_vente_id,
        pizza_id,
        attente_preparation,
        en_preparation,
        en_cuisson,
        pret_a_servir,
        client_servi
    )
VALUES
    (
        '1000000001',
        3,
        1,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000001',
        3,
        2,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000001',
        3,
        2,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000001',
        3,
        3,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000002',
        1,
        4,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000003',
        2,
        5,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000003',
        2,
        6,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000005',
        1,
        7,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000005',
        1,
        8,
        FALSE,
        FALSE,
        FALSE,
        FALSE,
        TRUE
    ),
    (
        '1000000006',
        2,
        10,
        FALSE,
        FALSE,
        TRUE,
        FALSE,
        FALSE
    ),
    (
        '1000000008',
        1,
        4,
        FALSE,
        FALSE,
        TRUE,
        FALSE,
        FALSE
    ),
    (
        '1000000008',
        1,
        6,
        FALSE,
        TRUE,
        FALSE,
        FALSE,
        FALSE
    ),
    (
        '1000000008',
        1,
        8,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE
    ),
    (
        '1000000009',
        1,
        3,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE
    ),
    (
        '1000000010',
        3,
        2,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE
    ),
    (
        '1000000010',
        3,
        3,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE
    ),
    (
        '1000000010',
        3,
        5,
        TRUE,
        FALSE,
        FALSE,
        FALSE,
        FALSE
    );
