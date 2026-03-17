# GRAAL - Graph-based Research with Agents for Automatic Labelling

Classification automatique dans des nomenclatures statistiques par approche agentique.

## 🚀 Déploiement GitHub Pages

Ce repository contient un site web généré avec Quarto qui peut être déployé automatiquement sur GitHub Pages.

### Configuration requise

1. **Activer GitHub Pages** dans les paramètres du repository :
   - Aller dans Settings → Pages
   - Sélectionner "GitHub Actions" comme source

2. **Mettre à jour l'URL du site** dans `_quarto.yaml` :
   ```yaml
   site-url: "https://[YOUR-USERNAME].github.io/GRAAL"
   ```

### Déploiement automatique

Le workflow GitHub Actions (`deploy-website.yml`) se déclenche automatiquement à chaque push sur la branche `main` et :

1. Installe Quarto et Python
2. Installe les dépendances Python nécessaires
3. Rend tous les documents Quarto (`.qmd`)
4. Déploie le site généré sur GitHub Pages

### Développement local

Pour travailler localement sur le site :

```bash
# Installer Quarto (si pas déjà fait)
# https://quarto.org/docs/get-started/

# Installer les dépendances Python
pip install jupyter pyyaml plotly pandas numpy umap-learn pacmap scikit-learn polars s3fs python-dotenv

# Prévisualiser le site
quarto preview

# Rendre le site
quarto render
```

## 📁 Structure du projet

```
GRAAL/
├── index.qmd              # Page d'accueil
├── explorations.qmd       # Analyse interactive des embeddings
├── presentation/          # Présentation du projet
│   ├── presentation.qmd
│   └── _quarto.yaml
├── _quarto.yaml          # Configuration Quarto principale
├── docs/                 # Site généré (output-dir)
└── .github/workflows/    # Workflows GitHub Actions
    └── deploy-website.yml
```

## 🔧 Personnalisation

### Ajouter une nouvelle page

1. Créer un fichier `.qmd` à la racine
2. L'ajouter à la liste `render` dans `_quarto.yaml`
3. L'ajouter à la navbar dans `_quarto.yaml`

### Modifier le thème

Le thème est configuré dans `_quarto.yaml` :
```yaml
format:
  html:
    theme: cosmo  # Changer pour d'autres thèmes Bootswatch
```

## 📊 Contenu

- **Accueil** : Présentation générale du projet GRAAL
- **Explorations** : Analyse interactive des embeddings NACE avec visualisations k-NN
- **Présentation** : Document détaillé sur la méthodologie et les résultats

## 🛠 Technologies

- **Quarto** : Génération de documents scientifiques
- **Python** : Analyses et visualisations
- **Plotly** : Graphiques interactifs
- **Neo4j** : Base de données graphe
- **GitHub Pages** : Hébergement gratuit

## 📄 Licence

Ce projet est sous licence MIT.