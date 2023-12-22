/*
	1. Listez toutes les voitures
*/
SELECT * FROM Voitures;

/*
	2. Listez toutes les voitures, tri�es par marque et par mod�le
*/
SELECT * FROM Voitures ORDER BY marque, modele;

/*
	3. Listez toutes les marques
*/
SELECT * FROM Marques;

/*
	4. Listez le code postal et la ville de toutes les adresses
*/
SELECT cpo, ville FROM Adresses;

/*
	5. Listez les noms de tous les garages dont le nom est renseign�
*/
SELECT nom FROM Garages WHERE nom IS NOT NULL;

/*
	6. Listez la marque et le mod�le de toutes les voitures sorties entre 2015 et 2017
*/
SELECT marque, modele from Voitures WHERE date_sortie BETWEEN '2015' AND '2017';

/*
	7. Listez la marque, le mod�le et le prix de toutes les voitures
	La marque et le mod�le doivent appara�tre dans une seule colonne intitul�e 'v�hicule'
*/
SELECT
	marque + ' ' + modele AS V�hicule,
	prix
	FROM Voitures;

/*
	8. Listez toutes les voitures du garage 'Chez Paul'
*/
SELECT marque, modele, prix, date_sortie
	FROM Voitures v
	INNER JOIN Garages g ON v.id_garage = g.id
	WHERE g.nom = 'Chez Paul';

/*
	9. Listez toutes les marques des voitures vendues dans les garages RENAULT
*/
SELECT DISTINCT marque
	FROM Voitures v
	INNER JOIN Garages g ON v.id_garage = g.id
	INNER JOIN Marques m ON g.id_marque = m.id
	WHERE m.libelle = 'RENAULT';

/*
	10. Listez toutes les voitures qu'on peut acheter dans le 44
*/
SELECT marque, modele, prix, date_sortie
	FROM Voitures v
	INNER JOIN Garages g ON v.id_garage = g.id
	INNER JOIN Adresses a ON g.id_adresse = a.id
	WHERE a.cpo LIKE '44%';

/*
	11. Comptez le nombre de voitures
*/
SELECT COUNT(*) FROM Voitures;

/*
	12. Comptez le nombre de mod�le de voitures diff�rentes
*/
SELECT COUNT(distinct modele) FROM Voitures;

/*
	13. Comptez le nombre de mod�les de voitures distinctes, par marque de voiture
*/
SELECT marque, COUNT(distinct modele)
	FROM Voitures v
	GROUP BY marque;

/*
	14. Comptez le nombre de voitures vendues par le garage 'Bobby garage'
*/
SELECT COUNT(*)
	FROM Voitures v
	INNER JOIN Garages g ON v.id_garage = g.id
	WHERE g.nom = 'Bobby garage';

/*
	15. D�terminez le prix moyen d'une voiture
*/
SELECT AVG(prix) FROM Voitures;

/*
	16. D�terminez le prix moyen d'une voiture, par marque de voiture
*/
SELECT marque, AVG(prix)
	FROM Voitures
	GROUP BY marque;

/*
	17. D�terminez le prix moyen d'une voiture dans les garages PEUGEOT
*/
SELECT AVG(prix)
	FROM Voitures v
	INNER JOIN Garages g ON v.id_garage = g.id
	INNER JOIN Marques m ON g.id_marque = m.id
	WHERE m.libelle = 'PEUGEOT';

/*
	18. D�terminez le prix le plus �lev� dans les garages AUDI
*/
SELECT MAX(prix)
	FROM Voitures v
	INNER JOIN Garages g ON v.id_garage = g.id
	INNER JOIN Marques m ON g.id_marque = m.id
	WHERE m.libelle = 'AUDI';

/*
	19. D�terminez le prix le plus bas dans les garages AUDI
*/
SELECT MIN(prix)
	FROM Voitures v
	INNER JOIN Garages g ON v.id_garage = g.id
	INNER JOIN Marques m ON g.id_marque = m.id
	WHERE m.libelle = 'AUDI';

/*
	20. D�terminez l'�cart de prix entre la voiture la plus ch�re et la moins ch�re dans les garages AUDI
*/
SELECT MAX(prix) - MIN(prix)
	FROM Voitures v
	INNER JOIN Garages g ON v.id_garage = g.id
	INNER JOIN Marques m ON g.id_marque = m.id
	WHERE m.libelle = 'AUDI';

/*
	21. Listez le d�tail de la voiture la moins ch�re, tous garages confondus
*/
SELECT TOP 1 marque, modele, prix, date_sortie
	FROM Voitures
	ORDER BY prix ASC;

/*
	22. Listez le d�tail des voitures les moins ch�res, tous garages confondus
*/
SELECT DISTINCT marque, modele, prix, date_sortie
	FROM Voitures
	WHERE prix = (SELECT MIN(prix) FROM Voitures);

/*
	23. Listez le d�tail des 5 voitures distinctes les plus ch�res, tous garages confondus
*/
SELECT DISTINCT TOP 5 marque, modele, prix, date_sortie
	FROM Voitures
	ORDER BY prix DESC;

/*
	24. Plus dure :
	S�lectionnez toutes les voitures.
	Les voitures dont la marque correspond � la marque du garage b�n�ficient d'une r�duction :
		- 5% si elles ont 5 ans ou moins
		- 10% si elles ont plus de 5 ans
	SAUF s'il s'agit de la marque AUDI. Dans ce cas, le prix n'est pas affect�.
*/
SELECT DISTINCT marque, modele, prix * .95, date_sortie
	FROM Voitures v
		INNER JOIN Garages g ON v.id_garage = g.id
		INNER JOIN Marques m ON g.id_marque = m.id
	WHERE v.marque = m.libelle
		AND v.marque <> 'AUDI'
		AND DATEDIFF(year, date_sortie, GETDATE()) <= 5
UNION
SELECT DISTINCT marque, modele, prix * .90, date_sortie
	FROM Voitures v
		INNER JOIN Garages g ON v.id_garage = g.id
		INNER JOIN Marques m ON g.id_marque = m.id
	WHERE v.marque = m.libelle
		AND v.marque <> 'AUDI'
		AND DATEDIFF(year, date_sortie, GETDATE()) > 5
UNION
SELECT marque, modele, prix, date_sortie
	FROM Voitures v
		INNER JOIN Garages g ON v.id_garage = g.id
		INNER JOIN Marques m ON g.id_marque = m.id
	WHERE v.marque <> m.libelle
		OR v.marque = 'AUDI';
