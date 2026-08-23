CREATE TABLE departman (
    id SERIAL PRIMARY KEY,
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
('Ahmet', 'Yılmaz', 1, 65000.00, '2025-01-15'),
('Zeynep', 'Kaya', 1, 72000.50, '2025-03-20'),
('Mehmet', 'Demir', 1, 58000.00, '2025-06-10'),
('Ece', 'Yıldız', 1, 80000.00, '2024-11-01'),
('Can', 'Öztürk', 2, 45000.00, '2025-02-11'),
('Merve', 'Aydın', 2, 48500.25, '2025-05-18'),
('Ali', 'Çelik', 2, 42000.00, '2025-07-01'),
('Ayşe', 'Şahin', 3, 52000.80, '2025-04-05'),
('Umut', 'Arslan', 3, 55000.00, '2025-01-10'),
('Burcu', 'Koç', 3, 49000.00, '2025-06-25');


