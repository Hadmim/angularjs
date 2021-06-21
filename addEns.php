<?php
    $servername = "localhost";
    $username = "root";
    $password = "1234";
    $dbname = "dbtset";
    $table = "enseignant";
     

$conn = new mysqli($servername, $username, $password, $dbname);
if (!$conn) {
 die("Connection failed: " . mysqli_connect_error());
}


$json = file_get_contents('php://input');
$data = json_decode($json);
$nom = $data->nom;
$prenom =$data->prenom;
$tel=$data->tel;
$num_crt =$data->numc;
$email=$data->email;
$ecole_actuelle=$data->ecoa;
$titul=$data->tit;
$sql = "INSERT INTO $table (nom,prenom,tel,email,titulaire,école_actuelle,num_carte)VALUES
('$nom','$prenom','$tel','$email','$titul','$ecole_actuelle','$num_crt')";
$info_ens="nom : ".$nom.", prénom : ".$prenom.", téléphone : ".$tel.", Email : ".
     $email.", titulaire : ".$titul;
     $file=$nom.".text"
        file_put_contents($file,"information"."\n");
         file_put_contents($file,file_get_contents("info.text")."ensignant :");
        file_put_contents($file,file_get_contents("info.text").$row['num_carte']."\n");
        file_put_contents($file,file_get_contents("info.text").$info_ens);
if( $conn->query($sql)===true)
{ 
$last=$conn->insert_id;

 $data= array("id"=>$last);

echo json_encode($data);
}
else
{
echo ($conn -> error);

 
}



$conn->close();

?>