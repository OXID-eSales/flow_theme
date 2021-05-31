// Patched in jQuery v3.0.0 and later
// Prevent auto-execution of scripts when no explicit dataType was provided (See gh-2432)
jQuery.ajaxPrefilter(function (s) {
    if (s.crossDomain) {
        s.contents.script = false;
    }
});
