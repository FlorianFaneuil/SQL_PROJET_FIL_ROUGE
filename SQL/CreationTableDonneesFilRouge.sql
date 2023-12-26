DROP TABLE IF EXISTS messages ,employes, assocommandesplats,commandes, reservations , plats, cartes, clients, restaurants,  tables, superadmins, adresses;
 
CREATE TABLE adresses (

id INT PRIMARY KEY IDENTITY,

numéro INT NOT NULL,

complement VARCHAR(10),

type_voie VARCHAR(20) NOT NULL,

nom VARCHAR(40) NOT NULL,

code_postal VARCHAR(10) NOT NULL, 

ville VARCHAR(50) NOT NULL,

mention VARCHAR(100)

);
 
CREATE TABLE superadmins (

id INT PRIMARY KEY IDENTITY,

nom VARCHAR(50) NOT NULL,

prenom VARCHAR(20) NOT NULL,

email VARCHAR(60) NOT NULL,

password VARCHAR(60) NOT NULL

);
 
CREATE TABLE tables (

id INT PRIMARY KEY IDENTITY,

numero INT NOT NULL,

nombre_place INT NOT NULL,

etat VARCHAR(10) DEFAULT 'LIBRE' NOT NULL

);
 
 
CREATE TABLE restaurants (

id INT PRIMARY KEY IDENTITY,

nom VARCHAR(100) NOT NULL,

id_adresse INT NOT NULL,

heure_ouverture TIME NOT NULL,

heure_fermeture TIME NOT NULL,

id_table INT NOT NULL,

image_restaurant_url VARCHAR(255),

FOREIGN KEY (id_adresse) REFERENCES adresses(id)

FOREIGN KEY (id_table) REFERENCES tables(id)

);
 
CREATE TABLE clients (

id INT PRIMARY KEY IDENTITY,

nom VARCHAR(50) NOT NULL,

prenom VARCHAR(20) NOT NULL,

email VARCHAR(60) NOT NULL,

password VARCHAR(60) NOT NULL

);
 
 
CREATE TABLE cartes (

id INT PRIMARY KEY IDENTITY,

nom VARCHAR(20),

id_restaurant INT,

FOREIGN KEY (id_restaurant) REFERENCES restaurants(id)

);
 
 
 
CREATE TABLE plats (

id INT PRIMARY KEY IDENTITY,

nom VARCHAR(30) NOT NULL,

prix INT NOT NULL,

description VARCHAR(255) NOT NULL,

categorie VARCHAR(20) NOT NULL,

image_plat_url VARCHAR(255),

id_carte INT,

FOREIGN KEY (id_carte) REFERENCES cartes(id)

);
 
 
CREATE TABLE reservations (

id INT PRIMARY KEY IDENTITY ,

id_restaurant INT NOT NULL,

id_client INT NOT NULL,

id_table INT NOT NULL,

date DATE NOT NULL,

heure TIME NOT NULL,

etat VARCHAR(20) DEFAULT 'EN ATTENTE' NOT NULL,

FOREIGN KEY (id_restaurant) REFERENCES restaurants(id),

FOREIGN KEY (id_client) REFERENCES clients(id),

FOREIGN KEY (id_table) REFERENCES tables(id)

);
 
 
CREATE TABLE commandes (

id INT PRIMARY KEY IDENTITY,

numero INT NOT NULL,

id_table INT NOT NULL,

etat VARCHAR(20) DEFAULT 'EN PREPA' NOT NULL,

FOREIGN KEY (id_table) REFERENCES tables(id)

);
 
 
CREATE TABLE assocommandesplats (

id INT PRIMARY KEY IDENTITY,

id_commande INT NOT NULL,

id_plat INT NOT NULL,

FOREIGN KEY (id_commande) REFERENCES commandes(id),

FOREIGN KEY (id_plat) REFERENCES plats(id)

);
 
 
CREATE TABLE employes (

id INT PRIMARY KEY IDENTITY,

restaurant_id INT NOT NULL,

nom VARCHAR(50) NOT NULL,

prenom VARCHAR(20) NOT NULL,

email VARCHAR(60) NOT NULL,

password VARCHAR(60) NOT NULL,

FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)

);
 
 
CREATE TABLE messages (

id INT PRIMARY KEY IDENTITY,

titre VARCHAR(20),

contenu VARCHAR(255) NOT NULL,

id_client INT NOT NULL,

id_employe INT NOT NULL,

FOREIGN KEY (id_client) REFERENCES clients(id),

FOREIGN KEY (id_employe) REFERENCES employes(id)

);
