<?php 
require 'banco.php';
include 'api.php';
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (!isset($_GET['nomejogador']) || !isset($_GET['numero']) || !isset($_GET['idade']) || !isset($_GET['nascimento']) || !isset($_GET['gol']) || !isset($_GET['time']) || !isset($_GET['foto'])) {
    echo json_encode(["erro" => "Informações incompletas do jogador"]);
    exit();
}

$nomeJogador = $_GET['nomejogador'];
$numero = $_GET['numero'];
$idade = $_GET['idade'];
$nascimento = $_GET['nascimento'];
$gol = $_GET['gol'];
$time = $_GET['time'];
$foto = $_GET['foto'];

try {
    $sql = "INSERT INTO jogador (nomejogador, numero, idade, nascimento, gol, time, foto)
            VALUES (:nomejogador, :numero, :idade, :nascimento, :gol, :time, :foto)";
    $qry = $conexao->prepare($sql);
    $qry->bindParam(':nomejogador', $nomeJogador, PDO::PARAM_STR);
    $qry->bindParam(':numero', $numero, PDO::PARAM_INT);
    $qry->bindParam(':idade', $idade, PDO::PARAM_INT);
    $qry->bindParam(':nascimento', $nascimento, PDO::PARAM_STR);
    $qry->bindParam(':gol', $gol, PDO::PARAM_INT);
    $qry->bindParam(':time', $time, PDO::PARAM_STR);
    $qry->bindParam(':foto', $foto, PDO::PARAM_STR);
    $qry->execute();

    $nr = $qry->rowCount();

    $sqlLog = "INSERT INTO log (numeroregistros) VALUES (:numeroregistros)";
    $qryLog = $conexao->prepare($sqlLog); 
    $qryLog->bindParam(':numeroregistros',$nr, PDO::PARAM_INT); $qryLog->execute();
    echo json_encode(["rowsAffected" => $nr]);
} catch (PDOException $e) {
    echo json_encode(["erro" => "Erro ao inserir no banco de dados: " . $e->getMessage()]);
} catch (Exception $e) {
    echo json_encode(["erro" => "Erro inesperado: " . $e->getMessage()]);
}
?>
