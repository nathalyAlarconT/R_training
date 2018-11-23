R - Sintaxis
================

En este notebook revisaremos los aspectos básicos necesarios, para que estes en la capacidad de leer, entender y crear código de R. Contenido:

1.  Tipos de datos en R
2.  Estructuras de control de R

Empecemos con los tipos de datos principales que existen en R.

1. Tipos de datos
-----------------

### Strings / Cadenas de texto

``` r
# Definimos 2 variables que contengan texto
a <- "R-Ladies"
b <- "La Paz"
# Podemos concatenar las dos variables
# usamos la función paste y la opción "sep" para indicar cual es el caracter que va a concatenar los dos textos
c <- paste(a,b, sep = " ")
c
```

    ## [1] "R-Ladies La Paz"

``` r
#Ahora concatenemos el string nuevamente! 
d <- paste(c, ' - Bolivia', sep=" ")
d
```

    ## [1] "R-Ladies La Paz  - Bolivia"

### Fechas

``` r
# Podemos transformar textos de fechas a datos de tipo fecha R, para ello, es importante indicar el formato de las mismas.
# Transformemos el string "04/09/2018" a formato fecha
y <- strptime("04/09/2018", format= "%d/%m/%Y" )
y
```

    ## [1] "2018-09-04 -04"

``` r
# Averiguemos el día de la semana de la fecha indicada
dia <- weekdays(y)
dia
```

    ## [1] "Tuesday"

``` r
# Podemos trabajar con formatos de fechas más complejos
other.dates <- c("1jan99", "2jan05", "31mar04", "30jul05")
strptime(other.dates, "%d%b%y")
```

    ## [1] "1999-01-01 -04" "2005-01-02 -04" "2004-03-31 -04" "2005-07-30 -04"

### Vectores

``` r
# Definamos nuestro primer vector, usaremos la función c()
vector1 <- c(4,5,6,2,3,4,6,2)
vector1
```

    ## [1] 4 5 6 2 3 4 6 2

``` r
# Accedamos al primer elemento del vector creado
# En R, se empieza a contar los elementos desde 1, no desde 0 como en otros lenguajes.
vector1[1]
```

    ## [1] 4

``` r
# Podemos tambien definir el vector a partir de una secuencia. Por ejemplo, una secuencia del 1 al 10
vector2 <- c(1:10)
vector2
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10

``` r
# Veamos el tipo de dato del vector1
class(vector1)  #Todos los elementos del vector son de tipo numérico
```

    ## [1] "numeric"

``` r
# Los vectores pueden almacenar distintos tipos de datos
x <- c(0.5, 0.6)      ## numeric
x <- c(TRUE, FALSE)   ## Logical
x <- c(T, F)          ## Logical
x <- c("a", "b", "c") ## character
x <- 9:29             ## integer
x <- c(1+0i, 2+4i)    ## complex

# Podemos crear secuencias con parámetros más complejos 
# Veamos las opciones que tenemos en el comando seq
?seq
seq1 <- seq(from=10, to=40, by=2)
seq1
```

    ##  [1] 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40

``` r
seq2 <- seq(1, 2, 0.01)
seq2
```

    ##   [1] 1.00 1.01 1.02 1.03 1.04 1.05 1.06 1.07 1.08 1.09 1.10 1.11 1.12 1.13
    ##  [15] 1.14 1.15 1.16 1.17 1.18 1.19 1.20 1.21 1.22 1.23 1.24 1.25 1.26 1.27
    ##  [29] 1.28 1.29 1.30 1.31 1.32 1.33 1.34 1.35 1.36 1.37 1.38 1.39 1.40 1.41
    ##  [43] 1.42 1.43 1.44 1.45 1.46 1.47 1.48 1.49 1.50 1.51 1.52 1.53 1.54 1.55
    ##  [57] 1.56 1.57 1.58 1.59 1.60 1.61 1.62 1.63 1.64 1.65 1.66 1.67 1.68 1.69
    ##  [71] 1.70 1.71 1.72 1.73 1.74 1.75 1.76 1.77 1.78 1.79 1.80 1.81 1.82 1.83
    ##  [85] 1.84 1.85 1.86 1.87 1.88 1.89 1.90 1.91 1.92 1.93 1.94 1.95 1.96 1.97
    ##  [99] 1.98 1.99 2.00

``` r
seq3 <- seq(from=1992, by=2, length = 6)
seq3
```

    ## [1] 1992 1994 1996 1998 2000 2002

### Matrices

Atención! En R empezamos a contar desde 1 (no desde 0)

``` r
# En las matrices, los elementos son del mismo tipo de dato
a<-matrix(1:12,nrow=3,byrow=TRUE)
a
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    2    3    4
    ## [2,]    5    6    7    8
    ## [3,]    9   10   11   12

``` r
# Vamos a acceder a la matriz, por los índices
# Fila 2, Columna 3
a[2,3]
```

    ## [1] 7

``` r
# Columna 3, todas las filas
a[,3]
```

    ## [1]  3  7 11

``` r
# Fila 2, todas las columnas
a[2,]
```

    ## [1] 5 6 7 8

``` r
#Fila 2, columnas 2 y 3
a[2,c(2,3)]
```

    ## [1] 6 7

``` r
#Filas 1 y 2, columnas 2 y 3
a[c(1,2),c(2,3)]
```

    ##      [,1] [,2]
    ## [1,]    2    3
    ## [2,]    6    7

``` r
# Vamos a asignarle nombres a las filas
rownames(a)<-c("A","B","C")
a
```

    ##   [,1] [,2] [,3] [,4]
    ## A    1    2    3    4
    ## B    5    6    7    8
    ## C    9   10   11   12

