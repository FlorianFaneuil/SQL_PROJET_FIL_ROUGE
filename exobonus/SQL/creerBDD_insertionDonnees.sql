DROP TABLE IF EXISTS Voitures, Garages, Adresses, Marques;

CREATE TABLE Marques (
	id				INTEGER				PRIMARY KEY IDENTITY,
	libelle			VARCHAR(20)			NOT NULL
);

CREATE TABLE Adresses (
	id				INTEGER				PRIMARY KEY IDENTITY,
	numero			INTEGER				NOT NULL,
	rue				VARCHAR(80)			NOT NULL,
	cpo				CHAR(5)				NOT NULL,
	ville			VARCHAR(40)			NOT NULL
);

CREATE TABLE Garages (
	id				INTEGER				PRIMARY KEY IDENTITY,
	nom				VARCHAR(40)			NULL,
	id_adresse		INTEGER				NOT NULL,
	id_marque		INTEGER				NULL,
	FOREIGN KEY (id_adresse) REFERENCES Adresses(id),
	FOREIGN KEY (id_marque)  REFERENCES Marques (id)
);

CREATE TABLE Voitures (
	id				INTEGER				PRIMARY KEY IDENTITY,
	marque			VARCHAR(20)			NOT NULL,
	modele			VARCHAR(20)			NOT NULL	UNIQUE,
	prix			INTEGER				NOT NULL	DEFAULT 12000,
	date_sortie		DATE				NOT NULL	CHECK (date_sortie <= GETDATE()),
	date_achat		DATE				NULL,
	id_garage		INTEGER				NOT NULL,
	CHECK (date_sortie <= date_achat),
	FOREIGN KEY (id_garage)  REFERENCES Garages (id)
);


INSERT INTO Marques VALUES
	('Peugeot'),
	('Citro�n'),
	('Renault'),
	('Opel'),
	('Volkswagen'),
	('Audi');

INSERT INTO Adresses	(numero	, rue				,cpo		, ville				)
	VALUES				(12		, 'Rue des merles'	, '44800'	, 'Saint Herblain'	),
						(18		, 'Rue des arbres'	, '44300'	, 'Nantes'			),
						(24		, 'Rue des rouets'	, '44000'	, 'Nantes'			),
						(28		, 'Rue des croix'	, '44190'	, 'Clisson'			),
						(35		, 'Rue des devs'	, '69000'	, 'Lyon'			),
						(17		, 'Rue de l''eni'	, '35000'	, 'Rennes'			),
						(2		, 'Rue du jardin'	, '35600'	, 'Redon'			),
						(42		, 'Rue de la lune'	, '92000'	, 'Paris'			),
						(28		, 'Rue des fleurs'	, '29000'	, 'Quimper'			),
						(134	, 'Rue du soleil'	, '13001'	, 'Marseille'		),
						(72		, 'Rue du vent'		, '44210'	, 'Pornic'			),
						(13		, 'Rue Halloween'	, '66600'	, 'Vingrau'			),
						(5		, 'Rue d''�t�'		, '13002'	, 'Marseille'		),
						(4		, 'Rue d''hiver'	, '59000'	, 'Lille'			),
						(67		, 'Rue des pouets'	, '12345'	, 'Hesse'			);

