default:
    @just --list -u

prepare-data:
    Rscript --vanilla  build/prepdata.R
    
plot-timeseries:
    Rscript --vanilla scripts/descriptives.R

fit-model:
    Rscript --vanilla scripts/fit-model.R
    
run-loo:
    Rscript --vanilla scripts/leave-one-out.R
    
run: prepare-data plot-timeseries fit-model run-loo