library(lightgbm)
library(dplyr)

model_path  <- "lightgbm_model.rds"
input_path  <- "example_input.csv"
output_path <- "predictions.csv"

model <- readRDS(model_path)
df <- read.csv(input_path, check.names = FALSE)

selected_vars <- readRDS("selected_vars.rds")

X <- df %>% select(all_of(selected_vars)) %>% as.matrix()

# predict 
# model is a trained lgb.Booster object
pred_prob <- predict(model, X)
# Classification threshold used in the manuscript
threshold <- 0.5
pred_class <- ifelse(pred_prob >= threshold, 1, 0)
group <- ifelse(pred_class == 1, "active", "inactive")

# Save output
out <- data.frame(
  sample_id  = if ("sample_id" %in% names(df)) df$sample_id else sprintf("S%03d", seq_len(nrow(df))),
  pred_prob  = as.numeric(pred_prob),
  pred_class = pred_class,
  group      = group,
  stringsAsFactors = FALSE
)

write.csv(out, output_path, row.names = FALSE)
