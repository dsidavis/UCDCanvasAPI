announcements =
    #
    # z = announcements("120325", curl = con)
    #
function(courses, start_date = "2017-01-01", end_date = format(Sys.Date()), active_only = "false",
         url = "https://canvas.ucdavis.edu/api/v1/announcements",
         curl = getCanvasHandle(...), ...)
{
  context_codes = paste0("course_", courses)
  if(is.logical(active_only))
      active_only = c("false", "true")[active_only + 1L]
  
  ans = getForm(url, context_codes = context_codes,
                 start_date = start_date,
                 end_date = end_date, active_only = active_only, curl = curl)
  fromJSON(ans)
}


getCanvasHandle =
    #
    # kon = getCanvasHandle(followlocation = TRUE, cookiejar = "", key = key)
    #
function(..., key = getOption("CanvasAPIKey", stop("You need an API key")))
{
   getCurlHandle(..., httpheader = c(Authorization = paste("Bearer", key)))
}
