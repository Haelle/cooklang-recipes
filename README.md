# Cooklang Recipes

Collection de recettes au format [Cooklang](https://cooklang.org/).

## Prérequis

- Docker

## Utilisation

### Serveur web

Lancer le serveur web pour parcourir les recettes :

```bash
docker compose up -d
```

L'interface est accessible sur http://localhost:9080

Arrêter le serveur :

```bash
docker compose down
```

### CLI

Utiliser le CLI pour diverses opérations :

```bash
./bin/run-cli --help
./bin/run-cli recipe read ma-recette.cook
./bin/run-cli shopping-list *.cook
```

Note : la première exécution du CLI construira l'image Docker (compilation Rust).

## Structure

```
.
├── bin/run-cli          # Script wrapper pour le CLI
├── docker-compose.yml   # Configuration du serveur web
├── Dockerfile           # Image Docker pour le CLI
└── *.cook               # Fichiers de recettes
```

## Format Cooklang

Exemple de recette :

```
Faire revenir les @oignons{2} émincés dans une @huile d'olive{2%cuillères à soupe}.

Ajouter le @poulet{500%g} coupé en morceaux et faire dorer ~{10%minutes}.

Servir avec du @riz{200%g} cuit.
```

- `@ingrédient{quantité%unité}` : ingrédient avec quantité
- `#ustensile{}` : ustensile de cuisine
- `~{durée}` : temps de cuisson/préparation

Documentation complète : https://cooklang.org/docs/
