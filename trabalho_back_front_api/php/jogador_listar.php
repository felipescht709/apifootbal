<?php
    require 'banco.php';

    $sql = "select * from jogador order by idjogador";
    $qry = $conexao-> prepare($sql);
    $qry->execute();
    $registros = $qry->fetchAll(PDO::FETCH_OBJ);
    echo json_encode($registros);
?> 