calisanlar= [
    {
        "id": 23,
        "ad": "Mehmet",
        "soyad": "Demir",
        "departman_id": 1,
        "maas": 58000.00,
        "ise_giris_tarihi": "2025-06-10"
    },
    {
        "id": 24,
        "ad": "Ece",
        "soyad": "Yıldız",
        "departman_id": 1,
        "maas": 80000.00,
        "ise_giris_tarihi": "2024-11-01"
    },
    {
        "id": 25,
        "ad": "Can",
        "soyad": "Öztürk",
        "departman_id": 2,
        "maas": 45000.00,
        "ise_giris_tarihi": "2025-02-11"
    },
    {
        "id": 29,
        "ad": "Umut",
        "soyad": "Arslan",
        "departman_id": 3,
        "maas": 55000.00,
        "ise_giris_tarihi": "2025-01-10"
    },
    {
        "id": 28,
        "ad": "Ayşe",
        "soyad": "Şahin",
        "departman_id": 3,
        "maas": 52000.80,
        "ise_giris_tarihi": "2026-02-15"
    },
    {
        "id": 27,
        "ad": "Ali",
        "soyad": "Çelik",
        "departman_id": 2,
        "maas": 42000.00,
        "ise_giris_tarihi": "2023-05-15"
    },
    {
        "id": 22,
        "ad": "Zeynep",
        "soyad": "Kaya",
        "departman_id": 1,
        "maas": 72000.50,
        "ise_giris_tarihi": "2024-03-20"
    },
    {
        "id": 21,
        "ad": "Ahmet",
        "soyad": "Yılmaz",
        "departman_id": None,
        "maas": 65000.00,
        "ise_giris_tarihi": "2023-06-01"
    },
    {
        "id": 30,
        "ad": "Burcu",
        "soyad": "Koç",
        "departman_id": None,
        "maas": 49000.00,
        "ise_giris_tarihi": "2021-02-03"
    },
    {
        "id": 26,
        "ad": "Merve",
        "soyad": "Aydın",
        "departman_id": 2,
        "maas": 45000.00,
        "ise_giris_tarihi": "2025-05-18"
    }
]

for calisan in calisanlar:
    if calisan['maas'] > 50000:

        print(f" Ad: {calisan['ad']}, Soyad: {calisan['soyad']}, Maaş: {calisan['maas']}")

toplam_maas = 0.0
calisan_sayisi = 0


for calisan in calisanlar:
    toplam_maas += calisan['maas']
    calisan_sayisi += 1

if calisan_sayisi > 0:
    ortalama_maas = toplam_maas / calisan_sayisi
    print(f"Ortalama Maaş: {ortalama_maas}")