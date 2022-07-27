# dw-modularization
Modularize Transformation using DataWeave

Sample request for success

curl --location --request POST 'http://localhost:8081/employee' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email" : "scurry@mule.com",
    "name" : "Steff Curry",
     "dept" : {
         "name" : "NBA",
         "dept" : "Hall of Fame"
     }
}'

Sample request for failure

curl --location --request POST 'http://localhost:8081/employee' \
--header 'Content-Type: application/json' \
--data-raw '{
    "email" : "scurrymule.com",
    "name" : "Steff Curry",
     "dept" : {
         "name" : "NBA",
         "dept" : "Hall of Fame"
     }
}'