INSERT INTO Garages (nom			, id_adresse	, id_marque	)
	VALUES			(NULL			, 1				, 1			),
					(NULL			, 2				, 2			),
					(NULL			, 3				, 3			),
					(NULL			, 4				, 4			),
					(NULL			, 5				, 5			),
					(NULL			, 6				, 6			),
					(NULL			, 7				, 1			),
					(NULL			, 8				, 2			),
					(NULL			, 9				, 3			),
					(NULL			, 10			, 4			),
					(NULL			, 11			, 5			),
					(NULL			, 12			, 6			),
					(NULL			, 13			, 1			),
					('Chez Paul'	, 14			, NULL		),
					('Bobby garage'	, 15			, NULL		);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Peugeot'		, '3008'		, 22000	, '2023-06-30'	, 1			),
						('Peugeot'		, '208'			, 14000	, '2022-05-21'	, 1			),
						('Peugeot'		, '308'			, 16000	, '2021-07-18'	, 1			),
						('Peugeot'		, '2008'		, 28000	, '2020-01-07'	, 1			),
						('Peugeot'		, '408'			, 24000	, '2019-03-31'	, 1			),
						('Peugeot'		, '5008'		, 16000	, '2018-11-01'	, 1			),
						('Citro�n'		, 'C3'			, 12000	, '2022-12-21'	, 1			),
						('Citro�n'		, 'C4'			, 14000	, '2018-06-14'	, 1			),
						('Renault'		, 'Kangoo'		, 28000	, '2009-01-01'	, 1			),
						('Renault'		, 'Sc�nic'		, 22000	, '2015-09-03'	, 1			);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Peugeot'		, '208'			, 14000	, '2022-05-21'	, 2			),
						('Citro�n'		, 'C3'			, 12000	, '2022-12-21'	, 2			),
						('Citro�n'		, 'C4'			, 14000	, '2018-06-14'	, 2			),
						('Citro�n'		, 'Berlingo'	,  9000	, '2016-08-12'	, 2			),
						('Citro�n'		, 'C5'			, 18000	, '2023-01-20'	, 2			),
						('Citro�n'		, 'C1'			,  8000	, '2012-05-22'	, 2			);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Peugeot'		, '3008'		, 22000	, '2023-06-30'	, 3			),
						('Peugeot'		, '208'			, 14000	, '2022-05-21'	, 3			),
						('Renault'		, 'Clio'		, 8000	, '2011-06-14'	, 3			),
						('Renault'		, 'M�gane'		, 21000	, '2010-03-06'	, 3			),
						('Renault'		, 'Kangoo'		, 28000	, '2009-01-01'	, 3			),
						('Renault'		, 'Sc�nic'		, 22000	, '2015-09-03'	, 3			);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Opel'			, 'Astra'		, 12500	, '2013-10-24'	, 4			),
						('Opel'			, 'Corsa'		, 14000	, '2017-10-24'	, 4			),
						('Opel'			, 'Mokka'		, 18000	, '2015-10-24'	, 4			),
						('Opel'			, 'Insignia'	, 21000	, '2019-10-24'	, 4			);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Volkswagen'	, 'Golf'		, 32500	, '2019-09-05'	, 5			),
						('Volkswagen'	, 'Polo'		, 29999	, '2020-11-17'	, 5			),
						('Volkswagen'	, 'Passat'		, 19999	, '2021-08-03'	, 5			),
						('Volkswagen'	, 'Tiguan'		, 24999	, '2023-10-31'	, 5			);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Audi'			, 'Q4 e-tron'	, 53000	, '2023-10-31'	, 6			),
						('Audi'			, 'Q8 e-tron'	, 88600	, '2021-09-09'	, 6			),
						('Audi'			, 'quattro'		, 99999	, '2023-05-12'	, 6			);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Peugeot'		, '3008'		, 22000	, '2023-06-30'	, 7			),
						('Peugeot'		, '208'			, 14000	, '2022-05-21'	, 7			);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Citro�n'		, 'C3'			, 12000	, '2022-12-21'	, 8			),
						('Citro�n'		, 'C4'			, 14000	, '2018-06-14'	, 8			),
						('Citro�n'		, 'Berlingo'	,  9000	, '2016-08-12'	, 8			),
						('Citro�n'		, 'C5'			, 18000	, '2023-01-20'	, 8			),
						('Citro�n'		, 'C1'			,  8000	, '2012-05-22'	, 8			);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Peugeot'		, '3008'		, 22000	, '2023-06-30'	, 9			),
						('Peugeot'		, '208'			, 14000	, '2022-05-21'	, 9			),
						('Peugeot'		, '308'			, 16000	, '2021-07-18'	, 9			),
						('Peugeot'		, '2008'		, 28000	, '2020-01-07'	, 9			),
						('Peugeot'		, '408'			, 24000	, '2019-03-31'	, 9			),
						('Peugeot'		, '5008'		, 16000	, '2018-11-01'	, 9			),
						('Citro�n'		, 'C3'			, 12000	, '2022-12-21'	, 9			),
						('Citro�n'		, 'C4'			, 14000	, '2018-06-14'	, 9			),
						('Citro�n'		, 'Berlingo'	,  9000	, '2016-08-12'	, 9			),
						('Citro�n'		, 'C5'			, 18000	, '2023-01-20'	, 9			),
						('Citro�n'		, 'C1'			,  8000	, '2012-05-22'	, 9			),
						('Renault'		, 'Clio'		, 13000	, '2011-06-14'	, 9			),
						('Renault'		, 'M�gane'		, 21000	, '2010-03-06'	, 9			),
						('Renault'		, 'Kangoo'		, 28000	, '2009-01-01'	, 9			),
						('Renault'		, 'Sc�nic'		, 22000	, '2015-09-03'	, 9			),
						('Opel'			, 'Astra'		, 12500	, '2013-10-24'	, 9			),
						('Opel'			, 'Corsa'		, 14000	, '2017-10-24'	, 9			),
						('Opel'			, 'Mokka'		, 18000	, '2015-10-24'	, 9			),
						('Opel'			, 'Insignia'	, 21000	, '2019-10-24'	, 9			);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Opel'			, 'Astra'		, 12500	, '2013-10-24'	, 10		),
						('Opel'			, 'Corsa'		, 14000	, '2017-10-24'	, 10		),
						('Opel'			, 'Mokka'		, 18000	, '2015-10-24'	, 10		),
						('Opel'			, 'Insignia'	, 21000	, '2019-10-24'	, 10		);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Volkswagen'	, 'Passat'		, 19999	, '2021-08-03'	, 11		),
						('Volkswagen'	, 'Tiguan'		, 24999	, '2023-10-31'	, 11		);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Audi'			, 'Q4 e-tron'	, 53000	, '2023-10-31'	, 12		),
						('Audi'			, 'Q8 e-tron'	, 88600	, '2021-09-09'	, 12		),
						('Audi'			, 'quattro'		, 99999	, '2023-05-12'	, 12		);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Peugeot'		, '3008'		, 22000	, '2023-06-30'	, 13		),
						('Peugeot'		, '208'			, 14000	, '2022-05-21'	, 13		),
						('Peugeot'		, '308'			, 16000	, '2021-07-18'	, 13		),
						('Peugeot'		, '2008'		, 28000	, '2020-01-07'	, 13		),
						('Peugeot'		, '408'			, 24000	, '2019-03-31'	, 13		),
						('Peugeot'		, '5008'		, 16000	, '2018-11-01'	, 13		);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Peugeot'		, '3008'		, 22000	, '2023-06-30'	, 14		),
						('Citro�n'		, 'C3'			, 12000	, '2022-12-21'	, 14		),
						('Renault'		, 'Clio'		, 13000	, '2011-06-14'	, 14		),
						('Opel'			, 'Astra'		, 12500	, '2013-10-24'	, 14		),
						('Volkswagen'	, 'Golf'		, 32500	, '2019-09-05'	, 14		),
						('Audi'			, 'Q4 e-tron'	, 53000	, '2023-10-31'	, 14		);

INSERT INTO Voitures	(marque			, modele		, prix	, date_sortie	, id_garage	)
	VALUES				('Peugeot'		, '5008'		, 16000	, '2018-11-01'	, 15		),
						('Citro�n'		, 'C3'			, 12000	, '2022-12-21'	, 15		),
						('Citro�n'		, 'C4'			, 14000	, '2018-06-14'	, 15		),
						('Renault'		, 'Clio'		, 13000	, '2011-06-14'	, 15		),
						('Renault'		, 'M�gane'		, 21000	, '2010-03-06'	, 15		),
						('Opel'			, 'Astra'		, 12500	, '2013-10-24'	, 15		);
