library(palmerpenguins)
library(ggplot2)

ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm, color = species)) + geom_point()

okabe_ito <- c("#E69F00", "#56EBE9", "#009E73", "#F0E442", "#0072B2")

ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm, fill = species, shape = species)) + geom_point() + scale_fill_manual(values = okabe_ito) + scale_shape_manual(values = 21:25)

# Built-in themes, themeBW


ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm, fill = species, shape = species)) + geom_point() + scale_fill_manual(values = okabe_ito) + scale_shape_manual(values = 21:25)


ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm, fill = species, shape = species)) + geom_point() + scale_fill_manual(values = okabe_ito) + scale_shape_manual(values = 21:25) + theme_bw() + theme(legend.position = "inside", legend.position.inside = c(0.99, 0.01), legend.justification = c(1, 0))

# Fix labels

ggplot(penguins, aes(x = body_mass_g, y = flipper_length_mm, fill = species, shape = species)) + geom_point() + scale_fill_manual(values = okabe_ito) + scale_shape_manual(values = 21:25) + labs(x = "body mass (g)", y = "flipper length (mm)", fill = "Species", shape = "Species")
+ theme_bw() + theme(legend.position = "inside", legend.position.inside = c(0.99, 0.01), legend.justification = c(1, 0))
