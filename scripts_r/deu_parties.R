
#------------------------------------------------------------------------------#
## Libraries -------------------------------------------------------------------
library(tidyverse)
library(here)


#------------------------------------------------------------------------------#
## EU-NED ----------------------------------------------------------------------

#' The European NUTS-Level Election Dataset contains party votes by NUTS3.

# Read in data ----------------------------------------------------------------#
eu_ned_joint <- read.csv(here::here("data_in", "deu_parties", "eu_ned_joint.csv") )

# Filter to DEU, select relevant cols, and get unique values ------------------#
deu_ned <- eu_ned_joint |>
    dplyr::filter(country_code == "DE") |>
    dplyr::select(year, type, party_abbreviation, party_english, party_native,
                  partyfacts_id) |>
    dplyr::distinct()


#------------------------------------------------------------------------------#
## ParlGov ---------------------------------------------------------------------

#' The `ParlGov` data gives us scores of parties along a variety of dimensions, including left-right, libertarian-authoritarian, etc.
#' REF: https://www.parlgov.org/data-info/

# Read in data ----------------------------------------------------------------#
view_party <- read.csv(here::here("data_in", "deu_parties", "view_party.csv") )

# Filter to DEU, select relevant cols, and get unique values ------------------#
deu_parlgov <- view_party |>
    dplyr::filter(country_name_short == "DEU") |>
    dplyr::select(party_name_short, party_name_english, party_name_ascii,
                  party_name, family_name_short, family_name, left_right,
                  state_market, liberty_authority, eu_anti_pro, chess, party_id)
# head(deu_parlgov)


#------------------------------------------------------------------------------#
## CHES ------------------------------------------------------------------------

#' The `CHES` data gives us scores of parties along a variety of dimensions, including left-right, libertarian-authoritarian, immigration, etc.
#' REF: https://www.chesdata.eu/ches-europe

# Read in data ----------------------------------------------------------------#
ches <- read.csv(here::here("data_in", "deu_parties", "1999-2019_CHES_dataset_means(v3).csv") )

# Filter to DEU, select relevant cols, and get unique values ------------------#
deu_ches <- ches |>
    dplyr::filter(country == 3) |>
    dplyr::select(year, party_id, party, immigrate_policy, immigrate_salience, 
    immigrate_dissent, multiculturalism, multicult_salience, multicult_dissent)
    

#------------------------------------------------------------------------------#
## PartyFacts ------------------------------------------------------------------

#' The `PartyFacts` dataset provides us with a dictionary to convert the party IDs from `EU-NED` into the IDs from `ParlGov`.
#' REF: https://partyfacts.herokuapp.com/download/

# Read in data ----------------------------------------------------------------#
partyfacts_external_parties <- read.csv(
    here::here("data_in", "deu_parties", "partyfacts-external-parties.csv") )

# Filter to DEU, select relevant cols, and get unique values ------------------#
deu_partyfacts <- partyfacts_external_parties |>
    dplyr::filter(country == "DEU"
                  & dataset_key == "parlgov") |>
    dplyr::select(dataset_party_id, name_short, name, name_english, external_id,
                  partyfacts_id)


#------------------------------------------------------------------------------#
## Merge -----------------------------------------------------------------------
deu_parties <- deu_ned |>
    dplyr::left_join(
        y = deu_partyfacts,
        by = "partyfacts_id") |>
    dplyr::mutate(dataset_party_id = as.integer(dataset_party_id) ) |>
    dplyr::left_join(
        y = deu_parlgov,
        by = c("dataset_party_id" = "party_id") )

# Write to disk
readr::write_csv(x = deu_parties, file = here::here("data_out", "deu_parties.csv"))