``` r
# Asignamos nombres a las columnas
colnames(a)<-c("a","b","x","y")
a
```

    ##   a  b  x  y
    ## A 1  2  3  4
    ## B 5  6  7  8
    ## C 9 10 11 12

``` r
# También podemos combinar estructuras de datos

# cbind y rbind
x <- 1:3
x
```

    ## [1] 1 2 3

``` r
y <- 10:12
y
```

    ## [1] 10 11 12

``` r
# Vamos a combinar los 2 vectores en columnas
r1 <- cbind(x, y)
r1
```

    ##      x  y
    ## [1,] 1 10
    ## [2,] 2 11
    ## [3,] 3 12

``` r
# Combinamos los dos vectores en el sentido de filas
r2 <- rbind(x, y)
r2
```

    ##   [,1] [,2] [,3]
    ## x    1    2    3
    ## y   10   11   12

### Listas

``` r
# Permiten almacenar datos de distintos tipos y longitudes

# Vamos a crear dos estructuras de datos
A<-c(31,32,40)
S<-as.factor(c("F","M","M","F"))

# Creamos una lista uniendo las dos estructuras creadas previamente
People<-list(age=A,sex=S)
People
```

    ## $age
    ## [1] 31 32 40
    ## 
    ## $sex
    ## [1] F M M F
    ## Levels: F M

``` r
# Acceder a los elementos de la lista
# El operador $ nos permite acceder directamente a los atributos
People$age
```

    ## [1] 31 32 40

``` r
People[[1]]
```

    ## [1] 31 32 40

``` r
People[[2]]
```

    ## [1] F M M F
    ## Levels: F M

### Dataframes

``` r
# Son matrices generalizadas las columnas pueden tener distintos tipos de datos.
Patients <- data.frame(age=c(31,32,40,50),sex=S)
Patients
```

    ##   age sex
    ## 1  31   F
    ## 2  32   M
    ## 3  40   M
    ## 4  50   F

``` r
# Seleccionamos la primera fila del dataset
Patients[1,]
```

    ##   age sex
    ## 1  31   F

``` r
# Seleccionamos la segunda fila del dataset
Patients[2,]
```

    ##   age sex
    ## 2  32   M

``` r
# Seleccionamos la segunda columna del dataset
Patients[,2]
```

    ## [1] F M M F
    ## Levels: F M

``` r
# Vamos a crear un nuevo dataset
# Insulina dataframe
age <- c(50,62,60,40,48,47,57,70,48,67)
insulin <- c(16.5,10.8,32.3,19.3,14.2,11.3,
             15.5,15.8,16.2,11.2)
insulina <- data.frame(age, insulin)
# Veamos la distribución de los datos
plot(insulina$age, insulina$insulin)
```

![](1_R_Sintaxis_basica_files/figure-markdown_github/unnamed-chunk-6-1.png)

2. Estructuras de control
-------------------------

### if then else

``` r
# Validemos la edad de una persona
persona.edad <- 18
if (persona.edad >= 18) {
  print("Es mayor de edad")
} else {
  print("Es menor de edad")
}
```

    ## [1] "Es mayor de edad"

### For Loop

``` r
# Definimos un vector con los nombres de los departamentos de Bolivia
bolivia.departamentos <- c('La Paz', 'Cochabamba', 'Santa Cruz', 'Potosí', 'Oruro', 'Beni', 'Pando', 'Tarija', 'Chuquisaca')
# Ordenamos el vector de departamentos
bolivia.departamentos <- sort(bolivia.departamentos)
# Ahora procedemos a iterar el vector
for (departamento in bolivia.departamentos) {
  print(departamento)
}
```

    ## [1] "Beni"
    ## [1] "Chuquisaca"
    ## [1] "Cochabamba"
    ## [1] "La Paz"
    ## [1] "Oruro"
    ## [1] "Pando"
    ## [1] "Potosí"
    ## [1] "Santa Cruz"
    ## [1] "Tarija"

### While Loop

``` r
edad.persona <- 15
contador <- 1

while ( contador < edad.persona) {
 print(paste("Edad :", contador , " [Cumplida]"))
 contador <- contador + 1  
}
```

    ## [1] "Edad : 1  [Cumplida]"
    ## [1] "Edad : 2  [Cumplida]"
    ## [1] "Edad : 3  [Cumplida]"
    ## [1] "Edad : 4  [Cumplida]"
    ## [1] "Edad : 5  [Cumplida]"
    ## [1] "Edad : 6  [Cumplida]"
    ## [1] "Edad : 7  [Cumplida]"
    ## [1] "Edad : 8  [Cumplida]"
    ## [1] "Edad : 9  [Cumplida]"
    ## [1] "Edad : 10  [Cumplida]"
    ## [1] "Edad : 11  [Cumplida]"
    ## [1] "Edad : 12  [Cumplida]"
    ## [1] "Edad : 13  [Cumplida]"
    ## [1] "Edad : 14  [Cumplida]"

### Funciones

``` r
#Vamos a crear una función que valide el tipo de dato de un vector, antes de proceder a sumarlos
sumaVector <- function(x){
  # Verificamos el tipo de dato del vector 
  if(!is.numeric(x)) 
    # Si no cumple con la condición, forzamos el mensaje de error 
    stop("Los valores deben ser numéricos")
  # Sumamos los elementos del vector
  return (sum(x))
}

# Ahora invocamos a la función creada
# Mandamos un vector con valores numéricos, por lo tanto, deberíamos obtener correctamente la suma de los valores del vector
sumaVector(c(3,4,3))
```

    ## [1] 10

``` r
# Enviamos a la función con un vector, donde no todos los elementos son de tipo numérico, por lo tanto deberíamos obtener el mensaje de error  
# sumaVector(c(3,4,"A"))
```
