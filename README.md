This package is not specific to UCDavis but can access any Canvas API server
for which you have authorization.

This needs an OAuth2 token to make requests.
This token should be set as the value for the 
R option CanvasAPIKey, e.g., in your .Rprofile
```r
options(CanvasAPIKey = "......")
````
or
```r
options(CanvasAPIKey = readLines("~/.CanvasAPIKey")
```
Importantly, no other account should be able to read that .Rprofile
or the .CanvasAPIKey file.

If the key may be compromised, generate a new one on canvas.ucdavis.edu.


See https://usflearn.instructure.com/doc/api/live for documentation on the Canvas API.
