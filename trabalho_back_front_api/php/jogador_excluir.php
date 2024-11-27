<?php 
require 'banco.php';

try {
    if (isset($_GET['idjogador'])) {
        $idjogador = $_GET['idjogador'];
        $sql = "DELETE FROM jogador WHERE idjogador = :idjogador";
        $qry = $conexao->prepare($sql);
        $qry->bindParam(':idjogador', $idjogador, PDO::PARAM_INT);
        $qry->execute();
        $nr = $qry->rowCount();
        echo json_encode(["rowsAffected" => $nr]);
    } else {
        $sql = "DELETE FROM jogador";
        $qry = $conexao->prepare($sql);
        $qry->execute();
        $nr = $qry->rowCount();
        echo json_encode(["rowsAffected" => $nr]);
    }
} catch (PDOException $e) {
    echo json_encode(["erro" => "Erro ao executar a operação: " . $e->getMessage()]);
}
?>
