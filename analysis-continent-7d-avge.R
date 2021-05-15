#Create My_theme
My_theme = theme(plot.title = element_text(hjust = 0, size = 8, color = "black", face = "bold"), plot.subtitle = element_text(color = "black", size = 6), plot.caption = element_text(face = "italic", size = 4), axis.title.x = element_blank(), axis.title.y = element_blank())
options(scipen=999)
 
#Americas 7 day average
Americas = filter(data, continent == "Americas") %>% mutate(chge = confirmed-shift(confirmed,1)) %>% group_by(Date) %>% summarise(total = sum(confirmed)) %>% mutate(Americas_chge = total-shift(total,1)) %>% mutate(Americas_7d_ave = rollmean(Americas_chge, 7, fill=NA, align = "right"))
Americas <- within(Americas, rm("total"))
tail(Americas)
Americas_plot <- ggplot(Americas) + geom_col(aes(x = Date, y = Americas_chge), size = 0.01, color = "darkblue", fill = "white") + geom_line(aes(x = Date, y = Americas_7d_ave), size = 1.5, color="red", group = 1) + labs(title = "Covid Change by Continent: Americas", subtitle = "Daily and 7 day rolling average", caption = "Source: JHU, Westpac")  + My_theme
ggsave("figs/Americas.jpg", Americas_plot, height = 3, width = 3, dpi = 180)

#Europe 7 day average
Europe = filter(data, continent == "Europe") %>% mutate(cchge = confirmed-shift(confirmed,1)) %>% group_by(Date) %>% summarise(total = sum(confirmed)) %>% mutate(Europe_chge = total-shift(total,1)) %>% mutate(Europe_7d_ave = rollmean(Europe_chge, 7, fill=NA, align = "right"))
Europe <- within(Europe, rm("total"))
tail(Europe)
Europe_plot <- ggplot(Europe) + geom_col(aes(x = Date, y = Europe_chge), size = 0.01, color = "darkblue", fill = "white") + geom_line(aes(x = Date, y = Europe_7d_ave), size = 1.5, color="red", group = 1) + labs(title = "Covid Change by Continent: Europe", subtitle = "Daily and 7 day rolling average", caption = "Source: JHU, Westpac")  + My_theme
ggsave("figs/Europe.jpg", Europe_plot, height = 3, width = 3, dpi = 180)

#Asia 7 day average
Asia = filter(data, continent == "Asia") %>% mutate(chge = confirmed-shift(confirmed,1)) %>% group_by(Date) %>% summarise(total = sum(confirmed)) %>% mutate(Asia_chge = total-shift(total,1)) %>% mutate(Asia_7d_ave = rollmean(Asia_chge, 7, fill=NA, align = "right"))
Asia <- within(Asia, rm("total"))
tail(Asia)
Asia_plot <- ggplot(Asia) + geom_col(aes(x = Date, y = Asia_chge), size = 0.01, color = "darkblue", fill = "white") + geom_line(aes(x = Date, y = Asia_7d_ave), size = 1.5, color="red", group = 1) + labs(title = "Covid Change by Continent: Asia", subtitle = "Daily and 7 day rolling average", caption = "Source: JHU, Westpac")  + My_theme +ylim(0, 550000)
ggsave("figs/Asia.jpg", Asia_plot, height = 3, width = 3, dpi = 180)

#Africa 7 day average
Africa = filter(data, continent == "Africa") %>% mutate(chge = confirmed-shift(confirmed,1)) %>% group_by(Date) %>% summarise(total = sum(confirmed)) %>% mutate(Africa_chge = total-shift(total,1)) %>% mutate(Africa_7d_ave = rollmean(Africa_chge, 7, fill=NA, align = "right"))
Africa <- within(Africa, rm("total"))
tail(Africa)
Africa_plot <- ggplot(Africa) + geom_col(aes(x = Date, y = Africa_chge), size = 0.01, color = "darkblue", fill = "white") + geom_line(aes(x = Date, y = Africa_7d_ave), size = 1.5, color="red", group = 1) + labs(title = "Covid Change by Continent: Africa", subtitle = "Daily and 7 day rolling average", caption = "Source: JHU, Westpac")  + My_theme
ggsave("figs/Africa.jpg", Africa_plot, height = 3, width = 3, dpi = 180)

#Oceania 7 day average
Oceania = filter(data, continent == "Oceania") %>% mutate(chge = confirmed-shift(confirmed,1)) %>% group_by(Date) %>% summarise(total = sum(confirmed)) %>% mutate(Oceania_chge = total-shift(total,1)) %>% mutate(Oceania_7d_ave = rollmean(Oceania_chge, 7, fill=NA, align = "right"))
Oceania <- within(Oceania, rm("total")) 
tail(Oceania)
Oceania_plot <- ggplot(Oceania) + geom_col(aes(x = Date, y = Oceania_chge), size = 0.01, color = "darkblue", fill = "white") + geom_line(aes(x = Date, y = Oceania_7d_ave), size = 1.5, color="red", group = 1) + labs(title = "Covid Change by Continent: Oceania", subtitle = "Daily and 7 day rolling average", caption = "Source: JHU, Westpac")  + My_theme
ggsave("figs/Oceania.jpg", Oceania_plot, height = 3, width = 3, dpi = 180)

#World 7 day average
Total <- data %>% group_by(Date) %>% summarize(total = sum(confirmed)) %>% mutate(World_chge = total-shift(total,1)) %>% mutate(World_7d_ave = rollmean(World_chge, 7, fill=NA, align = "right")) %>% cbind('country' = 'World')
Total <- within(Total, rm("country", "total"))
tail(Total)
World_plot <- ggplot(Total) + geom_col(aes(x = Date, y = World_chge), size = 0.01, color = "darkblue", fill = "white") + geom_line(aes(x = Date, y = World_7d_ave), size = 1.5, color="red", group = 1) + labs(title = "Covid Change by Continent: World", subtitle = "Daily and 7 day rolling average", caption = "Source: JHU, Westpac")  + My_theme +ylim(0, 1000000)
ggsave("figs/World.jpg", World_plot, height = 3, width = 3, dpi = 180)

#Combined chart
Final_chart <- grid.arrange (Americas_plot, Europe_plot, Asia_plot, Africa_plot, Oceania_plot, World_plot, top = "Covid Case Count Change by Continent", ncol = 2)
ggsave("figs/Global_Covid_Case_Change_Continent.jpg", Final_chart, height = 5, width = 5, dpi = 180)
