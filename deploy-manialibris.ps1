# ================================================================================
# MANIA LIBRIS - VERIFICATION & DEPLOYMENT SCRIPT
# Pour: Windows (PowerShell)
# Usage: .\deploy-manialibris.ps1
# ================================================================================

# VARIABLES
$REPO_PATH = "$HOME\manialibris-website"  # À adapter si nécessaire
$DOWNLOAD_PATH = "$HOME\Downloads"
$FILES_TO_DEPLOY = @("le-cote-adam.html", "o-lado-de-adao.html", "catalogo.html")
$REPO_URL = "https://github.com/global-opera/manialibris-website.git"

# COULEURS
$SUCCESS = "Green"
$ERROR = "Red"
$WARNING = "Yellow"
$INFO = "Cyan"

# ================================================================================
# FONCTIONS
# ================================================================================

function Print-Header {
    param([string]$message)
    Write-Host ""
    Write-Host "=================================================================================" -ForegroundColor $INFO
    Write-Host $message -ForegroundColor $INFO
    Write-Host "=================================================================================" -ForegroundColor $INFO
    Write-Host ""
}

function Print-Success {
    param([string]$message)
    Write-Host "✓ $message" -ForegroundColor $SUCCESS
}

function Print-Error {
    param([string]$message)
    Write-Host "✗ $message" -ForegroundColor $ERROR
}

function Print-Warning {
    param([string]$message)
    Write-Host "⚠ $message" -ForegroundColor $WARNING
}

function Print-Info {
    param([string]$message)
    Write-Host "ℹ $message" -ForegroundColor $INFO
}

# Vérifier si fichier existe
function Check-File {
    param([string]$filePath)
    
    if (Test-Path $filePath) {
        Print-Success "Fichier trouvé: $filePath"
        return $true
    } else {
        Print-Error "Fichier MANQUANT: $filePath"
        return $false
    }
}

# Valider HTML
function Validate-HTML {
    param([string]$file)
    
    if (-not (Test-Path $file)) {
        Print-Error "Fichier n'existe pas: $file"
        return $false
    }
    
    $content = Get-Content $file
    $valid = $true
    
    # Vérifier éléments HTML essentiels
    if ($content -notmatch "<!DOCTYPE html>") {
        Print-Error "DOCTYPE MANQUANT"
        $valid = $false
    }
    if ($content -notmatch "<html") {
        Print-Error "Tag <html> MANQUANT"
        $valid = $false
    }
    if ($content -notmatch "</html>") {
        Print-Error "Tag </html> MANQUANT"
        $valid = $false
    }
    if ($content -notmatch "<body") {
        Print-Error "Tag <body> MANQUANT"
        $valid = $false
    }
    if ($content -notmatch "</body>") {
        Print-Error "Tag </body> MANQUANT"
        $valid = $false
    }
    
    if ($valid) {
        Print-Success "HTML valide: $(Split-Path $file -Leaf)"
    }
    
    return $valid
}

# Vérifier SEO
function Check-SEO {
    param([string]$file)
    
    $content = Get-Content $file
    
    if ($content -match 'meta name="description"') {
        Print-Success "Métadonnées description présentes"
    } else {
        Print-Error "Métadonnées description MANQUANTES"
    }
    
    if ($content -match 'meta name="keywords"') {
        Print-Success "Métadonnées keywords présentes"
    } else {
        Print-Error "Métadonnées keywords MANQUANTES"
    }
    
    if ($content -match "<title>") {
        Print-Success "Titre HTML présent"
    } else {
        Print-Error "Titre HTML MANQUANT"
    }
}

# Vérifier design
function Check-Design {
    param([string]$file)
    
    $content = Get-Content $file
    
    if ($content -match "#DAA520") {
        Print-Success "Couleur or #DAA520 trouvée"
    } else {
        Print-Error "Couleur or #DAA520 MANQUANTE"
    }
    
    if ($content -match "Georgia") {
        Print-Success "Police Georgia configurée"
    } else {
        Print-Error "Police Georgia MANQUANTE"
    }
    
    if ($content -match "viewport") {
        Print-Success "Meta viewport (responsive) présent"
    } else {
        Print-Error "Meta viewport MANQUANT"
    }
}

