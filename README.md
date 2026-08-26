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

### Mise à jour automatique

Le fetch doit passer par HTTPS : cron n'a pas d'agent SSH, une origine en `git@github.com:` échoue avec `Permission denied (publickey)`. Régler les URL une fois pour toutes, en gardant SSH pour le push :

```bash
cd /chemin/vers/cooklang-recipes
git remote set-url origin https://github.com/AxineTeam/cooklang-recipes.git
git remote set-url --push origin git@github.com:AxineTeam/cooklang-recipes.git
```

Puis ouvrir le crontab :

```bash
crontab -e
```

Et y ajouter cette ligne, qui fait un `git pull` toutes les 15 minutes et consigne le résultat :

```
*/15 * * * * (date; cd /chemin/vers/cooklang-recipes && git pull origin master) >> /tmp/cooklang-pull.log 2>&1
```

Suivre les exécutions : `tail -f /tmp/cooklang-pull.log`. Retirer la tâche : `crontab -e`, puis supprimer la ligne.

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
