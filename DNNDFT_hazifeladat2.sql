--Maszkolt változat létrehozása
CREATE TABLE REND_ELES_M (
    SORSZAM NUMERIC(7) NOT NULL,
    LOGIN VARCHAR(32) MASKED WITH (FUNCTION = 'partial(2, "XXXXXX", 2)'), -- részleges maszkolás a loginon
    REND_DATUM DATE,
    SZALL_DATUM DATE,
    SZALL_CIM VARCHAR(128) MASKED WITH (FUNCTION = 'partial(5, "***", 5)'), -- részleges maszkolás a szállítási címen
    SZALL_MOD VARCHAR(24),
    FIZ_MOD VARCHAR(24),
    SZAMLA_CIM VARCHAR(128) MASKED WITH (FUNCTION = 'partial(5, "***", 5)') -- részleges maszkolás a számlacímen
);

--Mintaadatok beszúrása
INSERT INTO REND_ELES_M (SORSZAM, LOGIN, REND_DATUM, SZALL_DATUM, SZALL_CIM, SZALL_MOD, FIZ_MOD, SZAMLA_CIM)
VALUES
(1000001, 'user123', '2025-04-20', '2025-04-25', 'Budapest, Petofi utca 10.', 'Futár', 'Bankkártya', 'Budapest, Szent István körút 5.'),
(1000002, 'anna456', '2025-04-21', '2025-04-26', 'Debrecen, Kossuth utca 8.', 'PickPackPont', 'Utánvét', 'Debrecen, Piac utca 12.'),
(1000003, 'peter789', '2025-04-22', '2025-04-27', 'Szeged, Rózsa utca 15.', 'Személyes átvétel', 'Készpénz', 'Szeged, Fő tér 1.');

--Lekérdezés
SELECT * FROM REND_ELES_M;

--Felhasználó létrehozás -> korlátozott jogosultsággal
CREATE USER webshop_user2 WITHOUT LOGIN;

--Jogosultság adás
GRANT SELECT ON REND_ELES_M TO webshop_user2;