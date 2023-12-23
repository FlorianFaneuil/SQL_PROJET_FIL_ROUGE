DELETE FROM adresses;

-- Les 5 premières adresses sans "complément" ni "mention"
INSERT INTO adresses (numéro, type_voie, nom, code_postal, ville)
VALUES (1, 'Rue', 'Napoléon Bonaparte', '75001', 'Paris');

INSERT INTO adresses (numéro, type_voie, nom, code_postal, ville)
VALUES (2, 'Avenue', 'Charles de Gaulle', '13001', 'Marseille');

INSERT INTO adresses (numéro, type_voie, nom, code_postal, ville)
VALUES (3, 'Boulevard', 'Louis XIV', '69001', 'Lyon');

INSERT INTO adresses (numéro, type_voie, nom, code_postal, ville)
VALUES (4, 'Chemin', 'Jeanne d''Arc', '33001', 'Bordeaux');

INSERT INTO adresses (numéro, type_voie, nom, code_postal, ville)
VALUES (5, 'Impasse', 'Marie Curie', '31001', 'Toulouse');

-- Les 5 dernières adresses avec un "complément" et une "mention"
INSERT INTO adresses (numéro, complement, type_voie, nom, code_postal, ville, mention)
VALUES (6, 'bis', 'Rue', 'Victor Hugo', '67001', 'Strasbourg', '1er étage');

INSERT INTO adresses (numéro, complement, type_voie, nom, code_postal, ville, mention)
VALUES (7, 'ter', 'Avenue', 'Jean Jaurès', '35001', 'Rennes', '2eme étage');

INSERT INTO adresses (numéro, complement, type_voie, nom, code_postal, ville, mention)
VALUES (8, 'bis', 'Boulevard', 'Voltaire', '21001', 'Dijon', '1er étage');

INSERT INTO adresses (numéro, complement, type_voie, nom, code_postal, ville, mention)
VALUES (9, 'ter', 'Chemin', 'Paul Valéry', '80001', 'Amiens', '2eme étage');

INSERT INTO adresses (numéro, complement, type_voie, nom, code_postal, ville, mention)
VALUES (10, 'bis', 'Impasse', 'Emile Zola', '06001', 'Nice', '1er étage');

