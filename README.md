# 02025956_LR: Research Project in Mathematics (MSci) [Code Repository]

## File Structure

- `events.csv` - extracted hurricane events
- `data_extraction.py` - scraper tool
- `grib_to_table.ipynb` - .grib to .csv file conversion
- `filter_extreme.ipynb` - extreme value filtering
- `first_adjacency.ipynb` - first order adjacency structure
- `second_adjacency.R` - second order adjacency structure
- `run.Rmd` - inference procedure
- `output_processing.ipynb` - figures and convergence statistics
- `traceplot_postpredictivechecks.ipynb` - traceplots and posterior predictive checks

### Folders

- `models/` – Stan code for all models
- `run_convergence/` – Convergence statistics
- `run_output/` – Output figures

### Model Output Details

Model output corresponds to data from Hurricane Alma, 11:00–13:00 UTC, June 8, 1966.  
- **First variable:** Total precipitation  
- **Second variable (and filtering variable):** Wind speed at 10 metres above the surface

## License

This project is licensed under the [MIT License](LICENSE).