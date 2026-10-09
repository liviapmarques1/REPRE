-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 09/10/2026 às 13:45
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bancorepre`
--
CREATE DATABASE IF NOT EXISTS `bancorepre` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bancorepre`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

DROP TABLE IF EXISTS `alunos`;
CREATE TABLE IF NOT EXISTS `alunos` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('aluno','professor','representante','gremio_atletica','coordenacao') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aluno',
  `status_conta` enum('pendente','ativo','recusado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ativo',
  `matricula` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `ultimo_login` datetime DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `matricula` (`matricula`),
  KEY `idx_alunos_tipo` (`tipo`),
  KEY `idx_alunos_status` (`status_conta`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `email`, `senha_hash`, `tipo`, `status_conta`, `matricula`, `foto_url`, `ativo`, `ultimo_login`, `criado_em`, `atualizado_em`) VALUES
(1, 'Lula', 'lulala@teste.com', '$2y$12$Lhb5uG5JGR0FBFicUvCPa.LQZRWi6tNf69TCnvItNx83rhK5eR/tK', 'aluno', 'ativo', NULL, NULL, 1, '2026-09-30 13:33:50', '2026-09-30 12:09:14', '2026-09-30 13:33:50'),
(2, 'bolsonaro lixo', 'lixoso@teste.com', '$2y$12$xdRBz6Ly6Rsmw0Wcd82ewOGcNKScHIySQa/eN4Y/MepqpeRHcGhs.', 'aluno', 'ativo', NULL, NULL, 1, '2026-09-30 13:49:22', '2026-09-30 13:47:08', '2026-09-30 13:49:22'),
(4, 'augusto cury', 'drone@gmail.com', '$2y$12$slquBYcFfOmfMAsTERaEceiNEbCiH4EuUendM9g32LMjR4ANz7ujC', 'aluno', 'ativo', NULL, NULL, 1, '2026-10-01 12:24:20', '2026-09-30 14:05:58', '2026-10-01 12:24:20'),
(11, 'Renatinha', 'renatinha@gmail.com', '$2y$12$dbas4ckHwhC7PqyEz9XbPuuWKK5MtzrM564nQi0mUq2CAlQRWfnFS', 'professor', 'ativo', NULL, NULL, 1, NULL, '2026-10-01 14:51:46', '2026-10-01 14:52:09'),
(12, 'Matheus Lima Camilo', 'camilomatheus0710@gmail.com', '$2y$12$pOjJrL4hxunZ/GjhHYdfJ.MD25Z60KhnEwVVesqe814VrYzH3iIB.', 'representante', 'ativo', NULL, NULL, 1, '2026-10-09 09:07:52', '2026-10-02 05:11:42', '2026-10-09 09:07:52'),
(13, 'Lívia Pinheiro Marques', 'liviapmarques1@gmail.com', '$2y$10$cvZdqTMD7V7mMa.HKRxlNuEVWVS/a1N2jCk8gtaxOUuyPkRWR6.Ru', 'aluno', 'ativo', NULL, NULL, 1, '2026-10-05 18:13:04', '2026-10-05 18:12:43', '2026-10-05 18:13:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `anexos`
--

DROP TABLE IF EXISTS `anexos`;
CREATE TABLE IF NOT EXISTS `anexos` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `atividade_id` int UNSIGNED DEFAULT NULL,
  `entrega_id` int UNSIGNED DEFAULT NULL,
  `mensagem_id` bigint UNSIGNED DEFAULT NULL,
  `aviso_id` int UNSIGNED DEFAULT NULL,
  `enviado_por` int UNSIGNED NOT NULL,
  `nome_original` varchar(255) NOT NULL,
  `caminho` varchar(255) NOT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `tamanho_bytes` bigint UNSIGNED DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `atividade_id` (`atividade_id`),
  KEY `entrega_id` (`entrega_id`),
  KEY `mensagem_id` (`mensagem_id`),
  KEY `aviso_id` (`aviso_id`),
  KEY `enviado_por` (`enviado_por`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividades`
--

DROP TABLE IF EXISTS `atividades`;
CREATE TABLE IF NOT EXISTS `atividades` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `turma_disciplina_id` int UNSIGNED NOT NULL,
  `periodo_id` int UNSIGNED DEFAULT NULL,
  `criador_id` int UNSIGNED NOT NULL,
  `titulo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tipo` enum('tarefa','trabalho','prova','quiz','projeto','leitura') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tarefa',
  `status` enum('rascunho','publicada','encerrada') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'rascunho',
  `em_grupo` tinyint(1) NOT NULL DEFAULT '0',
  `pontos` decimal(5,2) NOT NULL DEFAULT '10.00',
  `peso` decimal(4,2) NOT NULL DEFAULT '1.00',
  `permite_atraso` tinyint(1) NOT NULL DEFAULT '1',
  `publicada_em` datetime DEFAULT NULL,
  `data_limite` datetime DEFAULT NULL,
  `criada_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizada_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_ativ_limite` (`data_limite`),
  KEY `idx_ativ_td` (`turma_disciplina_id`,`status`),
  KEY `periodo_id` (`periodo_id`),
  KEY `criador_id` (`criador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `atividades`
--

INSERT INTO `atividades` (`id`, `turma_disciplina_id`, `periodo_id`, `criador_id`, `titulo`, `descricao`, `tipo`, `status`, `em_grupo`, `pontos`, `peso`, `permite_atraso`, `publicada_em`, `data_limite`, `criada_em`, `atualizada_em`) VALUES
(1, 2, 1, 12, 'Lista de geografia', 'Uma pesquisa sobre tipos de solo.', 'trabalho', 'publicada', 0, 3.00, 2.00, 0, '2026-10-02 09:26:33', '2026-10-07 10:00:00', '2026-10-02 06:26:33', '2026-10-02 06:26:33'),
(2, 1, 2, 12, 'lista de matematica', 'Responder perguntas da lista de matematica', 'trabalho', 'publicada', 1, 5.00, 3.00, 1, '2026-10-02 09:36:09', '2026-10-15 10:20:00', '2026-10-02 06:36:09', '2026-10-02 06:36:09'),
(3, 1, 2, 12, 'lista de matematica', 'Responder perguntas da lista de matematica', 'trabalho', 'publicada', 1, 5.00, 3.00, 1, '2026-10-02 09:37:19', '2026-10-15 10:20:00', '2026-10-02 06:37:19', '2026-10-02 06:37:19'),
(4, 1, 3, 12, 'lista de matematica', 'dqwua', 'trabalho', 'rascunho', 1, 10.00, 1.00, 1, NULL, '2026-10-03 10:36:00', '2026-10-02 06:37:41', '2026-10-02 06:37:41'),
(5, 1, 3, 12, 'lista de matematica', 'dqwua', 'trabalho', 'publicada', 1, 10.00, 1.00, 1, '2026-10-02 09:37:45', '2026-10-03 10:36:00', '2026-10-02 06:37:45', '2026-10-02 06:37:45'),
(6, 2, 2, 12, 'Lista de geografia', 'rgderfg', 'tarefa', 'publicada', 1, 10.00, 1.00, 1, '2026-10-02 09:39:16', '2026-10-19 10:38:00', '2026-10-02 06:39:16', '2026-10-02 06:39:16'),
(7, 1, 2, 12, 'lista de matematica', 'wrafr', 'trabalho', 'publicada', 1, 10.00, 1.00, 1, '2026-10-02 09:42:26', '2026-10-07 10:41:00', '2026-10-02 06:42:26', '2026-10-02 06:42:26');

-- --------------------------------------------------------

--
-- Estrutura para tabela `aulas`
--

DROP TABLE IF EXISTS `aulas`;
CREATE TABLE IF NOT EXISTS `aulas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `turma_disciplina_id` int UNSIGNED NOT NULL,
  `data_aula` date NOT NULL,
  `conteudo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_aula` (`turma_disciplina_id`,`data_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avisos`
--

DROP TABLE IF EXISTS `avisos`;
CREATE TABLE IF NOT EXISTS `avisos` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `turma_id` int UNSIGNED DEFAULT NULL,
  `turma_disciplina_id` int UNSIGNED DEFAULT NULL,
  `autor_id` int UNSIGNED NOT NULL,
  `titulo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conteudo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fixado` tinyint(1) NOT NULL DEFAULT '0',
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `turma_id` (`turma_id`),
  KEY `turma_disciplina_id` (`turma_disciplina_id`),
  KEY `autor_id` (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `avisos`
--

INSERT INTO `avisos` (`id`, `turma_id`, `turma_disciplina_id`, `autor_id`, `titulo`, `conteudo`, `fixado`, `criado_em`) VALUES
(1, NULL, 1, 12, 'Trazer EVA amanha', 'Para a aula de artes será nescessario EVA amanha, trazer por favor.', 0, '2026-10-05 18:40:36'),
(2, 1, NULL, 12, 'Feriado prolongado', 'Sem aula na proxima semana', 0, '2026-10-09 09:36:19');

-- --------------------------------------------------------

--
-- Estrutura para tabela `canais`
--

DROP TABLE IF EXISTS `canais`;
CREATE TABLE IF NOT EXISTS `canais` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `turma_disciplina_id` int UNSIGNED NOT NULL,
  `equipe_id` int UNSIGNED DEFAULT NULL,
  `nome` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('geral','avisos','duvidas','equipe') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'geral',
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `turma_disciplina_id` (`turma_disciplina_id`),
  KEY `equipe_id` (`equipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `atividade_id` int UNSIGNED DEFAULT NULL,
  `entrega_id` int UNSIGNED DEFAULT NULL,
  `autor_id` int UNSIGNED NOT NULL,
  `texto` text NOT NULL,
  `privado` tinyint(1) NOT NULL DEFAULT '0',
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `atividade_id` (`atividade_id`),
  KEY `entrega_id` (`entrega_id`),
  KEY `autor_id` (`autor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `criterios_avaliacao`
--

DROP TABLE IF EXISTS `criterios_avaliacao`;
CREATE TABLE IF NOT EXISTS `criterios_avaliacao` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `atividade_id` int UNSIGNED NOT NULL,
  `descricao` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pontos_max` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `atividade_id` (`atividade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplinas`
--

DROP TABLE IF EXISTS `disciplinas`;
CREATE TABLE IF NOT EXISTS `disciplinas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor_hex` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#6B5CC5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `disciplinas`
--

INSERT INTO `disciplinas` (`id`, `nome`, `cor_hex`) VALUES
(1, 'Matemática', '#6040DB'),
(2, 'História', '#E6535C'),
(3, 'Inglês', '#3470D9');

-- --------------------------------------------------------

--
-- Estrutura para tabela `entregas`
--

DROP TABLE IF EXISTS `entregas`;
CREATE TABLE IF NOT EXISTS `entregas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `atividade_id` int UNSIGNED NOT NULL,
  `aluno_id` int UNSIGNED NOT NULL,
  `equipe_id` int UNSIGNED DEFAULT NULL,
  `status` enum('pendente','entregue','atrasada','corrigida','devolvida') NOT NULL DEFAULT 'pendente',
  `texto` text,
  `enviado_em` datetime DEFAULT NULL,
  `nota` decimal(5,2) DEFAULT NULL,
  `feedback` text,
  `corrigido_por` int UNSIGNED DEFAULT NULL,
  `corrigido_em` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_entrega` (`atividade_id`,`aluno_id`),
  KEY `idx_entrega_aluno` (`aluno_id`,`status`),
  KEY `equipe_id` (`equipe_id`),
  KEY `corrigido_por` (`corrigido_por`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrega_criterios`
--

DROP TABLE IF EXISTS `entrega_criterios`;
CREATE TABLE IF NOT EXISTS `entrega_criterios` (
  `entrega_id` int UNSIGNED NOT NULL,
  `criterio_id` int UNSIGNED NOT NULL,
  `pontos` decimal(5,2) NOT NULL,
  PRIMARY KEY (`entrega_id`,`criterio_id`),
  KEY `criterio_id` (`criterio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipes`
--

DROP TABLE IF EXISTS `equipes`;
CREATE TABLE IF NOT EXISTS `equipes` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `turma_disciplina_id` int UNSIGNED NOT NULL,
  `nome` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `turma_disciplina_id` (`turma_disciplina_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe_alunos`
--

DROP TABLE IF EXISTS `equipe_alunos`;
CREATE TABLE IF NOT EXISTS `equipe_alunos` (
  `equipe_id` int UNSIGNED NOT NULL,
  `aluno_id` int UNSIGNED NOT NULL,
  `lider` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`equipe_id`,`aluno_id`),
  KEY `aluno_id` (`aluno_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `turma_id` int UNSIGNED DEFAULT NULL,
  `atividade_id` int UNSIGNED DEFAULT NULL,
  `criador_id` int UNSIGNED NOT NULL,
  `titulo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tipo` enum('aula','prova','entrega','reuniao','feriado','outro') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'outro',
  `inicio` datetime NOT NULL,
  `fim` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_evento_inicio` (`inicio`),
  KEY `turma_id` (`turma_id`),
  KEY `atividade_id` (`atividade_id`),
  KEY `criador_id` (`criador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `eventos`
--

INSERT INTO `eventos` (`id`, `turma_id`, `atividade_id`, `criador_id`, `titulo`, `descricao`, `tipo`, `inicio`, `fim`) VALUES
(1, 1, NULL, 12, 'Festa de Halloween', 'Ir fantasiado', 'outro', '2026-10-31 18:34:50', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_auditoria`
--

DROP TABLE IF EXISTS `log_auditoria`;
CREATE TABLE IF NOT EXISTS `log_auditoria` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario_id` int UNSIGNED DEFAULT NULL,
  `acao` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entidade` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entidade_id` bigint UNSIGNED DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `log_auditoria`
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
-- Estrutura para tabela `mensagens`
--

DROP TABLE IF EXISTS `mensagens`;
CREATE TABLE IF NOT EXISTS `mensagens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `canal_id` int UNSIGNED NOT NULL,
  `autor_id` int UNSIGNED NOT NULL,
  `resposta_a_id` bigint UNSIGNED DEFAULT NULL,
  `conteudo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `editada` tinyint(1) NOT NULL DEFAULT '0',
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_msg_canal` (`canal_id`,`criado_em`),
  KEY `autor_id` (`autor_id`),
  KEY `resposta_a_id` (`resposta_a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacoes`
--

DROP TABLE IF EXISTS `notificacoes`;
CREATE TABLE IF NOT EXISTS `notificacoes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario_id` int UNSIGNED NOT NULL,
  `tipo` enum('nova_atividade','nota','prazo','mensagem','aviso','sistema') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensagem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lida` tinyint(1) NOT NULL DEFAULT '0',
  `criada_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_notif_usuario` (`usuario_id`,`lida`,`criada_em`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `periodos_letivos`
--

DROP TABLE IF EXISTS `periodos_letivos`;
CREATE TABLE IF NOT EXISTS `periodos_letivos` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ano` year NOT NULL,
  `nome` varchar(40) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_periodo` (`ano`,`nome`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `periodos_letivos`
--

INSERT INTO `periodos_letivos` (`id`, `ano`, `nome`, `data_inicio`, `data_fim`) VALUES
(1, '2026', '1º Bimestre', '2026-02-02', '2026-04-30'),
(2, '2026', '2º Bimestre', '2026-05-01', '2026-07-31'),
(3, '2026', '3º Bimestre', '2026-08-03', '2026-09-30'),
(4, '2026', '4º Bimestre', '2026-10-01', '2026-12-18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `presencas`
--

DROP TABLE IF EXISTS `presencas`;
CREATE TABLE IF NOT EXISTS `presencas` (
  `aula_id` int UNSIGNED NOT NULL,
  `aluno_id` int UNSIGNED NOT NULL,
  `situacao` enum('presente','falta','justificada') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'presente',
  PRIMARY KEY (`aula_id`,`aluno_id`),
  KEY `aluno_id` (`aluno_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tarefas_pessoais`
--

DROP TABLE IF EXISTS `tarefas_pessoais`;
CREATE TABLE IF NOT EXISTS `tarefas_pessoais` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario_id` int UNSIGNED NOT NULL,
  `atividade_id` int UNSIGNED DEFAULT NULL,
  `titulo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `coluna` enum('a_fazer','fazendo','concluida') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a_fazer',
  `prioridade` enum('baixa','media','alta') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'media',
  `prazo` date DEFAULT NULL,
  `criada_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `atividade_id` (`atividade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

DROP TABLE IF EXISTS `turmas`;
CREATE TABLE IF NOT EXISTS `turmas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `turno` enum('Manhã','Tarde','Noite','Integral') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Manhã',
  `ano_letivo` year NOT NULL,
  `ativa` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_turma` (`nome`,`ano_letivo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`id`, `nome`, `serie`, `turno`, `ano_letivo`, `ativa`) VALUES
(1, '3° DS', 'Ensino Médio', 'Manhã', '2026', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma_disciplinas`
--

DROP TABLE IF EXISTS `turma_disciplinas`;
CREATE TABLE IF NOT EXISTS `turma_disciplinas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `turma_id` int UNSIGNED NOT NULL,
  `disciplina_id` int UNSIGNED NOT NULL,
  `professor_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_td` (`turma_id`,`disciplina_id`),
  KEY `disciplina_id` (`disciplina_id`),
  KEY `professor_id` (`professor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `turma_disciplinas`
--

INSERT INTO `turma_disciplinas` (`id`, `turma_id`, `disciplina_id`, `professor_id`) VALUES
(1, 1, 1, 11),
(2, 1, 2, 11),
(3, 1, 3, 11);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turma_membros`
--

DROP TABLE IF EXISTS `turma_membros`;
CREATE TABLE IF NOT EXISTS `turma_membros` (
  `turma_id` int UNSIGNED NOT NULL,
  `aluno_id` int UNSIGNED NOT NULL,
  `papel` enum('aluno','representante') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aluno',
  `entrou_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`turma_id`,`aluno_id`),
  KEY `aluno_id` (`aluno_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `turma_membros`
--

INSERT INTO `turma_membros` (`turma_id`, `aluno_id`, `papel`, `entrou_em`) VALUES
(1, 1, 'aluno', '2026-10-01 14:47:39'),
(1, 2, 'aluno', '2026-10-01 14:47:39'),
(1, 4, 'aluno', '2026-10-01 14:47:39'),
(1, 12, 'representante', '2026-10-02 06:13:41');

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aulas`
--
ALTER TABLE `aulas`
  ADD CONSTRAINT `aulas_ibfk_1` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `turma_disciplinas` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
