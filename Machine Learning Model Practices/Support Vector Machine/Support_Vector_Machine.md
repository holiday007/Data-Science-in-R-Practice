Support Vector Machine
================
Author: Holiday Tang  
[LinkeDin](https://www.linkedin.com/in/holiday-t/) |
[GitHub](https://github.com/holiday007) | [Kaggle
Novice](https://www.kaggle.com/holibae007)
<<<<<<< HEAD
| Date: 2020-01-01

  - [Support Vector Machine](#support-vector-machine)
      - [Non-linear separation? Use “Kernel
        Trick”](#non-linear-separation-use-kernel-trick)
      - [Implementation](#implementation)
=======
| Date: 2019-12-31

  - [Support Vector Machine](#support-vector-machine)
>>>>>>> 758c42010212dfbbb9354ec365dde58e8a588290

(Note: adopted from *Data Scicence and Machine Learning Bootcamp with R*
by *Jose Portilla* from Udemy)

# Support Vector Machine

SVM - supervised learning model, associated with algorithms that analyze
data and recognize patterns, used for **classification and regression**

An SVM model is a representations of the examples as points in space,
mapped so that the examples of separated categories are divided by a
clear gap that is as wide as possible. New examples are then mapped to
the established space, and predicted to belong to a category based on
which side the gap they fall on.

<<<<<<< HEAD
  - Non-probabilistic based
  - binary linear classifier

=======
>>>>>>> 758c42010212dfbbb9354ec365dde58e8a588290
Imagine the labeled traning data below:

![](C:\\Users\\Dell\\Pictures\\Random\\Capture.JPG)

<<<<<<< HEAD
We can intuitively draw an hyperplane to separate the two classes,
however, there are many possible ways to do it:

![](C:\\Users\\Dell\\Pictures\\Random\\Capture2.JPG)

We would like to choose a hyperplane that maximizes the margin between
classes

The vector points that the margin lines touch are known as Support
Vectors.

![](C:\\Users\\Dell\\Pictures\\Random\\Capture2.JPG)

### Non-linear separation? Use “Kernel Trick”

[Kernel Trick](https://en.wikipedia.org/wiki/Kernel_method)

Put data in higher dimension(s).

### Implementation

##### Data

``` r
head(iris)
```

``` 
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

##### Model

``` r
library(e1071) # for svm()

# simple model
model = svm(Species ~., data = iris)
summary(model)
```

``` 

Call:
svm(formula = Species ~ ., data = iris)


Parameters:
   SVM-Type:  C-classification 
 SVM-Kernel:  radial 
       cost:  1 

Number of Support Vectors:  51

 ( 8 22 21 )


Number of Classes:  3 

Levels: 
 setosa versicolor virginica
```

Prediction (Warning: use test-train split and cv in real practice)

``` r
pred.values = predict(model, iris[1:4])
table(pred.values, iris[,5])
```

``` 
            
pred.values  setosa versicolor virginica
  setosa         50          0         0
  versicolor      0         48         2
  virginica       0          2        48
```

##### Parameter Tuning

  - Cost: allows svm to have a soft margins (a buffer instead of a
    boundary), aka allowing some data points to cross the hard margin,
    often leads to a better fit

  - Gamma:
    
      - related to non-linear kernel function
      - for radial kernel, small gamma - guassian of large vaiance -
        influence of the support vector is larger (wide-spread); large -
        variance small - support vector does not have a wide-spread
        influence
      - large gamma, small variance, high bias, small gamma, large
        variance, small bias

<!-- end list -->

``` r
# tune() function use a grid search
tune.results = tune(method = svm, train.x = iris[1:4], train.y = iris[,5],
                    kernel = "radial", 
                    # ranges -> parameters to tune, in a list
                    ranges = list(
                      cost=c(0.1,1.5,10), 
                      gamma=c(0.1,0.5,1,2)
                                  )
                    )
```

``` r
summary(tune.results)
```

``` 

Parameter tuning of 'svm':

- sampling method: 10-fold cross validation 

- best parameters:
 cost gamma
   10   0.1

- best performance: 0.04666667 

- Detailed performance results:
   cost gamma      error dispersion
1   0.1   0.1 0.12666667 0.07981460
2   1.5   0.1 0.05333333 0.05258738
3  10.0   0.1 0.04666667 0.05488484
4   0.1   0.5 0.07333333 0.07981460
5   1.5   0.5 0.05333333 0.05258738
6  10.0   0.5 0.06000000 0.04919099
7   0.1   1.0 0.08000000 0.06885304
8   1.5   1.0 0.07333333 0.07336700
9  10.0   1.0 0.08000000 0.06885304
10  0.1   2.0 0.10000000 0.08461970
11  1.5   2.0 0.06666667 0.07698004
12 10.0   2.0 0.07333333 0.07336700
```

The tuned model

``` r
tuned.svm = svm(Species ~., data = iris, kernel = 'radial',
                cost = 1.5, gamma = 0.1)
tuned.svm
```

``` 

Call:
svm(formula = Species ~ ., data = iris, kernel = "radial", cost = 1.5, 
    gamma = 0.1)


Parameters:
   SVM-Type:  C-classification 
 SVM-Kernel:  radial 
       cost:  1.5 

Number of Support Vectors:  50
```

? Cost, Gamma
=======
  - Non-probabilistic based
  - binary linear classifier
>>>>>>> 758c42010212dfbbb9354ec365dde58e8a588290
