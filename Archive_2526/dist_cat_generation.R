### Script to produce forecasts for the FluSight-dist_cat model, a categorical target baseline that assigns a fixed probability distribution across categories:
###       0.05 to large decrease and large increase
###       0.20 decrease and increase
###       0.50 stable

# Packages
library(dplyr)
library(lubridate)
library(readr)

# Template
temp_path <- paste0("C:/Users/",Sys.info()["user"],"/Desktop/GitHub/Flusight-baseline/weekly-submission/forecasts/Flusight-equal_cat/2024-04-13-FluSight-equal_cat.csv")
flat_cat_template <- read.csv(temp_path,  stringsAsFactors = FALSE)

# Find next Saturday
(nsat<-today()+days(7-wday(today())))

# Category probabilities
dist_probs <- c(
  large_decrease = 0.05,
  decrease = 0.20,
  stable = 0.50,
  increase = 0.20,
  large_increase = 0.05)

# Update template
dist_cat_template <- flat_cat_template %>%
  mutate(model_id = "FluSight-dist_cat",
    reference_date = as.Date(nsat),
    target_end_date = reference_date + weeks(horizon),
    value = dist_probs[output_type_id]) %>% 
  select(-model_id)


# Write file
out_file <- file.path(paste0("C:/Users/", Sys.info()["user"],"/Desktop/GitHub/FluSight-forecast-hub/model-output/FluSight-dist_cat"), paste0(as.Date(nsat), "-FluSight-dist_cat.csv"))

dir.create(dirname(out_file), recursive = TRUE, showWarnings = FALSE)

readr::write_csv(dist_cat_template, out_file)




##2024-25 dates
# ref_dates <- seq.Date(
#   from = as.Date("2024-11-23"),
#   to   = as.Date("2025-05-31"),
#   by   = "week"
# )
# 
# ##2025-26 dates
# ref_dates <- seq.Date(
#   from = as.Date("2025-11-22"),
#   to   = as.Date("2026-05-30"),
#   by   = "week"
# )


##Loops on previous dates

# Desired distribution
# dist_probs <- c(
#   large_decrease = 0.05,
#   decrease = 0.20,
#   stable = 0.50,
#   increase = 0.20,
#   large_increase = 0.05
# )
# 
# # Output directory
# out_dir <- "../../FluSight-forecast-hub/model-output/FluSight-dist_cat"
# dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
# 
# # Loop
# for (current_ref_date in ref_dates) {
#   
#   date_str <- as.Date(current_ref_date)
#   message("==== ", date_str, " ====")
#   
#   # Build forecast
#   dist_cat_template <- flat_cat_template %>%
#     mutate(
#       model_id = "FluSight-dist_cat",
#       reference_date = date_str,
#       target_end_date = reference_date + weeks(horizon),
#       value = dist_probs[output_type_id]
#     ) %>% select(-model_id)
#   
#   # Safety check (optional but helpful)
#   if (any(is.na(dist_cat_template$value))) {
#     stop("Some output_type_id values did not match dist_probs")
#   }
#   
#   # Write file
#   out_file <- file.path(
#     out_dir,
#     paste0(date_str, "-FluSight-dist_cat.csv")
#   )
#   
#   write_csv(dist_cat_template, out_file)
#   
#   message("Wrote: ", out_file)
# }
