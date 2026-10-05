-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql112.infinityfree.com
-- Tempo de geração: 05-Out-2026 às 09:48
-- Versão do servidor: 11.4.13-MariaDB
-- versão do PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `if0_43054171_BancoRepre`
--
CREATE DATABASE BancoRepre;
USE BancoRepre;
-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(120) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `tipo` enum('aluno','professor','representante','gremio_atletica','coordenacao') NOT NULL DEFAULT 'aluno',
  `status_conta` enum('pendente','ativo','recusado') NOT NULL DEFAULT 'ativo',
  `matricula` varchar(30) DEFAULT NULL,
  `foto_url` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `ultimo_login` datetime DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `email`, `senha_hash`, `tipo`, `status_conta`, `matricula`, `foto_url`, `ativo`, `ultimo_login`, `criado_em`, `atualizado_em`) VALUES
(1, 'Lula', 'lulala@teste.com', '$2y$12$Lhb5uG5JGR0FBFicUvCPa.LQZRWi6tNf69TCnvItNx83rhK5eR/tK', 'aluno', 'ativo', NULL, NULL, 1, '2026-09-30 13:33:50', '2026-09-30 12:09:14', '2026-09-30 13:33:50'),
(2, 'bolsonaro lixo', 'lixoso@teste.com', '$2y$12$xdRBz6Ly6Rsmw0Wcd82ewOGcNKScHIySQa/eN4Y/MepqpeRHcGhs.', 'aluno', 'ativo', NULL, NULL, 1, '2026-09-30 13:49:22', '2026-09-30 13:47:08', '2026-09-30 13:49:22'),
(4, 'augusto cury', 'drone@gmail.com', '$2y$12$slquBYcFfOmfMAsTERaEceiNEbCiH4EuUendM9g32LMjR4ANz7ujC', 'aluno', 'ativo', NULL, NULL, 1, '2026-10-01 12:24:20', '2026-09-30 14:05:58', '2026-10-01 12:24:20'),
(11, 'Renatinha', 'renatinha@gmail.com', '$2y$12$dbas4ckHwhC7PqyEz9XbPuuWKK5MtzrM564nQi0mUq2CAlQRWfnFS', 'professor', 'ativo', NULL, NULL, 1, NULL, '2026-10-01 14:51:46', '2026-10-01 14:52:09'),
(12, 'Matheus Lima Camilo', 'camilomatheus0710@gmail.com', '$2y$12$pOjJrL4hxunZ/GjhHYdfJ.MD25Z60KhnEwVVesqe814VrYzH3iIB.', 'representante', 'ativo', NULL, NULL, 1, '2026-10-05 06:22:16', '2026-10-02 05:11:42', '2026-10-05 06:22:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `anexos`
--

CREATE TABLE `anexos` (
  `id` int(10) UNSIGNED NOT NULL,
  `atividade_id` int(10) UNSIGNED DEFAULT NULL,
  `entrega_id` int(10) UNSIGNED DEFAULT NULL,
  `mensagem_id` bigint(20) UNSIGNED DEFAULT NULL,
  `aviso_id` int(10) UNSIGNED DEFAULT NULL,
  `enviado_por` int(10) UNSIGNED NOT NULL,
  `nome_original` varchar(255) NOT NULL,
  `caminho` varchar(255) NOT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `tamanho_bytes` bigint(20) UNSIGNED DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividades`
--

CREATE TABLE `atividades` (
  `id` int(10) UNSIGNED NOT NULL,
  `turma_disciplina_id` int(10) UNSIGNED NOT NULL,
  `periodo_id` int(10) UNSIGNED DEFAULT NULL,
  `criador_id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `tipo` enum('tarefa','trabalho','prova','quiz','projeto','leitura') NOT NULL DEFAULT 'tarefa',
  `status` enum('rascunho','publicada','encerrada') NOT NULL DEFAULT 'rascunho',
  `em_grupo` tinyint(1) NOT NULL DEFAULT 0,
  `pontos` decimal(5,2) NOT NULL DEFAULT 10.00,
  `peso` decimal(4,2) NOT NULL DEFAULT 1.00,
  `permite_atraso` tinyint(1) NOT NULL DEFAULT 1,
  `publicada_em` datetime DEFAULT NULL,
  `data_limite` datetime DEFAULT NULL,
  `criada_em` datetime NOT NULL DEFAULT current_timestamp(),
  `atualizada_em` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `atividades`
--

INSERT INTO `atividades` (`id`, `turma_disciplina_id`, `periodo_id`, `criador_id`, `titulo`, `descricao`, `tipo`, `status`, `em_grupo`, `pontos`, `peso`, `permite_atraso`, `publicada_em`, `data_limite`, `criada_em`, `atualizada_em`) VALUES
(1, 2, 1, 12, 'Lista de geografia', 'Uma pesquisa sobre tipos de solo.', 'trabalho', 'publicada', 0, '3.00', '2.00', 0, '2026-10-02 09:26:33', '2026-10-07 10:00:00', '2026-10-02 06:26:33', '2026-10-02 06:26:33'),
(2, 1, 2, 12, 'lista de matematica', 'Responder perguntas da lista de matematica', 'trabalho', 'publicada', 1, '5.00', '3.00', 1, '2026-10-02 09:36:09', '2026-10-15 10:20:00', '2026-10-02 06:36:09', '2026-10-02 06:36:09'),
(3, 1, 2, 12, 'lista de matematica', 'Responder perguntas da lista de matematica', 'trabalho', 'publicada', 1, '5.00', '3.00', 1, '2026-10-02 09:37:19', '2026-10-15 10:20:00', '2026-10-02 06:37:19', '2026-10-02 06:37:19'),
(4, 1, 3, 12, 'lista de matematica', 'dqwua', 'trabalho', 'rascunho', 1, '10.00', '1.00', 1, NULL, '2026-10-03 10:36:00', '2026-10-02 06:37:41', '2026-10-02 06:37:41'),
(5, 1, 3, 12, 'lista de matematica', 'dqwua', 'trabalho', 'publicada', 1, '10.00', '1.00', 1, '2026-10-02 09:37:45', '2026-10-03 10:36:00', '2026-10-02 06:37:45', '2026-10-02 06:37:45'),
(6, 2, 2, 12, 'Lista de geografia', 'rgderfg', 'tarefa', 'publicada', 1, '10.00', '1.00', 1, '2026-10-02 09:39:16', '2026-10-19 10:38:00', '2026-10-02 06:39:16', '2026-10-02 06:39:16'),
(7, 1, 2, 12, 'lista de matematica', 'wrafr', 'trabalho', 'publicada', 1, '10.00', '1.00', 1, '2026-10-02 09:42:26', '2026-10-07 10:41:00', '2026-10-02 06:42:26', '2026-10-02 06:42:26');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aulas`
--

CREATE TABLE `aulas` (
  `id` int(10) UNSIGNED NOT NULL,
  `turma_disciplina_id` int(10) UNSIGNED NOT NULL,
  `data_aula` date NOT NULL,
  `conteudo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avisos`
--

CREATE TABLE `avisos` (
  `id` int(10) UNSIGNED NOT NULL,
  `turma_id` int(10) UNSIGNED DEFAULT NULL,
  `turma_disciplina_id` int(10) UNSIGNED DEFAULT NULL,
  `autor_id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `conteudo` text NOT NULL,
  `fixado` tinyint(1) NOT NULL DEFAULT 0,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canais`
--

CREATE TABLE `canais` (
  `id` int(10) UNSIGNED NOT NULL,
  `turma_disciplina_id` int(10) UNSIGNED NOT NULL,
  `equipe_id` int(10) UNSIGNED DEFAULT NULL,
  `nome` varchar(80) NOT NULL,
  `tipo` enum('geral','avisos','duvidas','equipe') NOT NULL DEFAULT 'geral',
  `criado_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `atividade_id` int(10) UNSIGNED DEFAULT NULL,
  `entrega_id` int(10) UNSIGNED DEFAULT NULL,
  `autor_id` int(10) UNSIGNED NOT NULL,
  `texto` text NOT NULL,
  `privado` tinyint(1) NOT NULL DEFAULT 0,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `criterios_avaliacao`
--

CREATE TABLE `criterios_avaliacao` (
  `id` int(10) UNSIGNED NOT NULL,
  `atividade_id` int(10) UNSIGNED NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `pontos_max` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(80) NOT NULL,
  `cor_hex` char(7) NOT NULL DEFAULT '#6B5CC5'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `disciplinas`
--

INSERT INTO `disciplinas` (`id`, `nome`, `cor_hex`) VALUES
(1, 'Matemática', '#6040DB'),
(2, 'História', '#E6535C'),
(3, 'Inglês', '#3470D9');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregas`
--

CREATE TABLE `entregas` (
  `id` int(10) UNSIGNED NOT NULL,
  `atividade_id` int(10) UNSIGNED NOT NULL,
  `aluno_id` int(10) UNSIGNED NOT NULL,
  `equipe_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pendente','entregue','atrasada','corrigida','devolvida') NOT NULL DEFAULT 'pendente',
  `texto` text DEFAULT NULL,
  `enviado_em` datetime DEFAULT NULL,
  `nota` decimal(5,2) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `corrigido_por` int(10) UNSIGNED DEFAULT NULL,
  `corrigido_em` datetime DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega_criterios`
--

CREATE TABLE `entrega_criterios` (
  `entrega_id` int(10) UNSIGNED NOT NULL,
  `criterio_id` int(10) UNSIGNED NOT NULL,
  `pontos` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipes`
--

CREATE TABLE `equipes` (
  `id` int(10) UNSIGNED NOT NULL,
  `turma_disciplina_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(80) NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe_alunos`
--

CREATE TABLE `equipe_alunos` (
  `equipe_id` int(10) UNSIGNED NOT NULL,
  `aluno_id` int(10) UNSIGNED NOT NULL,
  `lider` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

CREATE TABLE `eventos` (
  `id` int(10) UNSIGNED NOT NULL,
  `turma_id` int(10) UNSIGNED DEFAULT NULL,
  `atividade_id` int(10) UNSIGNED DEFAULT NULL,
  `criador_id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `tipo` enum('aula','prova','entrega','reuniao','feriado','outro') NOT NULL DEFAULT 'outro',
  `inicio` datetime NOT NULL,
  `fim` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_auditoria`
--

CREATE TABLE `log_auditoria` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `acao` varchar(60) NOT NULL,
  `entidade` varchar(60) NOT NULL,
  `entidade_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `log_auditoria`
--

INSERT INTO `log_auditoria` (`id`, `usuario_id`, `acao`, `entidade`, `entidade_id`, `ip`, `criado_em`) VALUES
(1, 12, 'criar', 'atividade', 1, '187.58.18.176', '2026-10-02 06:26:33'),
(2, 12, 'criar', 'atividade', 2, '187.58.18.176', '2026-10-02 06:36:09'),
(3, 12, 'criar', 'atividade', 3, '187.58.18.176', '2026-10-02 06:37:19'),
(4, 12, 'criar', 'atividade', 4, '187.58.18.176', '2026-10-02 06:37:41'),
(5, 12, 'criar', 'atividade', 5, '187.58.18.176', '2026-10-02 06:37:45'),
(6, 12, 'criar', 'atividade', 6, '187.58.18.176', '2026-10-02 06:39:16'),
(7, 12, 'criar', 'atividade', 7, '187.58.18.176', '2026-10-02 06:42:26');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `canal_id` int(10) UNSIGNED NOT NULL,
  `autor_id` int(10) UNSIGNED NOT NULL,
  `resposta_a_id` bigint(20) UNSIGNED DEFAULT NULL,
  `conteudo` text NOT NULL,
  `editada` tinyint(1) NOT NULL DEFAULT 0,
  `criado_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `tipo` enum('nova_atividade','nota','prazo','mensagem','aviso','sistema') NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `mensagem` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `lida` tinyint(1) NOT NULL DEFAULT 0,
  `criada_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `periodos_letivos`
--

CREATE TABLE `periodos_letivos` (
  `id` int(10) UNSIGNED NOT NULL,
  `ano` year(4) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL
) ;

--
-- Extraindo dados da tabela `periodos_letivos`
--

INSERT INTO `periodos_letivos` (`id`, `ano`, `nome`, `data_inicio`, `data_fim`) VALUES
(1, 2026, '1º Bimestre', '2026-02-02', '2026-04-30'),
(2, 2026, '2º Bimestre', '2026-05-01', '2026-07-31'),
(3, 2026, '3º Bimestre', '2026-08-03', '2026-09-30'),
(4, 2026, '4º Bimestre', '2026-10-01', '2026-12-18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `presencas`
--

CREATE TABLE `presencas` (
  `aula_id` int(10) UNSIGNED NOT NULL,
  `aluno_id` int(10) UNSIGNED NOT NULL,
  `situacao` enum('presente','falta','justificada') NOT NULL DEFAULT 'presente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tarefas_pessoais`
--

CREATE TABLE `tarefas_pessoais` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `atividade_id` int(10) UNSIGNED DEFAULT NULL,
  `titulo` varchar(150) NOT NULL,
  `descricao` text DEFAULT NULL,
  `coluna` enum('a_fazer','fazendo','concluida') NOT NULL DEFAULT 'a_fazer',
  `prioridade` enum('baixa','media','alta') NOT NULL DEFAULT 'media',
  `prazo` date DEFAULT NULL,
  `criada_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(80) NOT NULL,
  `serie` varchar(40) DEFAULT NULL,
  `turno` enum('manha','tarde','noite') NOT NULL DEFAULT 'manha',
  `ano_letivo` year(4) NOT NULL,
  `ativa` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `turmas`
--

INSERT INTO `turmas` (`id`, `nome`, `serie`, `turno`, `ano_letivo`, `ativa`) VALUES
(1, '3° DS', 'Ensino Médio', 'manha', 2026, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma_disciplinas`
--

CREATE TABLE `turma_disciplinas` (
  `id` int(10) UNSIGNED NOT NULL,
  `turma_id` int(10) UNSIGNED NOT NULL,
  `disciplina_id` int(10) UNSIGNED NOT NULL,
  `professor_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `turma_disciplinas`
--

INSERT INTO `turma_disciplinas` (`id`, `turma_id`, `disciplina_id`, `professor_id`) VALUES
(1, 1, 1, 11),
(2, 1, 2, 11),
(3, 1, 3, 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma_membros`
--

CREATE TABLE `turma_membros` (
  `turma_id` int(10) UNSIGNED NOT NULL,
  `aluno_id` int(10) UNSIGNED NOT NULL,
  `papel` enum('aluno','representante') NOT NULL DEFAULT 'aluno',
  `entrou_em` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `turma_membros`
--

INSERT INTO `turma_membros` (`turma_id`, `aluno_id`, `papel`, `entrou_em`) VALUES
(1, 1, 'aluno', '2026-10-01 14:47:39'),
(1, 2, 'aluno', '2026-10-01 14:47:39'),
(1, 4, 'aluno', '2026-10-01 14:47:39'),
(1, 12, 'representante', '2026-10-02 06:13:41');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `idx_alunos_tipo` (`tipo`),
  ADD KEY `idx_alunos_status` (`status_conta`);

--
-- Índices para tabela `anexos`
--
ALTER TABLE `anexos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `atividade_id` (`atividade_id`),
  ADD KEY `entrega_id` (`entrega_id`),
  ADD KEY `mensagem_id` (`mensagem_id`),
  ADD KEY `aviso_id` (`aviso_id`),
  ADD KEY `enviado_por` (`enviado_por`);

--
-- Índices para tabela `atividades`
--
ALTER TABLE `atividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ativ_limite` (`data_limite`),
  ADD KEY `idx_ativ_td` (`turma_disciplina_id`,`status`),
  ADD KEY `periodo_id` (`periodo_id`),
  ADD KEY `criador_id` (`criador_id`);

--
-- Índices para tabela `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_aula` (`turma_disciplina_id`,`data_aula`);

--
-- Índices para tabela `avisos`
--
ALTER TABLE `avisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turma_id` (`turma_id`),
  ADD KEY `turma_disciplina_id` (`turma_disciplina_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Índices para tabela `canais`
--
ALTER TABLE `canais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turma_disciplina_id` (`turma_disciplina_id`),
  ADD KEY `equipe_id` (`equipe_id`);

--
-- Índices para tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `atividade_id` (`atividade_id`),
  ADD KEY `entrega_id` (`entrega_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Índices para tabela `criterios_avaliacao`
--
ALTER TABLE `criterios_avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `atividade_id` (`atividade_id`);

--
-- Índices para tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_entrega` (`atividade_id`,`aluno_id`),
  ADD KEY `idx_entrega_aluno` (`aluno_id`,`status`),
  ADD KEY `equipe_id` (`equipe_id`),
  ADD KEY `corrigido_por` (`corrigido_por`);

--
-- Índices para tabela `entrega_criterios`
--
ALTER TABLE `entrega_criterios`
  ADD PRIMARY KEY (`entrega_id`,`criterio_id`),
  ADD KEY `criterio_id` (`criterio_id`);

--
-- Índices para tabela `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turma_disciplina_id` (`turma_disciplina_id`);

--
-- Índices para tabela `equipe_alunos`
--
ALTER TABLE `equipe_alunos`
  ADD PRIMARY KEY (`equipe_id`,`aluno_id`),
  ADD KEY `aluno_id` (`aluno_id`);

--
-- Índices para tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_evento_inicio` (`inicio`),
  ADD KEY `turma_id` (`turma_id`),
  ADD KEY `atividade_id` (`atividade_id`),
  ADD KEY `criador_id` (`criador_id`);

--
-- Índices para tabela `log_auditoria`
--
ALTER TABLE `log_auditoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_msg_canal` (`canal_id`,`criado_em`),
  ADD KEY `autor_id` (`autor_id`),
  ADD KEY `resposta_a_id` (`resposta_a_id`);

--
-- Índices para tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notif_usuario` (`usuario_id`,`lida`,`criada_em`);

--
-- Índices para tabela `periodos_letivos`
--
ALTER TABLE `periodos_letivos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_periodo` (`ano`,`nome`);

--
-- Índices para tabela `presencas`
--
ALTER TABLE `presencas`
  ADD PRIMARY KEY (`aula_id`,`aluno_id`),
  ADD KEY `aluno_id` (`aluno_id`);

--
-- Índices para tabela `tarefas_pessoais`
--
ALTER TABLE `tarefas_pessoais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `atividade_id` (`atividade_id`);

--
-- Índices para tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_turma` (`nome`,`ano_letivo`);

--
-- Índices para tabela `turma_disciplinas`
--
ALTER TABLE `turma_disciplinas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_td` (`turma_id`,`disciplina_id`),
  ADD KEY `disciplina_id` (`disciplina_id`),
  ADD KEY `professor_id` (`professor_id`);

--
-- Índices para tabela `turma_membros`
--
ALTER TABLE `turma_membros`
  ADD PRIMARY KEY (`turma_id`,`aluno_id`),
  ADD KEY `aluno_id` (`aluno_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `anexos`
--
ALTER TABLE `anexos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `atividades`
--
ALTER TABLE `atividades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avisos`
--
ALTER TABLE `avisos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canais`
--
ALTER TABLE `canais`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `criterios_avaliacao`
--
ALTER TABLE `criterios_avaliacao`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `entregas`
--
ALTER TABLE `entregas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_auditoria`
--
ALTER TABLE `log_auditoria`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `periodos_letivos`
--
ALTER TABLE `periodos_letivos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tarefas_pessoais`
--
ALTER TABLE `tarefas_pessoais`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `turma_disciplinas`
--
ALTER TABLE `turma_disciplinas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `anexos`
--
ALTER TABLE `anexos`
  ADD CONSTRAINT `anexos_ibfk_1` FOREIGN KEY (`atividade_id`) REFERENCES `atividades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `anexos_ibfk_2` FOREIGN KEY (`entrega_id`) REFERENCES `entregas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `anexos_ibfk_3` FOREIGN KEY (`mensagem_id`) REFERENCES `mensagens` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `anexos_ibfk_4` FOREIGN KEY (`aviso_id`) REFERENCES `avisos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `anexos_ibfk_5` FOREIGN KEY (`enviado_por`) REFERENCES `alunos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `atividades`
--
ALTER TABLE `atividades`
  ADD CONSTRAINT `atividades_ibfk_1` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `turma_disciplinas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `atividades_ibfk_2` FOREIGN KEY (`periodo_id`) REFERENCES `periodos_letivos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `atividades_ibfk_3` FOREIGN KEY (`criador_id`) REFERENCES `alunos` (`id`);

--
-- Limitadores para a tabela `aulas`
--
ALTER TABLE `aulas`
  ADD CONSTRAINT `aulas_ibfk_1` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `turma_disciplinas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `avisos`
--
ALTER TABLE `avisos`
  ADD CONSTRAINT `avisos_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `avisos_ibfk_2` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `turma_disciplinas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `avisos_ibfk_3` FOREIGN KEY (`autor_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `canais`
--
ALTER TABLE `canais`
  ADD CONSTRAINT `canais_ibfk_1` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `turma_disciplinas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `canais_ibfk_2` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`atividade_id`) REFERENCES `atividades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`entrega_id`) REFERENCES `entregas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_3` FOREIGN KEY (`autor_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `criterios_avaliacao`
--
ALTER TABLE `criterios_avaliacao`
  ADD CONSTRAINT `criterios_avaliacao_ibfk_1` FOREIGN KEY (`atividade_id`) REFERENCES `atividades` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `entregas`
--
ALTER TABLE `entregas`
  ADD CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`atividade_id`) REFERENCES `atividades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entregas_ibfk_2` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entregas_ibfk_3` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entregas_ibfk_4` FOREIGN KEY (`corrigido_por`) REFERENCES `alunos` (`id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `entrega_criterios`
--
ALTER TABLE `entrega_criterios`
  ADD CONSTRAINT `entrega_criterios_ibfk_1` FOREIGN KEY (`entrega_id`) REFERENCES `entregas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrega_criterios_ibfk_2` FOREIGN KEY (`criterio_id`) REFERENCES `criterios_avaliacao` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `equipes`
--
ALTER TABLE `equipes`
  ADD CONSTRAINT `equipes_ibfk_1` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `turma_disciplinas` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `equipe_alunos`
--
ALTER TABLE `equipe_alunos`
  ADD CONSTRAINT `equipe_alunos_ibfk_1` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `equipe_alunos_ibfk_2` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`atividade_id`) REFERENCES `atividades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `eventos_ibfk_3` FOREIGN KEY (`criador_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `log_auditoria`
--
ALTER TABLE `log_auditoria`
  ADD CONSTRAINT `log_auditoria_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `alunos` (`id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD CONSTRAINT `mensagens_ibfk_1` FOREIGN KEY (`canal_id`) REFERENCES `canais` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mensagens_ibfk_2` FOREIGN KEY (`autor_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mensagens_ibfk_3` FOREIGN KEY (`resposta_a_id`) REFERENCES `mensagens` (`id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD CONSTRAINT `notificacoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `presencas`
--
ALTER TABLE `presencas`
  ADD CONSTRAINT `presencas_ibfk_1` FOREIGN KEY (`aula_id`) REFERENCES `aulas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presencas_ibfk_2` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tarefas_pessoais`
--
ALTER TABLE `tarefas_pessoais`
  ADD CONSTRAINT `tarefas_pessoais_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tarefas_pessoais_ibfk_2` FOREIGN KEY (`atividade_id`) REFERENCES `atividades` (`id`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `turma_disciplinas`
--
ALTER TABLE `turma_disciplinas`
  ADD CONSTRAINT `turma_disciplinas_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `turma_disciplinas_ibfk_2` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`),
  ADD CONSTRAINT `turma_disciplinas_ibfk_3` FOREIGN KEY (`professor_id`) REFERENCES `alunos` (`id`);

--
-- Limitadores para a tabela `turma_membros`
--
ALTER TABLE `turma_membros`
  ADD CONSTRAINT `turma_membros_ibfk_1` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `turma_membros_ibfk_2` FOREIGN KEY (`aluno_id`) REFERENCES `alunos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
