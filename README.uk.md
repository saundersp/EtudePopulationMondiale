# Study on the evolution of the global population

_Read this in other languages: [Français](README.md)_

## Designation

It is well known that the world's population has grown to over seven and a half billion people and is constantly increasing.
On the other hand, it is said that the European population is increasing only slightly over the years and that it is getting older.
In order to verify these two statements, we will use the dataset [here](https://www.kaggle.com/theworldbank/global-population-estimates).
We will use the data in the range 1960-2010 to calculate the mean and variance of the random variables of interest.
Then we will use the data from 2011 to 2017 as a ́sample for hypothesis testing.
The same time series mining technique will be used to ́study the proportion of the population aged over 65 compared to the rest of the population.
Taking the data found [here](https://www.insee.fr/fr/statistiques/2387502), provided by INSEE, can we ́establish a correlation between the level of health expenditure and the ageing of the population ?

### Hypotheses

1. Positive correlation between year and world population.
2. Average European population of [1960, 2010] < Average European population of [2011, 2017].
3. World growth in [1960, 2010] > European growth in [2011, 2017].
4. Proportion of European person aged 65+ in [1960, 2010] < Proportion of European person aged 65+ in [2011, 2017].
5. Correlation between life expectancy and current health expenditure (INSEE) in Europe.

All hypotheses will be tested with a significance level of α = 0.05

## Resources used

All resources are downloaded and extracted to the _data_ folder.

### Datasets

- Global Population estimates - [lien](https://www.kaggle.com/theworldbank/global-population-estimates)

_content_

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

Tested with

- Python 3.9.4
- R x64 4.0.5

python, pip and Rscript executables must be accessible from the PATH !

### Installation

#### Classic

```bash
pip install -r requirements.txt
Rscript -e 'install.packages("IRkernel", repos = "http://cran.us.r-project.org");library(IRkernel);IRkernel::installspec()'
jupyter lab
```

#### Portable

```bash
./helper.sh install
./helper.sh launch
```

_2019 Pierre Saunders @saundersp_
