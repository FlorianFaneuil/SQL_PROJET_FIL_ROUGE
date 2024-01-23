DROP TABLE IF EXISTS messages ,employes, assocommandesplats,commandes, reservations , plats, cartes, clients, tables, restaurants, superadmins, adresses;


CREATE TABLE superadmins (

id INT PRIMARY KEY IDENTITY,

nom VARCHAR(50) NOT NULL,

prenom VARCHAR(20) NOT NULL,

email VARCHAR(60) NOT NULL,

password VARCHAR(60) NOT NULL

);
  
 
CREATE TABLE restaurants (

id INT PRIMARY KEY IDENTITY,

nom VARCHAR(100) NOT NULL,

adresse VARCHAR(150) NOT NULL,

heure_ouverture TIME NOT NULL,

heure_fermeture TIME NOT NULL,

image_restaurant_url VARCHAR(255),

);

CREATE TABLE tables (

id INT PRIMARY KEY IDENTITY,

numero INT NOT NULL,

nombre_place INT NOT NULL,

etat VARCHAR(10) DEFAULT 'LIBRE' NOT NULL CHECK (etat IN ('LIBRE', 'PRESENT', 'RESERVEE')),

id_restaurant INT,

FOREIGN KEY (id_restaurant) REFERENCES restaurants(id),

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

categorie VARCHAR(20) NOT NULL DEFAULT 'PLAT' CHECK (categorie IN ('ENTREE', 'PLAT', 'DESSERT', 'BOISSON')),

image_plat_url VARCHAR(255),
5()
id_carte INT,

FOREIGN KEY (id_carte) REFERENCES cartes(id)

);
 
 
CREATE TABLE reservations (

id INT PRIMARY KEY IDENTITY ,

id_restaurant INT NOT NULL,

id_client INT,

id_table INT NOT NULL,

date DATE NOT NULL,

heure TIME NOT NULL,

etat VARCHAR(20) DEFAULT 'EN ATTENTE' NOT NULL  CHECK (etat IN ('EN ATTENTE', 'ACCEPTEE', 'REFUSEE')),

FOREIGN KEY (id_restaurant) REFERENCES restaurants(id),

FOREIGN KEY (id_client) REFERENCES clients(id) ON DELETE SET NULL,

FOREIGN KEY (id_table) REFERENCES tables(id)

);
 
 
CREATE TABLE commandes (

id INT PRIMARY KEY IDENTITY,

numero INT NOT NULL,

id_table INT NOT NULL,

etat VARCHAR(20) DEFAULT 'EN PREPA' NOT NULL CHECK (etat IN ('EN PREPA', 'PRETE', 'SERVIE', 'REGLEE')),

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

id_restaurant INT NOT NULL,

nom VARCHAR(50) NOT NULL,

prenom VARCHAR(20) NOT NULL,

email VARCHAR(60) NOT NULL,

password VARCHAR(60) NOT NULL,

FOREIGN KEY (id_restaurant) REFERENCES restaurants(id)

);
 
 
CREATE TABLE messages (

id INT PRIMARY KEY IDENTITY,

titre VARCHAR(20),

contenu VARCHAR(255) NOT NULL,

id_client INT,

id_employe INT NOT NULL,

FOREIGN KEY (id_client) REFERENCES clients(id) ON DELETE SET NULL,

FOREIGN KEY (id_employe) REFERENCES employes(id),

);
