 #!/bin/bash

curl -X POST \
    -H "$(cat api.key)" \
    -H "Content-Type: application/json" \
    -d '
    {
       "inputs": [
        {
           "data": {
               "image": {
                  "url": "https://www.purinamills.com/2.purinamills.com/media/Images/MasterBrand/Lifestages/horse-special-needs.png"
                }
            }
        }
        ]
    }'\
	https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/outputs -o clarifai.json