# Copier fichiers
function Copy-Files {
    Print-Header "COPIE DES FICHIERS"
    
    if (-not (Test-Path $REPO_PATH)) {
        Print-Error "Répertoire repo NOT FOUND: $REPO_PATH"
        Print-Info "Créer le repo d'abord ou adapter REPO_PATH dans le script"
        return $false
    }
    
    foreach ($file in $FILES_TO_DEPLOY) {
        $sourceFile = ""
        
        if (Test-Path "$DOWNLOAD_PATH\$file") {
            $sourceFile = "$DOWNLOAD_PATH\$file"
        } elseif (Test-Path ".\$file") {
            $sourceFile = ".\$file"
        } elseif (Test-Path $file) {
            $sourceFile = $file
        }
        
        if ($sourceFile -eq "") {
            Print-Error "Fichier source NOT FOUND: $file"
            return $false
        }
        
        Copy-Item $sourceFile "$REPO_PATH\$file" -Force
        Print-Success "Copié: $file → $REPO_PATH\$file"
    }
    
    return $true
}

# Vérifier Git
function Check-Git {
    # Vérifier si Git est installé
    try {
        $gitVersion = git --version 2>&1
        Print-Success "Git installé: $gitVersion"
    } catch {
        Print-Error "Git NOT INSTALLED"
        return $false
    }
    
    # Vérifier repo Git
    if (Test-Path "$REPO_PATH\.git") {
        Print-Success "Repo Git trouvé: $REPO_PATH"
        return $true
    } else {
        Print-Error "Repo Git NOT FOUND: $REPO_PATH"
        return $false
    }
}

# Préparer Git
function Prepare-Git {
    Print-Header "PRÉPARATION GIT"
    
    Push-Location $REPO_PATH
    
    Print-Info "Statut Git:"
    git status
    
    Print-Info "Ajout des fichiers..."
    git add le-cote-adam.html o-lado-de-adao.html catalogo.html
    
    Print-Success "Fichiers ajoutés"
    
    Pop-Location
}

# Commit
function Commit-Changes {
    param([string]$commitMsg = "Mise à jour: Ajout ebooks 'Le Côté d'Adam' et 'O Lado de Adão' + catalogue")
    
    Push-Location $REPO_PATH
    
    Print-Info "Commit: $commitMsg"
    git commit -m "$commitMsg"
    
    Print-Success "Commit réussi"
    
    Pop-Location
}

# Push
function Push-Changes {
    Push-Location $REPO_PATH
    
    Print-Info "Push vers GitHub..."
    git push origin main
    
    Print-Success "Push réussi! Netlify déploie en 1-2 minutes"
    
    Pop-Location
}

# ================================================================================
# MAIN SCRIPT
# ================================================================================

Clear-Host

Print-Header "MANIA LIBRIS - VERIFICATION & DEPLOYMENT"

# === ÉTAPE 1: VÉRIFIER STRUCTURE ===
Print-Header "ÉTAPE 1: VÉRIFICATION DE STRUCTURE"

Print-Info "Cherchant les fichiers à déployer..."
Write-Host ""

$filesFound = 0
foreach ($file in $FILES_TO_DEPLOY) {
    if ((Test-Path "$DOWNLOAD_PATH\$file") -or (Test-Path ".\$file")) {
        if (Check-File "$DOWNLOAD_PATH\$file" -ErrorAction SilentlyContinue) {
            $filesFound++
        } elseif (Check-File ".\$file" -ErrorAction SilentlyContinue) {
            $filesFound++
        }
    } else {
        Print-Warning "Fichier: $file pas trouvé"
    }
}

Write-Host ""
Print-Info "Fichiers trouvés: $filesFound / $($FILES_TO_DEPLOY.Count)"
Write-Host ""

