<?php
    $servername = "localhost";
    $username = "root";
    $password = "1234";
    $dbname = "dbtset";
    $table = "niveau_ensignant";
     

$conn = new mysqli($servername, $username, $password, $dbname);
if (!$conn) {
 die("Connection failed: " . mysqli_connect_error());
}
$json = file_get_contents('php://input');
$data = json_decode($json);
$ide= $data->ide;
$idn =$data->idn;

$sql = "INSERT INTO $table (id_enseignant,id_niveau)VALUES('$ide','$idn')";
if( $conn->query($sql)===true)
{
echo "success";
}
else
{
echo ($conn -> error);

 
}



$conn->close();

?>