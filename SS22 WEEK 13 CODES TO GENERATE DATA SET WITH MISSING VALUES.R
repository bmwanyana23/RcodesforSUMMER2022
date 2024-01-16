##### Create some synthetic data with missings #####

set.seed(87654)   # Reproducibility
N <- 1000         # Sample size

# Some random variables
x1 <- round(rnorm(N), 2)
x2 <- round(x1 + rnorm(N, 10, 5))
x3 <- round(runif(N, -100, 20))

# Insert missing values
x1[rbinom(N, 1, 0.2) == 1] <- NA  # 20% missingness
x2[rbinom(N, 1, 0.05) == 1] <- NA # 5% missingness
x3[rbinom(N, 1, 0.7) == 1] <- NA  # 70% missingness

# Indicator for missings (needed later)
x1_miss_ind <- is.na(x1)
x2_miss_ind <- is.na(x2)
x3_miss_ind <- is.na(x3)

# Store variables in a data frame
data <- data.frame(x1, x2, x3)
head(data)        # First 6 rows of our data