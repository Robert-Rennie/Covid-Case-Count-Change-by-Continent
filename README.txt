We analyse Covid case count change, calculate daily change and 7 day moving average summed by continent and plot a summary chart

download-data.R - downloads data from the JHU CSSE Novel Coronavirus(COVID-19) Cases github page, adds Continents to the data so that the data can be summed.

Analysis-continent-7d-avge.R then calculates daily changes and the the 7 day moving average of that change, creates a plot for each continent, which is saved to the figs directory and then arranges all plots into a single plot and saves that plot as a JPG to the figs directory.
