## ---- means.sizes

meansize <- function(means, sizes, pars) {
  # Purpose: to calculate the power or size of the t-test and
  #          the Mann-Whitney U-test for a variety of different
  #          sample sizes and differences in the means of male
  #          and female heights
  
  # Inputs: means: a vector of the differences in means you want
  #                to calculate the power/size of the tests for
  #         sizes: a vector of the different sample sizes you
  #                want to find the power/size of the tests for
  #         pars: a vector giving the original data means and 
  #               standard deviations and the proportion of male
  #               heights in the sample, labelled "m.mu", "m.sd",
  #               "f.mu", "f.sd" and "rat", respectively
  
  # Outputs: "t.test": a matrix of the powers or sizes of the t-test
  #                    under each scenario provided by the inputs
  #          "mann.whitney": a matrix of the powers or sizes of the 
  #                          Mann-Whitney U-test under each scenario
  #                          provided by the inputs
  
  # Alter the parameter vector pars so that both the male and female
  # sample have the same mean and standard deviation 0.1496324 apart
  # (the same as in the original data)
  pars[1] <- pars[3]
  
  # Create two matrices with columns for each difference in means and 
  # rows for each sample size, one for each test
  s <- length(sizes)
  m <- length(means)
  t <- matrix(nrow = s, ncol = m, dimnames = list(as.list(sizes), 
                                                  as.list(means)))
  mw <- matrix(nrow = s, ncol = m, dimnames = list(as.list(sizes), 
                                                   as.list(means)))
  
  # Now calculate the power or size for each test for each scenario
  # created by each of the inputted means and sample sizes and enter
  # them into the matrices
  for (i in sizes) {
    for (j in means) {
      if (j == 0) {
        t[sizes == i, means == j] <- strength(1000, i, pars + c(j, 0,
                                0, 0, 0), 0, T)$t.size
        mw[sizes == i, means == j] <- strength(1000, i, pars + c(j, 
                                0, 0, 0, 0), 0, T)$mw.size
      }
      if (j != 0) {
        t[sizes == i, means == j] <- strength(1000, i, pars + c(j, 0,
                                      0, 0, 0), 0, F)$t.power
        mw[sizes == i, means == j] <- strength(1000, i, pars + c(j, 
                                      0, 0, 0, 0), 0, F)$mw.power
      }
    }
  }
  
  return(list("t.test" = t, "mann.whitney" = mw))
}
