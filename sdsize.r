## ---- sds.sizes

sdsize <- function(sds, sizes, pars) {
  # Purpose: to calculate the power of the t-test and the Mann-
  #          -Whitney U-test under various differences in sample
  #          standard deviations and sample sizes and a difference
  #          of 1 in the sample mean
  
  # Inputs: sds: a vector of the differences in standard deviations
  #              which you want to find the power of the tests
  #         sizes: a vector of the different sample sizes you
  #                want to find the power of the tests for
  #         pars: a vector giving the original data means and 
  #               standard deviations and the proportion of male
  #               heights in the sample, labelled "m.mu", "m.sd",
  #               "f.mu", "f.sd" and "rat", respectively
  
  # Outputs: "t.test": a matrix of the powers of the t-test
  #                    under each scenario provided by the inputs
  #          "mann.whitney": a matrix of the powers of the 
  #                          Mann-Whitney U-test under each scenario
  #                          provided by the inputs
  
  # Alter the parameter vector so that the male and female height samples
  # have a difference in means of 1 and the same sd
  pars[1] <- pars[3] + 1
  pars[2] <- pars[4]
  
  # Create two matrices with columns for each difference in sd and rows
  # for each sample size, one for each test
  s <- length(sizes)
  d <- length(sds)
  t <- matrix(nrow = s, ncol = d, dimnames = list(as.list(sizes),
                                                  as.list(sds)))
  mw <- matrix(nrow = s, ncol = d, dimnames = list(as.list(sizes),
                                                   as.list(sds)))
  
  # Calculate the power of both tests under each scenario provided by the
  # inputs and enter them into the matrices
  for (i in sizes) {
    for (j in sds) {
      t[sizes == i, sds == j] <- strength(1000, i, pars + c(0, j, 0, 0, 0),
                                          0, F)$t.power
      mw[sizes == i, sds == j] <- strength(1000, i, pars + c(0, j, 0, 0, 0),
                                           0, F)$mw.power
    }
  }
  
  return(list("t.test" = t, "mann.whitney" = mw))
}
