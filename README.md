# Sanal Sunucu Kiralama

- https://kapteyan.com.tr adresine gidip bir hesap oluşturun.
- https://www.kapteyan.com.tr/sunucu/turkiye-vds-sanal-sunucular adresine gidip `TR SSD VDS 1` isimli sunucuyu satın alın. (Vergiler dahil aylık 167.99₺)
- Sepet ekranında işletim sistemini `Ubuntu 22.04` olarak ayarladıktan sonra (ücretsiz) hiçbir şeyi işaretlemenize gerek yok

> Bu firmayla telefonda görüştüm fakat bizler için bir indirim kodu ayarlayamadım maalesef, sitede yazan indirim ise 3 yıllık satın alımlarda geçerli sadece.

- Satın alımı gerçekleştirdikten sonra hiç beklemeden https://my.kapteyan.com.tr/clientarea.php?action=services adresine gittiğinizde `ÜRÜN / HİZMET` bölümü altında satın aldığınız sunucuyu göreceksiniz.

![Urun Hizmet](https://drive.xn--tea.app/apps/files_sharing/publicpreview/M23YrmpxDqK7tjz?file=/urunhizmet.png&fileId=225&x=1920&y=1080&a=true&etag=a58aee43b6511b0c455cd441776dd9d0)

- Burada sağ taraftaki mavi butona tıklayın

![Sunucu Detaylari](https://drive.xn--tea.app/apps/files_sharing/publicpreview/M23YrmpxDqK7tjz?file=/sunucu_detaylari.png&fileId=223&x=1920&y=1080&a=true&etag=8bdfd74812f3224a720a8ed6d13352ec)

- Sizleri bu şekilde bir sayfa karşılayacak, içerisinde IP adresini bir yere kaydedin sonraki adımlarda işimize yarayacak.

- Aşağıdaki `Kurulum Yap` butonuna tıklayın ve çıkan seçeneklerden `Ubuntu 22.04` işletim sistemini seçin ve sunucuya bağlanmak için bir şifre belirleyin (şifreniz sadece sayı ve harflerden oluşmak zorunda)

![Sunucu Ayarları](https://drive.xn--tea.app/apps/files_sharing/publicpreview/M23YrmpxDqK7tjz?file=/kurulum_ayarlari.png&fileId=219&x=1920&y=1080&a=true&etag=5dc1d2013e8db17d5f571df2b24fc915)

- Yükle butonuna basın, burası bir kaç dakika sürebilir. Daha sonrasında sunucu bağlanmaya hazır hale gelecek.

# WireGuard Kurulumu

> Sunucuya bağlanmak için ilk önce PuTTy indirmelisiniz, https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html adresinden x86 veya Arm halini indirebilirsiniz.

> 213.238.172.XXX yazan yeri kendi sunucunuzun IP adresi ile değiştirin

- CMD penceresi açın
- `ssh -l root 213.238.172.XXX`
- İlk gelen soruya 'yes' yazıp entera basın
- Sunucuya verdiğiniz şifreyi girin (güvenlikten dolayı ekrana yazdığınız şifreyi göremeyeceksiniz ama korkmayın yazdıklrınız gidiyor, şifreyi girdikten sonra enter'a basın. Şifreniz doğruysa dosya sunucuya bağlanacaksınız. Doğru değilse hata atacaktır.)
- `curl -sfL https://drive.ğ.app/s/H3aL7rP2CKYaXxN/download/setup.sh -o setup.sh` komutunu çalıştırın, kurulum dosyalarını sunucuya indirecektir.
- `cat setup.sh` ile dosyanın içeriğini yazdırın ve `https://drive.ğ.app/s/H3aL7rP2CKYaXxN` bu linkteki içerikle aynı olduğuna emin olun.
- `chmod +x setup.sh` komutu ile dosyaya çalıştırma izni verin
- `./setup.sh --ip <sunucunuzun ip adresi> --sifre <arayüz şifresi>` ile kuruluma başlayın

![Tab Prompt](https://drive.xn--tea.app/apps/files_sharing/publicpreview/M23YrmpxDqK7tjz?file=/prompt.png&fileId=224&x=1920&y=1080&a=true&etag=72db1f8d43b13cb33a62cd081d2029a8)

Ekrana bu şekilde bir uyarı gelirse `Tab` tuşuyla `<Ok>` yerine getirin ve `Enter` tuşuna basın

> Bunun gibi 2-3 tane ekran görebilirsiniz

![Finish](https://drive.xn--tea.app/apps/files_sharing/publicpreview/M23YrmpxDqK7tjz?file=/finish.png&fileId=221&x=1920&y=1080&a=true&etag=b78ce16b45ddf7becc41de2d7e58fe89)

Bu ekranı gördüğünüzde kurulum tamamlanmış demektir.

Tarayıcınızı açıp `http://<sunucunuzun ip adresi>:51821` adresine gittiğinizde bir şifre soracak, kurulum esnasında `--sifre` ile verdiğiniz şifreyi yazarak giriş yapabilirsiniz.

![Login](https://drive.xn--tea.app/apps/files_sharing/publicpreview/M23YrmpxDqK7tjz?file=/login.png&fileId=218&x=1920&y=1080&a=true&etag=8bb7a5f56a4c724b4635693d91ec9f29)

> Şifrenizi veya IP adresinizi yanlış girdiyseniz `setup.sh` dosyasını tekrar çalıştırarak yeniden kurulum yapabilirsiniz.

![New Client](https://drive.xn--tea.app/apps/files_sharing/publicpreview/M23YrmpxDqK7tjz?file=/new_client.png&fileId=222&x=1920&y=1080&a=true&etag=3643c46fa139289f3932284a747a173a)

Giriş yaptıktan sonra gelen pencerede `New Client` butonuna basıp istediğiniz isimle yeni bir profil oluşturun.

![Download Configuration](https://drive.xn--tea.app/apps/files_sharing/publicpreview/M23YrmpxDqK7tjz?file=/download_configuration.png&fileId=217&x=1920&y=1080&a=true&etag=a535d9d2a94fd4e4f4c1fdcab5de3c10)

`Download Configuration` butonuna basıp oluşturduğunuz konfigurasyonu indirin.

- https://www.wireguard.com/install/ adresinden WireGuard istemcisini bilgisayarınıza indirin

![Import Profile](https://drive.xn--tea.app/apps/files_sharing/publicpreview/M23YrmpxDqK7tjz?file=/import_profile.png&fileId=220&x=1920&y=1080&a=true&etag=4462372d709c2b5a82ebbdbcfd70ffaa)

Bilgisayarınızdan `WireGuard` uygulamasını açıp sol aşağıdan `Import Tunnel` ve ardından `Import tunnel(s) from file` butonuna basın, açılan dosya penceresinde indirdiğiniz `profil.conf` dosyasını seçin.

`Activate` butonuna bastıktan sonra Valorant'ı kapatıp açın ve sesiniz düzelecektir.

> Aynı arayüz içerisinden başka arkadaşlarınıza profiller oluşturup onlardada sorunu çözebilirsiniz. Bu sayede arkadaşlarınızla ortak şekilde faturayıda ödeyebilirsiniz fakat unutmayın bu VPN aracılığıyla yasaklı sitelere giriş yapmak tamamen sizin sorumluluğunuzdadır. Yasaklı sitelere girişlerde hakkınızda yasal süreç başlayabilir bu yüzden sadece güvendiğiniz kişilere profil açın.

> Destek için https://discord.gg/aegEbj8G adresinden ulaşım sağlayabilirsiniz