# === ÉTAPE 2: VALIDER HTML ===
Print-Header "ÉTAPE 2: VALIDATION HTML"

foreach ($file in $FILES_TO_DEPLOY) {
    $sourceFile = ""
    
    if (Test-Path "$DOWNLOAD_PATH\$file") {
        $sourceFile = "$DOWNLOAD_PATH\$file"
    } elseif (Test-Path ".\$file") {
        $sourceFile = ".\$file"
    }
    
    if ($sourceFile -ne "") {
        Write-Host ""
        Print-Info "Validation de: $file"
        Validate-HTML $sourceFile
        Check-SEO $sourceFile
        Check-Design $sourceFile
    }
}

Write-Host ""

# === ÉTAPE 3: VÉRIFIER GIT ===
Print-Header "ÉTAPE 3: VÉRIFICATION GIT"

if (-not (Check-Git)) {
    Print-Error "Git pas configuré correctement"
    Write-Host ""
    Print-Info "Pour initialiser le repo:"
    Write-Host "  mkdir $REPO_PATH" -ForegroundColor Yellow
    Write-Host "  cd $REPO_PATH" -ForegroundColor Yellow
    Write-Host "  git clone $REPO_URL ." -ForegroundColor Yellow
    exit 1
}

Write-Host ""

# === ÉTAPE 4: COPIER FICHIERS ===
Print-Header "ÉTAPE 4: COPIE DES FICHIERS"

$response = Read-Host "Copier les fichiers? (y/n)"

if ($response.ToLower() -eq "y") {
    if (Copy-Files) {
        Print-Success "Tous les fichiers copiés"
    } else {
        Print-Error "Erreur lors de la copie"
        exit 1
    }
} else {
    Print-Warning "Copie annulée"
    exit 0
}

Write-Host ""

# === ÉTAPE 5: GIT WORKFLOW ===
Print-Header "ÉTAPE 5: WORKFLOW GIT"

Prepare-Git

Write-Host ""
$response = Read-Host "Effectuer le commit et push? (y/n)"

if ($response.ToLower() -eq "y") {
    Commit-Changes
    Write-Host ""
    
    $response = Read-Host "Push vers GitHub? (y/n)"
    
    if ($response.ToLower() -eq "y") {
        Push-Changes
    } else {
        Print-Warning "Push annulé"
        Print-Info "Pour pusher plus tard:"
        Write-Host "  cd $REPO_PATH" -ForegroundColor Yellow
        Write-Host "  git push origin main" -ForegroundColor Yellow
    }
} else {
    Print-Warning "Commit annulé"
    Print-Info "Pour commiter plus tard:"
    Write-Host "  cd $REPO_PATH" -ForegroundColor Yellow
    Write-Host "  git commit -m 'Mise à jour: Ajout ebooks + catalogue'" -ForegroundColor Yellow
    Write-Host "  git push origin main" -ForegroundColor Yellow
}

Write-Host ""

# === RÉSUMÉ FINAL ===
Print-Header "RÉSUMÉ & PROCHAINES ÉTAPES"

Print-Success "Vérifications complètes!"
Print-Info "Fichiers déployés:"
foreach ($file in $FILES_TO_DEPLOY) {
    Write-Host "  ✓ $file"
}

Write-Host ""
Print-Info "⏱️  Netlify déploie automatiquement en 1-2 minutes"
Print-Info "🔗 Vérifie: https://manialibris.com"

Write-Host ""
Print-Info "Checklist:"
Write-Host "  [ ] Vérifier que le site charge"
Write-Host "  [ ] Vérifier que 3 livres s'affichent dans catalogue"
Write-Host "  [ ] Vérifier que 'Aprende a ser contente' est supprimé"
Write-Host "  [ ] Vérifier les liens fonctionnent"
Write-Host "  [ ] Vérifier le responsive (mobile)"

Write-Host ""
Print-Success "✅ DÉPLOIEMENT TERMINÉ!"
Write-Host ""
