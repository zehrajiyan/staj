- pwd -- bulundugun dosya yolunu görmek için
- mkdir odev-1 --yeni klasor 
- cd odev-1 -- klasore giriş
- cd ..  -- bir üst klasore çıkmak için
- New-Item -Path . -Name "yeni_dosya.md" -ItemType "File" -- klasorun içinde yeni dosya oluşturma

- ls -- ile klasorun içini listeleme

- Get-Content terminal.md -- dosyayı açmadan terminalde okumak için 
- cp kaynak.txt hedef.txt -- dosyayı kopyalamak için
- rename-item -path "terminal.md" -newname "01-terminal.md" -- yeniden adlandırma
- rm terminal.md -- bir doyayı silmek için
- rm "klasor_adi/silinecek_dosya.md" -- bulunduğun klasörden çıkmadan başka klasördeki dosyayı silmek için
- mv eski_ad.txt yeni_ad.txt -- dosyayı taşır yada adını değiştirir.
- cat -- küçük dosyaların içeriğini terminalden okumak için.
- ctrl + c  --komutu iptal etmek yada kapatmak
- dosya içine girdiğimizde ekleme yapabilmek için önce i demek gerekir (aşağıda insert yazar)
- dosyadaki değişikliği kaydederek çıkmak için önce esc ardından :wq (write and quit) sonra enter
- dosya içinde yapılan değişikliği kaydetmeden çıkmak için önce esc :q yada :q! (zorla çık) sonra enter.
