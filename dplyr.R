data<-read.csv("per.csv",header = TRUE)
View(data)
str(data)

library(dplyr)

#the function of select
select(data, Zmyr)
select(data, Zmyr, Zcyr,gender)
select(data, 1:3)
select(data, starts_with("Z"))

arrange(data, grade)

library(ggplot2) 
library(gganimate)
theme_set(theme_bw())

library(gapminder) 
head(gapminder)

p <- ggplot(
  gapminder, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")
p

p + transition_time(year) + 
  labs(title = "Year: {frame_time}")
p + facet_wrap(~continent) +
  transition_time(year) +
  labs(title = "Year: {frame_time}")

p + transition_time(year) +
  labs(title = "Year: {frame_time}") +
  view_follow(fixed_y = TRUE)

p + transition_time(year) +
  labs(title = "Year: {frame_time}") +
  shadow_wake(wake_length = 0.1, alpha = FALSE)


p + transition_time(year) +
  labs(title = "Year: {frame_time}") +
  shadow_mark(alpha = 0.3, size = 0.5)

p <- ggplot(
  airquality,
  aes(Day, Temp, group = Month, color = factor(Month))
) +
  geom_line() +
  scale_color_viridis_d() +
  labs(x = "Day of Month", y = "Temperature") +
  theme(legend.position = "top")
p

p + transition_reveal(Day)

p + 
  geom_point() +
  transition_reveal(Day)


library(dplyr)
mean.temp <- airquality %>%
  group_by(Month) %>%
  summarise(Temp = mean(Temp))
mean.temp

p <- ggplot(mean.temp, aes(Month, Temp, fill = Temp)) +
  geom_col() +
  scale_fill_distiller(palette = "Reds", direction = 1) +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(color = "white"),
    panel.ontop = TRUE
  )
P

p + transition_states(Month, wrap = FALSE) +
  shadow_mark()

p + transition_states(Month, wrap = FALSE) +
  shadow_mark() +
  enter_grow() +
  enter_fade()

