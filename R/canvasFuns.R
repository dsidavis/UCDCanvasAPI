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

courses =
function(
         url = "https://canvas.ucdavis.edu/api/v1/courses",
         curl = getCanvasHandle(...), ...)
{
  ans = getURLContent(url, curl = con)
  fromJSON(ans)
}


enrollments =
function(course, per_page = 100,
         url = "https://canvas.ucdavis.edu/api/v1/courses/%s/enrollments",
         curl = getCanvasHandle(...), ...)
{
  url = sprintf(url, course)
  txt = getForm(url, per_page = per_page, curl = con)
  ans = fromJSON(txt)
  # Need to page.  
  ans

}


getCanvasHandle =
    #
    # kon = getCanvasHandle(followlocation = TRUE, cookiejar = "", key = key)
    #
function(..., key = getOption("CanvasAPIKey", stop("You need an API key")))
{
   getCurlHandle(..., httpheader = c(Authorization = paste("Bearer", key)))
}
