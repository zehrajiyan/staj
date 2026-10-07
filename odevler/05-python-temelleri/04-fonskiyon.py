calisanlar = [
    {"id": 23, "ad": "Mehmet", "soyad": "Demir", "departman_id": 1, "maas": 58000.00, "ise_giris_tarihi": "2025-06-10"},
    {"id": 24, "ad": "Ece", "soyad": "Yıldız", "departman_id": 1, "maas": 80000.00, "ise_giris_tarihi": "2024-11-01"},
    {"id": 25, "ad": "Can", "soyad": "Öztürk", "departman_id": 2, "maas": 45000.00, "ise_giris_tarihi": "2025-02-11"},
    {"id": 29, "ad": "Umut", "soyad": "Arslan", "departman_id": 3, "maas": 55000.00, "ise_giris_tarihi": "2025-01-10"},
    {"id": 28, "ad": "Ayşe", "soyad": "Şahin", "departman_id": 3, "maas": 52000.80, "ise_giris_tarihi": "2026-02-15"},
    {"id": 27, "ad": "Ali", "soyad": "Çelik", "departman_id": 2, "maas": 42000.00, "ise_giris_tarihi": "2023-05-15"},
    {"id": 22, "ad": "Zeynep", "soyad": "Kaya", "departman_id": 1, "maas": 72000.50, "ise_giris_tarihi": "2024-03-20"},
    {"id": 21, "ad": "Ahmet", "soyad": "Yılmaz", "departman_id": None, "maas": 65000.00, "ise_giris_tarihi": "2023-06-01"},
    {"id": 30, "ad": "Burcu", "soyad": "Koç", "departman_id": None, "maas": 49000.00, "ise_giris_tarihi": "2021-02-03"},
    {"id": 26, "ad": "Merve", "soyad": "Aydın", "departman_id": 2, "maas": 45000.00, "ise_giris_tarihi": "2025-05-18"}
]

def departman_sayisi(calisanlar, departman_id):
    sayac = 0
    
    for calisan in calisanlar:
        if calisan["departman_id"] == departman_id:
            sayac += 1
            
    return sayac


id_1_sayisi = departman_sayisi(calisanlar, 1)
print(f"Departman ID 1 olan çalışan sayısı: {id_1_sayisi}")

id_2_sayisi = departman_sayisi(calisanlar, 2)
print(f"Departman ID 2 olan çalışan sayısı: {id_2_sayisi}")

id_3_sayisi = departman_sayisi(calisanlar, 3)
print(f"Departman ID 3 olan çalışan sayısı: {id_3_sayisi}")

id_none_sayisi = departman_sayisi(calisanlar, None)
print(f"Departmanı olmayan (None) çalışan sayısı: {id_none_sayisi}")


def ortalama_maas(calisanlar):
    toplam_maas = 0.0
    calisan_sayisi = 0


    for calisan in calisanlar:
        toplam_maas += calisan['maas']
        calisan_sayisi += 1

    if calisan_sayisi > 0:
        ortalama_maas = toplam_maas / calisan_sayisi

        return ortalama_maas

print(ortalama_maas(calisanlar))

def ortalama_maas_print(calisanlar):
    toplam_maas = 0.0
    calisan_sayisi = 0


    for calisan in calisanlar:
        toplam_maas += calisan['maas']
        calisan_sayisi += 1

    if calisan_sayisi > 0:
        ortalama_maas = toplam_maas / calisan_sayisi
        print(f"Ortalama Maaş: {ortalama_maas}")

sonuc = ortalama_maas_print(calisanlar)
print (sonuc) # çıktı sonunda None dönecektir çünkü fonksiyon print ile yazdırıyor ve return etmiyor. çünkü print fonksiyonu None döndürür. neden none döndüğünü anlamak için print fonksiyonunun ne yaptığına bakmak gerekir. print fonksiyonu ekrana yazdırma işlemi yapar ve herhangi bir değer döndürmez, bu yüzden None döner.