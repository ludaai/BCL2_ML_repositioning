# BCL2_ML_repositioning
# Synthetic Inference Example

This repository provides a minimal, fully reproducible example for running
inference with a pre-trained LightGBM model using synthetic input data.

Due to intellectual property (IP) and patent restrictions, the original
training and test datasets cannot be shared. Instead, we provide a synthetic
input dataset that matches the feature schema used by the trained model, so
that the inference pipeline can be reproduced end-to-end.

## Files
- `lightgbm_model.rds`  
  Pre-trained LightGBM model.
- `selected_vars.rds`  
  Character vector of feature names (PubchemFP variables) used during model training.
  This file defines the exact feature schema expected by the model.
- `synthetic_example.R`  
  Generates a synthetic input dataset (`example_input.csv`) based on the feature list
  stored in `selected_vars.rds`.
- `predict_example.R`  
  Loads the trained model and the synthetic input, runs inference, and writes the
  results to `predictions.csv`.
- `example_input.csv`  
  Synthetic input data generated for demonstration purposes only.

## How to run
1. Generate synthetic input:
   source("synthetic_example.R")
2. Run prediction:
   source("predict_example.R")

After running the R scripts, a file named predictions.csv will be created,
containing predicted probabilities and class labels (active / inactive).

## Notes
The synthetic data are generated solely for demonstration and reproducibility
of the inference code and do not represent real compounds or experimental data.

Model performance metrics are not reported here, as the synthetic data do not
reflect the true data distribution.


