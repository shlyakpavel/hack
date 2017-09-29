 #!/bin/bash
echo "" > tags.txt
#curl http://shlyakpavel.tk/hackathon/
#$(date +%s)
python3 get_file_img.py 55.758310 37.579982 1506546000 1506718800 3600 | while read line ; do 

curl -s -X POST \
    -H "$(cat api.key)" \
    -H "Content-Type: application/json" \
    -d '
    {
       "inputs": [
        {
           "data": {
               "image": {
                  "url": "'$line\"'
                }
            }
        }
        ]
    }'\
	https://api.clarifai.com/v2/models/aaa03c23b3724a16a56b629203edc62c/outputs -o clarifai.json
cat clarifai.json | ./JSON.sh | grep name\"\] | sed 1,2d | awk '{print $2}' | tr -d \" >> tags.txt
#printf "\n" >> report.txt
#echo $line >> report.txt
done
./adv
