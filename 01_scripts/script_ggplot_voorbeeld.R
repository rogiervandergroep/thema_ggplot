# Dataframe aanmaken in R

## lees alle ggplot scripts in
source(
  "https://raw.githubusercontent.com/rogiervandergroep/thema_ggplot/main/01_scripts/script_ggplot_theme.R"
)

## een voorbeeldtabel
source(
  "https://raw.githubusercontent.com/rogiervandergroep/thema_ggplot/main/01_scripts/script_ggplot_tabel.R"
)

# fixeer de weekdagen anders krijg je  alfabetische volgorde
dag_levels <- c("ma", "di", "wo", "do", "vrij", "za", "zo")


## figuur met vertikale kolommen
data_voorbeeld |>
  my_plot_vertical(
    y_var = waarde,
    x_var = fct_relevel(dag, dag_levels),
    fill_var = fct_rev(meetmoment),
    color_var = blauw_pal[c(1, 6)]
  ) +
  facet_wrap(~week)


### figuur met vertikale kolommen zonder facet
data_voorbeeld |>
  filter(week == 'week 1') |>
  my_plot_vertical(
    y_var = waarde,
    x_var = fct_relevel(dag, dag_levels),
    fill_var = fct_rev(meetmoment),
    color_var = grijs_pal[c(1, 6)]
  )


## figuur met horizontale kolommen
data_voorbeeld |>
  my_plot_horizontal(
    x_var = waarde,
    y_var = fct_rev(fct_relevel(dag, dag_levels)),
    fill_var = meetmoment,
    color_var = wild_pal[c(3, 6)]
  ) +
  facet_wrap(~week)


# svg files zijn mooier dan png omdat het vector-bestanden zijn
# met ggsave sla de laatste figuur op
library(svglite)

# ggsave("map_met_plaatjes/figuur_1.svg", width = 10, height = 4)
