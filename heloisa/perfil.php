<?php
session_start();
require_once __DIR__ . '/config.php';
if (!isset($_SESSION['user_id'])) {
  header('Location: login.php');
  exit;
}
$usuarioId = $_SESSION['user_id'];
try {
  $pdo = db();
  $stmt = $pdo->prepare(" SELECT id, nome, email FROM alunos WHERE id = ? LIMIT 1 ");
  $stmt->execute([$usuarioId]);
  $usuario = $stmt->fetch();
  if (!$usuario) {
    session_destroy();
    header('Location: login.php');
    exit;
  }
} catch (Throwable $e) {
  http_response_code(500);
  exit('Erro ao carregar o perfil.');
}
?>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Repre - Perfil</title>
  <link rel="stylesheet" href="perfil.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>

<body>
  <nav class="navbar"> <a href="home.php" class="logo"> REPRE </a>
    <div class="nav-links"> <a href="home.php">Início</a> <a href="desempenho.php">Desempenho</a> <a href="perfil.php"
        class="ativo">Perfil</a> </div> <a href="logout.php" class="btn-sair"> Sair </a>
  </nav>
  <main class="perfil-container">
    <div class="perfil-header">
      <div class="avatar">
        <?= strtoupper(substr(htmlspecialchars($usuario['nome']), 0, 1)) ?>
      </div>
      <div>
        <h1>Meu perfil</h1>
        <p> Gerencie sua conta e personalize o REPRE. </p>
      </div>
    </div>
    <div class="perfil-grid"> <!-- INFORMAÇÕES DA CONTA -->
      <section class="perfil-card">
        <div class="card-titulo">
          <h2>Informações da conta</h2> <span>👤</span>
        </div>
        <div class="campo"> <label>Nome</label>
          <div class="campo-valor">
            <?= htmlspecialchars($usuario['nome']) ?>
          </div>
        </div>
        <div class="campo"> <label>E-mail</label>
          <div class="campo-valor">
            <?= htmlspecialchars($usuario['email']) ?>
          </div>
        </div>
      </section> <!-- PERSONALIZAÇÃO -->
      <section class="perfil-card">
        <div class="card-titulo">
          <h2>Personalização</h2> <span>🎨</span>
        </div>
        <div class="config-item">
          <div> <strong>Modo escuro</strong>
            <p> Altere a aparência do REPRE. </p>
          </div> <label class="switch"> <input type="checkbox" id="modoEscuro"> <span class="slider"></span> </label>
        </div>
        <div class="config-item">
          <div> <strong>Cor principal</strong>
            <p> Escolha a cor dos elementos do site. </p>
          </div> <input type="color" id="corPrincipal" value="#584391">
        </div>
      </section> <!-- SEGURANÇA -->
      <section class="perfil-card">
        <div class="card-titulo">
          <h2>Segurança</h2> <span>🔐</span>
        </div> <button type="button" class="botao-senha" onclick="alterarSenha()"> Alterar senha </button>
      </section> <!-- SAIR -->
      <section class="perfil-card card-perigo">
        <div class="card-titulo">
          <h2>Sair da conta</h2> <span>🚪</span>
        </div>
        <p> Ao sair, sua sessão atual será encerrada. </p> <a href="/logout.php" class="botao-sair"> Sair da conta </a>
      </section>
    </div>
  </main>
  <script> const modoEscuro = document.getElementById('modoEscuro'); const corPrincipal = document.getElementById('corPrincipal'); /* * MODO ESCURO */ const temaSalvo = localStorage.getItem('tema'); if (temaSalvo === 'escuro') { document.body.classList.add('dark'); modoEscuro.checked = true; } modoEscuro.addEventListener('change', () => { if (modoEscuro.checked) { document.body.classList.add('dark'); localStorage.setItem('tema', 'escuro'); } else { document.body.classList.remove('dark'); localStorage.setItem('tema', 'claro'); } }); /* * COR PRINCIPAL */ const corSalva = localStorage.getItem('corPrincipal'); if (corSalva) { corPrincipal.value = corSalva; document.documentElement.style.setProperty('--roxo', corSalva); } corPrincipal.addEventListener('input', () => { const cor = corPrincipal.value; document.documentElement.style.setProperty('--roxo', cor); localStorage.setItem('corPrincipal', cor); }); /* * ALTERAR SENHA */ function alterarSenha() { alert('A função de alteração de senha será adicionada na próxima etapa.'); } </script>
</body>

</html>