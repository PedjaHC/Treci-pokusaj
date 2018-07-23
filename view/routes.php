<?php

if(!isset($_SESSION)){
    session_start();
}
if(isset($_SESSION['time']) && time()- $_SESSION['time']>900){
	session_destroy();
	$msg="Your session expired due to inactivity";
}else{
	$_SESSION['time'] = time(); 
}


require_once '../controller/Controller.php';

$controller = new Controller();

// u slucaju da ne stize nijedna akcija tj page setovali smo defaultni naziv da bude index
$pageGet=isset($_GET['page'])?$_GET['page']:"index";
$pagePost=isset($_POST['page'])?$_POST['page']:"index";

$page=($pageGet!='index')?$pageGet:$pagePost;


switch ($page){
	
	case 'index':
		$controller->index();
	break;
	
	case 'showregister':
		$controller->showRegister();
	break;

	case 'register':
		$controller->register();
	break;

	case 'showlogin':
		$controller->showLogin();
	break;

	case 'login':
		$controller->login();
	break;

	/*case '_____':
		$controller->____();
	break;*/	


}

