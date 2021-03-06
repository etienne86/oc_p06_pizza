PGDMP     4    )                w           db_pizza    11.1    11.2 m    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    20027    db_pizza    DATABASE     f   CREATE DATABASE db_pizza WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE db_pizza;
          	   adm_pizza    false            �            1259    20327    adresse_livraison    TABLE     B  CREATE TABLE public.adresse_livraison (
    id integer NOT NULL,
    adresse_numero character varying(10) NOT NULL,
    adresse_voie character varying(100) NOT NULL,
    adresse_code_postal character varying(5) NOT NULL,
    adresse_ville character varying(50) NOT NULL,
    adresse_pays character varying(50) NOT NULL
);
 %   DROP TABLE public.adresse_livraison;
       public         postgres    false            �            1259    20325    adresse_livraison_id_seq    SEQUENCE     �   CREATE SEQUENCE public.adresse_livraison_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.adresse_livraison_id_seq;
       public       postgres    false    213            �           0    0    adresse_livraison_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.adresse_livraison_id_seq OWNED BY public.adresse_livraison.id;
            public       postgres    false    212            �            1259    20318    client    TABLE     6  CREATE TABLE public.client (
    id integer NOT NULL,
    identifiant character varying(100) NOT NULL,
    mdp_chiffre character(40) NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    telephone character varying(20) NOT NULL,
    authentifie boolean NOT NULL
);
    DROP TABLE public.client;
       public         postgres    false            �            1259    20316    client_id_seq    SEQUENCE     v   CREATE SEQUENCE public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.client_id_seq;
       public       postgres    false    211            �           0    0    client_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;
            public       postgres    false    210            �            1259    20333    commande_client    TABLE     �  CREATE TABLE public.commande_client (
    num character(10) NOT NULL,
    client_id integer NOT NULL,
    point_de_vente_id integer NOT NULL,
    a_livrer boolean NOT NULL,
    adresse_livraison_id integer NOT NULL,
    delai_livraison integer NOT NULL,
    date_heure_cmd_validee timestamp without time zone NOT NULL,
    date_heure_promis timestamp without time zone NOT NULL,
    montant real NOT NULL,
    mode_paiement character varying(50) NOT NULL,
    payee boolean NOT NULL,
    validee boolean NOT NULL,
    payee_en_ligne boolean NOT NULL,
    annul_ou_modif_en_cours boolean NOT NULL,
    modifiee boolean NOT NULL,
    annulee boolean NOT NULL,
    soldee boolean NOT NULL,
    en_preparation boolean NOT NULL
);
 #   DROP TABLE public.commande_client;
       public         postgres    false            �            1259    20283    employe    TABLE     �  CREATE TABLE public.employe (
    id integer NOT NULL,
    identifiant character varying(100) NOT NULL,
    mdp_chiffre character(40) NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    telephone character varying(20) NOT NULL,
    authentifie boolean NOT NULL,
    mail character varying(100) NOT NULL,
    alerte_sms boolean NOT NULL,
    alerte_mail boolean NOT NULL,
    role character varying(50) NOT NULL,
    point_de_vente_id integer NOT NULL
);
    DROP TABLE public.employe;
       public         postgres    false            �            1259    20281    employe_id_seq    SEQUENCE     w   CREATE SEQUENCE public.employe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.employe_id_seq;
       public       postgres    false    205            �           0    0    employe_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.employe_id_seq OWNED BY public.employe.id;
            public       postgres    false    204            �            1259    20348    en_cours_pizza    TABLE     n  CREATE TABLE public.en_cours_pizza (
    id integer NOT NULL,
    commande_client_num character(10) NOT NULL,
    point_de_vente_id integer NOT NULL,
    pizza_id integer NOT NULL,
    attente_preparation boolean NOT NULL,
    en_preparation boolean NOT NULL,
    en_cuisson boolean NOT NULL,
    pret_a_servir boolean NOT NULL,
    client_servi boolean NOT NULL
);
 "   DROP TABLE public.en_cours_pizza;
       public         postgres    false            �            1259    20346    en_cours_pizza_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.en_cours_pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.en_cours_pizza_id_seq;
       public       postgres    false    218            �           0    0    en_cours_pizza_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.en_cours_pizza_id_seq OWNED BY public.en_cours_pizza.id;
            public       postgres    false    217            �            1259    20251 
   ingredient    TABLE     �   CREATE TABLE public.ingredient (
    id integer NOT NULL,
    nom_ingredient character varying(50) NOT NULL,
    unite character varying(10) NOT NULL,
    lot_commande integer NOT NULL
);
    DROP TABLE public.ingredient;
       public         postgres    false            �            1259    20249    ingredient_id_seq    SEQUENCE     z   CREATE SEQUENCE public.ingredient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ingredient_id_seq;
       public       postgres    false    197            �           0    0    ingredient_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;
            public       postgres    false    196            �            1259    20293    ligne_cmd_marchandise    TABLE       CREATE TABLE public.ligne_cmd_marchandise (
    num character(10) NOT NULL,
    point_de_vente_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    quantite integer NOT NULL,
    annulee boolean NOT NULL,
    ouverte boolean NOT NULL,
    soldee boolean NOT NULL
);
 )   DROP TABLE public.ligne_cmd_marchandise;
       public         postgres    false            �            1259    20340    ligne_panier    TABLE     �   CREATE TABLE public.ligne_panier (
    id integer NOT NULL,
    commande_client_num character(10) NOT NULL,
    pizza_id integer NOT NULL,
    quantite integer NOT NULL
);
     DROP TABLE public.ligne_panier;
       public         postgres    false            �            1259    20338    ligne_panier_id_seq    SEQUENCE     |   CREATE SEQUENCE public.ligne_panier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ligne_panier_id_seq;
       public       postgres    false    216            �           0    0    ligne_panier_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.ligne_panier_id_seq OWNED BY public.ligne_panier.id;
            public       postgres    false    215            �            1259    20298    ligne_rcpt_marchandise    TABLE     "  CREATE TABLE public.ligne_rcpt_marchandise (
    num character(10) NOT NULL,
    ligne_cmd_marchandise_num character(10) NOT NULL,
    point_de_vente_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    quantite integer NOT NULL,
    commentaire character varying(1000) NOT NULL
);
 *   DROP TABLE public.ligne_rcpt_marchandise;
       public         postgres    false            �            1259    20354    livraison_client    TABLE     �   CREATE TABLE public.livraison_client (
    commande_client_num character(10) NOT NULL,
    adresse_livraison_id integer NOT NULL,
    date_heure_livraison timestamp without time zone NOT NULL
);
 $   DROP TABLE public.livraison_client;
       public         postgres    false            �            1259    20259    pizza    TABLE     y   CREATE TABLE public.pizza (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    tarif real NOT NULL
);
    DROP TABLE public.pizza;
       public         postgres    false            �            1259    20306    pizza_disponible    TABLE     �   CREATE TABLE public.pizza_disponible (
    pizza_id integer NOT NULL,
    point_de_vente_id integer NOT NULL,
    disponible boolean NOT NULL
);
 $   DROP TABLE public.pizza_disponible;
       public         postgres    false            �            1259    20257    pizza_id_seq    SEQUENCE     u   CREATE SEQUENCE public.pizza_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pizza_id_seq;
       public       postgres    false    199            �           0    0    pizza_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id;
            public       postgres    false    198            �            1259    20274    point_de_vente    TABLE     [  CREATE TABLE public.point_de_vente (
    id integer NOT NULL,
    adresse_numero character varying(10) NOT NULL,
    adresse_voie character varying(100) NOT NULL,
    adresse_code_postal character varying(5) NOT NULL,
    adresse_ville character varying(50) NOT NULL,
    adresse_pays character varying(50) NOT NULL,
    delai integer NOT NULL
);
 "   DROP TABLE public.point_de_vente;
       public         postgres    false            �            1259    20272 &   point_de_vente_adresse_code_postal_seq    SEQUENCE     �   CREATE SEQUENCE public.point_de_vente_adresse_code_postal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.point_de_vente_adresse_code_postal_seq;
       public       postgres    false    203            �           0    0 &   point_de_vente_adresse_code_postal_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.point_de_vente_adresse_code_postal_seq OWNED BY public.point_de_vente.adresse_code_postal;
            public       postgres    false    202            �            1259    20270    point_de_vente_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.point_de_vente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.point_de_vente_id_seq;
       public       postgres    false    203            �           0    0    point_de_vente_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.point_de_vente_id_seq OWNED BY public.point_de_vente.id;
            public       postgres    false    201            �            1259    20265    recette    TABLE     �   CREATE TABLE public.recette (
    pizza_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    quantite integer NOT NULL
);
    DROP TABLE public.recette;
       public         postgres    false            �            1259    20311    stock    TABLE     �   CREATE TABLE public.stock (
    point_de_vente_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    stock_secu integer NOT NULL,
    stock_courant integer NOT NULL,
    stock_projete integer NOT NULL
);
    DROP TABLE public.stock;
       public         postgres    false            
           2604    20330    adresse_livraison id    DEFAULT     |   ALTER TABLE ONLY public.adresse_livraison ALTER COLUMN id SET DEFAULT nextval('public.adresse_livraison_id_seq'::regclass);
 C   ALTER TABLE public.adresse_livraison ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    213    213            	           2604    20321 	   client id    DEFAULT     f   ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);
 8   ALTER TABLE public.client ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210    211                       2604    20286 
   employe id    DEFAULT     h   ALTER TABLE ONLY public.employe ALTER COLUMN id SET DEFAULT nextval('public.employe_id_seq'::regclass);
 9   ALTER TABLE public.employe ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204    205                       2604    20351    en_cours_pizza id    DEFAULT     v   ALTER TABLE ONLY public.en_cours_pizza ALTER COLUMN id SET DEFAULT nextval('public.en_cours_pizza_id_seq'::regclass);
 @   ALTER TABLE public.en_cours_pizza ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    218    217    218                       2604    20254    ingredient id    DEFAULT     n   ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);
 <   ALTER TABLE public.ingredient ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197                       2604    20343    ligne_panier id    DEFAULT     r   ALTER TABLE ONLY public.ligne_panier ALTER COLUMN id SET DEFAULT nextval('public.ligne_panier_id_seq'::regclass);
 >   ALTER TABLE public.ligne_panier ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    216    216                       2604    20262    pizza id    DEFAULT     d   ALTER TABLE ONLY public.pizza ALTER COLUMN id SET DEFAULT nextval('public.pizza_id_seq'::regclass);
 7   ALTER TABLE public.pizza ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199                       2604    20277    point_de_vente id    DEFAULT     v   ALTER TABLE ONLY public.point_de_vente ALTER COLUMN id SET DEFAULT nextval('public.point_de_vente_id_seq'::regclass);
 @   ALTER TABLE public.point_de_vente ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    203    203                       2604    20278 "   point_de_vente adresse_code_postal    DEFAULT     �   ALTER TABLE ONLY public.point_de_vente ALTER COLUMN adresse_code_postal SET DEFAULT nextval('public.point_de_vente_adresse_code_postal_seq'::regclass);
 Q   ALTER TABLE public.point_de_vente ALTER COLUMN adresse_code_postal DROP DEFAULT;
       public       postgres    false    203    202    203            �          0    20327    adresse_livraison 
   TABLE DATA                  COPY public.adresse_livraison (id, adresse_numero, adresse_voie, adresse_code_postal, adresse_ville, adresse_pays) FROM stdin;
    public       postgres    false    213   ��       �          0    20318    client 
   TABLE DATA               c   COPY public.client (id, identifiant, mdp_chiffre, nom, prenom, telephone, authentifie) FROM stdin;
    public       postgres    false    211   j�       �          0    20333    commande_client 
   TABLE DATA               $  COPY public.commande_client (num, client_id, point_de_vente_id, a_livrer, adresse_livraison_id, delai_livraison, date_heure_cmd_validee, date_heure_promis, montant, mode_paiement, payee, validee, payee_en_ligne, annul_ou_modif_en_cours, modifiee, annulee, soldee, en_preparation) FROM stdin;
    public       postgres    false    214   M�       �          0    20283    employe 
   TABLE DATA               �   COPY public.employe (id, identifiant, mdp_chiffre, nom, prenom, telephone, authentifie, mail, alerte_sms, alerte_mail, role, point_de_vente_id) FROM stdin;
    public       postgres    false    205   �       �          0    20348    en_cours_pizza 
   TABLE DATA               �   COPY public.en_cours_pizza (id, commande_client_num, point_de_vente_id, pizza_id, attente_preparation, en_preparation, en_cuisson, pret_a_servir, client_servi) FROM stdin;
    public       postgres    false    218   t�       �          0    20251 
   ingredient 
   TABLE DATA               M   COPY public.ingredient (id, nom_ingredient, unite, lot_commande) FROM stdin;
    public       postgres    false    197   �       �          0    20293    ligne_cmd_marchandise 
   TABLE DATA               z   COPY public.ligne_cmd_marchandise (num, point_de_vente_id, ingredient_id, quantite, annulee, ouverte, soldee) FROM stdin;
    public       postgres    false    206   �       �          0    20340    ligne_panier 
   TABLE DATA               S   COPY public.ligne_panier (id, commande_client_num, pizza_id, quantite) FROM stdin;
    public       postgres    false    216   {�       �          0    20298    ligne_rcpt_marchandise 
   TABLE DATA               �   COPY public.ligne_rcpt_marchandise (num, ligne_cmd_marchandise_num, point_de_vente_id, ingredient_id, quantite, commentaire) FROM stdin;
    public       postgres    false    207   �       �          0    20354    livraison_client 
   TABLE DATA               k   COPY public.livraison_client (commande_client_num, adresse_livraison_id, date_heure_livraison) FROM stdin;
    public       postgres    false    219   ��       �          0    20259    pizza 
   TABLE DATA               0   COPY public.pizza (id, type, tarif) FROM stdin;
    public       postgres    false    199   ؔ       �          0    20306    pizza_disponible 
   TABLE DATA               S   COPY public.pizza_disponible (pizza_id, point_de_vente_id, disponible) FROM stdin;
    public       postgres    false    208   p�       �          0    20274    point_de_vente 
   TABLE DATA               �   COPY public.point_de_vente (id, adresse_numero, adresse_voie, adresse_code_postal, adresse_ville, adresse_pays, delai) FROM stdin;
    public       postgres    false    203   ϕ       �          0    20265    recette 
   TABLE DATA               D   COPY public.recette (pizza_id, ingredient_id, quantite) FROM stdin;
    public       postgres    false    200   P�       �          0    20311    stock 
   TABLE DATA               k   COPY public.stock (point_de_vente_id, ingredient_id, stock_secu, stock_courant, stock_projete) FROM stdin;
    public       postgres    false    209   �       �           0    0    adresse_livraison_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.adresse_livraison_id_seq', 6, true);
            public       postgres    false    212            �           0    0    client_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.client_id_seq', 5, true);
            public       postgres    false    210            �           0    0    employe_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.employe_id_seq', 3, true);
            public       postgres    false    204            �           0    0    en_cours_pizza_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.en_cours_pizza_id_seq', 17, true);
            public       postgres    false    217            �           0    0    ingredient_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ingredient_id_seq', 17, true);
            public       postgres    false    196            �           0    0    ligne_panier_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.ligne_panier_id_seq', 20, true);
            public       postgres    false    215            �           0    0    pizza_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.pizza_id_seq', 10, true);
            public       postgres    false    198            �           0    0 &   point_de_vente_adresse_code_postal_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.point_de_vente_adresse_code_postal_seq', 1, false);
            public       postgres    false    202            �           0    0    point_de_vente_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.point_de_vente_id_seq', 3, true);
            public       postgres    false    201            $           2606    20332 &   adresse_livraison adresse_livraison_pk 
   CONSTRAINT     d   ALTER TABLE ONLY public.adresse_livraison
    ADD CONSTRAINT adresse_livraison_pk PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.adresse_livraison DROP CONSTRAINT adresse_livraison_pk;
       public         postgres    false    213            "           2606    20323    client client_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pk;
       public         postgres    false    211            &           2606    20337 "   commande_client commande_client_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.commande_client
    ADD CONSTRAINT commande_client_pk PRIMARY KEY (num);
 L   ALTER TABLE ONLY public.commande_client DROP CONSTRAINT commande_client_pk;
       public         postgres    false    214                       2606    20291    employe employe_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.employe
    ADD CONSTRAINT employe_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.employe DROP CONSTRAINT employe_pk;
       public         postgres    false    205            *           2606    20353     en_cours_pizza en_cours_pizza_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.en_cours_pizza
    ADD CONSTRAINT en_cours_pizza_pk PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.en_cours_pizza DROP CONSTRAINT en_cours_pizza_pk;
       public         postgres    false    218                       2606    20256    ingredient ingredient_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ingredient DROP CONSTRAINT ingredient_pk;
       public         postgres    false    197                       2606    20297 .   ligne_cmd_marchandise ligne_cmd_marchandise_pk 
   CONSTRAINT     m   ALTER TABLE ONLY public.ligne_cmd_marchandise
    ADD CONSTRAINT ligne_cmd_marchandise_pk PRIMARY KEY (num);
 X   ALTER TABLE ONLY public.ligne_cmd_marchandise DROP CONSTRAINT ligne_cmd_marchandise_pk;
       public         postgres    false    206            (           2606    20345    ligne_panier ligne_panier_pk 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ligne_panier
    ADD CONSTRAINT ligne_panier_pk PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.ligne_panier DROP CONSTRAINT ligne_panier_pk;
       public         postgres    false    216                       2606    20305 0   ligne_rcpt_marchandise ligne_rcpt_marchandise_pk 
   CONSTRAINT     o   ALTER TABLE ONLY public.ligne_rcpt_marchandise
    ADD CONSTRAINT ligne_rcpt_marchandise_pk PRIMARY KEY (num);
 Z   ALTER TABLE ONLY public.ligne_rcpt_marchandise DROP CONSTRAINT ligne_rcpt_marchandise_pk;
       public         postgres    false    207            ,           2606    20358 $   livraison_client livraison_client_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.livraison_client
    ADD CONSTRAINT livraison_client_pk PRIMARY KEY (commande_client_num, adresse_livraison_id);
 N   ALTER TABLE ONLY public.livraison_client DROP CONSTRAINT livraison_client_pk;
       public         postgres    false    219    219                       2606    20310 $   pizza_disponible pizza_disponible_pk 
   CONSTRAINT     {   ALTER TABLE ONLY public.pizza_disponible
    ADD CONSTRAINT pizza_disponible_pk PRIMARY KEY (pizza_id, point_de_vente_id);
 N   ALTER TABLE ONLY public.pizza_disponible DROP CONSTRAINT pizza_disponible_pk;
       public         postgres    false    208    208                       2606    20264    pizza pizza_pk 
   CONSTRAINT     L   ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pk PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.pizza DROP CONSTRAINT pizza_pk;
       public         postgres    false    199                       2606    20280     point_de_vente point_de_vente_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public.point_de_vente
    ADD CONSTRAINT point_de_vente_pk PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.point_de_vente DROP CONSTRAINT point_de_vente_pk;
       public         postgres    false    203                       2606    20269    recette recette_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public.recette
    ADD CONSTRAINT recette_pk PRIMARY KEY (pizza_id, ingredient_id);
 <   ALTER TABLE ONLY public.recette DROP CONSTRAINT recette_pk;
       public         postgres    false    200    200                       2606    20315    stock stock_pk 
   CONSTRAINT     j   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pk PRIMARY KEY (point_de_vente_id, ingredient_id);
 8   ALTER TABLE ONLY public.stock DROP CONSTRAINT stock_pk;
       public         postgres    false    209    209                        1259    20324 
   client_idx    INDEX     K   CREATE UNIQUE INDEX client_idx ON public.client USING btree (identifiant);
    DROP INDEX public.client_idx;
       public         postgres    false    211                       1259    20292    employe_idx    INDEX     M   CREATE UNIQUE INDEX employe_idx ON public.employe USING btree (identifiant);
    DROP INDEX public.employe_idx;
       public         postgres    false    205            ;           2606    20449 4   commande_client adresse_livraison_commande_client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande_client
    ADD CONSTRAINT adresse_livraison_commande_client_fk FOREIGN KEY (adresse_livraison_id) REFERENCES public.adresse_livraison(id);
 ^   ALTER TABLE ONLY public.commande_client DROP CONSTRAINT adresse_livraison_commande_client_fk;
       public       postgres    false    213    214    3108            A           2606    20444 6   livraison_client adresse_livraison_livraison_client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livraison_client
    ADD CONSTRAINT adresse_livraison_livraison_client_fk FOREIGN KEY (adresse_livraison_id) REFERENCES public.adresse_livraison(id);
 `   ALTER TABLE ONLY public.livraison_client DROP CONSTRAINT adresse_livraison_livraison_client_fk;
       public       postgres    false    219    3108    213            :           2606    20439 )   commande_client client_commande_client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande_client
    ADD CONSTRAINT client_commande_client_fk FOREIGN KEY (client_id) REFERENCES public.client(id);
 S   ALTER TABLE ONLY public.commande_client DROP CONSTRAINT client_commande_client_fk;
       public       postgres    false    211    214    3106            @           2606    20459 .   en_cours_pizza commande_client_encourspizza_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.en_cours_pizza
    ADD CONSTRAINT commande_client_encourspizza_fk FOREIGN KEY (commande_client_num) REFERENCES public.commande_client(num);
 X   ALTER TABLE ONLY public.en_cours_pizza DROP CONSTRAINT commande_client_encourspizza_fk;
       public       postgres    false    218    3110    214            B           2606    20454 4   livraison_client commande_client_livraison_client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livraison_client
    ADD CONSTRAINT commande_client_livraison_client_fk FOREIGN KEY (commande_client_num) REFERENCES public.commande_client(num);
 ^   ALTER TABLE ONLY public.livraison_client DROP CONSTRAINT commande_client_livraison_client_fk;
       public       postgres    false    214    3110    219            =           2606    20464 &   ligne_panier commande_client_panier_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_panier
    ADD CONSTRAINT commande_client_panier_fk FOREIGN KEY (commande_client_num) REFERENCES public.commande_client(num);
 P   ALTER TABLE ONLY public.ligne_panier DROP CONSTRAINT commande_client_panier_fk;
       public       postgres    false    214    3110    216            0           2606    20364 8   ligne_cmd_marchandise ingredient_commande_marchandise_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_cmd_marchandise
    ADD CONSTRAINT ingredient_commande_marchandise_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
 b   ALTER TABLE ONLY public.ligne_cmd_marchandise DROP CONSTRAINT ingredient_commande_marchandise_fk;
       public       postgres    false    197    206    3086            2           2606    20369 :   ligne_rcpt_marchandise ingredient_reception_marchandise_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_rcpt_marchandise
    ADD CONSTRAINT ingredient_reception_marchandise_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
 d   ALTER TABLE ONLY public.ligne_rcpt_marchandise DROP CONSTRAINT ingredient_reception_marchandise_fk;
       public       postgres    false    207    3086    197            -           2606    20374    recette ingredient_recette_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.recette
    ADD CONSTRAINT ingredient_recette_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
 G   ALTER TABLE ONLY public.recette DROP CONSTRAINT ingredient_recette_fk;
       public       postgres    false    3086    200    197            7           2606    20359    stock ingredient_stock_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT ingredient_stock_fk FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
 C   ALTER TABLE ONLY public.stock DROP CONSTRAINT ingredient_stock_fk;
       public       postgres    false    3086    209    197            4           2606    20434 F   ligne_rcpt_marchandise ligne_cmd_marchandise_ligne_rcpt_marchandise_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_rcpt_marchandise
    ADD CONSTRAINT ligne_cmd_marchandise_ligne_rcpt_marchandise_fk FOREIGN KEY (ligne_cmd_marchandise_num) REFERENCES public.ligne_cmd_marchandise(num);
 p   ALTER TABLE ONLY public.ligne_rcpt_marchandise DROP CONSTRAINT ligne_cmd_marchandise_ligne_rcpt_marchandise_fk;
       public       postgres    false    3097    206    207            >           2606    20379 $   en_cours_pizza pizza_encourspizza_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.en_cours_pizza
    ADD CONSTRAINT pizza_encourspizza_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(id);
 N   ALTER TABLE ONLY public.en_cours_pizza DROP CONSTRAINT pizza_encourspizza_fk;
       public       postgres    false    3088    199    218            <           2606    20384    ligne_panier pizza_panier_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.ligne_panier
    ADD CONSTRAINT pizza_panier_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(id);
 F   ALTER TABLE ONLY public.ligne_panier DROP CONSTRAINT pizza_panier_fk;
       public       postgres    false    3088    216    199            5           2606    20394 *   pizza_disponible pizza_pizza_disponible_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizza_disponible
    ADD CONSTRAINT pizza_pizza_disponible_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(id);
 T   ALTER TABLE ONLY public.pizza_disponible DROP CONSTRAINT pizza_pizza_disponible_fk;
       public       postgres    false    208    199    3088            .           2606    20389    recette pizza_recette_fk    FK CONSTRAINT     x   ALTER TABLE ONLY public.recette
    ADD CONSTRAINT pizza_recette_fk FOREIGN KEY (pizza_id) REFERENCES public.pizza(id);
 B   ALTER TABLE ONLY public.recette DROP CONSTRAINT pizza_recette_fk;
       public       postgres    false    199    200    3088            9           2606    20409 1   commande_client point_de_vente_commande_client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande_client
    ADD CONSTRAINT point_de_vente_commande_client_fk FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);
 [   ALTER TABLE ONLY public.commande_client DROP CONSTRAINT point_de_vente_commande_client_fk;
       public       postgres    false    203    3092    214            1           2606    20419 <   ligne_cmd_marchandise point_de_vente_commande_marchandise_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_cmd_marchandise
    ADD CONSTRAINT point_de_vente_commande_marchandise_fk FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);
 f   ALTER TABLE ONLY public.ligne_cmd_marchandise DROP CONSTRAINT point_de_vente_commande_marchandise_fk;
       public       postgres    false    3092    203    206            /           2606    20429 !   employe point_de_vente_employe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.employe
    ADD CONSTRAINT point_de_vente_employe_fk FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);
 K   ALTER TABLE ONLY public.employe DROP CONSTRAINT point_de_vente_employe_fk;
       public       postgres    false    205    3092    203            ?           2606    20399 -   en_cours_pizza point_de_vente_encourspizza_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.en_cours_pizza
    ADD CONSTRAINT point_de_vente_encourspizza_fk FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);
 W   ALTER TABLE ONLY public.en_cours_pizza DROP CONSTRAINT point_de_vente_encourspizza_fk;
       public       postgres    false    218    203    3092            6           2606    20414 3   pizza_disponible point_de_vente_pizza_disponible_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pizza_disponible
    ADD CONSTRAINT point_de_vente_pizza_disponible_fk FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);
 ]   ALTER TABLE ONLY public.pizza_disponible DROP CONSTRAINT point_de_vente_pizza_disponible_fk;
       public       postgres    false    208    203    3092            3           2606    20424 >   ligne_rcpt_marchandise point_de_vente_reception_marchandise_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.ligne_rcpt_marchandise
    ADD CONSTRAINT point_de_vente_reception_marchandise_fk FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);
 h   ALTER TABLE ONLY public.ligne_rcpt_marchandise DROP CONSTRAINT point_de_vente_reception_marchandise_fk;
       public       postgres    false    207    3092    203            8           2606    20404    stock point_de_vente_stock_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.stock
    ADD CONSTRAINT point_de_vente_stock_fk FOREIGN KEY (point_de_vente_id) REFERENCES public.point_de_vente(id);
 G   ALTER TABLE ONLY public.stock DROP CONSTRAINT point_de_vente_stock_fk;
       public       postgres    false    203    209    3092            �   �   x�m���0Eg�+��!�����O`qSKXJ�ʉ;��iU*1d��Α�u�.�3�J�'N<L���ꦅWT�)8z2�A~�Ul��0��ȩ$�`!0��M�xYHKln�v�c.!-���A5Ќ���QN�}��uU���P�3�Y��!�J:�����~Vz      �   �   x�����0E�ӏi*P;c�Fc�Dݹ�X�
�>��ǜ&F���N{���^
M�F�K�
���6��4���P��OUݜ/����z��q?#�����R�@Z	�Uӣ�tW���b2�>B��$l`s��86�P�$�1gU���`5_Of�!,-��y�aAC������`�A<ld+�cG���S�f?��J0��PB��F�      �   "  x���Mr�0F��\ �$��}�n(C��tڄ�)���*S��x��ޓ%C�h��H��ĺ%�d��"c��#�20��en_Ǐi|���}X�m7��X��LK�+���G������y�M�5��U����2쪴��k�)h���~�������KҞ�Z�I��md��JW2��'�X�A�W)����Vz�0�J&m�(��Ȃ>�S^Y z4��V�{C�֡�!�xo�%����� ]�Jɮ���+�8�wCr���?:�>Ї#]�c�k�tM�� ����      �   �   x����n�0��˻Բ�`+-A�
�]LbSc��C!oԩ��q�5]�����;Z��͋��R eq��E)d�Q��3��t_���mئ��?�t���O&9L hF��� ;�G[<Ԫm9)�<Vu�q�x`Q�Q�"kk����w	<�g�|1Z�A@�9��Ƅ���ĺL�_�-Z$�9�R8�`0��.�q�:_��o��I������?Y�����wE�q.|�      �   ~   x�u�1!��~Lt�Ð�������p�n�hFX�5�c�.&�}/mL��������-'��4�h�l�@O�dG�Kn��|լp�Bnkl~KZg[��A'�+:�R"G.�l�o���CU?�U      �   �   x�E�;r� �Z��n�L���H�F���6�0.|��V�&��b����O�ѯ��L2}Io��kPU%j5�ٍy=���t��� ��r���1�"�zplVW��Go��M!c��F���L��t�H�콁'�>{��ת��>��ӏ���|Z��=`\����t�j�)_fB��5���*�H7���s�.[�zH����/`��g�>^����b+      �   |   x�m�M� ��x��"bۻt�N��S������l:�@`���Ւ��]*4E��@���A!=��J�HfJa��nX�G^��I�=@&o_�}���,�rQ�X(��Z� \��|��K)�n6E      �   w   x�M�K� еu�rB�����2�+��#`p�C鐑8p6d(`6���Aw�
x���2�ҥ6��֝EV�~������R�x�죭���fw�MY�\jM������7�      �   q   x�e�M
� ���� u�2m�\B�u��FjV�{̄����Ô��sL*�}bTcyIS������C�ZVZTZ|�ĝ��1l�,̕�{a���ƃ�+Z.\>tJ���0      �   E   x�34�CNN#CK]]#C#+3+.C�#NS�S#+K�fp� F`b���� �Q      �   �   x�-�A�0����>���	K4�u�Cl�|R����9z1[�rf^��[7[�py�wo�)j:��]&����1HBMj�������\�	�ח�����,:�M�33ܗ����h��0:�ME\�&�*s�U����9�-�      �   O   x�%˱�@���.��w�@/�T@�� 'R�o��nt������,��,��j��`�v<6�`�v�����      �   q   x�m�1�0F���)��!e��z�..X�%HPw��-#����;�W�	-Bk��Υ|?<F<�iĔ9΂��! _��&˴���v�;i��V���zλ�d�{�j�s?�>.      �   �   x�=��D!C�X��(����������ya &S\S����*'�Io��E�ޢ��[�-9%�&��reB#딧ā:Qo���I����=H&N'���p/���e��r%h��#��h6�Ip��Hj.5r���O'&��3���Kk�Z�[+����$��~�?�~8      �   <  x�]�Q�C!D�u1/"������M�4�2���"M���l������T��c��h�R&�l��jG:���[)��'-��ҩ�W�$��w����R��;4��7�4$����8�c@Xh�8�Q�a�/����|�
����*}ݨ�#�khy`%��m���L����S�L*��Z�)�5�(���=*$����h��6W��m	�(B�:����s$��٥��ߩ��{�T�LH�߉;��zR��_�Ӥ$|�qa� -�HB���F} ]g@�i:		+�j����i2 $$_�����T6�t     