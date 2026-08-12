# 🚀 GUIDE DE MISE À JOUR - CORRECTION LIENS AMAZON
## Mise à jour de 12 fichiers HTML avec les ASIN Amazon corrects (BR et FR)

---

## 📦 FICHIERS FOURNIS

Vous avez reçu 5 fichiers essentiels :

1. ✅ **DEPLOY_MANIALIBRIS.bat** - Script automatique de déploiement
2. ✅ **GUIDE_INSTALLATION.md** - Guide détaillé complet (ce fichier)
3. ✅ **GUIDE_RAPIDE_CMD.md** - Commandes CMD rapides
4. ✅ **CHECKLIST_VERIFICATION.md** - Checklist de vérification
5. ✅ **README_FICHIERS_HTML.md** - Liste des 12 fichiers HTML à préparer

**IMPORTANT :** Vous devez avoir vos 12 fichiers HTML avec les liens Amazon corrigés dans le même dossier que ce guide !

---

## 📋 LES 12 FICHIERS HTML À DÉPLOYER

### Pages des Livres en Portugais (Amazon BR)
1. **tua-vontade.html** - Tua Vontade (ASIN: B0FY3TR5MD)
2. **o-lado-de-adao.html** - O Lado de Adão (ASIN: B0G1HNZQKH)
3. **aprendi-a-estar-contente.html** - Aprendi a Estar Contente (ASIN: B0G1L1VTW5)

### Pages des Livres en Français (Amazon FR)
4. **ta-volonte.html** - Ta Volonté (ASIN: B0FY3ZT7P5)
5. **le-cote-d-adam.html** - Le Côté d'Adam (ASIN: B0G1HP942H)
6. **jai-appris-a-etre-content.html** - J'ai Appris à Être Content (ASIN: B0G1L1VTW5)

### Pages Principales
7. **index.html** - Page d'accueil portugais
8. **index-fr.html** - Page d'accueil français
9. **catalogo.html** - Catalogue portugais
10. **catalogue-fr.html** - Catalogue français
11. **recursos.html** - Ressources portugais
12. **ressources.html** - Ressources français

---

## 🎯 MÉTHODE RAPIDE (Recommandée)

### Étape 1 : Préparer le Dossier de Staging

**Dossier cible :**
```cmd
C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\
```

**Actions :**
1. Créez ce dossier s'il n'existe pas
2. Videz-le complètement
3. Copiez-y tous les fichiers :
   - Les 12 fichiers HTML avec liens Amazon corrigés
   - DEPLOY_MANIALIBRIS.bat
   - Les 4 guides .md

### Étape 2 : Vérifier le Contenu

Ouvrez CMD et vérifiez :

```cmd
cd "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris"
dir *.html
dir *.bat
```

Vous devez voir :
- ✅ 12 fichiers .html
- ✅ 1 fichier .bat (DEPLOY_MANIALIBRIS.bat)
- ✅ 4 fichiers .md (guides)

### Étape 3 : Exécuter le Script

Dans la même fenêtre CMD :

```cmd
DEPLOY_MANIALIBRIS.bat
```

**Le script va automatiquement :**
1. ✅ Vérifier/cloner le repository GitHub
2. ✅ Copier les 12 fichiers HTML
3. ✅ Créer un backup horodaté
4. ✅ Afficher les modifications (git status)
5. ✅ Montrer un résumé des changements (git diff --stat)
6. ✅ Demander confirmation avant de déployer
7. ✅ Pusher sur GitHub si vous confirmez

### Étape 4 : Confirmer le Déploiement

Le script affichera :
```
ATTENTION : Vous allez deployer sur GitHub

CE QUI SERA MIS A JOUR :
  - 12 fichiers HTML avec liens Amazon corriges
  - Amazon BR (Portugais) : B0FY3TR5MD, B0G1HNZQKH, B0G1L1VTW5
  - Amazon FR (Francais)  : B0FY3ZT7P5, B0G1HP942H, B0G1L1VTW5

Voulez-vous continuer ? (O/N)
>
```

- **Tapez O** pour confirmer et déployer
- **Tapez N** pour annuler (vos fichiers seront sauvegardés localement)

### Étape 5 : Vérifier le Déploiement

Après le push GitHub (attendre 1-2 minutes) :

**1. GitHub (immédiat) :**
```
https://github.com/global-opera/manialibris-website/commits/main
```
Vous devriez voir un nouveau commit : "Correction des liens Amazon - Tous les ASIN corriges pour BR et FR"

**2. Netlify (1-2 minutes) :**
```
https://app.netlify.com
```
Attendez que le status soit "Published"

**3. Site Live (2-3 minutes total) :**

Testez tous les boutons Amazon sur :

**Pages Portugaises :**
- https://manialibris.com/tua-vontade.html
- https://manialibris.com/o-lado-de-adao.html
- https://manialibris.com/aprendi-a-estar-contente.html

**Pages Françaises :**
- https://manialibris.com/ta-volonte.html
- https://manialibris.com/le-cote-d-adam.html
- https://manialibris.com/jai-appris-a-etre-content.html

**Pages Principales :**
- https://manialibris.com/
- https://manialibris.com/index-fr.html
- https://manialibris.com/catalogo.html
- https://manialibris.com/catalogue-fr.html
- https://manialibris.com/recursos.html
- https://manialibris.com/ressources.html

---

## 🔧 MÉTHODE MANUELLE (Si le script ne fonctionne pas)

### Prérequis
- Git installé : https://git-scm.com/download/win
- Repository local cloné

### Étape 1 : Préparer le Repository

```cmd
cd C:\Users\Stéphane CASSANI\Documents

REM Si le repo n'existe pas encore
git clone https://github.com/global-opera/manialibris-website.git

REM Si le repo existe déjà
cd manialibris-website
git pull origin main
```

