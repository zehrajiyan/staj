CREATE TABLE departman (
    departman_id SERIAL PRIMARY KEY,
    ad VARCHAR(100) NOT NULL
);

CREATE TABLE calisan (
    id SERIAL PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50),
    departman_id INT REFERENCES departman(id),
    maas NUMERIC(10,2),
    ise_giris_tarihi DATE DEFAULT CURRENT_DATE
);


INSERT INTO departman (ad) 
VALUES 
('Yazılım Geliştirme'),
('İnsan Kaynakları'),
('Pazarlama');


INSERT INTO calisan (ad, soyad, departman_id, maas, ise_giris_tarihi) 
VALUES 
("Mehmet",	"Demir"	,1	,58000.00	,"2025-06-10"),
("Ece",	"Yıldız"	,1	,80000.00	,"2024-11-01"),
("Can",	"Öztürk"	,2	,45000.00,	"2025-02-11"),
("Umut",	"Arslan",	3,	55000.00	,"2025-01-10"),
("Ayşe",	"Şahin"	,3	,52000.80	,"2026-02-15"),
("Ali",	   "Çelik"	,2	,42000.00	,"2023-05-15"),
("Zeynep",	"Kaya"	,1,	72000.50	,"2024-03-20"),
("Ahmet",	"Yılmaz",	null,	65000.00	,"2023-06-01"),
("Burcu",	"Koç"	,	null,49000.00	,"2021-02-03"),
("Merve",	"Aydın"	,2	,45000.00	,"2025-05-18");
