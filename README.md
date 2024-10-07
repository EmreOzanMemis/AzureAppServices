Azure App Service, Microsoft'un bulut platformu Azure üzerinde web uygulamaları, API'ler ve mobil uygulamaları barındırmak için kullanılan yönetilen bir hizmettir. Esnek, ölçeklenebilir ve kullanımı kolay olan bu hizmet, geliştiricilere uygulamalarını hızlı bir şekilde dağıtmaları ve yönetmeleri için kapsamlı araçlar sunar.
Neden Kullanılır ve Avantajları

  Yönetilen Hizmet: Sunucu yönetimi, yama yönetimi gibi işletim sistemine özgü görevlerden Microsoft sorumludur. Bu, geliştiricilerin uygulama koduna odaklanmalarını sağlar.
  Otomatik Ölçekleme: Trafik artışına göre otomatik olarak kaynaklar artırılır ve azaltılır. Bu, performansı maksimize ederken maliyeti optimize eder.
  Birden Çok Dil ve Çerçeve Desteği: .NET, .NET Core, Java, Ruby, Node.js, PHP, Python gibi popüler programlama dilleri ve çerçeveleri destekler.
  Kolay Entegrasyon: Azure SQL Database, Azure Active Directory ve diğer Azure hizmetleri ile entegrasyon sağlar.
  DevOps Desteği: Azure DevOps, GitHub gibi popüler devops araçları ile entegrasyon, sürekli entegrasyon ve sürekli dağıtım (CI/CD) işlemlerini kolaylaştırır.
  Küresel Dağıtım: Microsoft’un küresel veri merkezi ağı sayesinde uygulamaları dünya genelinde kolayca dağıtma ve yönetme imkanı sunar.

Azure App Service Nasıl Kullanılır?

Azure App Service kullanarak bir web uygulaması barındırmak için aşağıdaki adımlar genel bir rehber olarak işlev görür:
1. Kaynak Oluşturma

   Azure portalına giriş yapın. "portal.azure.com" 
   Menüden yada Search bölümünden App Services seçeneğini bulup seçin.
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/f05d280e-08b8-4830-864d-8d5b2cd93c2e)
   "Create" seçeneğine tıklayın ve Web App seçiniz
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/5b618e5c-1e8a-4aec-b123-dd7a7897d045)
   Subscription seçiniz, Resource Group Seçin yada oluşturun. Uygulama için bir ad, yayın türü (Code veya Container) seçiniz. Bu örnek de Code üzerinden devam edeceğim, runtime stack, işletim sistemi ve bölge gibi temel bilgileri girin.
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/5cc40f68-f9b8-4480-96c6-9443ed3ddac3)
   Pricing Plans bölümünde sizin için uygun donanım ve özeliklere sahip planı seçiniz. (Plan seçimi yaparken sadece uygulamanız için ihtiyacınız olan kaynak miktarını göz önünde bulundurunuz. Scale bir yapıya ihtiyacınzı olacak ise scale opsiyonu olan plan seçmek önemli olacaktır. Planların her biri farklı kaynak ve özeliklere sahip olduğu için backup gibi ihtiyaçlarınız var ise plan seçiminde yine önemli tercih karar sürecinde göz önünde bulundurulmalıdır. Private network üzerinde çalışacaksanız seçtiğiniz planın vnet entegrasyonun olması önemli plan seçimi karar süreçlerinden olabilir.)
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/921c3d22-6a47-493e-a9da-433844c9d660)
   Seçtiğiniz plan kapsamında Zone redundancy özelliği var ise Zone redundancy terchinizi seçiniz.
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/fe1dd037-437d-4655-9ce0-d0c98a33446c)
   Recommended services (preview) bölümünde Web App ile birlikte Database yada Redis gibi ek servislerin deploy işlemlerini eş zamanlı gerçekleştirebilirsiniz. (Bu bölümde yaptığınız deployment yöntemleri sonrası Database yada redis için ek yapılandrıma süreçlerini deploy sonrası yapmayı unutmayınız)
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/16abf975-94ae-4878-8cb3-197aab091ab1)
   Deployment adımında Continuous deployment sürecinide tamamlamak isterseniz GitHub Action kullanarak deployment gerçekleştrirebilirsiniz.Continuous deployment Enable duruma getiriniz. GitHub Settings bölümünde GitHub Accountunuz ile giriş yapınız. Organization, Repository ve Branch seçimlerinizi gerçekleştirebilirsiniz. Authentication settings bölümünde Basic authentication enable duruma getirmeyi unutmayınız.
   Bu çalışma sırasında GitHub repolarımda fork olarak eklediğim my-spring-app uygluması kullanılmıştır. Java8 de hazırlanan bu uygulama için Runtime Stack bölümünde Java8 ve Java SE seçmemin sebebi bu yüzdendir.  
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/c53d25e0-3344-406f-8f6e-d6b2fcaa6e40)
   Networking adımında seçmiş olduğunuz plan özelikleri doğrultusunda Enable network injection kullanabilirsiniz. Bu özellik uygulamanızın private network üzerinde çalışmasına imkan sağlayacaktır. Bunun için VNET ve Subnet ihtiyaçlarınız bulunmaktaıdr. Uygulamanızı direk Public olarak erişime sunmak isterseniz Enable public access seçeneğini on duruma getiriniz.
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/df8987de-0284-4506-ae10-cbe2c8fd88d9)
   Monitoring adımında Applicaiton Insights kullanabilirsiniz. Application Insights, Azure tarafından sunulan bir performans izleme hizmetidir. Uygulamaların gerçek zamanlı olarak izlenmesini sağlar, hata teşhisleri ve kullanım analizleri yapar. Kullanıcıların uygulama performansını optimize etmelerine, sorunları hızlı bir şekilde tespit etmelerine ve çözümlerine yardımcı olur. Ayrıca, çeşitli programlama dilleri ve platformlarla entegre çalışabilme yeteneği sunarak esnek bir izleme çözümü sağlar.
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/289b9f54-65e9-4129-8ce5-d2c94cd04027)
   Tags adımında etiketlerimizi girebiliriz.
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/316cb5a7-7def-4e42-a8d7-311650fc19f7)
   Review + Create ekranında tüm yaptığımız seçimleri kontrol ettikten sonra artık sol alt bölümde bulunan Create butonuna basabiliriz.
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/be000e8e-6ea8-434a-9614-9e9cf55bde0f)

