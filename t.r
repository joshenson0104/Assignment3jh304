## ---- t.test

t <- function(n = 1000, x, pars, seed = 0) {
  # Purpose: to apply the t-test to each of the n simulated datasets,
  #          and to find the proportion that give a p-value that would
  #          reject the null hypothesis, whether correctly or not
  
  # Inputs: n: the number of simulated sets of data
  #         x: the number of heights to simulate in each set of data
  #         pars: a vector containing the mean and standard deviation of the
  #               male heights and then the female heights, with the 
  #               percentage in decimal form of the heights from the original
  #               data that are from males, labelled "m.mu", "m.sd", "f.mu", 
  #               "f.sd" and "rat", respectively
  #         seed: the seed to set to ensure reproducibility
  
  # Outputs: p.values: a vector of the n p-values generated from the 
  #                    t-test applied to each of the simulated datasets
  
  # Simulate n lots of x heights and separate into male and female heights
  sim <- simulate(n = n, x = x, pars = pars, seed = seed)
  mal <- sim$male.heights
  fem <- sim$female.heights
  
  # Create a vector to house each of the p-values obtained from the t-test
  p <- vector("numeric", n)
  
  # Find the p-value from applying the t-test to each set of simulated data
  for (i in 1 : n)
    p[i] <- t.test(mal[i, ], fem[i, ], "g")$p.value
  
  return("p.values" = p)
}
