# Cooklang Recipes

Collection de recettes au format Cooklang.

## Recherche de recettes sur internet

Privilégier les sites de passionnés qui partagent leurs propres recettes (blogs personnels, pages individuelles) plutôt que les gros agrégateurs avec des milliers de recettes (Marmiton, HelloFresh, Old El Paso, 750g, etc.). Chercher des recettes « authentiques » portées par une personne.

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

Reprendre les tags **directement depuis la source** (frije, etc.), séparés par des virgules.

**Règles :**
- Ne **jamais inventer** de tags
- Ne pas ajouter "végétarien" ou autre tag si non présent sur la source
- Si un tag semble incorrect sur frije, ne pas le reprendre

### Étapes

- Garder **exactement le même nombre d'étapes** que la recette source
- **Conserver la formulation originale MOT POUR MOT** : ne pas reformuler, réécrire ou "améliorer" le texte des étapes
- **Garder toutes les parenthèses** : "(selon les goûts)", "(facultatif)", "(à surveiller avec attention !)" etc.
- **Garder les emojis** : ":D", etc. si présents dans la source
- Une ligne vide entre chaque étape
- Les bonus/astuces d'une étape (ex: macération optionnelle) = étape séparée dans la même section

### Style d'écriture

Les règles ci-dessus valent pour une recette **importée telle quelle**. Dès qu'une recette est **adaptée** (ajouts, modifications demandées) ou écrite de zéro, elle suit le style du dépôt, décrit ci-dessous. Ce style est entièrement décrit ici : pas besoin d'aller lire d'autres recettes pour le deviner.

**Ton et grammaire**
- Verbes à l'**infinitif** : « Faire dorer », « Cuire », « Ciseler », « Réhydrater », « Mélanger ». Jamais « Faites dorer », jamais de « vous »
- Pas de point final à la fin d'une étape
- Pas de numérotation : une étape = un paragraphe, séparé du suivant par une ligne vide
- Pas de titre d'étape en gras, la section `== ... ==` suffit

**Longueur**
- Une étape tient sur une à deux lignes
- Les gestes liés se chaînent dans la même étape avec une virgule ou un point-virgule, plutôt que d'être éclatés : « Réhydrater le @wakamé séché{10%g} ~{10%minutes} dans l'eau froide, égoutter et presser »
- Une recette adaptée dépasse rarement 40 lignes
- Dans le doute, couper

**Ce qu'on écrit**
- Le geste, et le repère qui dit qu'il est réussi : « jusqu'à ce que l'eau soit claire », « elles doivent rester fermes (koshi) », « il doit avoir pris une teinte grillée »
- Les précisions utiles entre parenthèses : « (facultatif) », « (au choix) », « (simple ou au kombu) »

**Ce qu'on n'écrit pas**
- Les justifications, le pourquoi de la technique : ça part en note si ça vaut le coup, sinon ça saute
- Les évidences : « bien mélanger », « réserver » sans raison, un préchauffage sans température
- Les temps et températures inventés : soit ils viennent de la source, soit ils ne sont pas dans la recette

**Notes**
- 2 ou 3 au maximum, une phrase chacune
- Elles servent à trois choses : un écueil à éviter, une substitution d'ingrédient, une variante
- Les ingrédients cités dans une note prennent la syntaxe `@ingrédient{}`

### Notes et astuces

**Option 1 : Section Notes (recommandé)**

Créer une section dédiée en fin de recette :

```
== Notes ==

Astuce ou variante ici.
```

**Important** :
- Conserver le texte **exact** des notes de la source, ne jamais reformuler
- Si les notes/variantes mentionnent des ingrédients, les mettre en `@ingrédient{quantité%unité}`

**Option 2 : Blockquote inline**

Pour les notes **visibles** dans le corps de la recette :

```
> Astuce : ajouter du beurre fondu évite de graisser la poêle
```

**Commentaires cachés**

Pour les commentaires **non affichés** :

```
-- Ceci est un commentaire caché
```

