##############################################
## Sintaxis básica de R
##############################################


# Revisaremos los aspectos básicos necesarios, para que estes en la capacidad de leer, entender y crear código de R.
# Contenido:
#   
#   1. Tipos de datos en R
#   2. Estructuras de control de R
# 

# Empecemos con los tipos de datos principales que existen en R.


##############################################
##
##            1. Tipos de datos
## 
##############################################


##############################################
### Strings / Cadenas de texto
##############################################
# Definimos 2 variables que contengan texto
a <- "R-Ladies"
b <- "La Paz"
# Podemos concatenar las dos variables
# usamos la función paste y la opción "sep" para indicar cual es el caracter que va a concatenar los dos textos
c <- paste(a,b, sep = " ")
c
#Ahora concatenemos el string nuevamente! 
d <- paste(c, ' - Bolivia', sep=" ")
d





##############################################
### Fechas
##############################################
# Podemos transformar textos de fechas a datos de tipo fecha en R, para ello, es importante indicar el formato de las mismas.
# Transformemos el string "04/09/2018" a formato fecha
y <- strptime("04/09/2018", format= "%d/%m/%Y" )
y

# Averiguemos el día de la semana de la fecha indicada
dia <- weekdays(y)
dia

# Podemos trabajar con formatos de fechas más complejos
other.dates <- c("1jan99", "2jan05", "31mar04", "30jul05")
strptime(other.dates, "%d%b%y")





##############################################
### Vectores
##############################################
# Definamos nuestro primer vector, usaremos la función c()
vector1 <- c(4,5,6,2,3,4,6,2)
vector1

# Accedamos al primer elemento del vector creado
vector1[1]
# En R, se empiezan a contar los elementos desde 1, no desde 0 como en otros lenguajes.


# Podemos tambien definir el vector a partir de una secuencia. En este caso una secuencia del 1 al 10
vector2 <- c(1:10)
vector2

# Veamos el tipo de dato del vector1
class(vector1)  #Todos los elementos del vector son de tipo numérico


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

seq2 <- seq(1, 2, 0.01)
seq2

seq3 <- seq(from=1992, by=2, length = 6)
seq3





##############################################
### Matrices
# Atención! En R empezamos a contar desde 1 (no desde 0) 
##############################################
# En las matrices, los elementos son del mismo tipo de dato
a<-matrix(1:12,nrow=3,byrow=TRUE)
a
# Vamos a acceder a la matriz, por los índices
# Fila 2, Columna 3
a[2,3]

# Columna 3, todas las filas
a[,3]

# Fila 2, todas las columnas
a[2,]

#Fila 2, columnas 2 y 3
a[2,c(2,3)]

#Filas 1 y 2, columnas 2 y 3
a[c(1,2),c(2,3)]

# Vamos a asignarle nombres a las filas
rownames(a)<-c("A","B","C")
a

# Asignamos nombres a las columnas
colnames(a)<-c("a","b","x","y")
a

# También podemos combinar estructuras de datos
# cbind y rbind
x <- 1:3
x
y <- 10:12
y

# Vamos a combinar los 2 vectores en columnas
r1 <- cbind(x, y)
r1
# Combinamos los dos vectores en el sentido de filas
r2 <- rbind(x, y)
r2





##############################################
### Listas
##############################################
# Permiten almacenar datos de distintos tipos y longitudes

# Vamos a crear dos estructuras de datos
A<-c(31,32,40)
S<-as.factor(c("F","M","M","F"))

# Creamos una lista uniendo las dos estructuras creadas previamente
People<-list(age=A,sex=S)
People

# Acceder a los elementos de la lista
# El operador $ nos permite acceder directamente a los atributos
People$age
People[[1]]
People[[2]]





##############################################
### Dataframes
##############################################
# Son matrices generalizadas, las columnas pueden tener distintos tipos de datos.
Patients <- data.frame(age=c(31,32,40,50),sex=S)
Patients

# Seleccionamos la primera fila del dataset
Patients[1,]
# Seleccionamos la segunda fila del dataset
Patients[2,]
# Seleccionamos la segunda columna del dataset
Patients[,2]


# Vamos a crear un nuevo dataset
# Insulina dataframe
age <- c(50,62,60,40,48,47,57,70,48,67)
insulin <- c(16.5,10.8,32.3,19.3,14.2,11.3,
             15.5,15.8,16.2,11.2)
insulina <- data.frame(age, insulin)
# Veamos la distribución de los datos
plot(insulina$age, insulina$insulin)








######################################################
##
##            2. Estructuras de control en R 
## 
######################################################





##############################################
### if then else
##############################################
# Validemos la edad de una persona
persona.edad <- 12
if (persona.edad >= 18) {
  print("Es mayor de edad")
} else {
  print("Es menor de edad")
}





##############################################
### For Loop
##############################################
# Definimos un vector con los nombres de los departamentos de Bolivia
bolivia.departamentos <- c('La Paz', 'Cochabamba', 'Santa Cruz', 'Potosí', 'Oruro', 'Beni', 'Pando', 'Tarija', 'Chuquisaca')
# Ordenamos el vector de departamentos
bolivia.departamentos <- sort(bolivia.departamentos)
# Ahora procedemos a iterar el vector
for (departamento in bolivia.departamentos) {
  print(departamento)
}





##############################################
### While Loop
##############################################
edad.persona <- 5
contador <- 1

while ( contador < edad.persona) {
  print(paste("Edad :", contador , " [Cumplida]"))
  contador <- contador + 1  
}





##############################################
### Funciones
##############################################
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

# Enviamos a la función un vector, donde no todos los elementos son de tipo numérico, por lo tanto deberíamos obtener el mensaje de error  
sumaVector(c(3,4,"A"))