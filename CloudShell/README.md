# Azure Web App Deployment Scripti

Bu doküman, Azure üzerinde bir Web App oluşturup yapılandırmak için kullanılan Cloud Shell scriptinin detaylı bir açıklamasını içerir. Script, bir Azure App Service Plan oluşturur, bir Web App başlatır ve bu uygulamayı GitHub üzerinden sürekli entegrasyon ve dağıtım (CI/CD) ile yapılandırır.
Önkoşullar

  Azure hesabınıza erişiminiz olmalıdır.
  Azure CLI yüklü olmalı ve yapılandırılmış olmalıdır.
  GitHub hesabınız olmalı ve bir repository sahibi olmalısınız.
  Uygulamanızın kaynak kodları bu GitHub repository'sinde bulunmalıdır.

# Scriptin Kullanımı
Parametreleri Tanımlama

Scriptin başında yer alan parametreler, deployment için gereken çeşitli ayarları içerir. Bu parametrelerin açıklamaları aşağıda verilmiştir:

  subscriptionId: Azure abonelik ID'nizi girin.
  resourceGroupName: Oluşturulacak veya kullanılacak kaynak grubunun adını girin.
  location: Kaynakların oluşturulacağı Azure bölgesini belirtin (örneğin, westeurope).
  hostingPlanName: Oluşturulacak App Service Plan'ın adını belirtin.
  sku: Seçilen App Service Plan'ın SKU'sunu girin (örneğin, P1V3).
  numberOfWorkers: Planınızda istediğiniz worker sayısını girin.
  webAppName: Oluşturulacak Web App'in adını girin.
  linuxFxVersion: Uygulamanın çalıştığı platform ve sürümünü belirtin (örneğin, JAVA|8-jre8).
  alwaysOn: Web App'in sürekli çalışır durumda olup olmayacağını belirtin (true veya false).
  ftpsState: FTPS erişiminin durumunu belirtin.

Aboneliği Ayarlama

Script, az account set komutu ile belirtilen Azure aboneliğini aktif hale getirir.
Kaynak Grubu ve App Service Plan Oluşturma

Kaynak grubu ve App Service Plan, az group create ve az appservice plan create komutları ile sırasıyla oluşturulur.
Web App Oluşturma ve Yapılandırma

Web App, az webapp create komutu ile oluşturulur ve az webapp config set komutları ile yapılandırılır.
GitHub ile Entegrasyon

GitHub repository'nizden Azure Web App'e kod dağıtımını sağlamak için az webapp deployment source config komutu kullanılır. Bu komut, belirtilen GitHub repository'sinden belirtilen branch üzerinden kodları alıp Azure Web App'ınızda dağıtır.
Sonuç

Bu script, Azure üzerinde bir Web App oluşturmanın yanı sıra, uygulamanızın sürekli olarak güncel kalmasını sağlamak için GitHub ile entegrasyonu da otomatize eder. Böylece, kod değişiklikleriniz otomatik olarak canlı ortama yansıtılır.

Not-1: Bu scirpt örnek amaçlıdır. kullanmak istediğinzi işletim sistemi, plan yada runtime seçeneğine göre özelleştirmeniz gerekmektedir. 

Not-2: Deployment sürecinizi kolaylaştırması için örnek bir YAML dosyasıda ekledim. Gerekli düzenlemeleri yaparak CI/CD işlemlerini otomatize edebilirsiniz. 
