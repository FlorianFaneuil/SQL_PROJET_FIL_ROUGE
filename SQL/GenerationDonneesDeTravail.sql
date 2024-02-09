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
('La bonne table','6 Rue du Château, 75000 Paris','11:00','23:00', 'https://www.valdoise-tourisme.com/wp-content/uploads/2023/04/cambrousse-restaurant-8-e1681483983431-1600x900.jpg'),
('Au bon vivant','10 Rue de Lille, 75000 Paris','10:00','22:00', 'https://nolinskiparis.com/wp-content/uploads/2022/06/restaurant-nolinski-paris-5-etoiles-luxe-1-guillaume-de-laubier.jpg'),
('Le chat hurlant','8 Rue du Chat, 75000 Paris','10:00','22:00', 'https://miloguide.com/wp-content/uploads/2022/04/Cafe%CC%81s-fe%CC%81lins-pour-lamour-des-chats-et-des-gens.jpeg'),
('Test sans imageUrl','15 Rue sans URL, 75000 Paris','12:00','22:00', null);

SELECT * FROM restaurants;


INSERT INTO tables (numero, nombre_place, etat, id_restaurant)
VALUES 
 (1, 2, 'PRESENT', (SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (2, 4, 'PRESENT',(SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (3, 4, 'PRESENT',(SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (4, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (5, 6, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (6, 8, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (7, 2, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (8, 3, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (9, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (10, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (11, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 (12, 8, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Au bon vivant')),
 (13, 2, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Au bon vivant')),
 (14, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Au bon vivant')),
 (15, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Au bon vivant')),
 (16, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Au bon vivant')),
 (17, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Au bon vivant')),
 (18, 8, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Au bon vivant')),
 (19, 2, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Au bon vivant')),
 (20, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Au bon vivant'));

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
 ('Carte1', (SELECT id FROM restaurants WHERE nom = 'La bonne table')),
 ('Carte2', (SELECT id FROM restaurants WHERE nom = 'Au bon vivant')),
 ('Carte3', (SELECT id FROM restaurants WHERE nom = 'Le chat hurlant')),
 ('Carte4', (SELECT id FROM restaurants WHERE nom = 'Test sans imageUrl'));

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
((SELECT id FROM restaurants WHERE nom = 'La bonne table'), (SELECT id FROM clients WHERE nom = 'Jean'), (SELECT id FROM tables WHERE numero = 1), '2024-01-10', '11:30','EN ATTENTE', 4),
((SELECT id FROM restaurants WHERE nom = 'La bonne table'), (SELECT id FROM clients WHERE nom = 'Jeanne'), (SELECT id FROM tables WHERE numero = 2), '2024-01-09', '11:30','REFUSEE', 6),
((SELECT id FROM restaurants WHERE nom = 'Au bon vivant'), (SELECT id FROM clients WHERE nom = 'Pierre'), (SELECT id FROM tables WHERE numero = 17), '2024-01-08', '11:30','ACCEPTEE', 2);

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
((SELECT id FROM commandes WHERE numero = 1), (SELECT id FROM plats WHERE nom = 'Plat2')),
((SELECT id FROM commandes WHERE numero = 2), (SELECT id FROM plats WHERE nom = 'Entree2')),
((SELECT id FROM commandes WHERE numero = 3), (SELECT id FROM plats WHERE nom = 'Dessert2')),
((SELECT id FROM commandes WHERE numero = 4), (SELECT id FROM plats WHERE nom = 'Boisson2'));

SELECT * FROM assocommandesplats;


INSERT INTO employes (id_restaurant, nom, prenom, email, password)
VALUES
((SELECT id FROM restaurants WHERE nom = 'La bonne table'), 'Dupont', 'Sacha', 'sacha.dupont@example.com', 'password'),
((SELECT id FROM restaurants WHERE nom = 'Au bon vivant'), 'Dutunnel', 'Poire', 'poire.dutunnel@example.com', 'password'),
((SELECT id FROM restaurants WHERE nom = 'Le chat hurlant'), 'Duchemin', 'Antoine', 'antoine.duchemin@example.com', 'password'),
((SELECT id FROM restaurants WHERE nom = 'Test sans imageUrl'), 'Dutest', 'Testeur', 'testeur.dutest@example.com', 'password');


SELECT * FROM employes;


INSERT INTO messages (titre, contenu, id_client, id_employe)
VALUES
('Titre1', 'Voici le contenu de mon message 1', (SELECT id FROM clients WHERE nom = 'Jean'), (SELECT id FROM employes WHERE prenom = 'Sacha')),
('Titre2', 'Voici le contenu de mon message 2', (SELECT id FROM clients WHERE nom = 'Jeanne'), (SELECT id FROM employes WHERE prenom = 'Poire'));

SELECT * FROM messages;
