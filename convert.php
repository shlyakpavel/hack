//read the JSON file
$jsonFile = file_get_contents('clarifai.json');

//decode the data
$jsonFile_decoded = json_decode($jsonFile);

//create a new xml object
$xml = new SimpleXMLElement('<members/>');

//loop through the data, and add each record to the xml object
foreach($jsonFile_decoded AS $members){
	foreach($members AS $memberDetails){
		$member = $xml->addChild('member');
		$member->addChild('lastName', $memberDetails[0]);
		$member->addChild('firstName', $memberDetails[1]);
		$member->addChild('age', $memberDetails[2]);
		$member->addChild('sex', $memberDetails[3]);
		$member->addChild('location', $memberDetails[4]);
	}
}

//set header content type
Header('Content-type: text/xml');

//output the xml file
print($xml->asXML());