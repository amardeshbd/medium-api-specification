#!/bin/sh

setUp()
{
  originalPath=$PATH
  PATH=$PWD:$PATH
  
  echo "Executing tests... ^_^"
}

testEquality() {
	validationOutput=$(curl http://online.swagger.io/validator/debug?url=http://petstore.swagger.io/v2/swagger.json)
	echo "Testing swagger validation - current output is: $validationOutput"
	assertEquals $validationOutput "{}"
}

# Execute shunit2 to run the tests (downloaded via `.travis.yaml`)
. shunit2-2.1.6/src/shunit2