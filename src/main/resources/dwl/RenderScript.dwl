%dw 2.0
output application/json
---
if ( payload.success == false ) ({
    "error": payload.error.message
})
else 
    payload.result