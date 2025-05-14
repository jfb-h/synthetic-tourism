default:
    @just --list -u

prepare-data:
    Rscript --vanilla  build/prepdata.R
    
fit-model:
    Rscript --vanilla scripts/fit-model.R