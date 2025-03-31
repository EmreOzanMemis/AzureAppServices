## 1. Parametrelerin Doğru Ayarlanması
$subscriptionId, $resourceGroupName, $hostingPlanName, $webAppName, $repoUrl, $branch, ve $gittoken gibi değişkenlerin doğru değerlerle doldurulması gerekiyor.
Örneğin

    $subscriptionId = "12345678-1234-1234-1234-123456789abc"
    $resourceGroupName = "MyResourceGroup"
    $hostingPlanName = "MyHostingPlan"
    $webAppName = "MyWebApp"
    $repoUrl = "https://github.com/username/repository"
    $branch = "main"
    $gittoken = "ghp_YourGitHubToken"

## 2. GitHub Token
$gittoken değişkenine, GitHub'da oluşturduğunuz bir Personal Access Token (PAT) değerini girmeniz gerekiyor. Bu token, gerekli izinlere sahip olmalıdır:
repo (repository erişimi)
workflow (GitHub Actions workflow erişimi)

## 3. GitHub Repository Yapılandırması
$repoUrl değişkeni, uygulamanızın kaynak kodunu içeren GitHub repository'sini işaret etmelidir.
Repository'de bir Dockerfile veya web.config gibi Azure App Service ile uyumlu bir yapılandırma dosyası bulunmalıdır.

## 4. Azure CLI'nin Yüklü ve Giriş Yapılmış Olması
Azure CLI'nin yüklü olduğundan ve az login komutuyla giriş yaptığınızdan emin olun.

## 5. GitHub Actions Workflow Dosyası
Script, GitHub repository'nize bir GitHub Actions workflow dosyası ekler. Bu dosya, uygulamanızı Azure App Service'e otomatik olarak deploy etmek için kullanılır.

## 6. Scriptin Çalışma Sırası
Script, şu adımları takip eder:
Azure aboneliğinizi seçer.
Kaynak grubunu oluşturur.
App Service Plan oluşturur.
Web App oluşturur.
Web App ayarlarını yapılandırır.
GitHub repository'sini Azure Web App ile entegre eder ve bir GitHub Actions workflow dosyası oluşturur.

Örnek Workflow Dosyası
Scriptin oluşturduğu GitHub Actions workflow dosyası, aşağıdaki gibi bir yapı içerebilir:

    # .github/workflows/azure-webapp.yml
    name: Deploy to Azure Web App

    on:
    push:
    branches:
      - main

    jobs:
    build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Login to Azure
      uses: azure/login@v1
      with:
        creds: ${{ secrets.AZURE_CREDENTIALS }}

    - name: Deploy to Azure Web App
      uses: azure/webapps-deploy@v2
      with:
        app-name: MyWebApp
        slot-name: production
        publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}

Yukarıdaki adımları doğru şekilde uygularsanız, script Azure App Service üzerinde bir uygulama oluşturur ve GitHub Actions ile CI/CD entegrasyonunu sağlar. Bu sayede, GitHub repository'nize bir kod gönderdiğinizde (örneğin main branch'e), uygulamanız otomatik olarak Azure App Service'e deploy edilir.
