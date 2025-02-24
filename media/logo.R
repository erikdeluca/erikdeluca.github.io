library(tidyverse)
library(ggplot2)
text_color = "#f2fbfe"
bg_color = "#023e8aff"
points_color = "#90e0efff"

{
  set.seed(323)
  tibble(
    x = rexp(24, .1),
    # y = exp(-x)
    y = log(x) + rnorm(length(x), 0, .2),
    alpha_points = rnorm(length(x), .7, .1),
    size_points = rnorm(length(x), .7, .05)
  ) |> 
    ggplot() +
    annotate(
      "text",
      x = 19,
      y = .6,
      label = "Erik De Luca",
      size = 19,
      color = text_color,
      family = "Parkinsans"
    ) +
    geom_point(
      aes(x, y, alpha = alpha_points, size = size_points),
      color = points_color,
    ) + 
    # geom_line(
    #   aes(x, y),
    #   alpha = .2, 
    #   color = points_color,
    #   linetype = "dashed"
    # ) +
    scale_y_continuous(
      transform = "log10",
    ) +
    theme_minimal() + 
    theme(
      axis.title = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      panel.grid = element_blank(),
      plot.background = element_rect(fill = bg_color),
      legend.position = "none"
    )
    # ) -> p
    # ggsave("media/cover_linkedin.png", plot = p, width = 1536, height = 768, units = "px")
} 
