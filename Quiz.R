library(datasets)

data(iris)
?iris
View(iris)

## Answer 1
tapply(iris$Sepal.Length, iris$Species, mean)

## Answer 2
apply(iris[,1:4], 2, mean)

data(mtcars)
?mtcars


## Answer 3
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
with(mtcars, tapply(mpg, cyl, mean))


## Answer 4
eight_cyl <- mtcars %>% filter(cyl == 8)
eight_ave_horse <- mean(eight_cyl$hp)

four_cyl <- mtcars %>% filter(cyl == 4)
four_ave_horse <- mean(four_cyl$hp)

result <- abs(eight_ave_horse - four_ave_horse)
result


## Answer 5
debug(ls)
ls()
