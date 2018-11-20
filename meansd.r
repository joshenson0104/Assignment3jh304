## ---- means.sds

meansd <- function(means, sds, pars) {
  # Purpose: to calculate the power or size of the t-test and
  #          the Mann-Whitney U-test under various differences
  #          in sample means and standard deviations, for a 
  #          sample size of 100
  
  # Inputs: means: a vector of the differences in means you want
  #                to calculate the power/size of the tests for
  #         sds: a vector of the differences in sds you want to 
  #              calculate the power/size of the tests for
  #         pars: a vector giving the original data means and 
  #               standard deviations and the proportion of male
  #               heights in the sample, labelled "m.mu", "m.sd",
  #               "f.mu", "f.sd" and "rat", respectively
  
  # Outputs: t.test: a matrix or powers/sizes for the t-test with
  #                  columns for each difference in means and rows
  #                  for each difference in sds
  #          mann.whitney: a matrix or powers/sizes for the Mann-
  #                        Whitney U-test with columns for each 
  #                        difference in mean and rows for each 
  #                        difference in sds
  
  # Alter the parameters vector so that the male and female samples
  # have the same means and sds
  pars[1] <- pars[3]
  pars[2] <- pars[4]
  
  # Create two matrices with columns for each difference in means and
  # rows for each difference in sds
  s <- length(sds)
  m <- length(means)
  t <- matrix(nrow = s, ncol = m, dimnames = list(as.list(sds), 
                                                  as.list(means)))
  mw <- matrix(nrow = s, ncol = m, dimnames = list(as.list(sds), 
                                                   as.list(means)))
  
  # Calculate the power or size for each test under each scenario given
  # by the inputs and enter into the matrices
  for (i in sds) {
    for (j in means) {
      if (j == 0) {
        t[sds == i, means == j] <- strength(1000, 100, pars + c(j, i, 0, 
                                                0, 0), 0, T)$t.size
        mw[sds == i, means == j] <- strength(1000, 100, pars + c(j, i, 
                                                0, 0, 0), 0, T)$mw.size
      }
      if (j != 0) {
        t[sds == i, means == j] <- strength(1000, 100, pars + c(j, i, 0,
                                                0, 0), 0, F)$t.power
        mw[sds == i, means == j] <- strength(1000, 100, pars + c(j, i, 0,
                                                0, 0), 0, F)$mw.power
      }
    }
  }
  
  return(list("t.test" = t, "mann.whitney" = mw))
}
