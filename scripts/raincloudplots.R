library(raincloudplots)

rc_repmes_2x2 <- function (data_2x2,
                           colors = c("dodgerblue", "darkorange"),
                           fills = c("dodgerblue", "darkorange"),
                           groups = c("g1", "g2"), line_color = "gray",
                           line_alpha = 0.3, size = 2.5, alpha = 0.6) {
  figure_2x2 <-
    ggplot(data = data_2x2) +
    geom_line(data = dplyr::filter(data_2x2, x_axis %in% c("1", "2")),
              aes(x = jit, y = y_axis, group = id, color = colors[1]),
              alpha = alpha) +
    geom_line(data = dplyr::filter(data_2x2, x_axis %in% c("1.01", "2.01")),
              aes(x = jit, y = y_axis, group = id, color = colors[2]),
              alpha = alpha) +
    geom_point(data = dplyr::filter(data_2x2, x_axis == "1"),
               aes(x = jit, y = y_axis, color = colors[1]), fill = "white",
               shape = 21, size = size) +
    geom_point(data = dplyr::filter(data_2x2, x_axis == "1.01"),
               aes(x = jit, y = y_axis, color = colors[2]), fill = "white",
               shape = 21, size = size) +
    geom_point(data = dplyr::filter(data_2x2, x_axis == "2"),
               aes(x = jit, y = y_axis, color = colors[1]), fill = "white",
               shape = 21, size = size) +
    geom_point(data = dplyr::filter(data_2x2, x_axis == "2.01"),
               aes(x = jit, y = y_axis, color = colors[2]), fill = "white",
               shape = 21, size = size) +
    geom_half_boxplot(data = dplyr::filter(data_2x2, x_axis == "1"),
                      aes(x = x_axis, y = y_axis, color = colors[1], fill = fills[1]),
                      position = position_nudge(x = -0.15),
                      side = "l", outlier.shape = NA, center = TRUE,
                      errorbar.draw = FALSE, width = 0.05, alpha = alpha) +
    geom_half_boxplot(data = dplyr::filter(data_2x2, x_axis == "1.01"),
                      aes(x = x_axis, y = y_axis, color = colors[2], fill = fills[2]),
                      position = position_nudge(x = -0.125),
                      side = "l", outlier.shape = NA, center = TRUE,
                      errorbar.draw = FALSE, width = 0.05, alpha = alpha) +
    geom_half_boxplot(data = dplyr::filter(data_2x2, x_axis == "2"),
                      aes(x = x_axis, y = y_axis, color = colors[1], fill = fills[1]),
                      position = position_nudge(x = 0.125),
                      side = "r", outlier.shape = NA, center = TRUE,
                      errorbar.draw = FALSE, width = 0.05, alpha = alpha) +
    geom_half_boxplot(data = dplyr::filter(data_2x2, x_axis == "2.01"),
                      aes(x = x_axis, y = y_axis, color = colors[2], fill = fills[2]),
                      position = position_nudge(x = 0.15),
                      side = "r", outlier.shape = NA, center = TRUE,
                      errorbar.draw = FALSE, width = 0.05, alpha = alpha) +
    geom_half_violin(data = dplyr::filter(data_2x2, x_axis == "1"),
                     aes(x = x_axis, y = y_axis, color = colors[1], fill = fills[1]),
                     position = position_nudge(x = -0.2),
                     side = "l", alpha = alpha) +
    geom_half_violin(data = dplyr::filter(data_2x2, x_axis == "1.01"),
                     aes(x = x_axis, y = y_axis, color = colors[2], fill = fills[2]),
                     position = position_nudge(x = -0.21),
                     side = "l", alpha = alpha) +
    geom_half_violin(data = dplyr::filter(data_2x2, x_axis == "2"),
                     aes(x = x_axis, y = y_axis, color = colors[1], fill = fills[1]),
                     position = position_nudge(x = 0.2),
                     side = "r", alpha = alpha) +
    geom_half_violin(data = dplyr::filter(data_2x2, x_axis == "2.01"),
                     aes(x = x_axis, y = y_axis, color = colors[2], fill = fills[2]),
                     position = position_nudge(x = 0.19),
                     side = "r", alpha = alpha) +
    scale_fill_identity(name = "Groups", breaks = fills, labels = groups,
                        guide = "legend") +
    scale_colour_identity(guide = "legend")
    return(figure_2x2)
}

