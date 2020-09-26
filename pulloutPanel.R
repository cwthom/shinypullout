
# Pullout Panel Functions -------------------------------------------------

pulloutPanel <- function(...,
                         position = c("left", "right"),
                         width = "500px",
                         top = 0,
                         handleStyle = handleStyle(),
                         handleText = NULL) {
  
  # add js and style sheet as resources
  addResourcePath("shinypullout", "www")
  
  pw <- validateCssUnit(width)
  hw <- handleStyle$width
  pt <- validateCssUnit(top)
  
  # construct handle
  handle <-  div(class = sprintf("pp-handle pp-handle-%s", position),
                 style = handleStyle$style,
                 handleText)

  # construct contents
  contents <- div(class = sprintf("pp-contents pp-contents-%s", position),
                  style = createStyle(width = sprintf("calc(100%% - %s);", hw)),
                  ...)
  
  # construct pullout panel
  pullout <- div(class = sprintf("pullout-panel pp-%s", position),
                 style = createStyle(
                   width = hw,
                   minWidth = hw,
                   maxWidth = pw,
                   top = pt,
                   height = sprintf("calc(100%% - %s)", pt)
                 ),
                 handle, contents)
  
  # return tagList with resources and panel
  tagList(
    singleton(
      tags$head(
        tags$link(rel = "stylesheet", href = "shinypullout/pullout-styles.css"),
        tags$script(src = "shinypullout/resize-pullout.js")
      )
    ),
    pullout
  )

} 


createStyle = function(...) {
  dots <- list(...)
  styles <- names(dots)
  values <- unname(unlist(dots))
  styles_css <- tolower(gsub("([a-z])([A-Z])", "\\1-\\2", styles))
  paste0(styles_css, ": ", values, ";", collapse = " ")
}

# function for creating handle styles
handleStyle <- function(height = "100%", 
                        width = "25px",
                        backgroundColor = "#ddd",
                        top = 0,
                        ...) {
  
  height <- validateCssUnit(height)
  width  <- validateCssUnit(width)
  top    <- validateCssUnit(top)
  
  list(
    style = createStyle(height = height,
                        width = width,
                        backgroundColor = backgroundColor,
                        top = top,
                        lineHeight = width,
                        ...),
    width = width
  )
}
