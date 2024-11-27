<?php 
    require 'banco.php';

    if (!isset($_GET['idjogador']) ){
        echo "Erro, id do jogador é obrigatório";
        exit();
    }

    $idjogador = $_GET['idjogador'];

    $sql = "select * from jogador
            where idjogador = :idjogador";
    $qry = $conexao->prepare($sql);
    $qry->bindParam(':idjogador', $idjogador, PDO::PARAM_STR);
    $qry->execute();
    $nr = $qry->rowCount();
    $registros = $qry->fetchAll(PDO::FETCH_OBJ);
    echo json_encode($registros);
?>