# microservice-fission-java-template 
## create fission env, get function & route,post function & route
	./install.sh
### test get
	curl -X GET \
	  'https://fission.lingkcore.com/python-add-get?number1=10&number2=10' 
### test post
	curl -X POST \
	  https://fission.lingkcore.com/python-add-post \
	  -H 'Content-Type: application/json' \
	  -d '{
	  "numbers": [
	  	{ 
	      "number": 1
	    },
	    {
	      "number": 2
	    }
	  ]
	}'


### helpers
	find . -type f -print0 | xargs -0 dos2unix
	

"# microservice-fission-java-echo-raw-body" 