Note : le champ `description` ne supporte pas le multiligne.

### Ingrédients

- `@ingrédient{quantité%unité}` : ingrédient avec quantité
- `@ingrédient{quantité}` : ingrédient avec quantité sans unité (ex: `@oeufs{4}`)
- `~{durée%unité}` : temps de cuisson/préparation

Nommer les ingrédients **court** : `@wasabi{}` plutôt que `@pâte de wasabi{}`, `@sésame grillé{}` plutôt que `@graines de sésame blanc{}`. Garder un nom long seulement quand il apporte une indication utile à l'achat ou à la préparation : `@dashi en poudre{}`, `@filet mignon de porc{}`, `@wakamé séché{}`.

Ne pas utiliser la fonctionnalité ustensile (`#ustensile{}`).

### Sections

Les sections correspondent aux **groupes d'ingrédients** sur frije. Regarder comment les ingrédients sont organisés sur la source pour déterminer les sections.

```
== Sauce ==
```

**Règles :**
- Une section peut contenir **plusieurs étapes**
- Les bonus/astuces liés à une étape sont une **étape séparée** dans la même section
- La section `== Notes ==` est toujours **en fin de recette**
- La première étape peut être dans une section (pas obligatoirement avant)

**Créer une section si :**
- Elle correspond à un groupe d'ingrédients sur frije
- Elle regroupe **plusieurs ingrédients** (pas un seul)
- Elle a **au moins une étape** de préparation dédiée

**Exemples de sections :**
- Préparation : `== Oeufs ==`, `== Légumes ==`, `== Viandes ==`
- Composants : `== Sauce ==`, `== Semoule ==`, `== Bouillon ==`, `== Pâte ==`
- Étapes finales : `== Cuisson ==`, `== Service ==`, `== Finition ==`
- Toujours à la fin : `== Notes ==`, `== Variante ==`, `== Variantes ==`

### Images

Placer l'image avec le même nom que le fichier `.cook` :

Exemple : `pate-a-crepes.cook` → `pate-a-crepes.jpg`

**Récupération depuis frije :**

Les images frije suivent le pattern :
```
https://fr.frije.com/content/recipes/{ID}/800-1.jpg
```

Télécharger avec :
```bash
curl -f -o nom-recette.jpg "https://fr.frije.com/content/recipes/{ID}/800-1.jpg"
```

Note : toutes les recettes frije n'ont pas forcément d'image.

## Vérification après import

Après avoir importé des recettes, **toujours relire** chaque fichier créé et vérifier :

1. **Texte des étapes** : fidèle mot pour mot à la source
2. **Tags** : exactement ceux de frije, rien d'inventé
3. **Notes/astuces** : texte exact, avec `@ingrédient{}` si mentionnés
4. **Sections** : correspondent aux groupes d'ingrédients de frije
5. **Quantités des ingrédients** : toutes présentes (pas de `@ingrédient{}` vides)
6. **Source URL** : correcte si externe, vide + commentaire frije sinon
7. **Ingrédients complets** : re-vérifier contre la source que tous les ingrédients sont présents (le scraping peut en omettre, notamment sel, eau, ingrédients facultatifs)

**Erreurs fréquentes à éviter :**
- Reformuler les étapes ou notes (même légèrement !)
- Retirer des parenthèses ou commentaires entre parenthèses
- Remplacer des expressions par des synonymes ("pommes ça marche aussi" → "pommes acceptées" ❌)
- Inventer des tags
- Oublier des quantités d'ingrédients
- Oublier des ingrédients facultatifs
- Omettre des ingrédients "évidents" (sel, eau, poivre) mentionnés dans les étapes mais pas capturés par le scraping

## Structure du projet

```
.
├── bin/run-cli          # Script wrapper pour le CLI
├── docker-compose.yml   # Serveur web (port 9080)
├── Dockerfile           # Image Docker pour le CLI
├── recipes/             # Fichiers de recettes .cook
└── README.md
```