rc_repmes <- function (data, times = 2, colors = c("dodgerblue", "darkorange"),
                       fills = c("dodgerblue", "darkorange"),
                       line_color = "gray", line_alpha = 0.3, size = 2.5,
                       alpha = 0.6) {
  figure <- ggplot(data) + geom_line(aes(x = jit, y = y_axis, group = id),
                                     color = line_color, alpha = line_alpha,
                                     size = size / 2.5, show.legend = FALSE)
  for (i in seq(times)) {
    figure <- figure +
    geom_point(data = dplyr::filter(data, x_axis == i), aes(x = jit, y = y_axis),
               color = colors[i], fill = fills[i], size = size, alpha = alpha,
               show.legend = FALSE) +
    geom_half_boxplot(data = dplyr::filter(data, x_axis == i),
                      aes(x = x_axis, y = y_axis), color = colors[i],
                      fill = fills[i], side = "r", outlier.shape = NA,
                      position = position_nudge(x = times - i + .05 + .05*i),
                      errorbar.draw = FALSE, width = 0.08, alpha = alpha,
                      center = TRUE, show.legend = FALSE) +
    geom_half_violin(data = dplyr::filter(data, x_axis == i),
                     aes(x = x_axis, y = y_axis), color = colors[i],
                     fill = fills[i], side = "r", alpha = alpha - .1,
                     position = position_nudge(
                        x = times - i + .1*times),
                     show.legend = FALSE)
  }
  return(figure)
}



rc_repmes_2x2_spread <- function (data_2x2,
                                  colors = rep(c("dodgerblue", "darkorange"), 2),
                                  fills = rep(c("dodgerblue", "darkorange"), 2),
                                  line_color = "gray", line_alpha = 0.3,
                                  size = 1.5, alpha = 0.6) {
  figure_2x2 <- ggplot(data = data_2x2) +
    geom_point(data = dplyr::filter(data_2x2, x_axis == "1"),
               aes(x = jit, y = y_axis), color = colors[1], fill = fills[1],
               size = size, alpha = alpha) +
    geom_point(data = dplyr::filter(data_2x2, x_axis == "2"),
               aes(x = jit, y = y_axis), color = colors[2], fill = fills[2],
               size = size, alpha = alpha) +
    geom_point(data = dplyr::filter(data_2x2, x_axis == "3"),
               aes(x = jit, y = y_axis), color = colors[3], fill = fills[3],
               size = size, alpha = alpha) +
    geom_point(data = dplyr::filter(data_2x2, x_axis == "4"),
               aes(x = jit, y = y_axis), color = colors[4], fill = fills[4],
               size = size, alpha = alpha) +
    geom_line(data = dplyr::filter(data_2x2, x_axis %in% c("1", "2")),
              aes(x = jit, y = y_axis, group = id), color = line_color,
              alpha = alpha) +
    geom_line(data = dplyr::filter(data_2x2, x_axis %in% c("3", "4")),
              aes(x = jit, y = y_axis, group = id), color = line_color,
              alpha = alpha) +
    geom_half_boxplot(data = dplyr::filter(data_2x2, x_axis == "1"),
                      aes(x = x_axis, y = y_axis), color = colors[1],
                      fill = fills[1], position = position_nudge(x = -0.37),
                      side = "l", outlier.shape = NA, center = TRUE,
                      errorbar.draw = FALSE, width = 0.2, alpha = alpha) +
    geom_half_boxplot(data = dplyr::filter(data_2x2, x_axis == "2"),
                      aes(x = x_axis, y = y_axis), color = colors[2],
                      fill = fills[2], position = position_nudge(x = -1.23),
                      side = "l", outlier.shape = NA, center = TRUE,
                      errorbar.draw = FALSE, width = 0.2, alpha = alpha) +
    geom_half_boxplot(data = dplyr::filter(data_2x2, x_axis == "3"),
                      aes(x = x_axis, y = y_axis), color = colors[3],
                      fill = fills[3], position = position_nudge(x = 1.23),
                      side = "r", outlier.shape = NA, center = TRUE,
                      errorbar.draw = FALSE, width = 0.2, alpha = alpha) +
    geom_half_boxplot(data = dplyr::filter(data_2x2, x_axis == "4"),
                      aes(x = x_axis, y = y_axis), color = colors[4],
                      fill = fills[4], position = position_nudge(x = 0.37),
                      side = "r", outlier.shape = NA, center = TRUE,
                      errorbar.draw = FALSE, width = 0.2, alpha = alpha) +
    geom_half_violin(data = dplyr::filter(data_2x2, x_axis == "1"),
                     aes(x = x_axis, y = y_axis), color = colors[1],
                     fill = fills[1], position = position_nudge(x = -0.5),
                     side = "l", alpha = alpha) +
    geom_half_violin(data = dplyr::filter(data_2x2, x_axis == "2"),
                     aes(x = x_axis, y = y_axis), color = colors[2],
                     fill = fills[2], position = position_nudge(x = -1.5),
                     side = "l", alpha = alpha) +
    geom_half_violin(data = dplyr::filter(data_2x2, x_axis == "3"),
                     aes(x = x_axis, y = y_axis), color = colors[3],
                     fill = fills[3], position = position_nudge(x = 1.5),
                     side = "r", alpha = alpha) +
    geom_half_violin(data = dplyr::filter(data_2x2, x_axis == "4"),
                     aes(x = x_axis, y = y_axis), color = colors[4],
                     fill = fills[4], position = position_nudge(x = 0.5),
                     side = "r", alpha = alpha)
    return(figure_2x2)
}
