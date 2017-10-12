<!DOCTYPE html>
<html>
<style>
.title{
   font-size: -webkit-xxx-large;
   text-align: -webkit-center;
   color: #3c8dbc;
}
.fonts{
  color: #3c8dbc;
  font-size: 30px;
}
body{
    background-color:#A6ACAF   ;
}
form {
   padding: 0% 30%;
}
input[type=text], input[type=password],input[type=submit]{
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    font-size: 20px;
    color: black;   
}
input[type=submit]{
background-color: #004D40 !important;
color: #fff;
border-radius: 25px;


}
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}
.center{
    color: #004d40;
    text-align: center;
}
.cmpylogo{

    display: block;
    margin: auto;
    width: 40%;

}


/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
<body>
<br>
<br>
<img class="cmpylogo" src="resources/img/logo.png" height="120" width="690">

<br><br>

<h2 class="center">Enter Admin Details</h2>

<script type="text/javascript" src="dashboard"></script>
<form name='f' action="login" method='POST'>
  <div class="imgcontainer">
  </div>

  <div class="container">
    <!-- <label><b class="fonts">Username</b></label> -->
    <input type='text'  placeholder="Enter UserName" name='username' value='' required>

    <!-- <label><b class="fonts">Password</b></label> -->
    <input type='password' name='password' placeholder="Enter Password"  required/>
       
    <input name="submit" type="submit" value="Login" />
  </div>
  
    
  </div>
</form>

</body>
</html>