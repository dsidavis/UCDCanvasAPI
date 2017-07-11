library(RCurl)

key = readLines("key")

url = "https://canvas.ucdavis.edu/api/v1/courses"
con = getCurlHandle(verbose = TRUE, cookiejar = "",
                     followlocation = TRUE,
                     httpheader = c(Authorization = paste("Bearer", key)))
tt = getURLContent(url, curl = con)
library(RJSONIO)
ans = fromJSON(tt)


