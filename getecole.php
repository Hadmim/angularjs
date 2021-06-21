<?php
    $servername = "localhost";
    $username = "root";
    $password = "1234";
    $dbname = "dbtset";
    $table = "e_moyenne";

$conn = new mysqli($servername, $username, $password, $dbname);
if (!$conn) {
 die("Connection failed: " . mysqli_connect_error());
}
$dbdata = array();
        $sql = "SELECT * FROM $table ORDER BY id ";
        $result = $conn->query($sql);
        while ($row = mysqli_fetch_array($result)) {
 $data[] = array("nom"=>$row['nom'],"daira"=>$row['daira'],"id"=>$row['id']);
}

echo json_encode($data);

?>