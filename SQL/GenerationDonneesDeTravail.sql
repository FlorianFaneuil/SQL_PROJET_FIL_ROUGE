DELETE FROM superadmins;
DELETE FROM assocommandesplats WHERE id_commande IN (SELECT id FROM commandes) AND id_plat IN (SELECT id FROM plats);
DELETE FROM plats;
DELETE FROM commandes WHERE id_table IN (SELECT id FROM tables);
DELETE FROM reservations WHERE id_restaurant IN (SELECT id FROM restaurants) AND id_client IN (SELECT id FROM clients) AND id_table IN (SELECT id FROM tables);
DELETE FROM tables WHERE id_restaurant IN (SELECT id FROM restaurants);
DELETE FROM cartes WHERE id_restaurant IN (SELECT id FROM restaurants);
DELETE FROM messages WHERE id_client IN (SELECT id FROM clients) AND id_employe IN (SELECT id FROM employes);
DELETE FROM employes WHERE id_restaurant IN (SELECT id FROM restaurants);
DELETE FROM restaurants;
DELETE FROM clients;


INSERT INTO superadmins (nom, prenom, email, password)
VALUES ('Super','Admin','super.admin@example.com','password');

SELECT * FROM superadmins;


INSERT INTO restaurants (nom, adresse, heure_ouverture, heure_fermeture, image_restaurant_url)
VALUES 
('Chez Mireille','28 Rue du Champs-Élysées, 75008, Paris','11:00','23:00', 'https://caffecreole.com/wp-content/uploads/2019/07/restaurant-creole7.jpg'),
('Lakay Restaurant','15 Rue de la Canebière, 13001, Marseille','10:00','22:00', 'https://privateaser-media.s3.eu-west-1.amazonaws.com/etab_photos/333/1500x750/98548.jpg'),
('Le Lambi','10 Place Bellecour, 69002, Lyon','10:00','22:00', 'https://www.b3designers.co.uk/media/kzbi3h3j/b3designers_caribbeansmokehouse_006.jpg?anchor=center&mode=crop&width=1440&height=930&rnd=132373855949230000'),
('Saveurs d''Haiti','5 Rue de la Bourse, 31000, Toulouse','12:00','23:00', 'https://pyxis.nymag.com/v1/imgs/949/367/dd94031a01efb617eb9d8d82f581e8f622-bony-crown-heights-caribbean-gladys.2x.rhorizontal.w710.jpg'),
('La Caye','35 Promenade des Anglais, 06000, Nice','08:30','19:30', 'https://www.createursdinterieur.com/static/d135ef38ad81ce923e7e8cf764374e5d/ddced/design-restaurant-caribeen-architecte.jpg'),
('TiGeorges'' Chicken','18 Rue de la République, 44000, Nantes','12:00','22:00', 'https://www.bucksfreepress.co.uk/resources/images/17472536/?type=responsive-gallery-fullscreen'),
('Grandchamp','8 Rue du Vieux Marché aux Poissons, 67000, Strasbourg','07:00','16:00', 'https://www.fayobserver.com/gcdn/authoring/authoring-images/2024/02/02/NTFO/72450951007-fob-bahama-breezeopening-01.jpg'),
('Piman Cafe','12 Place de la Comédie, 34000, Montpellier','09:00','19:00', 'https://patch.com/img/cdn/users/61909/2012/12/raw/60cd126bf671096207efdb01fe01bbde.jpg'),
('Fritaille','25 Quai de la Douane, 33000, Bordeaux','11:00','00:00', 'https://turtlebay.co.uk/assets/site/_1920xAUTO_fit_center-center_none/230919JWDRP65568.jpg'),
('Le Soleil','7 Rue de la Grande Chaussée, 59000, Lille','07:15','18:30', 'https://i2-prod.lincolnshirelive.co.uk/incoming/article8765622.ece/ALTERNATES/s1227b/0_230919JWDRP65538.jpg'),
('Boukman Restaurant','14 Rue de la Soif, 35000, Rennes','18:00','01:30', 'https://turtlebay.co.uk/assets/site/_1920xAUTO_fit_center-center_none/DUrham-Upstairs.jpg'),
('Taino''s Kitchen','20 Rue de Vesle, 51100, Reims','10:00','23:30', 'https://i2-prod.manchestereveningnews.co.uk/incoming/article24834450.ece/ALTERNATES/s1200d/0_Turtle-Bay-Salford-Quays.jpg');

SELECT * FROM restaurants;


