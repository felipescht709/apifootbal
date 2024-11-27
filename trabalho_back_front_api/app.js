function iniciar() {
  listarJogador();
}

async function listarJogador() {
  var url = "./php/jogador_listar.php";
  var res = await fetch(url).then((resposta) => {
    return resposta.json();
  });

  var tabela = document.getElementById("tabelaJogador");
  var a = "";
  for (var i = 0; i < res.length; i++) {
    let dataNascimentoFormatada = formatarData(res[i].nascimento);
    a += `
      <tr>
        <td><img src="${res[i].foto}" alt="Foto do jogador" style="width: 50px; height: 50px;"></td>
        <td>${res[i].idjogador}</td>
        <td>${res[i].nomejogador}</td>
        <td>${res[i].numero}</td>
        <td>${res[i].idade}</td>
        <td>${dataNascimentoFormatada}</td>
        <td>${res[i].gol}</td>
        <td>${res[i].time}</td>
        <td>
          <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modaljogador" 
            onclick="abrirJogador(${res[i].idjogador})">Alterar</button>
        </td>
        <td>
          <button class="btn btn-danger" onclick="excluirJogador(${res[i].idjogador})">Excluir</button>
        </td>
      </tr>`;
  }
  tabela.innerHTML = a;
}
async function excluirTodosJogadores() {
  if (!confirm("Deseja realmente excluir todos os jogadores agora?")) return;
  var url = `./php/jogador_excluir.php`;
  await fetch(url)
    .then((resposta) => resposta.json())
    .then((data) => {
      listarJogador();
      exibirLogs();
    })
    .catch((erro) => {});
}

async function exibirLogs() {
  var url = "./php/log_exibir.php";
  var logs = await fetch(url).then((resposta) => resposta.json());

  var logContainer = document.getElementById("logContainer");
  logContainer.innerHTML = "";

  var logTable = `
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th>ID Log</th>
          <th>Data e Hora</th>
          <th>Número de Registros</th>
        </tr>
      </thead>
      <tbody>
  `;

  logs.forEach(log => {
    logTable += `
      <tr>
        <td>${log.idlog}</td>
        <td>${log.datahora}</td>
        <td>${log.numeroregistros}</td>
      </tr>
    `;
  });

  logTable += `
      </tbody>
    </table>
  `;

  logContainer.innerHTML = logTable;
}

document.addEventListener("DOMContentLoaded", function() {
  const buttonExibirLogs = document.querySelector("button[onclick='exibirLogs()']");
  buttonExibirLogs.addEventListener("click", exibirLogs);
});


async function abrirJogador(idjogador) {
  var inputIdjogador = document.getElementById("idjogador");
  var inputNomeJogador = document.getElementById("nomejogador");
  var inputNumero = document.getElementById("numero");
  var inputIdade = document.getElementById("idade");
  var inputNascimento = document.getElementById("nascimento");
  var inputGol = document.getElementById("gol");
  var inputTime = document.getElementById("time");
  if (idjogador == 0) {
    document.getElementById("titulojogador").innerHTML = `Inserindo novo jogador`;
    inputIdjogador.value = "";
    inputNomeJogador.value = "";
    inputNumero.value = "";
    inputIdade.value = "";
    inputNascimento.value = "";
    inputGol.value = "";
    inputTime.value = "";
  } else {
    document.getElementById("titulojogador").innerHTML = `Alterando jogador ${idjogador}`;

    var url = `./php/jogador_selecionar.php?idjogador=${idjogador}`;
    var res = await fetch(url).then((resposta) => {
      return resposta.json();
    });
    inputIdjogador.value = res[0].idjogador;
    inputNomeJogador.value = res[0].nomejogador;
    inputNumero.value = res[0].numero;
    inputIdade.value = res[0].idade;
    inputNascimento.value = res[0].nascimento;
    inputGol.value = res[0].gol;
    inputTime.value = res[0].time;
  }
}

async function SalvarJogador() {
  var inputIdjogador = document.getElementById("idjogador");
  var inputNomeJogador = document.getElementById("nomejogador");
  var inputNumero = document.getElementById("numero");
  var inputIdade = document.getElementById("idade");
  var inputNascimento = document.getElementById("nascimento");
  var inputGol = document.getElementById("gol");
  var inputTime = document.getElementById("time");
  var url = "";

  if (inputIdjogador.value == "") {
    url = `./php/jogador_inserir.php?nomejogador=${inputNomeJogador.value}&numero=${inputNumero.value}&idade=${inputIdade.value}&nascimento=${inputNascimento.value}&gol=${inputGol.value}&time=${inputTime.value}`;
  } else {
    url = `./php/jogador_alterar.php?idjogador=${inputIdjogador.value}&nomejogador=${inputNomeJogador.value}&numero=${inputNumero.value}&idade=${inputIdade.value}&nascimento=${inputNascimento.value}&gol=${inputGol.value}&time=${inputTime.value}`;
  }

  await fetch(url)
    .then((resposta) => resposta.json())
    .then((data) => {
      listarJogador();
    })
    .catch((erro) => {});
}

async function excluirJogador(idjogador) {
  if (!confirm("Deseja realmente excluir o jogador agora?")) return;
  var url = `./php/jogador_excluir.php?idjogador=${idjogador}`;
  await fetch(url)
    .then((resposta) => resposta.json())
    .then((data) => {
      listarJogador();
    })
    .catch((erro) => {});
}

function buscarDadosApi() {
  var nomeJogador = document.getElementById("nomeJogadorInput").value;
  var url = `https://apiv3.apifootball.com/?action=get_players&player_name=${nomeJogador}&APIkey=1d021bbdfe73b45b58077cbebb3f1ebe50cc8c01057b446133dbfa4968ccef75`;

  fetch(url)
    .then((resposta) => resposta.json())
    .then((dados) => {
      inserirJogadorNoBanco(dados);
    })
    .catch((erro) => {});
}

async function inserirJogadorNoBanco(dados) {
  if (!confirm(`Deseja realmente inserir ${dados.length} jogadores agora?`)) return;
  if (dados.length > 0) {
    for (let i = 0; i < dados.length; i++) {
      var jogador = dados[i];
      var url = `./php/jogador_inserir.php?nomejogador=${jogador.player_name}&numero=${jogador.player_number}&idade=${jogador.player_age}&nascimento=${jogador.player_birthdate}&gol=${jogador.player_goals}&time=${jogador.team_name}&foto=${jogador.player_image}`;

      await fetch(url)
        .then((resposta) => resposta.text())  
        .then((texto) => {
          const json = JSON.parse(texto);
          if (!json.erro) {
          }
        })
        .catch((erro) => {});
    }
    listarJogador();
  } else { }
}

function formatarData(data) {
  var partes = data.split('-');
  return `${partes[2]}/${partes[1]}/${partes[0]}`;
}



