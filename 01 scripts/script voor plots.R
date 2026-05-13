library(tidyverse)
library(patchwork)
library(svglite)
library(scales)

theme_phd_kitten <- function(
  orientation = "vertical",
  legend_position = "bottom",
  drop_axis_titles = F
) {
  grDevices::windowsFonts(
    `Amsterdam Sans` = grDevices::windowsFont("Amsterdam Sans")
  )
  font <- "Amsterdam Sans"
  theme <- theme_bw() +
    theme(
      axis.text = element_text(family = font, size = 13),
      plot.caption = element_text(family = font, size = 14),
      axis.title = element_text(family = font, hjust = 1, size = 13),
      plot.subtitle = element_text(family = font, size = 15),
      legend.text = element_text(family = font, size = 12),
      plot.title = element_text(family = font, lineheight = 1.2, size = 15),
      panel.grid.minor = element_blank(),
      strip.background = element_blank(),
      legend.title = element_blank(),
      axis.ticks.y = element_blank(),
      axis.ticks.x = element_blank(),
      legend.position = legend_position,
      panel.border = element_rect(fill = "transparent", color = NA),
      strip.text = element_text(
        color = "black",
        family = font,
        face = "bold",
        size = 15
      )
    )
  if (orientation %in% c("vertical", "v")) {
    theme <- theme + theme(panel.grid.major.x = element_blank())
  } else if (orientation %in% c("horizontal", "h")) {
    theme <- theme + theme(panel.grid.major.y = element_blank())
  }
  if (drop_axis_titles) {
    theme <- theme +
      theme(axis.title.x = element_blank(), axis.title.y = element_blank())
  }
  return(theme)
}


wild_pal <- c(
  "#004699",
  "#009de6",
  "#53b361",
  "#bed200",
  "#ffe600",
  "#ff9100",
  "#ec0000"
)

grijs_pal <- c(
  "#767676",
  "#848484",
  "#939393",
  "#a1a1a1",
  "#b0b0b0",
  "#c0c0c0",
  "#cfcfcf",
  "#dfdfdf",
  "#efefef"
)


blauw_pal <- c(
  "#004699",
  "#3858a4",
  "#566bb0",
  "#707ebb",
  "#8992c6",
  "#a1a7d2",
  "#b8bcdd",
  "#d0d2e8",
  "#e7e8f4",
  "#e6e6e6"
)

grDevices::windowsFonts(
  "Amsterdam Sans" = grDevices::windowsFont("Amsterdam Sans")
)
font <- "Amsterdam Sans"


## figuur verticaal met waardes naast elkaar ---
my_plot_vertical <- function(
  x,
  x_var,
  y_var,
  fill_var,
  color_var,
  guide_nr = 1
) {
  hcl <- farver::decode_colour(color_var, "rgb", "hcl")

  label_col <- ifelse(hcl[, "l"] < 50, "black", "white")

  x |>
    ggplot(aes(
      x = {{ x_var }},
      y = {{ y_var }},
      group = fct_rev({{ fill_var }}),
      fill = fct_rev({{ fill_var }})
    )) +
    geom_col(position = "dodge") +
    geom_text(
      aes(
        y = 0.8 * {{ y_var }},
        label = {{ y_var }},
        color = {{ fill_var }},
      ),
      size = 4.5,
      position = position_dodge(0.9),
      family = font,
      fontface = "bold",
      lineheight = 0.8
    ) +

    labs(
      title = NULL,
      x = NULL,
      y = NULL
    ) +

    theme_phd_kitten(legend_position = "bottom") +
    scale_fill_manual(
      name = NULL,
      values = color_var
    ) +

    scale_color_manual(
      name = NULL,
      values = label_col
    ) +

    guides(
      fill = guide_legend(
        nrow = guide_nr,
        reverse = T
      ),
      colour = "none"
    )
}


## figuur verticaal met waardes naast elkaar ---
my_plot_horizontal <- function(
  x,
  x_var,
  y_var,
  fill_var,
  color_var,
  guide_nr = 2
) {
  hcl <- farver::decode_colour(color_var, "rgb", "hcl")

  label_col <- ifelse(hcl[, "l"] < 50, "black", "white")

  x |>
    ggplot(aes(
      x = {{ x_var }},
      y = {{ y_var }},
      group = fct_rev({{ fill_var }}),
      fill = fct_rev({{ fill_var }})
    )) +
    geom_col(position = "dodge") +
    geom_text(
      aes(
        x = 0.8 * {{ x_var }},
        label = {{ x_var }},
        color = {{ fill_var }},
      ),
      size = 4.5,
      position = position_dodge(0.9),
      family = font,
      fontface = "bold",
      lineheight = 0.8
    ) +

    labs(
      title = NULL,
      x = NULL,
      y = NULL
    ) +

    theme_phd_kitten(
      orientation = 'vertical',
      legend_position = "right"
    ) +
    scale_fill_manual(
      name = NULL,
      values = color_var
    ) +

    scale_color_manual(
      name = NULL,
      values = label_col
    ) +

    guides(
      fill = guide_legend(
        nrow = guide_nr,
        reverse = T
      ),
      colour = "none"
    )
}


tabel_tanja <- openxlsx::read.xlsx("00 ruwe data/data_figuur1.xlsx")

dag_levels <- c("ma", "di", "wo", "do", "vrij", "za", "zo")

tabel_tanja |>

  my_plot_vertical(
    y_var = waarde,
    x_var = fct_relevel(dag, dag_levels),
    fill_var = meetmoment,
    color_var = blauw_pal[c(1, 5)]
  ) +
  facet_wrap(~week)


tabel_tanja |>

  my_plot_horizontal(
    x_var = waarde,
    y_var = fct_rev(fct_relevel(dag, dag_levels)),
    fill_var = meetmoment,
    color_var = blauw_pal[c(1, 5)]
  ) +
  facet_wrap(~week)
