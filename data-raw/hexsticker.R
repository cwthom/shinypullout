# Script to create hexSticker

# hexSticker package
library(hexSticker)
library(magrittr)
library(magick)

# create sticker
sticker(subplot = "./data-raw/question-mark.png",
        package = "shinypullout",
        p_size = 18,
        s_x = 1.03, s_y = 0.75,
        h_color = "#ffffff",
        h_fill  = "#305ca3", 
        url = "https://github.com/cwthom/shinypullout",
        u_size = 3,
        u_color = "#ffffff",
        filename = "data-raw/shinypullout.png")

shinypullout <- magick::image_read("data-raw/shinypullout.png")
image_scale(shinypullout, "150") %>%
  image_write(path = "man/figures/logo.png", format = "png")