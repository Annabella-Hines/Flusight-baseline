# Flusight-baseline

The code in this repository creates the `Flusight-baseline` model and `Flusight-seasonal-baseline` model in the [Flusight-forecast-hub](https://github.com/cdcepi/FluSight-forecast-hub) repository.

## Dependencies

The baseline model is implemented in R, and has the following package dependencies:

 - Packages available on CRAN:
    - `purrr`
    - `dplyr`
    - `readr`
    - `tidyr`
    - `lubridate`
    - `ggplot2`
    - `ggforce`
 - Other packages, to be installed via GitHub:
    - `covidHubUtils`: See this package's [documentation page](http://reichlab.io/covidHubUtils/) for installation instructions.
    - `simplets`: Install from GitHub using the command `devtools::install_github("reichlab/simplets")`

## Running the baseline model

The script `flusight-baseline.R` creates the Flusight-baseline forecasts. It can be run, for example, via

```
Rscript flusight-baseline.R
```

The script `flusight-seasonal-baseline.R` creates the Flusight-seasonal-baseline forecasts.

Baseline forecasts will be saved in the directory `weekly-submission/forecasts/Flusight-baseline`.

Seasonal baseline forecasts will be saved in the directory `weekly-submission/forecasts/Flusight-seasonal-baseline`.

## Public Domain Standard Notice
This repository constitutes a work of the United States Government and is not
subject to domestic copyright protection under 17 USC § 105. This repository is in
the public domain within the United States, and copyright and related rights in
the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).
All contributions to this repository will be released under the CC0 dedication. By
submitting a pull request you are agreeing to comply with this waiver of
copyright interest.

## Privacy Standard Notice
This repository contains only non-sensitive, publicly available data and
information. For more information about CDC's privacy policy, please visit [http://www.cdc.gov/other/privacy.html](https://www.cdc.gov/other/privacy.html).

## Contributing Standard Notice
Anyone is encouraged to contribute to the repository by [forking](https://help.github.com/articles/fork-a-repo)
and submitting a pull request. (If you are new to GitHub, you might start with a
[basic tutorial](https://help.github.com/articles/set-up-git).) 

All comments, messages, pull requests, and other submissions received through
CDC including this GitHub page may be subject to applicable federal law, including but not limited to the Federal Records Act, and may be archived. Learn more at [http://www.cdc.gov/other/privacy.html](http://www.cdc.gov/other/privacy.html).


## Records Management Standard Notice
This repository is not a source of government records, but is a copy to increase
collaboration and collaborative potential. All government records will be
published through the [CDC web site](http://www.cdc.gov).
