<?php
//script to create Dockerrun file for use with
//aws elastic beanstalk
//takes in argv1 and uses that as the dockerhub tag

if(!isset($argv[1]))
	{
	print "no session information provided\n";
	exit(0);
	}

$dockerConf = array();

$image = "fontesj/solano-docker:".trim($argv[1]); 

$dockerConf['AWSEBDockerrunVersion'] = 2;
$dockerConf['containerDefinitions'] = array(
					array('name' => 'solano-app-docker',
						'image' => $image,
						'environment' => array(array('name' => 'container',
									'value' => 'PHPDocker')
								),
						'essential' => 'true',
						'memory' => 256,
						'portMappings' => array(array('hostPort' => 80, 'containerPort' => 80))
							)
						);

//print_r($dockerConf);

if(file_put_contents("Dockerrun.aws.json",json_encode($dockerConf)) == FALSE)
	{
	print "Could not write to file\n";
	exit(1);
	}

print "Docker run file:  Dockerrun.aws.json \n Image: $image \n";
print "\n".json_encode($dockerConf)."\n";

?>
