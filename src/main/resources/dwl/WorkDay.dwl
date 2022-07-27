/**
 * This module contains Workday functions for data transformations.
 * This example logs the specified validation message. Note that the `DefaultLoggingService`
 * in a Mule app 
 */
%dw 2.0
import try, fail from dw::Runtime
import dwl::Utilities
import mask as mask from dwl::Utilities
/*
 * Use Dept type to map Dept Object from Workday to create, update and retrieve in API
 * 
 */
type Dept = {
	dept: String,
	name: String		
}
/*
 * Use Employee type to map Employee Object from Workday to create, update and retrieve in API
 * 
 */
type Employee = {
	name: String,
	email: String,
	dept: Dept	
}
/*
 * Use employee function to map employee Object from Workday to create, update and retrieve in API
 * === Parameters
 * | Name          | Type   | Description
 * | payload       | Any    | Employee Object
 * | correlationId | String | correlationId is used for audit log and is optional
 * | validation    | Boolean| validation is used to perform validation on payload and used only during create and update and is optional
 */
fun employee(payload: Employee, validation = false, correlationId = uuid()) =
(
//using (correlationId = if (isBlank(correlationId)) uuid() else correlationId, validation = if (isBlank(validation)) false else true)
	
if (isEmpty(payload) and validation ) ({
	"error": log("correlationId =" ++ correlationId ++ ", Payload =" ++ mask(payload) ++ ", Error =Employee Data is null"),
	"fail": fail("Employee Data is null")
})
else if (!(payload.email contains  ("@")) and validation ) ({
	
	"error": log("correlationId =" ++ correlationId ++ ", Payload =" ++ mask(payload) ++ ", Error =Employee Email is not proper"),
	"fail": fail("Employee Email is not proper")
})  	
else
{
		("firstname" : (payload.name splitBy(/\s/))[0]) if (!isBlank(payload.name)),
		("lastname" : (payload.name splitBy(/\s/))[1]) if (!isBlank(payload.name)),
		("email" : payload.email) if (!isBlank(payload.email)),
		("dept" : payload.dept) if (!isEmpty(payload.dept))
}
)