INSERT INTO tables (numero, nombre_place, etat, id_restaurant)
VALUES 
 (1, 2, 'PRESENT', (SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (2, 4, 'PRESENT',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (3, 4, 'PRESENT',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (4, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (5, 6, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (6, 8, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (7, 2, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (8, 3, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (9, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (10, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (11, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (12, 8, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (13, 2, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (14, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (15, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (16, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (17, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (18, 8, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (19, 2, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haitit')),
 (20, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'));

 SELECT * FROM tables;



 INSERT INTO clients (nom, prenom, email, password)
VALUES 
 ('Jean', 'Paulo', 'jean.paulo@example.com', 'password'),
 ('Jeanne', 'Paula', 'jeanne.paula@example.com', 'password'),
 ('Pierre', 'Dupont', 'pierre.dupont@example.com', 'password'),
 ('Yves', 'Rocher', 'yves.rocher@example.com', 'password');

 SELECT * FROM clients;


 INSERT INTO cartes (nom, id_restaurant)
VALUES 
 ('Carte1', (SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 ('Carte2', (SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 ('Carte3', (SELECT id FROM restaurants WHERE nom = 'La Caye')),
 ('Carte4', (SELECT id FROM restaurants WHERE nom = 'Le Soleil'));

 SELECT * FROM cartes;

 INSERT INTO plats (nom, prix, description, categorie, image_plat_url, id_carte)
VALUES 
 ('Plat1', 15, 'Un très bon plat', 'PLAT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 ('Entree1', 8, 'Une très bonne entrée', 'ENTREE', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 ('Dessert1', 15, 'Un très bon dessert', 'DESSERT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 ('Boisson1', 15, 'Une boisson fraiche', 'BOISSON', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 ('Plat2', 15, 'Un très bon plat', 'PLAT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte2')),
 ('Entree2', 8, 'Une très bonne entrée', 'ENTREE', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte2')),
 ('Dessert2', 15, 'Un très bon dessert', 'DESSERT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte2')),
 ('Boisson2', 15, 'Une boisson fraiche', 'BOISSON', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte2')),
  ('Plat3', 15, 'Un très bon plat', 'PLAT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte3')),
 ('Entree3', 8, 'Une très bonne entrée', 'ENTREE', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte3')),
 ('Dessert3', 15, 'Un très bon dessert', 'DESSERT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte3')),
 ('Boisson3', 15, 'Une boisson fraiche', 'BOISSON', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte3')),
   ('Plat4', 15, 'Un très bon plat', 'PLAT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte4')),
 ('Entree4', 8, 'Une très bonne entrée', 'ENTREE', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte4')),
 ('Dessert4', 15, 'Un très bon dessert', 'DESSERT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte4')),
 ('Boisson4', 15, 'Une boisson fraiche', 'BOISSON', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte4'));

 SELECT * FROM plats;

 INSERT INTO reservations (id_restaurant, id_client, id_table, date, heure, etat, nombre_place)
VALUES
((SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), (SELECT id FROM clients WHERE nom = 'Jean'), (SELECT id FROM tables WHERE numero = 1), '2024-01-10', '11:30','EN ATTENTE', 4),
((SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), (SELECT id FROM clients WHERE nom = 'Jeanne'), (SELECT id FROM tables WHERE numero = 2), '2024-01-09', '11:30','REFUSEE', 6),
((SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), (SELECT id FROM clients WHERE nom = 'Pierre'), (SELECT id FROM tables WHERE numero = 17), '2024-01-08', '11:30','ACCEPTEE', 2);

SELECT * FROM reservations;


 INSERT INTO commandes (numero, id_table, etat)
VALUES
(1, (SELECT id FROM tables WHERE numero = 17), 'EN PREPA'),
(2, (SELECT id FROM tables WHERE numero = 17), 'PRETE'),
(3, (SELECT id FROM tables WHERE numero = 17), 'SERVIE'),
(4, (SELECT id FROM tables WHERE numero = 17), 'REGLEE');

SELECT * FROM commandes;


INSERT INTO assocommandesplats (id_commande, id_plat)
VALUES
((SELECT id FROM commandes WHERE numero = 1), (SELECT id FROM plats WHERE nom = 'Plat2' )),
((SELECT id FROM commandes WHERE numero = 2), (SELECT id FROM plats WHERE nom = 'Entree2')),
((SELECT id FROM commandes WHERE numero = 3), (SELECT id FROM plats WHERE nom = 'Dessert2')),
((SELECT id FROM commandes WHERE numero = 4), (SELECT id FROM plats WHERE nom = 'Boisson2'));

SELECT * FROM assocommandesplats;


INSERT INTO employes (id_restaurant, nom, prenom, email, password)
VALUES
((SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), 'Dupont', 'Sacha', 'sacha.dupont@example.com', 'password'),
((SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), 'Dutunnel', 'Poire', 'poire.dutunnel@example.com', 'password'),
((SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), 'Duchemin', 'Antoine', 'antoine.duchemin@example.com', 'password'),
((SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), 'Dutest', 'Testeur', 'testeur.dutest@example.com', 'password');


SELECT * FROM employes;


INSERT INTO messages (titre, contenu, id_client, id_employe)
VALUES
('Titre1', 'Voici le contenu de mon message 1', (SELECT id FROM clients WHERE nom = 'Jean'), (SELECT id FROM employes WHERE prenom = 'Sacha')),
('Titre2', 'Voici le contenu de mon message 2', (SELECT id FROM clients WHERE nom = 'Jeanne'), (SELECT id FROM employes WHERE prenom = 'Poire'));

SELECT * FROM messages;
