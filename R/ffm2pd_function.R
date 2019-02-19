#' Five Factor Model (FFM) to Personality Disorder (PD)
#'
#' This function calculates Personality Disorder Risk for one or more FFM personality profiles. The calculation is based on two earlier studies: (1) A meta-analysis by Samuel and Widiger (2008) on the average FFM scores for each DSM Personality Disorder; (2) a recent study by Steppan et al. (2019) on a mathematical link function between the FFM and Personality Disorders. Personality Disorder risk is calculated based on a vector model. Given a multivariate normal distribution of the Five Factor Model, the average distance of individuals to personality disorder prototype vectors can be calculated. Individuals which are significantly closer to a prototype have a higher risk of a given personality disorder.
#' @param ffmprofiles A dataframe with 5 columns (Order: Extraversion-Agreeableness-Concscientiousness-Neuroticism-Openness) and n rows (n=number of individuals). Values represent z Scores on each FFM dimension.
#' @keywords FFM, Personality Disorder, DSM
#' @export

#' @references
#' Samuel, D. B., & Widiger, T. A. (2008). A meta-analytic review of the relationships between the five-factor model and DSM-IV-TR personality disorders: A facet level analysis. Clinical psychology review, 28(8), 1326-1342.
#' @import stats utils



ffm2pd <- function(ffmprofiles)
{



  if(ncol(ffmprofiles)==5){

    if(nrow(ffmprofiles)>0){

      ExtraversionZ<-ffmprofiles[,1]
      AgreeablenessZ<-ffmprofiles[,2]
      ConscientiousnessZ<-ffmprofiles[,3]
      NeuroticismZ<-ffmprofiles[,4]
      OpennessZ<-ffmprofiles[,5]

      result<-data.frame(matrix(NA,nrow=nrow(ffmprofiles),ncol=11))

      a<-system.file("extdata","adjectives.csv",package="ffm2pd")
      adjectives<-read.csv(a,sep=";")

      p<-system.file("extdata","pdmeanvectordist.csv",package="ffm2pd")
      pdmeanvectordist<-read.csv(p,sep=",")


      me<-system.file("extdata","metaanalyse.csv",package="ffm2pd")
      metaanalyse<-read.csv(me,sep=";")

      d<-adjectives
      d<-data.frame(d)

      m<-pdmeanvectordist

      meta<-metaanalyse


      for (i in 1:nrow(ffmprofiles)){





        dis <- as.matrix(as.numeric(((d[,2]-AgreeablenessZ[i])^2 + (d[,3]-ExtraversionZ[i])^2 +(d[,4]-ConscientiousnessZ[i])^2 + (d[,5]-NeuroticismZ[i])^2 + (d[,6]-OpennessZ[i])^2)))

        pd<-  as.matrix(as.numeric(((meta[,2]*8-ExtraversionZ[i])^2 + (meta[,3]*8-OpennessZ[i])^2 +(meta[,4]*8-NeuroticismZ[i])^2 + (meta[,5]*8-ConscientiousnessZ[i])^2 + (meta[,6]*8-AgreeablenessZ[i])^2)))

        pdnorm<- (1-pnorm(as.matrix(as.numeric(((pd-m[,3])/m[,4])))))*100



        result[i,1:11]<-pdnorm

      }
      names(result)<-m[,2]
      return(result)




    }
    else {
      print("You need to provide at least one FFM profile")
    }
  }
  else {
    print("Your data needs exactly 5 columns of the order E-A-C-N-O (Extraversion, Agreeabeleness, Conscientiousness, Neuroticism, Openness")
  }

}


