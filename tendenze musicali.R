# Libraries
library(ggplot2)
library(dplyr)
library(plotly)
library(ggplotly)
library(hrbrthemes)

# Load dataset from github
data <- read.csv("csv/musica.csv")

f <- list(
  family = "Arial, monospace",
  size = 14,
  color = "#7f7f7f"
)
x <- list(
  title = "Anni",
  titlefont = f
)
y <- list(
  title = "Uscite album",
  titlefont = f
)

# annotations
a <- list(
  text = "Giovanni Pietro  Vitali - UVSQ-Paris-Saclay (giovanni.vitali@uvsq.fr)",
  
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.8,
  y = 0.985,
  showarrow = FALSE
)

b <- list(
  text = "",
  font = f,
  xref = "paper",
  yref = "paper",
  yanchor = "bottom",
  xanchor = "center",
  align = "center",
  x = 0.5,
  y = 0.95,
  showarrow = FALSE
)


# Area chart with 2 groups
p <- plot_ly(x = data$anni, 
             y = data$cantautori,
             type="scatter", 
             mode="markers", 
             fill = "tozeroy",
             name = "Cantautori") 
  
p <- p %>% add_trace(y = data$gruppi, 
                     name = "Gruppi musicali") 

p <- p %>% layout(xaxis = x, 
                  yaxis = y, 
                  title= "Uscite album musica impegnata dagli anni '60 al 2018", 
                  annotations = list(a))

p
