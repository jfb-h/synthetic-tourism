default:
    @just --list -u

prepare-data:
    Rscript --vanilla  scripts/prepdata.R
    
fit-model:
    Rscript --vanilla scripts/fit-model.R