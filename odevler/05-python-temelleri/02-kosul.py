maas = int(input("Maasinizi giriniz: "))

departman_id = None

if maas >= 60000:
    print("Yuksek maas")
elif maas >= 45000:
    print("Orta maas")
else:
    print("Dusuk maas") # IndentationError: expected an indented block after 'else' statement on line 9


# Maasinizi giriniz: 57000
# Orta maas
# Maasinizi giriniz: 40000
# Dusuk maas
# Maasinizi giriniz: 80000
# Yuksek maas

if departman_id == None:
    print("Departman Yok")