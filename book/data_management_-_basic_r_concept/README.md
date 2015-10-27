# Manage data: R programming


```R``` code can be entered into the command line directly or saved to a script, which can be run inside a session using  the ```source``` function
Commands are separated either by a ```;``` or by a newline.
```R``` is case sensitive.

The ```#``` character at the beginning of a line signifies
  a comment, which is not executed.
Help files for R functions are accessed by preceding the name of the function with ```?``` (e.g. ```?require```).


```R``` stores both data and output from data analysis (as well as
  everything else) in objects. Things are assigned to and stored in objects using
  the ```<-``` or ```=``` operator

A list of all objects in the current session can be obtained by ``` ls() ```


## Data elements in R

-  `Vectors` are a core data structure in R, and are created with `c()`. Elements in a vector must be of the same type.

-  `Data frame` where each column is a vector, but adjacent vectors can hold different things

- `Matrix` just like a data frame except it's all numeric

- `List` are made of any dimension, mix and match

- `Factors` are a special class that R uses for categorical variables, which also allows for value labeling.


## Vectors examples


```r
  numbers = c(23, 13, 5, 7, 31)
  names = c("mohammed", "hussein", "ali")

#Elements are indexed starting at 1, and are accessed with `[]` notation.
	numbers[1] # 23
	names[1] # mohammed
```

## Data frames

```r
    books = data.frame(
        title = c("harry potter", "war and peace", "lord of the rings"),
        author = c("rowling", "tolstoy", "tolkien"),
        num_pages = c("350", "875", "500")
    )

# you can access columns of a data frame with `$`.
	books$title # c("harry potter", "war and peace", "lord of the rings")
	books$author[1] # "rowling"

#You can also create new columns with `$`.
	books$num_bought_today = c(10, 5, 8)
	books$num_bought_yesterday = c(18, 13, 20)
	books$total_num_bought = books$num_bought_today + books$num_bought_yesterday
```

## Load and check a Data Frame


```r
data(CASchools)
mydata <- CASchools

# load a data set from csv and assign it to an object called 'mydata'
#mydata <- read.csv("unhcr_mass_comm_db_merged_20140612.csv")

# first few rows of the dataset
head(mydata)

# last few rows
tail(mydata)

# variable names
colnames(mydata)

# pop-up view of entire data set (uncomment to run)
# View(mydata)
```


## Initial exploration


```r
# dimension of the data frame
dim(mydata)

# Structure of the data frame of all variables
# this includes the class(type) i.e factor or not
str(mydata)

# summary statistics with means for every variable
summary(mydata)
```

## View the data


```r
# single cell value
mydata[2,3]

# omitting row value implies all rows; here all rows in column 3
mydata[,3]

# omitting column values implies all columns; here all columns in row 2
mydata[2,]

# can also use ranges - rows 2 and 3, columns 2 and 3
mydata[2:3, 2:3]

# get first 10 rows of variable female using two methods
mydata[1:10, "female"]
mydata$female[1:10]

# get column 1 for rows 1, 3 and 5
mydata[c(1,3,5), 1]

# get row 1 values for variables female, prog and socst
mydata[1,c("female", "prog", "socst")]

# sort data using the order function.
sorteddata <- mydatad[order(d$id, d$female), ]
```

## Subsetting Variables
Often, datasets come with many more variable than we want. We can also use subset to keep only the variables we need.

We can use  the select argument to subset by variable rather than by observation.


```r
# select is special, so we do not need to quote the variable names
mydataselect <- subset(mydata, select = c(id, female, read, write))

# the - preceding c(female... , which means drop these variables
mydatadropped <- subset(mydata, select = -c(female, read, write))
```


## Merging



##  Reshaping - Pivot table

A common operation is the transformation between wide and long data.
Wide data has a column for each variable. For example, this is wide-format data:

```
#   ozone   wind  temp
# 1 23.62 11.623 65.55
# 2 29.44 10.267 79.10
# 3 59.12  8.942 83.90
# 4 59.96  8.794 83.97
```

And this is long-format data:

```
#    variable  value
# 1     ozone 23.615
# 2     ozone 29.444
# 3     ozone 59.115
# 4     ozone 59.962
# 5      wind 11.623
# 6      wind 10.267
# 7      wind  8.942
# 8      wind  8.794
# 9      temp 65.548
# 10     temp 79.100
# 11     temp 83.903
# 12     temp 83.968
```

Long-format data has a column for possible variable types and a column for the values of those variables. Long-format data isn’t necessarily only two columns. Long format is what you can obtain in excel when generating a pivot table


reshape2 is based around two key functions: melt and cast:

melt takes wide-format data and melts it into long-format data.

cast takes long-format data and casts it into wide-format data.


[Manipulating data](http://www.cookbook-r.com/Manipulating_data/)

This is an exercise:

---

Define a variable `x` equal to 10.

```js
var x =
```

```js
var x = 10;
```

```js
assert(x == 10);
```

```js
// This is context code available everywhere
// The user will be able to call magicFunc in his code
function magicFunc() {
    return 3;
}
```

---


