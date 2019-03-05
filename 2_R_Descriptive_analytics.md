Análisis Descriptivo con R
================

Parte 1 - Análisis descriptivo de los datos
===========================================

Vamos a realizar el análisis de un dataset

``` r
# Vamos a definir el directorio en el que trabajaremos
# Define el folder en el que clonaste el repositorio
path_global <- '/Users/nathaly/MyFiles/DataScience/R_training'
setwd(path_global)
```

Ahora vamos a leer el dataset de entrenamiento
----------------------------------------------

``` r
# Definimos el path en el que se encuentra nuestro dataset
path_dataset <- paste(path_global,'/data/train_titanic.csv', sep='')
# Leemos el dataset
df <- read.csv(path_dataset)

df_bk <- read.csv(path_dataset)
# Ahora visualicemos el archivo
head(df, n = 20)
```

    ##    PassengerId Survived Pclass
    ## 1            1        0      3
    ## 2            2        1      1
    ## 3            3        1      3
    ## 4            4        1      1
    ## 5            5        0      3
    ## 6            6        0      3
    ## 7            7        0      1
    ## 8            8        0      3
    ## 9            9        1      3
    ## 10          10        1      2
    ## 11          11        1      3
    ## 12          12        1      1
    ## 13          13        0      3
    ## 14          14        0      3
    ## 15          15        0      3
    ## 16          16        1      2
    ## 17          17        0      3
    ## 18          18        1      2
    ## 19          19        0      3
    ## 20          20        1      3
    ##                                                       Name    Sex Age
    ## 1                                  Braund, Mr. Owen Harris   male  22
    ## 2      Cumings, Mrs. John Bradley (Florence Briggs Thayer) female  38
    ## 3                                   Heikkinen, Miss. Laina female  26
    ## 4             Futrelle, Mrs. Jacques Heath (Lily May Peel) female  35
    ## 5                                 Allen, Mr. William Henry   male  35
    ## 6                                         Moran, Mr. James   male  NA
    ## 7                                  McCarthy, Mr. Timothy J   male  54
    ## 8                           Palsson, Master. Gosta Leonard   male   2
    ## 9        Johnson, Mrs. Oscar W (Elisabeth Vilhelmina Berg) female  27
    ## 10                     Nasser, Mrs. Nicholas (Adele Achem) female  14
    ## 11                         Sandstrom, Miss. Marguerite Rut female   4
    ## 12                                Bonnell, Miss. Elizabeth female  58
    ## 13                          Saundercock, Mr. William Henry   male  20
    ## 14                             Andersson, Mr. Anders Johan   male  39
    ## 15                    Vestrom, Miss. Hulda Amanda Adolfina female  14
    ## 16                        Hewlett, Mrs. (Mary D Kingcome)  female  55
    ## 17                                    Rice, Master. Eugene   male   2
    ## 18                            Williams, Mr. Charles Eugene   male  NA
    ## 19 Vander Planke, Mrs. Julius (Emelia Maria Vandemoortele) female  31
    ## 20                                 Masselmani, Mrs. Fatima female  NA
    ##    SibSp Parch           Ticket    Fare Cabin Embarked
    ## 1      1     0        A/5 21171  7.2500              S
    ## 2      1     0         PC 17599 71.2833   C85        C
    ## 3      0     0 STON/O2. 3101282  7.9250              S
    ## 4      1     0           113803 53.1000  C123        S
    ## 5      0     0           373450  8.0500              S
    ## 6      0     0           330877  8.4583              Q
    ## 7      0     0            17463 51.8625   E46        S
    ## 8      3     1           349909 21.0750              S
    ## 9      0     2           347742 11.1333              S
    ## 10     1     0           237736 30.0708              C
    ## 11     1     1          PP 9549 16.7000    G6        S
    ## 12     0     0           113783 26.5500  C103        S
    ## 13     0     0        A/5. 2151  8.0500              S
    ## 14     1     5           347082 31.2750              S
    ## 15     0     0           350406  7.8542              S
    ## 16     0     0           248706 16.0000              S
    ## 17     4     1           382652 29.1250              Q
    ## 18     0     0           244373 13.0000              S
    ## 19     1     0           345763 18.0000              S
    ## 20     0     0             2649  7.2250              C

