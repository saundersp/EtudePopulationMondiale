# Étude de l'évolution de la population mondiale

*2019 Pierre Saunders @saundersp*

## Intitulée

Il est bien connu que la population mondiale compte désormais plus de sept milliards et demi d’individus et qu’elle est en augmentation constante.
Par contre, on dit que la population européenne n’augment que très légèrement au fil des années et qu’elle de plus en plus âgée.
Afin de vérifier ces deux affirmations, nous allons utiliser la base donnée qui se trouve [ici](https://www.kaggle.com/theworldbank/global-population-estimates).
Il s’agira d’utiliser les données dans la plage 1960-2010 pour calculer la moyenne et variance des variables aléatoires qui nous intéressent.
Puis on utilisera les données de 2011 à 2017 comme ́échantillon pour la vérification des hypothèses.
On utilisera la même technique d’exploitation des séries temporelles pour ́étudier la proportion de population âgée de plus de 65 ans par rapport au reste de la population.
En prenant les données qui se trouvent [ici](https://www.insee.fr/fr/statistiques/2387502), fournies par l’INSEE, est-ce que l'on peut ́établir une corrélation entre le niveau de dépenses de santé et le vieillissement de la population ?

### Hypothèses

1. Corrélation positive entre l'année et la population mondiale
2. Moyenne population européenne de $[1960, 2010]$ < Moyenne population européenne de $[2011, 2017]$
3. Croissance mondiale de $[1960, 2010]$ > Croissance européenne de $[2011, 2017]$
4. Proportion de personne européenne âgée de plus de 65 ans en $[1960, 2010]$ < Proportion de personne européenne âgée de plus de 65 ans en $[2011, 2017]$
5. Corrélation entre l'espérance de vie et la dépense de santé courante (INSEE) en Europe

Toutes les hypothèses seront testées avec un niveau de signification $\alpha = 0.05$

## Resources utilisées

### Datasets

- Global Population estimates - [lien](https://www.kaggle.com/theworldbank/global-population-estimates)

_contenu_

```r
archive.zip
   -> data.csv
   -> definitions_and_sources.csv
```

Le fichier __data.csv__ a été convertie au format xlsx, les watermarks ont été supprimées,  puis le fichier a été renommé en __estim.xlsx__ et placé dans le dossier __converted__.

- Dépense courante de santé dans les pays de l'OCDE - [lien](https://www.insee.fr/fr/statistiques/2387502)

_contenu_

```r
cond-sante-dep-courante-monde.xls
```

Nous avons retiré les watermarks du fichier __cond-sante-dep-courante-monde.xls__, nous l'avons renommée en __depcours.xls__ et placé dans le dossier __converted__.

### Librairies

- Documentation [tidyverse](https://www.tidyverse.org/)

```r
install.packages("tidyverse")
```

ou

- Documentation [readxl](https://readxl.tidyverse.org/)

```r
install.packages("readxl")
```

- Documentation [ggplot2](https://ggplot2.tidyverse.org/reference/)

```r
install.packages("ggplot2")
```

- Documentation [gridExtra](https://cran.r-project.org/web/packages/gridExtra/vignettes/arrangeGrob.html)

```r
install.packages("gridExtra")
```

*2019 Pierre Saunders @saundersp*