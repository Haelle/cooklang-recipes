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
source.url: URL de la source originale
tags: tag1, tag2
---
```

### Source et lien frije

- `source.url` : la **source originale** de la recette (blog, site culinaire, etc.)

**Cas possibles :**

1. **Recette frije d'un autre utilisateur** → `source.url` = lien frije
2. **Ta propre recette frije avec source externe** → `source.url` = source externe + commentaire frije au début des instructions
3. **Ta propre recette frije sans source** → `source.url` vide + commentaire frije au début des instructions

Format du commentaire frije :

```
-- frije : https://fr.frije.com/recipes/XXXXX
```

### Tags

Reprendre les tags **directement depuis la source** (frije, etc.), séparés par des virgules. Ne pas improviser de tags.

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

### Ingrédients

- `@ingrédient{quantité%unité}` : ingrédient avec quantité
- `@ingrédient{quantité}` : ingrédient avec quantité sans unité (ex: `@oeufs{4}`)
- `~{durée%unité}` : temps de cuisson/préparation

Ne pas utiliser la fonctionnalité ustensile (`#ustensile{}`).

### Sections

Utiliser les sections pour organiser les recettes quand c'est pertinent :

```
== Sauce ==
```

Créer une section si :
- Elle regroupe **plusieurs ingrédients** (pas un seul)
- Elle a **au moins une étape** de préparation dédiée
- Elle représente une partie distincte de la recette (sauce, accompagnement, garniture, etc.)

Exemples valides : `== Sauce ==`, `== Semoule ==`, `== Garniture ==`, `== Pâte ==`

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
