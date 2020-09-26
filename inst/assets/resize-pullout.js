
// function to expand/hide pullout panel on click
function open_close_pullout() {
  
  // on click on handle, resize the panel
    $('.pp-handle').on('click', function (e) {
      
        // find the parent panel dive
        panel = $($(this).parents('.pullout-panel'));
        
        // if it's open, close it
        if (panel.css('width') > panel.css('min-width')) {
          panel.css('width', panel.css('min-width'));
          
        // otherwise open it to full extent
        } else {
          panel.css('width', panel.css('max-width'));
        }
    });

}

// call the function on startup
$(document).ready(open_close_pullout);
