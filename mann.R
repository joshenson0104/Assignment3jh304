## ---- mann.whitney

mann <- function(n = 1000, x, pars, seed = 0) {
  # Purpose: to apply the Mann-Whitney test to n sets of x simulated
  #          heights and obtain a p-value for each dataset
  
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
  
  # Simulate n lots of datasets and separate the male and female heights
  sim <- simulate(n = n, x = x, pars = pars, seed = seed)
  mal <- sim$male.heights
  fem <- sim$female.heights
  
  # Create a vector to house the n p-values obtained by applying the Mann-
  # Whitney test to each simulated dataset
  p <- vector("numeric", n)
  
  # Calculate the p-value for each simulated dataset using wilcox.test
  for (i in 1 : n)
    p[i] <- wilcox.test(as.numeric(mal[i, ]), as.numeric(fem[i, ]),
                        "g")$p.value
  
  return("p.values" = p)
}
