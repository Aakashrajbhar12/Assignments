#1.Try to write a code for printing sequence of numbers from 1 to 50 with the differences of 3, 5, 10 
Seqby3 <<- seq(1, 50, by=3)
Seqby5 = seq(1, 50, by=5)
Seqby10 = seq(1, 50, by=10)
print(Seqby3)
print(Seqby5)
print(Seqby10)


#2. What are the different data objects in R? and write syntax and example for each and every object

# Data Types/Object in R - Vector, List, Matrix, Array, Factor, Data Frame

#vector : syntax: vector_name <<- c(element1,element2,...elementn)
Vect <<- c(1,2,3,4,5)
print(Vect)
class(Vect)
 
#list : syntax: list_name <<- list(element1,element2,....elementn)
Fruit <<- list(c("Apple","Mango","Banana","Grape"))
print(Fruit)
class(Fruit)

#Matrix: syntax: matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)
m <- matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol = 3, byrow = TRUE, 
            dimnames = list(c('r1', 'r2','r3'), c('c1', 'c2','c3')))
print(m)
class(m)

#Array: syntax: array_name <<- array(data=file,vector, dim = c(dem1,dem2), dimnames = null )
ar <- array(c(1,2), dim = c(3, 3, 2))
print(ar)
class(ar)


# Factor: syntax: factor(vect_name)
k <- c("red", "green", "blue", "blue", "red")
class(k)
k
factor_k <- factor(k) # creating vector using factor()
class(factor_k)
factor_k


# Data Frame: syntax: data.frame(coln1,coln2,...colnN)
df <- data.frame(gender = c("Male", "Male","Female","Male","Female"), height = c(152, 171.5, 165,155,175), 
                weight = c(81,93,78,65,95), Age = c(42,38,64,45,40))
print(df)
class(df)

#3.Create Data frame with 3 columns and 5 rows and write a code to fetch and delete row and a column using index and add new column and row to the existed data frame
#Creating Data frame
df1 <- data.frame(gender = c("Male", "Female","Female","Male","Female"), height = c(152, 171.5, 165,145,170), 
                  weight = c(81,55,58,70,65))  
print(df1)

#Fetching data from df1
df1[2,1:3]  #fetching 2nd row and all 3 coln

#Deleting - Drop rows & coln using "-" operator in R
df1 = df1[-c(5),-c(3)]
df1

#adding New row using rbind()
newrow = c("Female",130) # Two value because of two column are there in df
df1 = rbind(df1,newrow)  
df1

#adding New Column using cbind()
age = c(40,39,38,27,45) # 5 value because of 5 observations
df1 = cbind(df1,age)
df1

# 4.Write nested if else statements to print whether the given number is negative, positive or Zero 
x <- 0
if (x>0) {
  print("Positive Number")
} else if (x<0) {
  print("Negative Number")
} else if (x==0){
  print("Nmberis Zero")
} else print("Not a Number")

# 5.write a program to input any value and check whether it is character, numeric or special character

checking <- function(read){
  if (grepl("[[:alpha:]]",read)){
    print("Input is a character")
  }
  else if (grepl("^[0-9]+$",read)){
    print("Input is numeric")
  }
  else if (grepl("[[:punct:]]",read)){
    print("Input is a Special character")
  }
  else 
    print("Wrong input")
}

# Calling the function 'Checking'
checking("Analyts")
checking(5)
checking("#")


#6.write difference between break and next also write examples for both 

# Break :
#1.terminates the loop statement then and there if the break conditions Satisfies.
#2.Break statement basically terminates/stop the loop resulting in no further iterations of the loop.
#3.Keyword for Break Statement is: break
#4.Example:
for (b in seq(10)){
  if (b==5){
    break      # will break at 4 since, b==5
  }
  print(b)
} 

#Next :
#1.Skip a iteration then and there if the next condition satisfies.
#2.Next statements basically skip a step/iteration and continues with further iterations
#3.keyword for Next statement is: next
#4.Example:
for (n in seq(7)){
  if (n==4){
    next    # will next and skip 4
  }
  print(n)
}


#7.write a program to print a given vector in reverse format x= c(1,5.6,3,10,3.5,5)

x= c(1,5.6,3,10,3.5,5)
print(rev(x))       # rev() prints the arguments in reverse order.


#8.write a program to get the mode value of the given vector ('a','b','c','t','a','c','r','a','c','t','z','r','v','t','u','e','t')

vect1 = c("a","b","c","t","a","c","r","a","c","t","z","r","v","t","u","e","t")
#Creating a function for mode
mode <- function(vec) {         #naming the function as mode and parameter
  uni <- unique(vec)            #unique() - will gives unique value and storing it in 'uni'
  uni[which.max(tabulate(match(vec, uni)))] #which.max() - gives the index of max element, tabulate() - counts the elements/values.
}
#Calling the Function mode for vect1
mode(vect1)


#9.Write a function to filter only data belongs to 'setosa' in species of Iris dataset.( using dplyr package) 
library(dplyr)          # importing the libary
irisdf<-datasets::iris  # Loading iris dataset in irisdf variable 

#Creating a function/method to filter only data of setosa 
iris_setosa <-filter(irisdf,Species == "setosa")
# calling the variable in which data of setosa species is stored
iris_setosa 



#10.Create a new column for iris dataset with the name of Means_of_obs, which contains mean value of each row.( using dplyr package)
#importing Dataset
df_iris<-datasets::iris
#Creating an array of means of first 4 colums by using apply & mean Function
means = apply(df_iris[1:4],1,mean)
#appending the array of mean at the end of the dataframe
df_new_column = mutate(df_iris,Means_of_obs=means)
#Creating View instant
View(df_new_column)



#11.Filter data for the "versicolor" and get only 'sepel_length' and Sepel _width' columns.( using dplyr package)
# Loading iris dataset in irisdf variable 
irisdf<-datasets::iris
#filtering using subset function
df_versicolor = subset(irisdf, Species == "versicolor")[,1:2]
#Creating View instant
View(df_versicolor)

#12.create below plots for the mtcars also write your inferences for each and every plot (use ggplot package) Use Different ( Size , Colour )
#Creating DataFrame of mtcars dataset
df_mtcars<-datasets::mtcars
#getting a list of columns names 
colnames(df_mtcars)
library("ggplot2")
#1.create a scatter plot
ggplot(data = mtcars,aes(x = mpg,y = hp)) + geom_point(color ="Red", size=2)

# inference: As the mpg of the Cars increase, hp(horsePower) decrease it is Strongly negatively correlated

#2.create a box plot
ggplot(data = mtcars,aes(x = wt)) + geom_boxplot(color ="Green", size = 2) + coord_flip()
# inference: There are 3 outliers (Extreme Observation) in the wt category

#3.create a Histogram
ggplot(mtcars,aes(mpg)) + geom_histogram(fill = "Red",color ="Black", bins = 5,size = 1) 
# inference: Histogram of MPG Doesn't follow Normal Distribution, it is also Postively Skewed 

#4.create a line Graph
ggplot(data = mtcars,aes(x = mpg,y = hp)) + geom_line(color = "Red", size = 2)
# inference: As the mpg of the Cars increase, hp(horsePower) decrease it is Strongly negatively correlated

#5.create a Bar Graph
ggplot(data = mtcars,aes(x = gear)) + geom_bar(color ="Black",fill = "NavyBlue", size = 1)
# inference: Through the bar graph it can be there are 15, 12 and 5 cars with 3, 4 and 5 gears respectively.
                                            


