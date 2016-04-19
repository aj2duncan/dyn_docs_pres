#' ---
#' title: "Example of Compiled Notebook"
#' author: "Andrew Duncan"
#' output: html_document
#' ---

#+ setup, include = FALSE
knitr::opts_chunk$set(echo = TRUE, eval = TRUE, comment = NA, message = F, warning = F)

#' ## Baseball Data

# load packages and data
library(Lahman) # Contains baseball data
library(dplyr)
library(ggplot2)

# Calculate batting statistics
Batting = tbl_df(battingStats()) 
Teams = tbl_df(Teams)
Teams = select(Teams, yearID, teamID, franchID)
Batting = left_join(Batting, Teams)
my_fav_team = "BOS"
team_name = TeamsFranchises$franchName[TeamsFranchises$franchID == my_fav_team]
num_hr = 400 # Number of home runs to examine later


# Select my team
my_team = Batting %>%
  filter(franchID == my_fav_team)

# calculate average BA for the team that year
ba_year = my_team %>%
  group_by(yearID) %>%
  summarise(average_ba = mean(BA, na.rm = T)) %>%
  ungroup()

#' Plot the batting average of the `r team_name`

# plot the results
ggplot(data = ba_year, mapping = aes(x = yearID, y = average_ba)) + 
  geom_point() + 
  xlab("Year") + ylab("Mean Batting Average") + 
  ggtitle(paste("Mean Batting Average of the", team_name, sep = " "))

# Examine the number of my players who have hit more than `num_hr` home runs

# Gather the players 
home_runs = my_team %>%
  group_by(playerID) %>%
  summarise(total_hr = sum(HR)) %>%
  filter(total_hr >= num_hr) 

# collect actual player names
players = tbl_df(Master) %>% 
  select(playerID, nameFirst, nameLast)

# join dataframes together and output
home_runs = left_join(home_runs, players) %>%
  mutate(Player = paste(nameFirst, nameLast, sep = " ")) %>%
  select(Player, total_hr) %>% # reordering columns
  arrange(desc(total_hr))

#' The number of players hitting more than `r num_hr` for `r team_name`.

home_runs

