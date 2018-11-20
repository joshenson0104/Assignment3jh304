# Assignment 3 Josh Henson 160001522

## Abstract

## Methods
Having chosen the database on which to conduct our study, we first investigated the properties of the original data in order to gain an insight into the properties that the data holds. In doing this we obtained the original sample means and standard deviations of the male and the female heights along with the proportion of the heights that were from males, which combine to allow us to accurately simulate datasets with similar properties.

The two tests we chose to conduct our investigation on were the independent sample t-test and the Mann-Whitney U-test. The parametric test of choice fits the data well, since it is designed to assess whether the means of two independent samples are likely to be the same or not. The non-parametric test chosen is also well suited to the situation, as it serves to decide whether the means of two samples from the same populations are equal or not.

To conduct the test, we first had to use Monte Carlo simulations to simulate datasets with given means and standard deviations for the male and female heights, using the Normal distribution to obtain the heights. Once we had the simulations, say 1000 different datasets, we then had to apply both the t-test and the Mann-Whitley U-test to each of the sets and obtain a p-value for how likely it is that the heights generated for males and for females have the same means.

To calculate the power or size of each test, we first had to determine whether the null hypothesis (that males, on average, are not taller than females) was true or false for the given scenario. If the simulated data generated had the same means for the female and male heights, then the null hypothesis is known to be true, and so the size of the tests was calculated. If the simulated datasets were generated using a higher mean for the male heights than the female heights, then the null hypothesis is known to be false, and so the power of each test is calculated.

The size represents the probability that the null hypothesis is incorrectly rejected given that it is true, and the power represents the probability that the null hypothesis is correctly rejected given that it is false. Both were calculated by finding the proportion of p-values given by each test for the simulated datasets that were below 0.05, and so would cause the null hypothesis to be rejected assuming a 5% significance level.

This method could be used under different scenarios to test how the power or size of each test changed given the situation; in this case we calculated the powers and sizes for a variety of means and standard deviations for the distributions from which the data was generated, as well as a range of sample sizes.

## Results
Below are the results tables showing how the power and size of both the t-test and te Mann-Whitney U-test are affected by the difference in sample means, difference in sample standard deviation (and so by extension variance) and the sample size.

### Tables showing the relationship of power and size for the t-test and the Mann-Whitney U-test with sample size and the difference in sample means

| t-test | Difference in Means |
| ------ | ---- |
| Sample Size | --- |


## Discussion

## Conclusion

## Appendix

## References
