#' Create a pullout panel
#' 
#' Use anywhere in your app ui to fix a pullout panel to either the left or the 
#' right of that element.
#' 
#' @export
#' 
#' @param ... contents of the panel
#' @param position left or right
#' @param width the width of the expanded panel - should be a valid CSS unit
#' @param top the distance from the top of the parent element to place the panel - 
#'   useful for preventing overlap e.g. in dashboard pages and navbar pages
#' @param handleStyle styles for the panel handle - use a call to \code{handleStyle}
#' @param handleText optional text for the handle
#' 
pulloutPanel <- function(...,
                         position = c("left", "right"),
                         width = "500px",
                         top = 0,
                         handleStyle = handleStyle(),
                         handleText = NULL) {
  
  # add js and style sheet as resources
  shiny::addResourcePath("shinypullout", system.file("assets", package = "shinypullout"))
  
  pw <- shiny::validateCssUnit(width)
  hw <- handleStyle$width
  pt <- shiny::validateCssUnit(top)
  
  # construct handle
  handle <-  shiny::div(
    class = sprintf("pp-handle pp-handle-%s", position),
    style = handleStyle$style,
    handleText
  )

  # construct contents
  contents <- shiny::div(
    class = sprintf("pp-contents pp-contents-%s", position),
    style = createStyle(width = sprintf("calc(100%% - %s);", hw)),
    ...
  )
  
  # construct pullout panel
  pullout <- shiny::div(
    class = sprintf("pullout-panel pp-%s", position),
    style = createStyle(
      width = hw, minWidth = hw, maxWidth = pw,
      top = pt, height = sprintf("calc(100%% - %s)", pt)
    ),
    handle, contents)
  
  # return tagList with resources and panel
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$link(rel = "stylesheet", href = "shinypullout/pullout-styles.css"),
        shiny::tags$script(src = "shinypullout/resize-pullout.js")
      )
    ),
    pullout
  )

} 

#' Helper function for creating styles
#' 
#' @param ... named arguments to be coerced to css styles
#' 
createStyle = function(...) {
  dots <- list(...)
  styles <- names(dots)
  values <- unname(unlist(dots))
  styles_css <- tolower(gsub("([a-z])([A-Z])", "\\1-\\2", styles))
  paste0(styles_css, ": ", values, ";", collapse = " ")
}

#' Styles for the pullout panel handle
#' 
#' Use this in the \code{handleStyle} argument of \code{pulloutPanel}
#' 
#' @export
#' 
#' @param height,width the handle height and width, in valid CSS units
#' @param backgroundColor the color of the handle
#' @param top the distance from the top of the pullout panel to position the handle
#' @param ... further arguments to pass to the \code{style} of the handle - these are 
#'   coerced to CSS styles by converting capitals to "-" e.g. borderRadius --> border-radius
#'   
handleStyle <- function(height = "100%", 
                        width = "25px",
                        backgroundColor = "#ddd",
                        top = 0,
                        ...) {
  
  height <- shiny::validateCssUnit(height)
  width  <- shiny::validateCssUnit(width)
  top    <- shiny::validateCssUnit(top)
  
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