Önemli Not-1: üst bölümde gördüğünüz ekran görüntüsündeki fiyatlar bölgelere göre değişiklik gösterebilir.
Önemli Not-2: üst bölümde gördüğünüz ekran görüntüsünün sağ alt bölümünde bulunan Download a template for automation linki sayesinde mevcut yapılandırma ve seçimleriminizi ARM template halinde sonraki deploy işlemleri kullanabilir. İş süreçlerinizi otomatize edebilirsiniz. 

   Deployment ekranını kontrol ediyoruz. Tüm süreçler sorunsuz tamamlandığından emin olunuz.
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/de622bea-60b5-4d47-9028-31030d3f289e)

   GitHub Action kullandığımız için CI/CD sürecini kontrol etmek için GitHub'daki repoma gidiyourm ve Action bölümünü kontrol ediyourm. Yeni bir workflow oluşturdu ve Action Başladımı Kontrol Ediyorum
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/8c2a0547-056b-4710-ab54-860a51daae49)

   İlgili yml dosyasını incelemek istersniz workflow dizinindne kontrol edebilirsiniz. 
   ![image](https://github.com/user-attachments/assets/69570686-f395-47cc-80b4-86f276a84daa)


   Aynı Kontrol işlemini Azure App Sevices içerisinde oluşturduğumuz Web App'in Overview ekranında sağ alt bölümde bulunan Deploymnet Center detaylarında bulabilirsiniz
   ![image](https://github.com/EmreOzanMemis/AzureAppServices/assets/63871298/bf665759-51a5-4c20-9325-febd4bae8266)


2. Uygulama Yayınlama

   Yayınlamak istediğiniz uygulamayı geliştirin.
   Visual Studio veya başka bir IDE kullanarak Azure App Service'e bağlanın ve uygulamanızı doğrudan yayınlayın.
   Alternatif olarak, Azure CLI veya PowerShell gibi komut satırı araçları kullanarak uygulamanızı yayınlayabilirsiniz.

3. Yönetim ve İzleme

   Azure Portal üzerinden uygulamanızın performansını izleyebilir, log kayıtlarına erişebilir ve ölçekleme ayarlarını yönetebilirsiniz.
   Otomatik ölçeklendirme, yedekleme ve diğer pek çok yönetim özelliğini konfigüre edebilirsiniz.

Azure App Service, özellikle çeşitli programlama dilleri ve çerçeveleri desteklemesi ve kolay entegrasyon imkanlarıyla geliştiricilere geniş bir esneklik alanı sunar, böylece geliştirme sürecini hızlandırır ve yönetim yükünü azaltır. Bu özellikler, özellikle dinamik uygulamalar ve çoklu dil desteği gerektiren projeler için idealdir.
