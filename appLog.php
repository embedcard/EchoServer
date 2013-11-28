<?php

date_default_timezone_set('Australia/Perth');

$date = date('m/d/Y h:i:s a', time());

$appName = "unknownApp";
$msg = "No message";

if(isset($_GET['appName']))
{
	$appName = $_GET['appName'];
}

if(isset($_GET['message']))
{
	$msg = $_GET['message'];
}

file_put_contents ( "/logs/" . $appName . ".txt" , $date . ": " . $msg . PHP_EOL , FILE_APPEND );

?>
