%dw 2.0
import try, fail from dw::Runtime
fun mask(payload: Any) = ((write(payload) replace  "\n" with "") replace "\"" with "")