-- maaşı belli bir değerin üstünde olan çalışanlar
explain analyze select ad, soyad, maas from calisan where maas > 50000;

-- "Seq Scan on calisan  (cost=0.00..13.38 rows=90 width=252) (actual time=0.015..0.017 rows=6.00 loops=1)"
-- "  Filter: (maas > '50000'::numeric)"
-- "  Rows Removed by Filter: 4"
-- "  Buffers: shared hit=1"
-- "Planning Time: 0.089 ms"
-- "Execution Time: 0.028 ms"

create index idx_maas on calisan(maas);

-- "Seq Scan on calisan  (cost=0.00..1.12 rows=3 width=252) (actual time=0.014..0.016 rows=6.00 loops=1)"
-- "  Filter: (maas > '50000'::numeric)"
-- "  Rows Removed by Filter: 4"
-- "  Buffers: shared hit=1"
-- "Planning:"
-- "  Buffers: shared hit=18 read=2"
-- "Planning Time: 1.588 ms"
-- "Execution Time: 0.030 ms"

--DROP INDEX IF EXISTS idx_maas;

--insert into calisan(ad,soyad,departman_id,maas,ise_giris_tarihi) select 'ad' || i, 'soyad' ||i, 1,(random()*100000)::numeric(10,2),'2020-01-01'::date + i from generate_series(1,200000) as i ;
--analyze calisan;

-- Before index:
-- "Seq Scan on calisan  (cost=0.00..4358.12 rows=100117 width=27) (actual time=0.018..13.521 rows=100056.00 loops=1)"
-- "  Filter: (maas > '50000'::numeric)"
-- "  Rows Removed by Filter: 99954"
-- "  Buffers: shared hit=1858"
-- "Planning:"
-- "  Buffers: shared hit=20 dirtied=1"
-- "Planning Time: 0.348 ms"
-- "Execution Time: 15.627 ms"

--After index:

-- "Seq Scan on calisan  (cost=0.00..4358.12 rows=100117 width=27) (actual time=0.015..11.684 rows=100056.00 loops=1)"
-- "  Filter: (maas > '50000'::numeric)"
-- "  Rows Removed by Filter: 99954"
-- "  Buffers: shared hit=1858"
-- "Planning Time: 0.084 ms"
-- "Execution Time: 13.495 ms"

explain analyze select * from calisan where maas>0;

-- "Seq Scan on calisan  (cost=0.00..4358.12 rows=200010 width=39) (actual time=0.015..11.804 rows=200010.00 loops=1)"
-- "  Filter: (maas > '0'::numeric)"
-- "  Buffers: shared hit=1858"
-- "Planning:"
-- "  Buffers: shared hit=4"
-- "Planning Time: 0.161 ms"
-- "Execution Time: 15.630 ms"


--delete from calisan where ad like 'ad%';