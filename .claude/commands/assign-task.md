# /assign-task

Belirli bir role görev atamasını kolayca yapmak için kullanılır.
Örnek kullanım: `/assign-task "Frontend Developer" "Giriş ekranı login componentını tasarla"`

Team Lead (Sen), aşağıdaki işlemleri uygulayacaksın:
1. `docs/reports/INBOX/<rol_adi>_task.md` dosyasını oluştur veya güncelle. (örn: frontend_task.md)
2. Görev ataması formatına uygun olarak (# docs/reports/INBOX/<rol>_task.md formatı) görevi yaz.
3. İlgili rolün OUTBOX klasöründeki eski görev raporu varsa okundu olarak işaretlemek için `OUTBOX/` içindeki önceki raporun sonuna "(Görüldü)" yaz veya dosyayı temizle.
4. Kullanıcıya: "Görev ilgili role atandı. İlgili üye panelden görevi alacaktır." mesajı ver.
