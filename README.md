# ffm2pd - Five Factor Model to Personality Disorder Calculator

This package provides a function by which Five Factor Model ("Big Five") profiles can be translated into personality disorder risks. 
The methodology is described in a recent paper by Steppan et al. (2019). 


## Installation

__Current development version:__ Download package from [AppVeyor](https://ci.appveyor.com/project/mhahsler/seriation/build/artifacts) or install from GitHub (needs devtools).
```R 
install.packages("http://www.iscpt.org/epitoolbox/colorout_1.1-0.tar.gz", repos=NULL)
```

## Usage

Load library, read data and calculate distances. Then use default seriation.
```R
library(seriation)
data("iris")
x <- as.matrix(iris[-5])
x <- x[sample(1:nrow(x)),]

d <- dist(x)
order <- seriate(d)
order
```


## References

* Martin Steppan et al. (2019). A Vector Theory of Personality Disorder and their association with the Five Factor Model.
