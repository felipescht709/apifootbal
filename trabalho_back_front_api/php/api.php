<?php
function buscarDadosApi($nomeJogador) {
    $APIkey = '1d021bbdfe73b45b58077cbebb3f1ebe50cc8c01057b446133dbfa4968ccef75';
    $url = "https://apiv3.apifootball.com/?action=get_players&player_name={$nomeJogador}&APIkey={$APIkey}";
    
    $curl_options = array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_HEADER => false,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_CONNECTTIMEOUT => 5
    );

    $curl = curl_init();
    curl_setopt_array($curl, $curl_options);
    $result = curl_exec($curl);

    if ($result === false) {
        return ["erro" => "Erro ao buscar dados da API: " . curl_error($curl)];
    }

    curl_close($curl);
    return json_decode($result, true);
}
?>