Cuántos datos tenemos?
----------------------

``` r
# Cuál es la dimensión de nuestro dataset ? 
# La primera dimensión indica el número de filas/registros/observaciones 
# La segunda dimensión indica el número de columnas/variables/features

dim(df)
```

    ## [1] 891  12

Qué tipos de datos tenemos?
---------------------------

``` r
# Veamos los tipos de datos de cada una de nuestros features

sapply(df, class)
```

    ## PassengerId    Survived      Pclass        Name         Sex         Age 
    ##   "integer"   "integer"   "integer"    "factor"    "factor"   "numeric" 
    ##       SibSp       Parch      Ticket        Fare       Cabin    Embarked 
    ##   "integer"   "integer"    "factor"   "numeric"    "factor"    "factor"

``` r
# Convertimos a clases la columna Survived
df$Survived <- as.factor(df$Survived)
```

Cuál es la proporción de nuestros datos?
----------------------------------------

``` r
cbind(freq=table(df$Sex), percentage=prop.table(table(df$Sex)) * 100)
```

    ##        freq percentage
    ## female  314    35.2413
    ## male    577    64.7587

La descripción global del dataset?
----------------------------------

``` r
summary(df)
```

    ##   PassengerId    Survived     Pclass     
    ##  Min.   :  1.0   0:549    Min.   :1.000  
    ##  1st Qu.:223.5   1:342    1st Qu.:2.000  
    ##  Median :446.0            Median :3.000  
    ##  Mean   :446.0            Mean   :2.309  
    ##  3rd Qu.:668.5            3rd Qu.:3.000  
    ##  Max.   :891.0            Max.   :3.000  
    ##                                          
    ##                                     Name         Sex           Age       
    ##  Abbing, Mr. Anthony                  :  1   female:314   Min.   : 0.42  
    ##  Abbott, Mr. Rossmore Edward          :  1   male  :577   1st Qu.:20.12  
    ##  Abbott, Mrs. Stanton (Rosa Hunt)     :  1                Median :28.00  
    ##  Abelson, Mr. Samuel                  :  1                Mean   :29.70  
    ##  Abelson, Mrs. Samuel (Hannah Wizosky):  1                3rd Qu.:38.00  
    ##  Adahl, Mr. Mauritz Nils Martin       :  1                Max.   :80.00  
    ##  (Other)                              :885                NA's   :177    
    ##      SibSp           Parch             Ticket         Fare       
    ##  Min.   :0.000   Min.   :0.0000   1601    :  7   Min.   :  0.00  
    ##  1st Qu.:0.000   1st Qu.:0.0000   347082  :  7   1st Qu.:  7.91  
    ##  Median :0.000   Median :0.0000   CA. 2343:  7   Median : 14.45  
    ##  Mean   :0.523   Mean   :0.3816   3101295 :  6   Mean   : 32.20  
    ##  3rd Qu.:1.000   3rd Qu.:0.0000   347088  :  6   3rd Qu.: 31.00  
    ##  Max.   :8.000   Max.   :6.0000   CA 2144 :  6   Max.   :512.33  
    ##                                   (Other) :852                   
    ##          Cabin     Embarked
    ##             :687    :  2   
    ##  B96 B98    :  4   C:168   
    ##  C23 C25 C27:  4   Q: 77   
    ##  G6         :  4   S:644   
    ##  C22 C26    :  3           
    ##  D          :  3           
    ##  (Other)    :186

Qué tan dispersos están los datos ?
-----------------------------------

``` r
df[is.na(df)] <- 0
numerical_columns <- unlist(lapply(df, is.numeric))  
apply(df[, numerical_columns],2, sd)
```

    ## PassengerId      Pclass         Age       SibSp       Parch        Fare 
    ## 257.3538420   0.8360712  17.5960741   1.1027434   0.8060572  49.6934286

``` r
apply(df[, numerical_columns],2, mean)
```

    ## PassengerId      Pclass         Age       SibSp       Parch        Fare 
    ## 446.0000000   2.3086420  23.7992929   0.5230079   0.3815937  32.2042080

