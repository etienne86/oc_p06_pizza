-- Tables creation into db_pizza

-- Please select the database 'db_pizza' in pgAdmin before executing these SQL requests

CREATE SEQUENCE public.ingredient_id_seq;

CREATE TABLE public.Ingredient (
                id INTEGER NOT NULL DEFAULT nextval('public.ingredient_id_seq'),
                nom_ingredient VARCHAR(50) NOT NULL,
                unite VARCHAR(10) NOT NULL,
                lot_commande INTEGER NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.Ingredient.id;

CREATE SEQUENCE public.employe_id_seq;

CREATE TABLE public.Employe (
                id INTEGER NOT NULL DEFAULT nextval('public.employe_id_seq'),
                identifiant VARCHAR(100) NOT NULL,
                mdp_chiffre CHAR(40) NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                telephone VARCHAR(20) NOT NULL,
                authentifie BOOLEAN NOT NULL,
                mail VARCHAR(100) NOT NULL,
                alerte_sms BOOLEAN NOT NULL,
                alerte_mail BOOLEAN NOT NULL,
                role VARCHAR(50) NOT NULL,
                CONSTRAINT employe_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.employe_id_seq OWNED BY public.Employe.id;

CREATE UNIQUE INDEX employe_idx
 ON public.Employe
 ( identifiant );

CREATE SEQUENCE public.pizza_id_seq;

CREATE TABLE public.Pizza (
                id INTEGER NOT NULL DEFAULT nextval('public.pizza_id_seq'),
                type VARCHAR(50) NOT NULL,
                tarif REAL NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizza_id_seq OWNED BY public.Pizza.id;

CREATE TABLE public.Recette (
                pizza_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT recette_pk PRIMARY KEY (pizza_id, ingredient_id)
);


CREATE SEQUENCE public.point_de_vente_id_seq;

CREATE SEQUENCE public.point_de_vente_adresse_code_postal_seq;

CREATE TABLE public.Point_de_vente (
                id INTEGER NOT NULL DEFAULT nextval('public.point_de_vente_id_seq'),
                adresse_numero VARCHAR(10) NOT NULL,
                adresse_voie VARCHAR(100) NOT NULL,
                adresse_code_postal VARCHAR(5) NOT NULL DEFAULT nextval('public.point_de_vente_adresse_code_postal_seq'),
                adresse_ville VARCHAR(50) NOT NULL,
                adresse_pays VARCHAR(50) NOT NULL,
                delai INTEGER NOT NULL,
                CONSTRAINT point_de_vente_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.point_de_vente_id_seq OWNED BY public.Point_de_vente.id;

ALTER SEQUENCE public.point_de_vente_adresse_code_postal_seq OWNED BY public.Point_de_vente.adresse_code_postal;

CREATE TABLE public.Ligne_cmd_marchandise (
                num CHAR(10) NOT NULL,
                point_de_vente_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                annulee BOOLEAN NOT NULL,
                ouverte BOOLEAN NOT NULL,
                soldee BOOLEAN NOT NULL,
                CONSTRAINT ligne_cmd_marchandise_pk PRIMARY KEY (num)
);


CREATE TABLE public.Ligne_rcpt_marchandise (
                num CHAR(10) NOT NULL,
                ligne_cmd_marchandise_num CHAR(10) NOT NULL,
                point_de_vente_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                commentaire VARCHAR(1000) NOT NULL,
                CONSTRAINT ligne_rcpt_marchandise_pk PRIMARY KEY (num)
);


CREATE TABLE public.Pizza_disponible (
                pizza_id INTEGER NOT NULL,
                point_de_vente_id INTEGER NOT NULL,
                disponible BOOLEAN NOT NULL,
                CONSTRAINT pizza_disponible_pk PRIMARY KEY (pizza_id, point_de_vente_id)
);


CREATE TABLE public.Stock (
                point_de_vente_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                stock_secu INTEGER NOT NULL,
                stock_courant INTEGER NOT NULL,
                stock_projete INTEGER NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (point_de_vente_id, ingredient_id)
);


CREATE SEQUENCE public.client_id_seq;

CREATE TABLE public.Client (
                id INTEGER NOT NULL DEFAULT nextval('public.client_id_seq'),
                identifiant VARCHAR(100) NOT NULL,
                mdp_chiffre CHAR(40) NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                telephone VARCHAR(20) NOT NULL,
                authentifie BOOLEAN NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.client_id_seq OWNED BY public.Client.id;

CREATE UNIQUE INDEX client_idx
 ON public.Client
 ( identifiant );

CREATE SEQUENCE public.adresse_livraison_id_seq;

CREATE TABLE public.Adresse_livraison (
                id INTEGER NOT NULL DEFAULT nextval('public.adresse_livraison_id_seq'),
                adresse_numero VARCHAR(10) NOT NULL,
                adresse_voie VARCHAR(100) NOT NULL,
                adresse_code_postal VARCHAR(5) NOT NULL,
                adresse_ville VARCHAR(50) NOT NULL,
                adresse_pays VARCHAR(50) NOT NULL,
                CONSTRAINT adresse_livraison_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.adresse_livraison_id_seq OWNED BY public.Adresse_livraison.id;

CREATE TABLE public.Commande_client (
                num CHAR(10) NOT NULL,
                client_id INTEGER NOT NULL,
                point_de_vente_id INTEGER NOT NULL,
                a_livrer BOOLEAN NOT NULL,
                adresse_livraison_id INTEGER NOT NULL,
                delai_livraison INTEGER NOT NULL,
                date_heure_cmd_validee TIMESTAMP NOT NULL,
                date_heure_promis TIMESTAMP NOT NULL,
                montant REAL NOT NULL,
                mode_paiement VARCHAR(50) NOT NULL,
                payee BOOLEAN NOT NULL,
                validee BOOLEAN NOT NULL,
                payee_en_ligne BOOLEAN NOT NULL,
                annul_ou_modif_en_cours BOOLEAN NOT NULL,
                modifiee BOOLEAN NOT NULL,
                annulee BOOLEAN NOT NULL,
                soldee BOOLEAN NOT NULL,
                en_preparation BOOLEAN NOT NULL,
                CONSTRAINT commande_client_pk PRIMARY KEY (num)
);


CREATE SEQUENCE public.ligne_panier_id_seq;

CREATE TABLE public.Ligne_panier (
                id INTEGER NOT NULL DEFAULT nextval('public.ligne_panier_id_seq'),
                commande_client_num CHAR(10) NOT NULL,
                pizza_id INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT ligne_panier_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ligne_panier_id_seq OWNED BY public.Ligne_panier.id;

CREATE SEQUENCE public.en_cours_pizza_id_seq;

CREATE TABLE public.En_cours_pizza (
                id INTEGER NOT NULL DEFAULT nextval('public.en_cours_pizza_id_seq'),
                commande_client_num CHAR(10) NOT NULL,
                point_de_vente_id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                attente_preparation BOOLEAN NOT NULL,
                en_preparation BOOLEAN NOT NULL,
                en_cuisson BOOLEAN NOT NULL,
                pret_a_servir BOOLEAN NOT NULL,
                client_servi BOOLEAN NOT NULL,
                CONSTRAINT en_cours_pizza_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.en_cours_pizza_id_seq OWNED BY public.En_cours_pizza.id;

CREATE TABLE public.Livraison_client (
                commande_client_num CHAR(10) NOT NULL,
                adresse_livraison_id INTEGER NOT NULL,
                date_heure_livraison TIMESTAMP NOT NULL,
                CONSTRAINT livraison_client_pk PRIMARY KEY (commande_client_num, adresse_livraison_id)
);


ALTER TABLE public.Stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ligne_cmd_marchandise ADD CONSTRAINT ingredient_commande_marchandise_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ligne_rcpt_marchandise ADD CONSTRAINT ingredient_reception_marchandise_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Recette ADD CONSTRAINT ingredient_recette_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.Ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.En_cours_pizza ADD CONSTRAINT pizza_encourspizza_fk
FOREIGN KEY (pizza_id)
REFERENCES public.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ligne_panier ADD CONSTRAINT pizza_panier_fk
FOREIGN KEY (pizza_id)
REFERENCES public.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Recette ADD CONSTRAINT pizza_recette_fk
FOREIGN KEY (pizza_id)
REFERENCES public.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizza_disponible ADD CONSTRAINT pizza_pizza_disponible_fk
FOREIGN KEY (pizza_id)
REFERENCES public.Pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.En_cours_pizza ADD CONSTRAINT point_de_vente_encourspizza_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES public.Point_de_vente (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Stock ADD CONSTRAINT point_de_vente_stock_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES public.Point_de_vente (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande_client ADD CONSTRAINT point_de_vente_commande_client_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES public.Point_de_vente (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Pizza_disponible ADD CONSTRAINT point_de_vente_pizza_disponible_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES public.Point_de_vente (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ligne_cmd_marchandise ADD CONSTRAINT point_de_vente_commande_marchandise_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES public.Point_de_vente (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ligne_rcpt_marchandise ADD CONSTRAINT point_de_vente_reception_marchandise_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES public.Point_de_vente (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ligne_rcpt_marchandise ADD CONSTRAINT ligne_cmd_marchandise_ligne_rcpt_marchandise_fk
FOREIGN KEY (ligne_cmd_marchandise_num)
REFERENCES public.Ligne_cmd_marchandise (num)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande_client ADD CONSTRAINT client_commande_client_fk
FOREIGN KEY (client_id)
REFERENCES public.Client (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Livraison_client ADD CONSTRAINT adresse_livraison_livraison_client_fk
FOREIGN KEY (adresse_livraison_id)
REFERENCES public.Adresse_livraison (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande_client ADD CONSTRAINT adresse_livraison_commande_client_fk
FOREIGN KEY (adresse_livraison_id)
REFERENCES public.Adresse_livraison (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Livraison_client ADD CONSTRAINT commande_client_livraison_client_fk
FOREIGN KEY (commande_client_num)
REFERENCES public.Commande_client (num)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.En_cours_pizza ADD CONSTRAINT commande_client_encourspizza_fk
FOREIGN KEY (commande_client_num)
REFERENCES public.Commande_client (num)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ligne_panier ADD CONSTRAINT commande_client_panier_fk
FOREIGN KEY (commande_client_num)
REFERENCES public.Commande_client (num)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
