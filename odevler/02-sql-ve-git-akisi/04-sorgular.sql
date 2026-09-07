select * from departman;

1	"Yazılım Geliştirme"
2	"İnsan Kaynakları"
3	"Pazarlama"

select * from calisan;


23	"Mehmet"	"Demir"	1	58000.00	"2025-06-10"
24	"Ece"	"Yıldız"	1	80000.00	"2024-11-01"
25	"Can"	"Öztürk"	2	45000.00	"2025-02-11"
29	"Umut"	"Arslan"	3	55000.00	"2025-01-10"
28	"Ayşe"	"Şahin"	3	52000.80	"2026-02-15"
27	"Ali"	"Çelik"	2	42000.00	"2023-05-15"
22	"Zeynep"	"Kaya"	1	72000.50	"2024-03-20"
21	"Ahmet"	"Yılmaz"		65000.00	"2023-06-01"
30	"Burcu"	"Koç"		49000.00	"2021-02-03"
26	"Merve"	"Aydın"	2	45000.00	"2025-05-18"


---- en yüksek maaş alan 3 kişi
select ad, soyad, maas from calisan order by maas desc limit 3;

"Ece"	"Yıldız"	80000.00
"Zeynep"	"Kaya"	72000.50
"Ahmet"	"Yılmaz"	65000.00



--aynı maaşı alan kişiler
select ad, soyad , a.maas 
from calisan c join 
(select maas, count(*) from calisan group by maas having count(*) > 1 ) a  on c.maas=a.maas;

"Can"	"Öztürk"	45000.00
"Merve"	"Aydın"	45000.00



--aynı maaşı alan kişiler self join. c1.id <> c2.id şartı, çalışanın maaşını kendisiyle değil, tablodaki başka bir çalışanla kıyaslamasını sağlar
SELECT c1.ad, c1.soyad, c1.maas
FROM calisan c1
JOIN calisan c2 ON c1.maas = c2.maas AND c1.id <> c2.id;

"Can"	"Öztürk"	45000.00
"Merve"	"Aydın"	45000.00



--aynı departmanda olup aynı maaşı alanlar
SELECT c1.ad, c1.soyad, c1.departman_id, c1.maas
FROM calisan c1
JOIN calisan c2 ON c1.maas = c2.maas AND c1.departman_id=c2.departman_id and c1.id <> c2.id;


"Can"	"Öztürk"	2	45000.00
"Merve"	"Aydın"	2	45000.00



--calisan ve bulundugu departman. left join olunca departmanı bulunmayanlar da gelir.
select c.ad,c.soyad, coalesce(d.ad, 'departman ismi bulunmuyor') as departman_adi from calisan c left join departman d  on c.departman_id=d.departman_id ; 


"Mehmet"	"Demir"	"Yazılım Geliştirme"
"Ece"	"Yıldız"	"Yazılım Geliştirme"
"Can"	"Öztürk"	"İnsan Kaynakları"
"Umut"	"Arslan"	"Pazarlama"
"Ayşe"	"Şahin"	"Pazarlama"
"Ali"	"Çelik"	"İnsan Kaynakları"
"Zeynep"	"Kaya"	"Yazılım Geliştirme"
"Ahmet"	"Yılmaz"	"departman ismi bulunmuyor"
"Burcu"	"Koç"	"departman ismi bulunmuyor"
"Merve"	"Aydın"	"İnsan Kaynakları"



--her departmandaki çalısan sayısı
select d.ad, count(c.id) as calisan_sayisi from departman d left join calisan c on d.departman_id=c.departman_id
group by d.ad;

"Yazılım Geliştirme"	3
"İnsan Kaynakları"	3
"Pazarlama"	2




--departmana göre ortalama maas
select d.ad, avg(c.maas) from departman d join calisan c on d.departman_id=c.departman_id group by d.ad;


"Yazılım Geliştirme"	70000.166666666667
"İnsan Kaynakları"	44000.000000000000
"Pazarlama"	53500.400000000000


--maas sıralaması
SELECT ad, soyad, maas,
       DENSE_RANK() OVER(ORDER BY maas DESC) AS maas_sirasi
FROM calisan;


"Ece"	"Yıldız"	80000.00	1
"Zeynep"	"Kaya"	72000.50	2
"Ahmet"	"Yılmaz"	65000.00	3
"Mehmet"	"Demir"	58000.00	4
"Umut"	"Arslan"	55000.00	5
"Ayşe"	"Şahin"	52000.80	6
"Burcu"	"Koç"	49000.00	7
"Merve"	"Aydın"	45000.00	8
"Can"	"Öztürk"	45000.00	8
"Ali"	"Çelik"	42000.00	9