Existe correlación en los datos?
--------------------------------

Cómo los datos se relacionan entre si ?

``` r
cor(df[,numerical_columns])
```

    ##              PassengerId      Pclass         Age       SibSp        Parch
    ## PassengerId  1.000000000 -0.03514399  0.03812523 -0.05752683 -0.001652012
    ## Pclass      -0.035143994  1.00000000 -0.36135322  0.08308136  0.018442671
    ## Age          0.038125229 -0.36135322  1.00000000 -0.18466353 -0.048786083
    ## SibSp       -0.057526834  0.08308136 -0.18466353  1.00000000  0.414837699
    ## Parch       -0.001652012  0.01844267 -0.04878608  0.41483770  1.000000000
    ## Fare         0.012658219 -0.54949962  0.13551585  0.15965104  0.216224945
    ##                    Fare
    ## PassengerId  0.01265822
    ## Pclass      -0.54949962
    ## Age          0.13551585
    ## SibSp        0.15965104
    ## Parch        0.21622494
    ## Fare         1.00000000

Parte 2 - Visualización de los datos
====================================

Univariate Analysis
-------------------

``` r
hist(df$Age, main="Distribución de Edades", xlab = "Edad", col="purple")
```

![](2_R_Descriptive_analytics_files/figure-markdown_github/unnamed-chunk-10-1.png) \#\#\# Density Plot

``` r
library(lattice)

plot(density(df$Age, na.rm = TRUE))
```

![](2_R_Descriptive_analytics_files/figure-markdown_github/unnamed-chunk-11-1.png) \#\#\# Boxplots

``` r
boxplot(df$Age)
```

![](2_R_Descriptive_analytics_files/figure-markdown_github/unnamed-chunk-12-1.png) \#\#\# Barplot Para datos categóricos

``` r
barplot(table(df$Embarked), main = "Puntos de Embarque")
```

![](2_R_Descriptive_analytics_files/figure-markdown_github/unnamed-chunk-13-1.png) \#\# Missing Values

``` r
# install.packages("Amelia")
library("Amelia")
```

    ## Loading required package: Rcpp

    ## ## 
    ## ## Amelia II: Multiple Imputation
    ## ## (Version 1.7.5, built: 2018-05-07)
    ## ## Copyright (C) 2005-2019 James Honaker, Gary King and Matthew Blackwell
    ## ## Refer to http://gking.harvard.edu/amelia/ for more information
    ## ##

``` r
missmap(df_bk, y.cex=0.5, col=c("red","grey"))
```

![](2_R_Descriptive_analytics_files/figure-markdown_github/unnamed-chunk-14-1.png) \#\# Multivariate Analysis Buscamos relaciones e interacciones entre variables

``` r
# install.packages('corrplot')
library(corrplot)
```

    ## corrplot 0.84 loaded

``` r
correlations <- cor(df[,numerical_columns], )
corrplot(correlations, method="circle")
```

![](2_R_Descriptive_analytics_files/figure-markdown_github/unnamed-chunk-15-1.png) \#\#\# Scatterplot Muestra la interacción entre dos o más variables. La distribución de los datos indica la relación entre las variables

``` r
pairs(df[, numerical_columns])
```

![](2_R_Descriptive_analytics_files/figure-markdown_github/unnamed-chunk-16-1.png)

Por clase

``` r
pairs(Survived ~ Age + Sex+ Pclass + SibSp + Parch + Fare + Embarked, data = df, col=c('red','green') )
```

![](2_R_Descriptive_analytics_files/figure-markdown_github/unnamed-chunk-17-1.png)

Feature Plot

``` r
# library(caret)

# featurePlot(x=df[, c("Age", "SibSp")], y=df[,c("Survived")],  plot="box")
```

Mujeres y Niños primero

``` r
barplot(table(df$Survived, df$Sex), col = df$Survived )
```

![](2_R_Descriptive_analytics_files/figure-markdown_github/unnamed-chunk-19-1.png)

``` r
table(df$Survived, df$Sex)
```

    ##    
    ##     female male
    ##   0     81  468
    ##   1    233  109
