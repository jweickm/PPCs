data {
  int<lower=0> N;
  real<lower=0> epsilon_alpha[2];
  real<lower=0> epsilon_beta[2];
  real<lower=0> epsilon_sigma[2];
}

parameters {
}

model {
}

generated quantities {
  vector[N] height_bar;  
  real alpha = normal_rng(epsilon_alpha[1], epsilon_alpha[2]);
  real beta  = normal_rng(epsilon_beta[1], epsilon_beta[2]);
  real sigma = cauchy_rng(epsilon_sigma[1], epsilon_sigma[2]);
  
  for (n in 1:N) {
      height_bar[n] = normal_rng(alpha + beta, fabs(sigma));
  }
}

