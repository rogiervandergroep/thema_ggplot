# Dataframe aanmaken in R

source(
  "https://raw.githubusercontent.com/rogiervandergroep/thema_ggplot/main/01_scripts/script_ggplot_theme.R"
)


data_voorbeeld <- data.frame(
  week = c(
    "week 1",
    "week 1",
    "week 1",
    "week 1",
    "week 1",
    "week 1",
    "week 1",
    "week 1",
    "week 1",
    "week 1",
    "week 2",
    "week 2",
    "week 2",
    "week 2",
    "week 2",
    "week 2",
    "week 2",
    "week 2",
    "week 2",
    "week 2"
  ),

  dag = c(
    "ma",
    "ma",
    "di",
    "di",
    "wo",
    "wo",
    "do",
    "do",
    "vrij",
    "vrij",
    "ma",
    "ma",
    "di",
    "di",
    "wo",
    "wo",
    "do",
    "do",
    "vrij",
    "vrij"
  ),

  meetmoment = c(
    "1e keer",
    "2e keer",
    "1e keer",
    "2e keer",
    "1e keer",
    "2e keer",
    "1e keer",
    "2e keer",
    "1e keer",
    "2e keer",
    "1e keer",
    "2e keer",
    "1e keer",
    "2e keer",
    "1e keer",
    "2e keer",
    "1e keer",
    "2e keer",
    "1e keer",
    "2e keer"
  ),

  waarde = c(
    5,
    5,
    6,
    6,
    7,
    7,
    8,
    8,
    18,
    18,
    9,
    9,
    10,
    10,
    11,
    11,
    12,
    12,
    13,
    13
  )
)


dag_levels <- c("ma", "di", "wo", "do", "vrij", "za", "zo")

data_voorbeeld |>

  my_plot_vertical(
    y_var = waarde,
    x_var = fct_relevel(dag, dag_levels),
    fill_var = fct_rev(meetmoment),
    color_var = blauw_pal[c(1, 6)]
  ) +
  facet_wrap(~week)


data_voorbeeld |>

  my_plot_horizontal(
    x_var = waarde,
    y_var = fct_rev(fct_relevel(dag, dag_levels)),
    fill_var = meetmoment,
    color_var = blauw_pal[c(1, 6)]
  ) +
  facet_wrap(~week)
