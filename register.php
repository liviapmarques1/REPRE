<?php
declare(strict_types=1);

require_once __DIR__ . '/Settings/auth.php';

if (!empty($_SESSION['user_id'])) {
    redirect('home.php');
}

$error = '';
$oldName = '';
$oldEmail = '';
$oldTipo = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    verify_csrf();

    $oldName = trim((string)($_POST['name'] ?? ''));
    $oldEmail = strtolower(trim((string)($_POST['email'] ?? '')));
    $senha = (string)($_POST['password'] ?? '');
    $oldTipo = (string)($_POST['tipo']?? '');
    
    $tiposPermitidos = [
        'aluno',
        'professor',
        'representante',
        'gremio',
        'atletica'
    ];

    if (!in_array($oldTipo, $tiposPermitidos, true)) {
        $error = 'Selecione um tipo de conta válido.';
    } elseif ($oldName === '' || strlen($oldName) > 120) {
        $error = 'Informe um nome válido.';
    } elseif (!filter_var($oldEmail, FILTER_VALIDATE_EMAIL) || strlen($oldEmail) > 150) {
        $error = 'Informe um e-mail válido.';
    } elseif (strlen($senha) < 8 || strlen($senha) > 72) {
        $error = 'A senha deve ter entre 8 e 72 caracteres.';
    } else {
        $check = db()->prepare('SELECT id FROM alunos WHERE email = :email LIMIT 1');
        $check->execute(['email' => $oldEmail]);

        if ($check->fetch()) {
            $error = 'Este e-mail já está cadastrado.';
        } else {
            $hash = password_hash($senha, PASSWORD_DEFAULT);
            
            $statusConta = ($oldTipo ==='ativo')
                ? 'ativo' 
                : 'pendente';

            $stmt = db()->prepare(
                'INSERT INTO alunos (nome, email, senha_hash, tipo, status_conta)
                 VALUES (:nome, :email, :senha_hash, :tipo, :status_conta)'
            );
            $stmt->execute([
                'nome' => $oldName,
                'email' => $oldEmail,
                'senha_hash' => $hash,
                'tipo' => $oldTipo,
                'status_conta' => $statusConta
            ]);

            redirect('login.php');
        }
    }
}
?>

<!doctype html>
<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Criar Conta</title>
    <link rel="shortcut icon" href="Images/Logo.png" type="image/x-icon" />
    <link rel="stylesheet" href="Styles/login-register.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
    />
  </head>

  <body>
    <div class="bg-books" id="bgBooks" aria-hidden="true"></div>
    <header>
      <div>
        <img src="Images/Logo.png" alt="Logo" height="30px" />
        <!-- <i class="fa-solid fa-graduation-cap" style="color: #584391;"></i> -->
        <a href="index.html">REPRE</a>
      </div>
      <a href="index.html" class="btn back">
        <i class="fa-solid fa-right-from-bracket"></i>
        Voltar
      </a>
    </header>
    <main>
      <div class="card">
        <h2>Crie sua conta para acessar sua turma.</h2>
        <?php if ($error): ?>
          <p role="alert" style="color:#c0392b;"><?= e($error) ?></p>
        <?php endif; ?>
        <form action="register.php" method="post" class="principal-form">
 <label for="tipo">Tipo de conta</label>

    <select name="tipo" id="tipo" class="form-input" required>
        <option value="">Selecione seu perfil</option>
        <option value="aluno">Aluno</option>
        <option value="professor">Professor</option>
        <option value="representante">Representante</option>
        <option value="gremio">Grêmio</option>
        <option value="atletica">Atlética</option>
    </select>
    
    <input type="hidden" name="csrf_token" value="<?= e(csrf_token()) ?>">

    <input
        class="form-input"
        type="text"
        name="name"
        placeholder="Nome Completo"
        maxlength="120"
        autocomplete="name"
        value="<?= e($oldName) ?>"
        required
    >

    <input
        class="form-input"
        type="email"
        name="email"
        placeholder="Email"
        maxlength="150"
        autocomplete="email"
        value="<?= e($oldEmail) ?>"
        required
    >

    <input
        class="form-input"
        type="password"
        name="password"
        placeholder="Senha (mín. 8 caracteres)"
        minlength="8"
        maxlength="72"
        autocomplete="new-password"
        required
    >

    <button type="submit" class="form-input btn-submit">
        Cadastrar
    </button>

</form>
      </div>
    </main>
    <footer>© 2026 Repre · Estude com organização</footer>

    <script src="funcaolivros.js"></script>
  </body>
</html>
