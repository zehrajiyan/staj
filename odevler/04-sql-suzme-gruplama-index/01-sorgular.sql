
-- maaşı belli bir değerin üstünde olan çalışanlar
select ad, soyad, maas from calisan where maas > 50000;

-- "Mehmet"	"Demir"	58000.00
-- "Ece"	"Yıldız"	80000.00
-- "Umut"	"Arslan"	55000.00
-- "Ayşe"	"Şahin"	52000.80
-- "Zeynep"	"Kaya"	72000.50
-- "Ahmet"	"Yılmaz"	65000.00

-- Adı belli bir harf ile başlayan çalışanlar
select ad, soyad from calisan where ad like 'A%';

-- "Ayşe"	"Şahin"
-- "Ali"	"Çelik"
-- "Ahmet"	"Yılmaz"

--departman adı belli olmayan çalışanlar
select ad,soyad, departman_id from calisan where departman_id = null;
--SQL bu soruya "Evet" veya "Hayır" diyemez. Yanıt her zaman Unknown (Bilinmeyen) olur.
--Hata vermemesinin sebebi sözdiziminin (syntax) doğru olması, sadece mantıksal sonucun boş çıkmasıdır.

select ad,soyad, departman_id from calisan where departman_id is null;

--IS NULL bir karşılaştırma operatörü değil, özel bir durum kontrolüdür.
--SQL bu kontrolü yapabilir ve eğer alan boşsa doğrudan True sonucunu üretir. Bu sayede doğru satırlar listelenir.

-- "Ahmet"	"Yılmaz"	
-- "Burcu"	"Koç"	

--her departmandaki çalısan sayısı
select d.ad, count(c.id) as calisan_sayisi from departman d left join calisan c on d.departman_id=c.departman_id
group by d.ad;

-- "Yazılım Geliştirme"	3
-- "İnsan Kaynakları"	3
-- "Pazarlama"	2

-- calisan sayısı 2'den fazla olan departmanlar
select d.ad as departman_adi , count(c.id) as calisan_sayisi
from departman d left join calisan c on d.departman_id= c.departman_id group by d.ad having count(c.id) > 2;

-- "Yazılım Geliştirme"	3
-- "İnsan Kaynakları"	3

select d.ad as departman_adi , count(c.id) as calisan_sayisi 
from departman d left join calisan c on d.departman_id= c.departman_id where count(c.id) > 2 group by d.ad;

--Hata mesajı: aggregate functions are not allowed in WHERE
-- aggregate fonksiyonlar (count, sum, avg, min, max) WHERE şartında kullanılamaz. GROUP BY ile birlikte HAVING şartı kullanılmalıdır.

--left join ve inner join farkı
select * from calisan c left join departman d on c.departman_id=d.departman;

-- 23	"Mehmet"	"Demir"	1	58000.00	"2025-06-10"	1	"Yazılım Geliştirme"
-- 24	"Ece"	"Yıldız"	1	80000.00	"2024-11-01"	1	"Yazılım Geliştirme"
-- 25	"Can"	"Öztürk"	2	45000.00	"2025-02-11"	2	"İnsan Kaynakları"
-- 29	"Umut"	"Arslan"	3	55000.00	"2025-01-10"	3	"Pazarlama"
-- 28	"Ayşe"	"Şahin"	3	52000.80	"2026-02-15"	3	"Pazarlama"
-- 27	"Ali"	"Çelik"	2	42000.00	"2023-05-15"	2	"İnsan Kaynakları"
-- 22	"Zeynep"	"Kaya"	1	72000.50	"2024-03-20"	1	"Yazılım Geliştirme"
-- 21	"Ahmet"	"Yılmaz"		65000.00	"2023-06-01"		
-- 30	"Burcu"	"Koç"		49000.00	"2021-02-03"		
-- 26	"Merve"	"Aydın"	2	45000.00	"2025-05-18"	2	"İnsan Kaynakları"

select * from calisan c inner join departman d on c.departman_id=d.departman_id ;

-- 23	"Mehmet"	"Demir"	1	58000.00	"2025-06-10"	1	"Yazılım Geliştirme"
-- 24	"Ece"	"Yıldız"	1	80000.00	"2024-11-01"	1	"Yazılım Geliştirme"
-- 25	"Can"	"Öztürk"	2	45000.00	"2025-02-11"	2	"İnsan Kaynakları"
-- 29	"Umut"	"Arslan"	3	55000.00	"2025-01-10"	3	"Pazarlama"
-- 28	"Ayşe"	"Şahin"	3	52000.80	"2026-02-15"	3	"Pazarlama"
-- 27	"Ali"	"Çelik"	2	42000.00	"2023-05-15"	2	"İnsan Kaynakları"
-- 22	"Zeynep"	"Kaya"	1	72000.50	"2024-03-20"	1	"Yazılım Geliştirme"
-- 26	"Merve"	"Aydın"	2	45000.00	"2025-05-18"	2	"İnsan Kaynakları"

---- left join ile calısan tablosunun yani soldakilerin tamamı gelir birleşen tablonun ise sadece eşleşen satırları gelir.
---- inner join ile sadece eşleşen satırlar gelir. Eşleşmeyen satırlar gelmez. mesela departmanı boş olanlar gelemedi.