### Étape 2 : Copier les 12 Fichiers HTML

```cmd
cd C:\Users\Stéphane CASSANI\Documents\manialibris-website

REM Copier chaque fichier depuis le dossier de staging
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\tua-vontade.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\ta-volonte.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\o-lado-de-adao.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\le-cote-d-adam.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\aprendi-a-estar-contente.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\jai-appris-a-etre-content.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\index.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\index-fr.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\catalogo.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\catalogue-fr.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\recursos.html" .
copy "C:\Users\Stéphane CASSANI\Downloads\1-Mise à jour Site manialibris\ressources.html" .
```

### Étape 3 : Créer un Backup

```cmd
mkdir backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%
copy *.html backup_%date:~-4,4%%date:~-7,2%%date:~-10,2%\
```

### Étape 4 : Vérifier et Déployer

```cmd
REM Voir les modifications
git status
git diff --stat

REM Configurer Git (si première fois)
git config --global user.name "Stephane Cassani"
git config --global user.email "info@manialibris.com"

REM Committer et pusher
git add .
git commit -m "Correction des liens Amazon - Tous les ASIN corriges pour BR et FR"
git push origin main
```

---

## ✅ CHECKLIST FINALE

Avant de déployer, vérifiez :

- [ ] Les 12 fichiers HTML sont dans le dossier de staging
- [ ] Le script DEPLOY_MANIALIBRIS.bat est présent
- [ ] Git est installé et configuré (nom et email)
- [ ] Vous avez vérifié les liens Amazon dans chaque fichier HTML
- [ ] Backup créé automatiquement par le script
- [ ] git status vérifié avant confirmation
- [ ] Confirmation donnée pour le push
- [ ] Push réussi vers GitHub
- [ ] Netlify déploie avec succès (status "Published")
- [ ] Tous les boutons Amazon testés et fonctionnels

---

## 🆘 DÉPANNAGE

### Le script dit "Git n'est pas reconnu"

➡️ **Solution :** Git n'est pas installé

```cmd
REM Téléchargez et installez Git
https://git-scm.com/download/win

REM Puis relancez le script
```

### Le script dit "Author identity unknown"

➡️ **Solution :** Configurez votre identité Git

```cmd
git config --global user.name "Stephane Cassani"
git config --global user.email "info@manialibris.com"
```

### Git refuse le push

➡️ **Solution :** Authentification nécessaire

Le navigateur va s'ouvrir automatiquement pour l'authentification GitHub.
Connectez-vous et autorisez l'accès.

### Warnings "LF will be replaced by CRLF"

➡️ **Info :** Ce sont des warnings normaux sur Windows, pas des erreurs.
Git convertit automatiquement les fins de ligne. Vous pouvez ignorer ces messages.

### Le site ne se met pas à jour immédiatement

➡️ **Solution :** Attendre 2-3 minutes

1. GitHub reçoit le push (immédiat)
2. Netlify détecte le changement (30 secondes)
3. Netlify build et déploie (1-2 minutes)
4. Site mis à jour (total : 2-3 minutes)

Vérifiez le status sur : https://app.netlify.com

### Un fichier HTML n'est pas trouvé par le script

➡️ **Solution :** Vérifier le nom du fichier

Le script affichera `[SKIP] fichier.html non trouve` pour chaque fichier manquant.

Vérifiez que :
1. Le fichier existe dans le dossier de staging
2. Le nom est exactement comme attendu (minuscules, tirets, pas d'espaces)
3. L'extension est bien .html

---

## 📞 SUPPORT

Si vous rencontrez des problèmes :

1. Copiez le message d'erreur exact
2. Notez ce que vous avez déjà essayé
3. Vérifiez la section Dépannage ci-dessus
4. Revenez dans Claude avec ces informations

---

## ✨ RÉSULTAT FINAL

Une fois terminé, votre site aura :

✅ **12 fichiers HTML mis à jour** avec les liens Amazon corrects
✅ **Amazon BR (Portugais)** pointant vers amazon.com.br
   - Tua Vontade : B0FY3TR5MD
   - O Lado de Adão : B0G1HNZQKH
   - Aprendi a Estar Contente : B0G1L1VTW5
✅ **Amazon FR (Français)** pointant vers amazon.fr
   - Ta Volonté : B0FY3ZT7P5
   - Le Côté d'Adam : B0G1HP942H
   - J'ai Appris à Être Content : B0G1L1VTW5
✅ **Navigation cohérente** sur toutes les pages
✅ **Design or/noir** préservé (#DAA520 / #000000)
✅ **Déploiement automatique** Netlify actif

**Félicitations !** 🎉

Tous vos visiteurs auront maintenant accès aux bons livres Amazon !

---

## 🌍 VÉRIFICATION DES LIENS AMAZON

Après déploiement, testez manuellement ces liens sur votre site :

### Amazon BR (Portugais)
- https://www.amazon.com.br/dp/B0FY3TR5MD (Tua Vontade)
- https://www.amazon.com.br/dp/B0G1HNZQKH (O Lado de Adão)
- https://www.amazon.com.br/dp/B0G1L1VTW5 (Aprendi a Estar Contente)

### Amazon FR (Français)
- https://www.amazon.fr/dp/B0FY3ZT7P5 (Ta Volonté)
- https://www.amazon.fr/dp/B0G1HP942H (Le Côté d'Adam)
- https://www.amazon.fr/dp/B0G1L1VTW5 (J'ai Appris à Être Content)

---

**Version du Guide :** 2.0 - Correction Liens Amazon  
**Date :** Novembre 2025  
**Auteur :** Claude pour Mania Libris
