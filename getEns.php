<?php
    $servername = "localhost";
    $username = "root";
    $password = "1234";
    $dbname = "dbtset";
    $table = "enseignant";
     $table2 = "e_moyenne";
    $table3 = "niveau_ensignant";
    $table4="module_enseignant";

$conn = new mysqli($servername, $username, $password, $dbname);
if (!$conn) {
 die("Connection failed: " . mysqli_connect_error());
}
$dbdata = array();
        $sql = "SELECT * FROM $table ORDER BY id ";
        $result = $conn->query($sql);
$i=0;
        while ($row = mysqli_fetch_array($result)) {
        $ide=$row['école_actuelle'];
        $sql = "SELECT nom FROM $table2 where id=$ide ";
        $result1 = $conn->query($sql);
           $nomeco=$result1->fetch_assoc();
          $iden=$row['id'];
         
         $sql = "SELECT id_niveau FROM $table3 where id_enseignant=$iden";
        $result2 = $conn->query($sql);
          $niveau=null;
        while ($nev=$result2->fetch_assoc()) {
         
           $niveau[]=array($nev['id_niveau']);
          $val="";
          
           foreach($niveau as $value) {
            $val=$value[0]." ".$val;
               }
          
        }
        
     $sql ="SELECT matière FROM module where id in(SELECT module_id FROM $table4 where ensignant_id=$iden)";
        $result3 = $conn->query($sql);
         $mods=null;
         $vall="";
         while ($mod=$result3->fetch_assoc()) {
          
           $mods[]=array($mod['matière']);
          $vall="";
          
           foreach($mods as $value) {
            $vall=$value[0]." ".$vall;
               }
          
        }
        

 $data[] = array("id"=>$row['id'],"nom"=>$row['nom'],"prenom"=>$row['prenom'],
"tel"=>$row['tel'],"email"=>$row['email'],"tit"=>$row['titulaire'],"numc"=>$row['num_carte'],
"eco"=>$nomeco['nom'],"nev"=>$val,"mod"=>$vall
);
}

echo json_encode($data);

?>