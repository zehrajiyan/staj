--Bir çalışan birden fazla projede yer alabilir, bir projede de birden fazla çalışan yer alabilir.

--en az üç proje girilecek
CREATE TABLE proje (
    proje_id SERIAL PRIMARY KEY,
    proje_adi VARCHAR(255) NOT NULL,
    baslangic_tarihi DATE
);

--10 eşleşme girilecek
CREATE TABLE calisan_proje (
    calisan_id INTEGER,
    proje_id INTEGER,
    PRIMARY KEY (calisan_id, proje_id),
    FOREIGN KEY (calisan_id) REFERENCES calisan (id),
    FOREIGN KEY (proje_id) REFERENCES proje (proje_id)
);

-- insert into proje (proje_adi, baslangic_tarihi) values
-- ('Proje A', '2021-01-01'),
-- ('Proje B', '2023-01-01'),
-- ('Proje C', '2024-01-01'),
-- ('Proje D', '2025-01-01'),
-- ('Proje E', '2026-01-01');


-- insert into calisan_proje (calisan_id, proje_id) values
-- (30, 1),
-- (21, 2),
-- (27, 2),
-- (22, 3),
-- (24, 3),
-- (26, 4),
-- (29, 4),
-- (25, 4),
-- (23, 4),
-- (28, 5);

--çalışanlar ve bulundukları projeler
select ad, soyad, proje_adi from calisan c
join calisan_proje cp on c.id = cp.calisan_id 
join proje p on cp.proje_id = p.proje_id;

-- "Burcu"	"Koç"	"Proje A"
-- "Ahmet"	"Yılmaz"	"Proje B"
-- "Ali"	"Çelik"	"Proje B"
-- "Zeynep"	"Kaya"	"Proje C"
-- "Ece"	"Yıldız"	"Proje C"
-- "Merve"	"Aydın"	"Proje D"
-- "Umut"	"Arslan"	"Proje D"
-- "Can"	"Öztürk"	"Proje D"
-- "Mehmet"	"Demir"	"Proje D"
-- "Ayşe"	"Şahin"	"Proje E"

--hangi projede kaç kişi var
select p.proje_adi, count(c.id) from proje p join calisan_proje cp on p.proje_id = cp.proje_id
join calisan c on cp.calisan_id = c.id group by p.proje_adi;

-- "Proje A"	1
-- "Proje E"	1
-- "Proje C"	2
-- "Proje B"	2
-- "Proje D"	4

--Silinemiyor çünkü başka tabloda foreign key olarak bağlanmış
delete from proje where proje_id = 1;

-- ERROR:  update or delete on table "proje" violates foreign key constraint "calisan_proje_proje_id_fkey" on table "calisan_proje"
-- Key (proje_id)=(1) is still referenced from table "calisan_proje". 

-- SQL state: 23503
-- Detail: Key (proje_id)=(1) is still referenced from table "calisan_proje".