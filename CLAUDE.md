# Cooklang Recipes

Collection de recettes au format Cooklang.

## Convention pour les recettes

### Nom du fichier

Utiliser un slug en minuscules avec tirets :

- `pate-a-crepes.cook`
- `mac-and-cheese.cook`

Ne pas mettre "recette" dans le nom.

### Métadonnées obligatoires

Chaque recette doit commencer par un bloc YAML :

```yaml
---
title: Titre lisible de la recette
description: Courte description ou accroche de la recette
servings: X
time: durée (ex: "30 minutes", "1h30m")
source.url: URL de la source
---
```

### Étapes

- Garder **exactement le même nombre d'étapes** que la recette source
- Une ligne vide entre chaque étape

### Notes et astuces

Pour les notes **visibles** (astuces, variantes), utiliser le format blockquote :

```
> Astuce : ajouter du beurre fondu évite de graisser la poêle
```

Pour les commentaires **cachés** (non affichés), utiliser :

```
-- Ceci est un commentaire caché
```

### Ingrédients et ustensiles

- `@ingrédient{quantité%unité}` : ingrédient avec quantité
- `@ingrédient{quantité}` : ingrédient avec quantité sans unité (ex: `@oeufs{4}`)
- `#ustensile{}` : ustensile de cuisine
- `~{durée%unité}` : temps de cuisson/préparation

### Images

Placer l'image avec le même nom que le fichier `.cook` :

Exemple : `pate-a-crepes.cook` → `pate-a-crepes.jpg`

## Structure du projet

```
.
├── bin/run-cli          # Script wrapper pour le CLI
├── docker-compose.yml   # Serveur web (port 9080)
├── Dockerfile           # Image Docker pour le CLI
├── recipes/             # Fichiers de recettes .cook
└── README.md
```
