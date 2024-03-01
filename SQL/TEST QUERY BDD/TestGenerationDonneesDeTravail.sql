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






INSERT INTO restaurants (id, nom, adresse, heure_ouverture, heure_fermeture, image_restaurant_url)
VALUES 
(1,'Chez Mireille','28 Rue du Champs-Élysées, 75008, Paris','11:00','23:00', 'https://caffecreole.com/wp-content/uploads/2019/07/restaurant-creole7.jpg'),
(2,'Lakay Restaurant','15 Rue de la Canebière, 13001, Marseille','10:00','22:00', 'https://privateaser-media.s3.eu-west-1.amazonaws.com/etab_photos/333/1500x750/98548.jpg'),
(3,'Le Lambi','10 Place Bellecour, 69002, Lyon','10:00','22:00', 'https://www.b3designers.co.uk/media/kzbi3h3j/b3designers_caribbeansmokehouse_006.jpg?anchor=center&mode=crop&width=1440&height=930&rnd=132373855949230000'),
(4,'Saveurs d''Haiti','5 Rue de la Bourse, 31000, Toulouse','12:00','23:00', 'https://pyxis.nymag.com/v1/imgs/949/367/dd94031a01efb617eb9d8d82f581e8f622-bony-crown-heights-caribbean-gladys.2x.rhorizontal.w710.jpg'),
(5,'La Caye','35 Promenade des Anglais, 06000, Nice','08:30','19:30', 'https://www.createursdinterieur.com/static/d135ef38ad81ce923e7e8cf764374e5d/ddced/design-restaurant-caribeen-architecte.jpg'),
(6,'TiGeorges'' Chicken','18 Rue de la République, 44000, Nantes','12:00','22:00', 'https://www.bucksfreepress.co.uk/resources/images/17472536/?type=responsive-gallery-fullscreen'),
(7,'Grandchamp','8 Rue du Vieux Marché aux Poissons, 67000, Strasbourg','07:00','16:00', 'https://www.fayobserver.com/gcdn/authoring/authoring-images/2024/02/02/NTFO/72450951007-fob-bahama-breezeopening-01.jpg'),
(8,'Piman Cafe','12 Place de la Comédie, 34000, Montpellier','09:00','19:00', 'https://patch.com/img/cdn/users/61909/2012/12/raw/60cd126bf671096207efdb01fe01bbde.jpg'),
(9,'Fritaille','25 Quai de la Douane, 33000, Bordeaux','11:00','00:00', 'https://turtlebay.co.uk/assets/site/_1920xAUTO_fit_center-center_none/230919JWDRP65568.jpg'),
(10,'Le Soleil','7 Rue de la Grande Chaussée, 59000, Lille','07:15','18:30', 'https://i2-prod.lincolnshirelive.co.uk/incoming/article8765622.ece/ALTERNATES/s1227b/0_230919JWDRP65538.jpg'),
(11,'Boukman Restaurant','14 Rue de la Soif, 35000, Rennes','18:00','01:30', 'https://turtlebay.co.uk/assets/site/_1920xAUTO_fit_center-center_none/DUrham-Upstairs.jpg'),
(12,'Taino''s Kitchen','20 Rue de Vesle, 51100, Reims','10:00','23:30', 'https://i2-prod.manchestereveningnews.co.uk/incoming/article24834450.ece/ALTERNATES/s1200d/0_Turtle-Bay-Salford-Quays.jpg');



