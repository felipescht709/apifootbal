<?php 
require 'banco.php';

if (!isset($_GET['idjogador']) || !isset($_GET['nomejogador']) || !isset($_GET['numero']) || 
    !isset($_GET['idade']) || !isset($_GET['nascimento']) || !isset($_GET['gol']) || 
    !isset($_GET['time'])) {
    echo json_encode(["erro" => "Informações incorretas"]);
    exit();
}

$idjogador = $_GET['idjogador']; 
$nomejogador = $_GET['nomejogador']; 
$numero = $_GET['numero'];
$idade = $_GET['idade'];
$nascimento = $_GET['nascimento'];
$gol = $_GET['gol'];
$time = $_GET['time'];

$sql = "UPDATE jogador 
        SET nomejogador = :nomejogador, 
            numero = :numero, 
            idade = :idade, 
            nascimento = :nascimento, 
            gol = :gol, 
            time = :time 
        WHERE idjogador = :idjogador";

$qry = $conexao->prepare($sql);
$qry->bindParam(':idjogador', $idjogador, PDO::PARAM_INT);
$qry->bindParam(':nomejogador', $nomejogador, PDO::PARAM_STR);
$qry->bindParam(':numero', $numero, PDO::PARAM_INT);
$qry->bindParam(':idade', $idade, PDO::PARAM_INT);
$qry->bindParam(':nascimento', $nascimento, PDO::PARAM_STR);
$qry->bindParam(':gol', $gol, PDO::PARAM_INT);
$qry->bindParam(':time', $time, PDO::PARAM_STR);
$qry->execute();

$nr = $qry->rowCount();
echo json_encode(["rowsAffected" => $nr]);
?>