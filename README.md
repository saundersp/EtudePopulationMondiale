# Étude de l'évolution de la population mondiale

_Read this in other languages: [English](README.uk.md)_

## Intitulée

Il est bien connu que la population mondiale compte désormais plus de sept milliards et demi d’individus et qu’elle est en augmentation constante.
Par contre, on dit que la population européenne n’augmente que très légèrement au fil des années et qu’elle de plus en plus âgée.
Afin de vérifier ces deux affirmations, nous allons utiliser la base donnée qui se trouve [ici](https://www.kaggle.com/theworldbank/global-population-estimates).
Il s’agira d’utiliser les données dans la plage 1960-2010 pour calculer la moyenne et variance des variables aléatoires qui nous intéressent.
Puis on utilisera les données de 2011 à 2017 comme ́échantillon pour la vérification des hypothèses.
On utilisera la même technique d’exploitation des séries temporelles pour ́étudier la proportion de population âgée de plus de 65 ans par rapport au reste de la population.
En prenant les données qui se trouvent [ici](https://www.insee.fr/fr/statistiques/2387502), fournies par l’INSEE, est-ce que l'on peut ́établir une corrélation entre le niveau de dépenses de santé et le vieillissement de la population ?

### Hypothèses

1. Corrélation positive entre l'année et la population mondiale.
2. Moyenne population européenne de [1960, 2010] < Moyenne population européenne de [2011, 2017].
3. Croissance mondiale de [1960, 2010] > Croissance européenne de [2011, 2017].
4. Proportion de personne européenne âgée de plus de 65 ans en [1960, 2010] < Proportion de personne européenne âgée de plus de 65 ans en [2011, 2017].
5. Corrélation entre l'espérance de vie et la dépense de santé courante (INSEE) en Europe.

Toutes les hypothèses seront testées avec un niveau de signification α = 0.05

## Ressources utilisées

Toutes les ressources sont téléchargées et extraient dans le dossier _data_.

### Sets de données

- Global Population estimates - [lien](https://www.kaggle.com/theworldbank/global-population-estimates)

_contenu_

> archive.zip
>
> > data.csv
> > definitions_and_sources.csv

- Dépense courante de santé dans les pays de l'OCDE - [lien](https://www.insee.fr/fr/statistiques/2387502)

### Librairies

- Documentation [tidyverse](https://www.tidyverse.org/)

ou

- Documentation [readxl](https://readxl.tidyverse.org/)
- Documentation [ggplot2](https://ggplot2.tidyverse.org/reference/)
- Documentation [gridExtra](https://cran.r-project.org/web/packages/gridExtra/vignettes/arrangeGrob.html)

## Utilisation

Testée avec

- Python 3.9.4
- R x64 4.0.5

Les exécutables python, pip et Rscript doivent être accessible depuis le PATH !

### Installation

#### Classique

```bash
pip install -r requirements.txt
Rscript -e 'install.packages("IRkernel", repos = "http://cran.us.r-project.org");library(IRkernel);IRkernel::installspec()'
jupyter lab
```

#### Portable

```bash
./helper.sh install
./helper.sh kernel
./helper.sh launch
```

_2019 Pierre Saunders @saundersp_
