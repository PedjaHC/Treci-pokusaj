<?php
require_once '../model/DAO.php';

function test_input($data){
	$data = trim($data);
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	return $data;
}


class Controller{

	
	public function index(){
		include 'index.php';
	}

	
	public function showRegister(){
		include 'register.php';
	}

			
    public function register(){
    	
        $first_name=isset($_POST['first_name'])?$_POST['first_name']:"";
    	$last_name=isset($_POST['last_name'])?$_POST['last_name']:"";
    	$email=isset($_POST['email'])?$_POST['email']:"";
    	$password=isset($_POST['password'])?$_POST['password']:"";
    	$cpassword=isset($_POST['cpassword'])?$_POST['cpassword']:"";    	
    	
    	$errors= array();
        
        if(empty($first_name)){        
            $errors['first_name']='First name is required';
    	}else{
        	$first_name = test_input($first_name);
        	if (!preg_match("/^[a-zA-Z ]*$/",$first_name)){
            	$errors['first_name'] = 'Use letters and spacing only'; 
        	}
    	}    
        
        if(empty($last_name)){        
             $errors['last_name']='Last name is required.';
        }else{
        	$last_name = test_input($last_name);
        	if (!preg_match("/^[a-zA-Z ]*$/",$last_name)){
            	$errors['last_name'] = 'Use letters and spacing only'; 
        	}
    	}       
             
        if(empty($email)){       
             $errors['email']='Email is required';            
        }else{
			$email = test_input($email);
           if (filter_var($email, FILTER_VALIDATE_EMAIL)){ 
           		$dao=new DAO();
    			$user=$dao->getUser($email);
    			if($user){
    				$errors['email']='Email adress already in use';
    			}else{
    			}
           }else{
                 $errors['email']="Incorrect email adress";
           }       	      	
        }
         
        if(empty($password)){        
            $errors['password']='Password is required';                       
        }else{
         	$password = test_input($password);	
         	$cpassword = test_input($cpassword);
         	if ($password!==$cpassword){ 
            	$errors['password'] = "Passwords do not match";        	          
            }
            elseif (strlen($password) <= '8') {
            	$errors['password'] = "Password must contain at least 8 characters!";
        	}
        	elseif(!preg_match("#[0-9]+#",$password)) {
            	$errors['password'] = "At least one character must be a number!";
        	}
        	elseif(!preg_match("#[A-Z]+#",$password)) {
            	$errors['password'] = "Use at least one capital letter!";
        	}
        	elseif(!preg_match("#[a-z]+#",$password)) {
            	$errors['password'] = "Use at least one lowercase letter!";
        	}
        }
            
    		if(count($errors)==0){                
                $dao=new DAO();
                $dao->insertUser($first_name, $last_name, $email, $password);
                $msg='Successful registration';
                include 'login.php';                    
            }else{            	
            	$msg='Not registred'; 
            	include 'register.php';                 
            }    	    	
    }

	
	public function showLogin(){
		include 'login.php';
	}


	public function login(){

		$email=isset($_POST['email'])?$_POST['email']:"";
    	$password=isset($_POST['password'])?$_POST['password']:"";
        $user=isset($user)?$user:"";
		
        if(!isset($email)){       
             $errors['email']='Email is required';
        }else{
			$email = test_input($email);
            if (filter_var($email, FILTER_VALIDATE_EMAIL)){ 
           		$dao=new DAO();
    			$user=$dao->getUser($email);
    			if($user){   				
    			}else{
    				$errors['email']='Incorrect email adress, please register';
                    include 'login.php';
    			}
            }else{
                 $errors['email']="Incorrect email adress format";
                 include 'login.php';
            }       	      	
        }
    			 				
    	if($password===$user['password']){    					
    	}else{
    		$errors['password']='Wrong password';				
    	}

    	if(count($errors)==0){                
 			if (!isset($_SESSION)) {
				session_start(); 
			}	              				
			$_SESSION['user']=serialize($user);			
          	include 'index.php';                    
        }else{
            $msg='You are not logedin'; 
            include 'login.php';                 
        }    				
    }  
    	
	
	public function logout(){
		if (!isset($_SESSION)){
			session_start(); 
		}		
		session_unset();
		session_destroy();
		include 'login.php';	
	}



}

				
				
				
							
			
  