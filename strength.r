## ---- strength

strength <- function(n = 1000, x, pars, seed = 0, h0) {
  # Purpose: to calculate the power or size of the t-test and the Mann-
  #          Whitney U-test under different scenarios, depending on
  #          whether the null hypothesis (H0) is false or true
  
  # Inputs: n: the number of simulated sets of data
  #         x: the number of heights to simulate in each set of data
  #         pars: a vector containing the mean and standard deviation of the
  #               male heights and then the female heights, with the 
  #               percentage in decimal form of the heights from the original
  #               data that are from males, labelled "m.mu", "m.sd", "f.mu", 
  #               "f.sd" and "rat", respectively
  #         seed: the seed to set to ensure reproducibility
  #         h0: a logical variable that is TRUE if the null hypothesis is known
  #             to be true, or FALSE if it is known to be false, and dictates
  #             whether the size or power of each test is calculated, 
  #             respectively
  
  # Outputs: t.size: the size of the t-test under the given scenario
  #          t.power: the power of the t-test under the given scenario
  #          mw.size: the size of the Mann-Whitney U-test under the given
  #                   scenario
  #          mw.power: the power of the Mann-Whitney U-test under the given
  #                    scenario
  
  # Apply both the t-test and the Mann-Whitney U-test to n simulated datasets 
  # and store the p-values given by the tests
  t.p <- t(n = n, x = x, pars = pars, seed = seed)
  m.p <- mann(n = n, x = x, pars = pars, seed = seed)
  
  # Find the proportion of p-values that are under 0.05 and so would cause us to 
  # reject the null hypothesis at a 5% significance level, whether correctly or 
  # not
  tpr <- length(which(t.p <= 0.05)) / length(t.p)
  mpr <- length(which(m.p <= 0.05)) / length(m.p)
  
  # If h0 is TRUE, then this is the calculated size
  if (h0 == T)
    return(list("t.size" = tpr, "mw.size" = mpr))
  
  # If h0 is FALSE, then this is the calculated power
  if (h0 == F)
    return(list("t.power" = tpr, "mw.power" = mpr))
}
