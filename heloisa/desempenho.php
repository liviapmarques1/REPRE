<?php
require_once __DIR__ . '/auth.php';
require_login();
?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Repre - Desempenho</title>
    <link rel="stylesheet" href="desempenho.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>

<body>
    <div class="layout">

        <!-- NAVBAR -->
        <div class="navbar">
    <div class="logo">
        <div class="logo-icon">REPRE</div>
    </div>

    <div class="links">
        <a href="home.php">Home</a>
        <a href="#">Atividades</a>

        <a href="#">
            Calendário
            <i class="fa-solid fa-caret-down"></i>
        </a>

        <a href="#" class="active">Desempenho</a>

        <a href="#">
            Atlética e Grêmio
            <i class="fa-solid fa-caret-down"></i>
        </a>
    </div>

    <div class="sininho">
        <i class="fa-solid fa-bell" style="color:#584391;"></i>
    </div>

    <div class="profile">
        <a href="perfil.php">
            <img src="imagem-foto-perfil.jpg" alt="Foto de perfil">
        </a>
    </div>
</div>

        <!-- CONTEÚDO -->
        <div class="content">

            <!-- BOAS-VINDAS -->
            <section class="welcome">
                <div class="welcome-text">
                    <h1>Seu Desempenho, <?= e($_SESSION['user_name']) ?>!</h1>
                    <p>Confira seu desempenho mensal e semanal.</p>
                </div>

                <div class="citacao">
                    “Para ser válida, toda educação, toda ação educativa deve necessariamente estar precedida de uma
                    reflexão sobre o homem e de uma análise do meio de vida concreto do homem concreto a quem queremos
                    educar.”
                    <br>
                    <strong>— Paulo Freire</strong>
                </div>
            </section>

            <!-- CONTEÚDO PRINCIPAL -->
            <div class="dashboard-conteudo">

                <!-- RESUMO -->
                <div class="dashboard">
                    <div class="desempenho-header">
                        <div class="desempenho-titulo"></div>

                        <select class="select-mes" id="selectMes">
                            <option value="2026-06">📅 Junho de 2026</option>
                            <option value="2026-05">Maio de 2026</option>
                            <option value="2026-04">Abril de 2026</option>
                        </select>
                    </div>

                    <div class="header-dash">
                        <div class="header-dash-left">
                            <div class="bola-header-dash">
                                <i class="fa-solid fa-chart-line" style="font-size:18px;color:#584391;"></i>
                            </div>

                            <div>
                                <h2>Resumo de atividades</h2>
                                <p>Seu desempenho geral</p>
                            </div>
                        </div>
                    </div>

                    <div class="particoes">
                        <div class="card-particoes">
                            <div class="topo-particoes">
                                <div class="circle verdin">
                                    <i class="fa-regular fa-circle-check"></i>
                                </div>
                                <span class="numero verdin-text">24</span>
                            </div>

                            <h3>Concluídas</h3>
                            <p class="variacao verdin-text">↑ 12%</p>
                        </div>

                        <div class="divisoria"></div>

                        <div class="card-particoes">
                            <div class="topo-particoes">
                                <div class="circle amarelo">
                                    <i class="fa-regular fa-clock"></i>
                                </div>
                                <span class="numero amarelo-text">11</span>
                            </div>

                            <h3>Pendentes</h3>
                            <p class="variacao amarelo-text">↑ 3%</p>
                        </div>

                        <div class="divisoria"></div>

                        <div class="card-particoes">
                            <div class="topo-particoes">
                                <div class="circle vermeio">
                                    <i class="fa-solid fa-circle-exclamation"></i>
                                </div>
                                <span class="numero vermeio-text">5</span>
                            </div>

                            <h3>Atrasadas</h3>
                            <p class="variacao vermeio-text">↑ 2%</p>
                        </div>
                    </div>
                </div>

                <!-- GRÁFICOS PRINCIPAIS -->
                <div class="performance-grid">

                    <!-- VISÃO GERAL -->
                    <div class="perf-card">
                        <div class="header-painel">
                            <div class="icon-header">
                                <i class="fa-solid fa-chart-pie" style="color:#584391;"></i>
                            </div>

                            <div class="header-painel-left">
                                <h2>Visão geral</h2>
                                <p>Distribuição das suas atividades</p>
                            </div>
                        </div>

                        <div class="painel-content">
                            <div class="chart">
                                <div class="pizza">
                                    <div class="center">
                                        <h1>40</h1>
                                        <span>total de tarefas</span>
                                    </div>
                                </div>
                            </div>

                            <div class="dados">
                                <div class="item">
                                    <div class="info">
                                        <span class="bola green"></span>
                                        <p>Concluídas</p>
                                    </div>
                                    <span>24 (57%)</span>
                                </div>

                                <div class="item">
                                    <div class="info">
                                        <span class="bola yellow"></span>
                                        <p>Pendentes</p>
                                    </div>
                                    <span>11 (26%)</span>
                                </div>

                                <div class="item">
                                    <div class="info">
                                        <span class="bola red"></span>
                                        <p>Atrasadas</p>
                                    </div>
                                    <span>5 (12%)</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- POR MATÉRIAS -->
                    <div class="perf-card">
                        <div class="header-painel-porMateria">
                            <div class="icon-header-painel-porMateria">
                                <i class="fa-solid fa-chart-bar" style="color:#584391;"></i>
                            </div>

                            <div class="header-painel-porMateria-left">
                                <h2>Por Matérias</h2>
                                <p>Seu desempenho em cada matéria</p>
                            </div>
                        </div>

                        <div class="painel-porMateria-content">

                            <div class="materias">
                                <div class="materias-header">
                                    <span>Matemática</span>
                                    <span>85%</span>
                                </div>
                                <div class="barra-progresso">
                                    <div class="progresso matematica"></div>
                                </div>
                            </div>

                            <div class="materias">
                                <div class="materias-header">
                                    <span>Português</span>
                                    <span>75%</span>
                                </div>
                                <div class="barra-progresso">
                                    <div class="progresso portugues"></div>
                                </div>
                            </div>

                            <div class="materias">
                                <div class="materias-header">
                                    <span>Física</span>
                                    <span>80%</span>
                                </div>
                                <div class="barra-progresso">
                                    <div class="progresso fisica"></div>
                                </div>
                            </div>

                            <div class="materias">
                                <div class="materias-header">
                                    <span>Química</span>
                                    <span>58%</span>
                                </div>
                                <div class="barra-progresso">
                                    <div class="progresso quimica"></div>
                                </div>
                            </div>

                            <div class="materias">
                                <div class="materias-header">
                                    <span>Sociologia</span>
                                    <span>77%</span>
                                </div>
                                <div class="barra-progresso">
                                    <div class="progresso sociologia"></div>
                                </div>
                            </div>

                            <div class="materias">
                                <div class="materias-header">
                                    <span>Banco de Dados</span>
                                    <span>90%</span>
                                </div>
                                <div class="barra-progresso">
                                    <div class="progresso banco-dados"></div>
                                </div>
                            </div>

                            <div class="materias">
                                <div class="materias-header">
                                    <span>Filosofia</span>
                                    <span>88%</span>
                                </div>
                                <div class="barra-progresso">
                                    <div class="progresso filosofia"></div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- DESEMPENHO SEMANAL -->
                    <div class="perf-card desempenho-semanal">

                        <div class="header-painel">
                            <div class="icon-header">
                                <i class="fa-solid fa-chart-column" style="color:#584391;"></i>
                            </div>

                            <div class="header-painel-left">
                                <h2>Desempenho Semanal</h2>
                                <p>Evolução das atividades entregues, pendentes e atrasadas.</p>
                            </div>
                        </div>

                        <div class="weekly-chart">
                            <div class="week-col">
                                <i class="bar-col green-bg" style="height:55%"></i>
                                <i class="bar-col orange-bg" style="height:25%"></i>
                                <i class="bar-col red-bg" style="height:15%"></i>
                            </div>

                            <div class="week-col">
                                <i class="bar-col green-bg" style="height:62%"></i>
                                <i class="bar-col orange-bg" style="height:27%"></i>
                                <i class="bar-col red-bg" style="height:15%"></i>
                            </div>

                            <div class="week-col">
                                <i class="bar-col green-bg" style="height:68%"></i>
                                <i class="bar-col orange-bg" style="height:27%"></i>
                                <i class="bar-col red-bg" style="height:14%"></i>
                            </div>

                            <div class="week-col">
                                <i class="bar-col green-bg" style="height:73%"></i>
                                <i class="bar-col orange-bg" style="height:27%"></i>
                                <i class="bar-col red-bg" style="height:15%"></i>
                            </div>

                            <div class="week-col">
                                <i class="bar-col green-bg" style="height:70%"></i>
                                <i class="bar-col orange-bg" style="height:29%"></i>
                                <i class="bar-col red-bg" style="height:11%"></i>
                            </div>

                            <div class="week-col">
                                <i class="bar-col green-bg" style="height:78%"></i>
                                <i class="bar-col orange-bg" style="height:27%"></i>
                                <i class="bar-col red-bg" style="height:10%"></i>
                            </div>

                            <div class="week-col">
                                <i class="bar-col green-bg" style="height:80%"></i>
                                <i class="bar-col orange-bg" style="height:27%"></i>
                                <i class="bar-col red-bg" style="height:10%"></i>
                            </div>
                        </div>

                        <div class="week-labels">
                            <span>Seg<br>16/06</span>
                            <span>Ter<br>17/06</span>
                            <span>Qua<br>18/06</span>
                            <span>Qui<br>19/06</span>
                            <span>Sex<br>20/06</span>
                            <span>Sáb<br>21/06</span>
                            <span>Dom<br>22/06</span>
                        </div>

                        <div class="legend-mini">
                            <span>
                                <i class="legend-green"></i>
                                Entregues
                            </span>
                            <span>
                                <i class="legend-orange"></i>
                                Pendentes
                            </span>
                            <span>
                                <i class="legend-red"></i>
                                Atrasadas
                            </span>
                        </div>

                    </div>
                </div>

                <!-- NOVOS DASHBOARDS -->
                <div class="performance-grid">

                    <!-- EVOLUÇÃO -->
                    <div class="perf-card evolucao-card">
                        <h3>
                            <span class="card-icon">
                                <i class="fa-solid fa-chart-line"></i>
                            </span>
                            Evolução do Desempenho
                        </h3>

                        <p>Percentual de atividades entregues ao longo das semanas.</p>

                        <div class="evolucao-chart">
                            <div class="evolucao-eixos">
                                <span>100%</span>
                                <span>75%</span>
                                <span>50%</span>
                                <span>25%</span>
                                <span>0%</span>
                            </div>

                            <div class="evolucao-linha"></div>

                            <span class="evolucao-ponto"></span>
                            <span class="evolucao-ponto"></span>
                            <span class="evolucao-ponto"></span>
                            <span class="evolucao-ponto"></span>
                            <span class="evolucao-ponto"></span>
                            <span class="evolucao-ponto"></span>
                            <span class="evolucao-ponto"></span>
                        </div>

                        <div class="evolucao-labels">
                            <span>Sem 1</span>
                            <span>Sem 2</span>
                            <span>Sem 3</span>
                            <span>Sem 4</span>
                            <span>Sem 5</span>
                            <span>Sem 6</span>
                            <span>Sem 7</span>
                        </div>
                    </div>

                    <!-- TAXA DE CONCLUSÃO -->
                    <div class="perf-card conclusao-card">
                        <h3>
                            <span class="card-icon">
                                <i class="fa-solid fa-bullseye"></i>
                            </span>
                            Taxa de Conclusão
                        </h3>

                        <p>Seu progresso geral nas atividades.</p>

                        <div class="conclusao-content">
                            <div class="conclusao-ring">
                                <div class="conclusao-ring-content">
                                    <strong>78%</strong>
                                    <small>da meta</small>
                                </div>
                            </div>

                            <div class="conclusao-info">
                                <span class="conclusao-numero">39 de 50</span>
                                <small>atividades concluídas</small>

                                <div class="conclusao-barra">
                                    <span></span>
                                </div>

                                <span class="conclusao-variacao">
                                    ↑ 8% em relação à semana anterior
                                </span>
                            </div>
                        </div>
                    </div>

                    <!-- MATÉRIA QUE PRECISA DE ATENÇÃO -->
                    <div class="perf-card atencao-card">
                        <h3>
                            <span class="card-icon">
                                <i class="fa-solid fa-triangle-exclamation"></i>
                            </span>
                            Matéria que precisa de mais atenção
                        </h3>

                        <p>Veja qual matéria tem mais pendências.</p>

                        <div class="atencao-principal">
                            <div class="atencao-materia">
                                <div class="atencao-materia-info">
                                    <div class="atencao-icone">
                                        <i class="fa-solid fa-book"></i>
                                    </div>

                                    <div>
                                        <strong>Matemática</strong>
                                        <small>7 atividades pendentes</small>
                                    </div>
                                </div>

                                <span class="atencao-badge">
                                    Requer atenção
                                </span>
                            </div>

                            <div class="atencao-barra">
                                <span></span>
                            </div>

                            <div class="atencao-porcentagem">
                                <span>Atividades entregues</span>
                                <strong>63%</strong>
                            </div>
                        </div>

                        <div class="atencao-outras">
                            <div class="atencao-outras-titulo">
                                Outras matérias com mais pendências:
                            </div>

                            <div class="atencao-outra">
                                <span class="atencao-ponto" style="background:#ef4f5b;"></span>
                                <span class="atencao-outra-nome">Física</span>
                                <span class="atencao-outra-pendentes">4 pendentes</span>
                                <span class="atencao-outra-percentual">52%</span>
                            </div>

                            <div class="atencao-outra">
                                <span class="atencao-ponto" style="background:#ffa82d;"></span>
                                <span class="atencao-outra-nome">Geografia</span>
                                <span class="atencao-outra-pendentes">3 pendentes</span>
                                <span class="atencao-outra-percentual">68%</span>
                            </div>

                            <div class="atencao-outra">
                                <span class="atencao-ponto" style="background:#2d89ee;"></span>
                                <span class="atencao-outra-nome">Inglês</span>
                                <span class="atencao-outra-pendentes">2 pendentes</span>
                                <span class="atencao-outra-percentual">82%</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- PRÓXIMOS PRAZOS -->
                <div class="perf-card prazos-card">
                    <h3>
                        <span class="card-icon">
                            <i class="fa-regular fa-calendar"></i>
                        </span>
                        Próximos Prazos
                    </h3>

                    <p>Não se esqueça das suas atividades!</p>

                    <div class="prazo-item">
                        <div class="prazo-data">
                            <strong>25</strong>
                            <small>Jun</small>
                        </div>

                        <div class="prazo-info">
                            <strong>Matemática</strong>
                            <small>Lista de exercícios</small>
                        </div>

                        <span class="prazo-badge urgente">Amanhã</span>
                    </div>

                    <div class="prazo-item">
                        <div class="prazo-data">
                            <strong>27</strong>
                            <small>Jun</small>
                        </div>

                        <div class="prazo-info">
                            <strong>Física</strong>
                            <small>Trabalho prático</small>
                        </div>

                        <span class="prazo-badge proximo">Em 3 dias</span>
                    </div>

                    <div class="prazo-item">
                        <div class="prazo-data">
                            <strong>30</strong>
                            <small>Jun</small>
                        </div>

                        <div class="prazo-info">
                            <strong>História</strong>
                            <small>Seminário</small>
                        </div>

                        <span class="prazo-badge proximo">Em 5 dias</span>
                    </div>

                    <div class="prazo-item">
                        <div class="prazo-data">
                            <strong>02</strong>
                            <small>Jul</small>
                        </div>

                        <div class="prazo-info">
                            <strong>Português</strong>
                            <small>Redação</small>
                        </div>

                        <span class="prazo-badge proximo">Em 7 dias</span>
                    </div>
                </div>

                <!-- META SEMANAL -->
                <div class="goal-card">

                    <div class="goal-ring">
                        <div>
                            <strong>78%</strong>
                            <small>da meta</small>
                        </div>
                    </div>

                    <div class="goal-form">
                        <label>Minha meta de atividades entregues esta semana</label>

                        <div class="goal-input">
                            <input id="goal" type="number" min="1" max="100" value="80">
                            <span>%</span>
                        </div>

                        <button class="save" onclick="saveGoal()">
                            Salvar meta
                        </button>
                    </div>

                    <div class="goal-progress">
                        <b>
                            🏆 Seu progresso atual
                            <br>
                            78%
                        </b>

                        <div class="bar">
                            <span style="width:78%;"></span>
                        </div>

                        <p id="goal-msg" class="label">
                            Você está a 2% da sua meta. Continue assim!
                        </p>
                    </div>

                </div>

                <!-- SEQUÊNCIA DE ESTUDOS -->
                <div class="sequencia-card">

                    <div>
                        <div class="sequencia-titulo">
                            <span class="card-icon">
                                <i class="fa-solid fa-trophy"></i>
                            </span>

                            <div>
                                <h3>Sequência de Estudos</h3>
                                <p>Você tem mantido uma ótima constância!</p>
                            </div>
                        </div>
                    </div>

                    <div class="sequencia-dados">

                        <div class="sequencia-numero">
                            <span class="emoji">🔥</span>

                            <div>
                                <strong>7 dias</strong>
                                <small>de sequência atual</small>
                            </div>
                        </div>

                        <div class="sequencia-divisor"></div>

                        <div class="melhor-sequencia">
                            <span class="trofeu">🏆</span>

                            <div>
                                <small>Melhor sequência:</small>
                                <strong>12 dias</strong>
                            </div>
                        </div>

                    </div>

                    <div class="sequencia-frase">
                        “Disciplina hoje, conquista amanhã!” 🚀
                    </div>

                </div>

            </div>
        </div>
    </div>

    <!-- JAVASCRIPT DA META -->
    <script>
        function saveGoal() {
            const goal = document.getElementById("goal").value;
            const msg = document.getElementById("goal-msg");
            const atual = 78;

            if (goal <= 0 || goal > 100) {
                msg.textContent = "Digite uma meta entre 1% e 100%.";
                msg.style.color = "var(--vermelho)";
                return;
            }

            if (atual >= goal) {
                msg.textContent = "🎉 Você já alcançou sua meta!";
                msg.style.color = "var(--verde)";
            } else {
                const restante = goal - atual;
                msg.textContent = `Você está a ${restante}% da sua meta. Continue assim!`;
                msg.style.color = "var(--verde)";
            }
        }
    </script>

</body>

</html>