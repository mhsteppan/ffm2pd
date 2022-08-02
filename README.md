# ffm2pd - Five Factor Model to Personality Disorder Calculator

This package provides a function by which Five Factor Model ("Big Five") profiles can be translated into personality disorder risks. 
The methodology is described in a recent paper by Steppan et al. (2019). 


## Installation

```R 
library(devtools)
install_github("mhsteppan/ffm2pd")
```

## Usage

Load library, read data and calculate distances. Then use default seriation.
```R
library(ffm2pd)

# Example of two recent American presidents and how their personalities may come across
# The order is always: E-A-C-N-O: 1) Extraversion 2) Agreeableness 3) Conscientiousness 4) Neuroticism 5) Openness (z scores)
Trump<-cbind(0.3,-2,-1,-0.5,-0.5)
ffm2pd(Trump)

Obama<-cbind(0.8,1,0.8,-0.5,1.5)
ffm2pd(Obama)

# Example of a multivariate normal distribution with 1,000 individuals
E<-rnorm(1000,0,1)
A<-rnorm(1000,0,1)
C<-rnorm(1000,0,1)
N<-rnorm(1000,0,1)
O<-rnorm(1000,0,1)

data<-cbind(E,A,C,N,O)
ffm2pd(data)


```


## References

* Martin Steppan et al. (2019). A Vector Theory of Personality Disorder and their association with the Five Factor Model.
