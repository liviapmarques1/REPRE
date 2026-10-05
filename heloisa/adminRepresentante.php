<?php
declare(strict_types=1);

require_once __DIR__ . '/auth.php';

require_role(['representante']);

$usuarioId = (int) $_SESSION['user_id'];

$sql = "
    SELECT
        t.id,
        t.nome,
        t.serie,
        t.turno,
        t.ano_letivo
    FROM turma_membros tm
    INNER JOIN turmas t
        ON t.id = tm.turma_id
    WHERE tm.aluno_id = :aluno_id
      AND tm.papel = 'representante'
      AND t.ativa = 1
    ORDER BY t.ano_letivo DESC, t.nome
";

$stmt = db()->prepare($sql);

$stmt->execute([
    ':aluno_id' => $usuarioId
]);

$turmas = $stmt->fetchAll(PDO::FETCH_ASSOC);

$sql = "
    SELECT COUNT(*)
    FROM atividades a
    INNER JOIN turma_disciplinas td
        ON td.id = a.turma_disciplina_id
    INNER JOIN turma_membros tm
        ON tm.turma_id = td.turma_id
    WHERE tm.aluno_id = :aluno_id
      AND tm.papel = 'representante'
";

$stmt = db()->prepare($sql);

$stmt->execute([
    ':aluno_id' => $usuarioId
]);

$atividades = (int) $stmt->fetchColumn();
?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Administração do Representante - REPRE</title>

    <link rel="stylesheet" href="adminRepresentante.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet"
    >

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    >
</head>

<body>

