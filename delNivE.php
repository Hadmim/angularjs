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
$sql = "DELETE FROM $table WHERE id_enseignant ='$ide'";
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