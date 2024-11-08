# Parametreleri tanımlayın
$subscriptionId = "<Abone ID'nizi girin>"
$resourceGroupName = "<Kaynak grubu adınızı girin>"
$location = "westeurope"  # Lokasyon ismi
$hostingPlanName = "<Hosting plan adınızı girin>"
$sku = "P1V3"
$numberOfWorkers = 1
$webAppName = "<Web uygulama adınızı girin>"
$linuxFxVersion = "JAVA|8-jre8"
$alwaysOn = $true
$ftpsState = "FtpsOnly"

# Aboneliği ayarlayın
az account set --subscription $subscriptionId

# Kaynak grubunu oluşturun
az group create --name $resourceGroupName --location $location

# App Service Plan oluşturun
az appservice plan create --name $hostingPlanName --resource-group $resourceGroupName --location $location --sku $sku --is-linux --number-of-workers $numberOfWorkers

# Web App oluşturun
az webapp create --resource-group $resourceGroupName --plan $hostingPlanName --name $webAppName --runtime $linuxFxVersion

# Web App ayarlarını yapılandırın
az webapp config set --resource-group $resourceGroupName --name $webAppName --always-on $alwaysOn --ftps-state $ftpsState

# Azure CLI ile Azure Web App için Java ve Java SE yapılandırması
az webapp config set --resource-group $resourceGroupName --name $webAppName `
    --linux-fx-version "JAVA|8-jre8" `
    --java-container "JAVA" `
    --java-container-version "SE"

# GitHub'dan Azure Web App'e GitHub Actions ile CI/CD yapılandırması
$webAppName = "<Web uygulama adınızı girin>"  # Web App adınız
$resourceGroupName = "<Kaynak grubu adınızı girin>"  # Kaynak grubunuzun adı
$repoUrl = "<GitHub repository URL'nizi girin>"  # GitHub repository URL'niz
$branch = "<Kullanılacak branch'ı girin>"  # Kullanılacak branch
$gitHubUser = "<GitHub kullanıcı adınızı girin>"  # GitHub kullanıcı adınız
$gitHubOrganization = "<GitHub organizasyon adınızı girin>"  # GitHub organizasyon adınız
$gittoken = "<GitHub token'ınızı girin>"  # GitHub token

# GitHub reposunu Azure Web App ile entegre edin
az webapp deployment source config --name $webAppName --resource-group $resourceGroupName `
  --repo-url $repoUrl --branch $branch --git-token $gittoken --repository-type github

# Bu komut, GitHub reposuna bir GitHub Actions workflow dosyası ekler ve Azure Web App'ınızla entegre eder
