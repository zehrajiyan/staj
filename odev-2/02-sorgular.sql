select * from departman;

select * from calisan;

select ad, soyad, maas from calisan order by maas desc limit 3;

--aynı maaşı alan kişiler
select ad, soyad , a.maas 
from calisan c join 
(select maas, count(*) from calisan group by maas having count(*) > 1 ) a  on c.maas=a.maas;

--aynı maaşı alan kişiler self join. c1.id <> c2.id şartı, çalışanın maaşını kendisiyle değil, tablodaki başka bir çalışanla kıyaslamasını sağlar
SELECT c1.ad, c1.soyad, c1.maas
FROM calisan c1
JOIN calisan c2 ON c1.maas = c2.maas AND c1.id <> c2.id;

--aynı departmanda olup aynı maaşı alanlar
SELECT c1.ad, c1.soyad, c1.departman_id, c1.maas
FROM calisan c1
JOIN calisan c2 ON c1.maas = c2.maas AND c1.departman_id=c2.departman_id and c1.id <> c2.id;

--calisan ve bulundugu departman. left join olunca departmanı bulunmayanlar da gelir.
select c.ad,c.soyad, coalesce(d.ad, 'departman ismi bulunmuyor') as departman_adi from calisan c left join departman d  on c.departman_id=d.departman_id ; 

--her departmandaki çalısan sayısı
select d.ad, count(c.id) as calisan_sayisi from departman d left join calisan c on d.departman_id=c.departman_id
group by d.ad;

--departmana göre ortalama maas
select d.ad, avg(c.maas) from departman d join calisan c on d.departman_id=c.departman_id group by d.ad;

--maas sıralaması
SELECT ad, soyad, maas,
       DENSE_RANK() OVER(ORDER BY maas DESC) AS maas_sirasi
FROM calisan;
