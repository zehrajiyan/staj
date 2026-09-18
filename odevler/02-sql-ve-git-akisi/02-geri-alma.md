Bir degisiklik git te üç yerde bulunabilir: çalışma alanı, staging ve commit.

git diff            ------- dosyadaki değişikliği gösterir. henuz kaydedilmemiş yani git add . komutundan önceki değişikliği gösterir.
git diff --staged   ------- dosyadaki farklılık. git add dedikten sonraki farklılıgı gösterir.

git restore  dosyaadi.md   ----- çalışma alanındaki değişikliği atar dosya en son committeki haline döner

git reset                  ---- commit i geri alır.

git reset --soft           ---- commit i çözer ama değişiklikleri staging de bırakır 
git reset --mixed          ---- çalışma alanında bırakır
git reset --hard           ---- değişiklikleri tamamen siler

git revert                 ---- geçmişi silmez yaptığı işlemi geri alan yeni bir commit üretir.


git log --oneline           ---- yapılan commitlerin vs geçmiş kaydını gösterir.


---> Github a push edilmiş bir commiti geri alırken en doğru seçim git revert işlemidir.
Çünkü geçmişi silmez yapılan değişikliği yada hatayı geri alan yeni bir commit açar böylece geçmiş kaydı düzenli olur ve eski hataya istenildiği vakit dönüp bakılabilir. Ekip arkadaşlarıyla merge conflict yaşanmasını önler.

--> Conflict denemesi : geçici bir branch ile github daki conflict durumu gözlenir.


---> bu satır deneme içindir.