<div class="pagina">

    <!-- NAVBAR -->
    <nav class="navbar">

        <a href="home.php" class="logo">
            REPRE
        </a>

        <div class="nav-links">

        <a href="home.php">Home</a>

        <a href="#">Atividades</a>

        <a href="#">
            Calendário
            <i class="fa-solid fa-caret-down"></i>
        </a>

        <a href="desempenho.php">Desempenho</a>

        <a href="#">
            Atlética e Grêmio
            <i class="fa-solid fa-caret-down"></i>
        </a>

        <a href="adminRepresentante.php" class="ativo">
            <i class="fa-solid fa-people-group"></i>
            Área de representante
        </a>
    </div>

        <div class="nav-direita">

            <a href="perfil.php" class="perfil-link">
                <i class="fa-solid fa-user"></i>
            </a>

            <a href="logout.php" class="btn-sair">
                Sair
            </a>

        </div>

    </nav>


    <!-- CONTEÚDO -->
    <main class="conteudo">

        <!-- CABEÇALHO -->
        <section class="cabecalho">

            <div>

                <span class="tag">
                    ÁREA DO REPRESENTANTE
                </span>

                <h1>
                    Olá, <?= e($_SESSION['user_name'] ?? 'Representante') ?>!
                </h1>

                <p>
                    Gerencie as informações e atividades das turmas que você representa.
                </p>

            </div>

        </section>


        <!-- RESUMO -->
        <section class="resumo">

            <div class="card-resumo">

                <div class="icone roxo">
                    <i class="fa-solid fa-people-group"></i>
                </div>

                <div>

                    <span>Turmas representadas</span>

                    <strong>
                        <?= count($turmas) ?>
                    </strong>

                </div>

            </div>


            <div class="card-resumo">

                <div class="icone azul">
                    <i class="fa-solid fa-list-check"></i>
                </div>

                <div>

                    <span>Atividades</span>

                    <strong>
                        <?= $atividades ?>
                    </strong>

                </div>

            </div>


            <div class="card-resumo">

                <div class="icone verde">
                    <i class="fa-solid fa-bullhorn"></i>
                </div>

                <div>

                    <span>Avisos</span>

                    <strong>
                        0
                    </strong>

                </div>

            </div>

        </section>


        <!-- TURMAS -->
        <section class="secao">

            <div class="secao-header">

                <div>

                    <h2>
                        Minhas turmas
                    </h2>

                    <p>
                        Selecione uma turma para administrar.
                    </p>

                </div>

            </div>


            <?php if (empty($turmas)): ?>

                <div class="vazio">

                    <div class="vazio-icone">
                        <i class="fa-solid fa-people-group"></i>
                    </div>

                    <h3>
                        Nenhuma turma encontrada
                    </h3>

                    <p>
                        Você ainda não foi definido como representante de nenhuma turma.
                    </p>

                </div>

            <?php else: ?>

                <div class="turmas-grid">

                    <?php foreach ($turmas as $turma): ?>

                        <article class="turma-card">

                            <div class="turma-topo">

                                <div class="turma-icone">
                                    <i class="fa-solid fa-users"></i>
                                </div>

                                <span class="status">
                                    Ativa
                                </span>

                            </div>


                            <h3>
                                <?= e($turma['nome']) ?>
                            </h3>


                            <p class="serie">
                                <?= e($turma['serie'] ?? 'Turma') ?>
                            </p>


                            <div class="turma-info">

                                <span>

                                    <i class="fa-regular fa-calendar"></i>

                                    <?= e((string) $turma['ano_letivo']) ?>

                                </span>


                                <span>

                                    <i class="fa-regular fa-clock"></i>

                                    <?= e(ucfirst($turma['turno'])) ?>

                                </span>

                            </div>


                            <a
                                href="adminTurma.php?id=<?= (int) $turma['id'] ?>"
                                class="btn-gerenciar"
                            >

                                Gerenciar turma

                                <i class="fa-solid fa-arrow-right"></i>

                            </a>

                        </article>

                    <?php endforeach; ?>

                </div>

            <?php endif; ?>

        </section>


        <!-- AÇÕES -->
        <section class="secao">

            <div class="secao-header">

                <div>

                    <h2>
                        Ações rápidas
                    </h2>

                    <p>
                        Ferramentas disponíveis para o representante.
                    </p>

                </div>

            </div>


            <?php if (!empty($turmas)): ?>

                <?php
                $turmaRapida = $turmas[0];
                ?>


                <div class="acoes-grid">


                    <!-- CRIAR ATIVIDADE -->
                    <a
                        href="criarAtividade.php?turma_id=<?= (int) $turmaRapida['id'] ?>"
                        class="acao-card"
                    >

                        <div class="acao-icone roxo">

                            <i class="fa-solid fa-plus"></i>

                        </div>


                        <div>

                            <h3>
                                Criar atividade
                            </h3>

                            <p>
                                Adicione uma atividade para a turma
                                <?= e($turmaRapida['nome']) ?>.
                            </p>

                        </div>


                        <i class="fa-solid fa-chevron-right seta"></i>

                    </a>


                    <!-- CRIAR AVISO -->
                    <a
                        href="#"
                        class="acao-card"
                    >

                        <div class="acao-icone azul">

                            <i class="fa-solid fa-bullhorn"></i>

                        </div>


                        <div>

                            <h3>
                                Criar aviso
                            </h3>

                            <p>
                                Publique um aviso para os alunos.
                            </p>

                        </div>


                        <i class="fa-solid fa-chevron-right seta"></i>

                    </a>


                    <!-- ADICIONAR EVENTO -->
                    <a
                        href="#"
                        class="acao-card"
                    >

                        <div class="acao-icone verde">

                            <i class="fa-solid fa-calendar-plus"></i>

                        </div>


                        <div>

                            <h3>
                                Adicionar evento
                            </h3>

                            <p>
                                Adicione um evento ao calendário da turma.
                            </p>

                        </div>


                        <i class="fa-solid fa-chevron-right seta"></i>

                    </a>

                </div>


            <?php else: ?>

                <div class="vazio">

                    <div class="vazio-icone">

                        <i class="fa-solid fa-lock"></i>

                    </div>

                    <h3>
                        Nenhuma turma disponível
                    </h3>

                    <p>
                        As ações rápidas estarão disponíveis quando você estiver
                        vinculado a uma turma.
                    </p>

                </div>

            <?php endif; ?>

        </section>

    </main>

</div>

</body>

</html>
```
