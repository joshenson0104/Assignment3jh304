## ---- simulate

simulate <- function(n = 1000, x, pars, seed = 0) {
  # Purpose: to simulate n lots of x heights from a normal distribution
  
  # Inputs: n: the number of simulated sets of data
  #         x: the number of heights to simulate in each set of data
  #         pars: a vector containing the mean and standard deviation of the
  #               male heights and then the female heights, with the 
  #               percentage in decimal form of the heights from the original
  #               data that are from males, labelled "m.mu", "m.sd", "f.mu", 
  #               "f.sd" and "rat", respectively
  #         seed: the seed to set to ensure reproducibility
  
  # Outputs: male.heights: a dataframe of the n lots of simulated male heights
  #          female.heights: a dataframe of the n lots of simulated female
  #                          heights
  
  # Work out the number of male and female heights required to fit the
  # same ratio of male to female heights in the original data to the 
  # desired sample size
  rat <- pars["rat"]
  nm <- as.integer(x * rat)
  nf <- x - nm
  
  # Create dataframes for both the male and the female heights, with enough
  # rows to include each of the n simulated samples and the original sample
  mal <- data.frame(matrix(ncol = nm, nrow = n))
  fem <- data.frame(matrix(ncol = nf, nrow = n))
  
  # Extract the desired mean and sd for the distributions of female and male
  # heights
  m.mu <- pars["m.mu"]
  m.sd <- pars["m.sd"]
  f.mu <- pars["f.mu"]
  f.sd <- pars["f.sd"]
  
  # Simulate n sets of heights using rnorm and input into the two dataframes, 
  # setting the seed to ensure reproducibility
  set.seed(seed)
  for (i in 1 : n) {
    mal[i, ] <- rnorm(nm, m.mu, m.sd)
    fem[i, ] <- rnorm(nf, f.mu, f.sd)
  }
  
  return(list("male.heights" = mal, "female.heights" = fem))
}

##