INSERT INTO tables (id, numero, nombre_place, etat, id_restaurant)
VALUES 
 (1,1, 2, 'PRESENT', (SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (2,2, 4, 'PRESENT',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (3,3, 4, 'PRESENT',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (4,4, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (5,5, 6, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (6,6, 8, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (7,7, 2, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (8,8, 3, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (9,9, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (10,10, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (11,11, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (12,12, 8, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (13,13, 2, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (14,14, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (15,15, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (16,16, 6, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (17,17, 6, 'PRESENT',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (18,18, 8, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (19,19, 2, 'RESERVEE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haitit')),
 (20,20, 4, 'LIBRE',(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'));




 INSERT INTO clients (id,nom, prenom, email, password)
VALUES 
 (1,'Jean', 'Paulo', 'jean.paulo@example.com', 'password'),
 (2,'Jeanne', 'Paula', 'jeanne.paula@example.com', 'password'),
 (3,'Pierre', 'Dupont', 'pierre.dupont@example.com', 'password'),
 (4,'Yves', 'Rocher', 'yves.rocher@example.com', 'password');



 INSERT INTO cartes (id, nom, id_restaurant)
VALUES 
 (1,'Carte1', (SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti')),
 (2,'Carte2', (SELECT id FROM restaurants WHERE nom = 'Le Lambi')),
 (3,'Carte3', (SELECT id FROM restaurants WHERE nom = 'La Caye')),
 (4,'Carte4', (SELECT id FROM restaurants WHERE nom = 'Le Soleil'));


 INSERT INTO plats (id, nom, prix, description, categorie, image_plat_url, id_carte)
VALUES 
 (1,'Accra de Morue', 8,'Beignet frits à base de morue, de farine de pois et d''épices, servis avec une sauce piquante', 'ENTREE', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (2,'Griot', 9, 'Morceaux de porc marinés dans un mélange d''ail, de jus d''orange et d''épices, puis frits', 'ENTREE', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (3,'Marinad', 5, 'Des concombres, des oignons et des carottes marinés dans un mélange de vinaigre, de jus de citron et d''épices haïtiennes, créant une salade fraîche et acidulée', 'ENTREE', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (4,'Tassot', 9, 'Morceaux de chèvre ou de bœuf marinés dans un mélange d''épices haïtiennes et frits, servis avec du riz et des haricots rouges', 'ENTREE', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (5,'Pâtés Haïtiens', 4, 'petits pâtés feuilletés farcis de viande hachée, de légumes et d''épices', 'ENTREE', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (6,'Riz et Pois Rouges', 12, 'Plat traditionnel composé de riz cuit dans un bouillon de haricots rouges assaisonné avec du thym, du persil et de l''ail. Servi avec du porc grillé ou du poulet', 'PLAT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (7,'Lambi Créole', 18, 'Tranches de conque de lambi (gros coquillage de mer) marinées dans une sauce créole épicée à base de tomates, d''oignons, de poivrons et d''épices haïtiennes. Servi avec du riz et des légumes', 'PLAT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (8,'Boulettes de Viande en Sauce', 15, 'Boulettes de viande hachée mélangées à des épices et des herbes, cuites dans une sauce tomate épicée avec des carottes et des pommes de terre. Servi avec du riz blanc', 'PLAT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (9,'Legim avec Viande', 14, 'Ragoût de légumes comprenant des carottes, des pois, des choux, des aubergines et du chou, mijoté avec du porc dans une sauce épicée. Servi avec du riz ou du pain', 'PLAT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (10,'Poulet Diri Ak Pwa', 16, 'Morceaux de poulet marinés dans une sauce épicée à base de tomates, d''ail, de piments et d''épices haïtiennes, cuits avec des haricots rouges et du riz pour créer un plat savoureux et nourrissant.', 'PLAT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (11,'Pain Patate', 5 , 'Délicieux gâteau sucré à base de patate douce, de farine, de lait de coco, de beurre, de cannelle et de muscade', 'DESSERT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (12,'Konparet', 3 , 'Pain doux et moelleux, garni de confiture de goyave ou de banane, puis roulé et saupoudré de sucre en poudre', 'DESSERT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (13,'Joumou Soup', 8 , 'Soupe crémeuse et sucrée à base de citrouille, de lait de coco, de porc, de muscade de clou de girofle. Servie en dessert pour son caractère sucré', 'DESSERT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (14,'Douces Mamba', 6 , 'Bonbons traditionnels haïtiens faits à partir de beurre de cacahuète, de sucre de canne et de vanille, enrobés de noix de coco râpée ou de graines de sésame', 'DESSERT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (15,'Akasan', 5 , 'Boisson traditionnelle crémeuse à base de farine de maïs, de lait, de cannelle de muscade et de sucre de canne. Consommée comme dessert pour sa texture épaisse et son goût sucré', 'DESSERT', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (16,'Jus de Citron Vert', 4 , 'Un rafraîchissant jus de citron vert frais pressé, sucré avec du sirop de sucre de canne et servi avec de la glace', 'BOISSON', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (17,'Rhum Punch', 8 , 'Cocktail tropical à base de rhum haïtien, de jus d''ananas, d''orange et de grenadine, de sirop de canne et agrémenté d''une touche de menthe fraîche', 'BOISSON', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (18,'Dous Kokoye', 5 , 'Boisson crémeuse et sucrée à base de lait de coco, de lait concentré sucré, de vanille et de cannelle, servie avec de la glace', 'BOISSON', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (19,'Jus de Canne à Sucre', 4 , 'Délicieux jus fraîchement pressé à partir de tiges de canne à sucre, servi avec une tranche de citron vert pour une touche d''acidité', 'BOISSON', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1')),
 (20,'Té Poule', 6 , 'Boisson chaude réconfortante composée de lait, de rhum, de cannelle, de muscade, et sucrée avec du sirop de sucre de canne ou du miel', 'BOISSON', 'NULL', (SELECT id FROM cartes WHERE nom = 'Carte1'));


 INSERT INTO reservations (id,id_restaurant, id_client, id_table, date, heure, etat, nombre_place)
VALUES
(1,(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), (SELECT id FROM clients WHERE nom = 'Jean'), (SELECT id FROM tables WHERE numero = 1), '2024-01-10', '11:30','EN ATTENTE', 4),
(2,(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), (SELECT id FROM clients WHERE nom = 'Jeanne'), (SELECT id FROM tables WHERE numero = 2), '2024-01-09', '11:30','REFUSEE', 6),
(3,(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), (SELECT id FROM clients WHERE nom = 'Pierre'), (SELECT id FROM tables WHERE numero = 17), '2024-01-08', '11:30','ACCEPTEE', 2);



 INSERT INTO commandes (id,numero, id_table, etat)
VALUES
(1,1, (SELECT id FROM tables WHERE numero = 17), 'EN PREPA'),
(2,2, (SELECT id FROM tables WHERE numero = 17), 'PRETE'),
(3,3, (SELECT id FROM tables WHERE numero = 17), 'SERVIE'),
(4,4, (SELECT id FROM tables WHERE numero = 17), 'REGLEE');



INSERT INTO assocommandesplats (id, id_commande, id_plat)
VALUES
(1,(SELECT id FROM commandes WHERE numero = 1), (SELECT id FROM plats WHERE nom = 'Accra de Morue' AND id_carte = (SELECT id FROM cartes WHERE nom = 'Carte1'))),
(2,(SELECT id FROM commandes WHERE numero = 2), (SELECT id FROM plats WHERE nom = 'Griot' AND id_carte = (SELECT id FROM cartes WHERE nom = 'Carte1'))),
(3,(SELECT id FROM commandes WHERE numero = 3), (SELECT id FROM plats WHERE nom = 'Lambi Créole' AND id_carte = (SELECT id FROM cartes WHERE nom = 'Carte1'))),
(4,(SELECT id FROM commandes WHERE numero = 4), (SELECT id FROM plats WHERE nom = 'Té Poule' AND id_carte = (SELECT id FROM cartes WHERE nom = 'Carte1')));



INSERT INTO employes (id,id_restaurant, nom, prenom, email, password, role)
VALUES
(1,(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), 'Dupont', 'Sacha', 'sacha.dupont@example.com', 'password', 'EMPLO'),
(2,(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), 'Dutunnel', 'Poire', 'poire.dutunnel@example.com', 'password', 'EMPLO'),
(3,(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), 'Duchemin', 'Antoine', 'antoine.duchemin@example.com', 'password', 'EMPLO'),
(4,(SELECT id FROM restaurants WHERE nom = 'Saveurs d''Haiti'), 'Dutest', 'Testeur', 'testeur.dutest@example.com', 'password', 'EMPLO'),
(5,NULL, 'Admin', 'admin', 'admin@example.com','admin', 'ADMIN');





INSERT INTO messages (id,titre, contenu, id_client, id_employe)
VALUES
(1,'Titre1', 'Voici le contenu de mon message 1', (SELECT id FROM clients WHERE nom = 'Jean'), (SELECT id FROM employes WHERE prenom = 'Sacha')),
(2,'Titre2', 'Voici le contenu de mon message 2', (SELECT id FROM clients WHERE nom = 'Jeanne'), (SELECT id FROM employes WHERE prenom = 'Poire'));

