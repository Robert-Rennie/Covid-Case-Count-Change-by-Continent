#Join US and EU data 
Covid_data_file <- merge(Americas, Europe, by = 'Date') 
tail(Covid_data_file)
Covid_data_file<- Covid_data_file %>% right_join(Asia, by = 'Date') %>% right_join(Africa, by = 'Date') %>% right_join(Oceania, by = 'Date') %>% right_join(Total, by = 'Date')
tail(Covid_data_file)

#save data file for inspection/ use elsewhere and then melt for charts
write.csv(Covid_data_file, "data/Covid-Case-Count-by-Continent.csv", row.names = FALSE)

