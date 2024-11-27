-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/11/2024 às 00:52
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco1`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `nota1` float NOT NULL DEFAULT 0,
  `nota2` float NOT NULL DEFAULT 0,
  `idcidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`matricula`, `nome`, `nota1`, `nota2`, `idcidade`) VALUES
(1, 'Ana dos Santos', 8, 9, 1),
(2, 'Bianca Conceição', 0, 0, 1),
(3, 'Carla Almeida', 9.5, 7.8, 2),
(4, 'Deise da Silva', 0, 0, 3),
(5, 'Eliane Mendes', 0, 0, 4),
(6, 'Fernanda Souza', 0, 0, 1),
(7, 'Gabriela Pereira', 0, 0, 1),
(8, 'Heloisa Ferreira', 0, 0, 1),
(10, 'Ingrid Lopes', 0, 0, 2),
(11, 'Juliana Garcia', 0, 0, 1),
(12, 'Laura Perez', 8, 9, 2),
(13, 'Paulo', 10, 9, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `idcidade` int(11) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cidade`
--

INSERT INTO `cidade` (`idcidade`, `cidade`, `uf`) VALUES
(1, 'Chapecó', 'SC'),
(2, 'Xaxim', 'SC'),
(3, 'Piratuba', 'SC'),
(4, 'Curitiba', 'PR'),
(9, 'Joinville', 'SC'),
(10, 'Toledo', 'PR'),
(11, 'Balneário Camburiu ', 'SC'),
(12, 'Santa Maria ', 'RS'),
(13, 'Porto Alegre', 'RS'),
(14, 'Gramado', 'RS'),
(16, 'Florianópolis', 'SC'),
(19, 'Cascavel', 'PR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogador`
--

CREATE TABLE `jogador` (
  `idjogador` int(5) NOT NULL,
  `foto` text NOT NULL,
  `nomejogador` varchar(100) NOT NULL,
  `numero` int(3) NOT NULL,
  `idade` int(3) NOT NULL,
  `nascimento` date NOT NULL,
  `gol` int(5) NOT NULL,
  `time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `jogador`
--

INSERT INTO `jogador` (`idjogador`, `foto`, `nomejogador`, `numero`, `idade`, `nascimento`, `gol`, `time`) VALUES
(205, 'https://apiv3.apifootball.com/badges/players/52515_cristiano-ronaldo.jpg', 'Cristiano Ronaldo ', 0, 39, '1985-02-05', 3, 'Portugal'),
(206, 'https://apiv3.apifootball.com/badges/players/52515_cristiano-ronaldo.jpg', 'Cristiano Ronaldo', 7, 39, '1985-02-05', 7, 'Al Nassr'),
(207, '', 'R. Messi', 0, 0, '2007-05-23', 1, 'Dijon II'),
(208, 'https://apiv3.apifootball.com/badges/players/15060_j-messiba.jpg', 'J. Messiba', 12, 28, '1988-01-01', 1, 'Lucon'),
(209, '', 'G. Messineo', 0, 0, '1993-02-23', 0, 'Andria BAT'),
(210, '', 'Messias', 0, 0, '1984-01-20', 0, 'Aliados Lordelo'),
(211, 'https://apiv3.apifootball.com/badges/players/62444_bruno-almeida.jpg', 'Bruno Messi', 0, 19, '1996-09-09', 3, 'Bustelo'),
(212, '', 'M. Messina', 0, 0, '0000-00-00', 0, 'Alfonso Ugarte Puno'),
(213, '', 'A. Messika', 4, 26, '1995-09-19', 0, 'Beitar Kfar Saba'),
(214, '', 'S. Messili', 0, 0, '2001-11-19', 0, 'Feurs'),
(215, '', 'Messias', 0, 0, '2002-06-17', 0, 'Independente FSJ'),
(216, '', 'Messias', 0, 0, '0000-00-00', 0, 'CEOV Operário'),
(217, '', 'Messinho', 0, 0, '2000-06-20', 0, 'Atlético Cajazeirense'),
(218, '', 'Messias', 0, 0, '1998-01-19', 0, 'Nacional SP'),
(219, '', 'D. Messi', 0, 0, '2000-01-20', 0, 'El Farolito'),
(220, '', 'Messias', 0, 0, '1992-03-25', 0, 'São Francisco'),
(221, '', 'N. Messina', 0, 0, '2001-04-02', 0, 'Perth'),
(222, '', 'R. Messina', 14, 19, '2004-10-14', 1, 'Peninsula Power'),
(223, '', 'J. Messi', 0, 0, '2002-04-16', 0, 'Estudiantes Río Cuarto'),
(224, '', 'R. Messi', 7, 17, '2007-05-23', 0, 'France U17'),
(225, '', 'H. Messika', 0, 0, '2000-05-03', 0, 'Hapoel Ramat Gan'),
(226, 'https://apiv3.apifootball.com/badges/players/97489_t-messing.jpg', 'T. Messing', 0, 0, '2000-12-24', 0, 'Krems / Rehberg'),
(227, 'https://apiv3.apifootball.com/badges/players/2127_l-messi.jpg', 'L. Messi', 10, 37, '1987-06-24', 20, 'Inter Miami'),
(228, '', 'R. Messika', 0, 0, '1989-06-15', 5, 'Hapoel Kfar Shalem'),
(229, '', 'R. Messi', 0, 0, '2007-05-23', 0, 'France U19'),
(230, 'https://apiv3.apifootball.com/badges/players/2127_l-messi.jpg', 'L. Messi', 10, 37, '1987-06-24', 1, 'Argentina'),
(231, '', 'F. Messina', 47, 18, '2006-05-04', 0, 'Estudiantes'),
(232, 'https://apiv3.apifootball.com/badges/players/65833_a-messidoro.jpg', 'A. Messidoro', 9, 27, '1997-05-13', 1, 'Dewa United'),
(233, '', 'Z. Messibah', 0, 0, '1995-10-16', 0, 'NC Magra'),
(234, 'https://apiv3.apifootball.com/badges/players/118230_h-messiad.jpg', 'H. Messiad', 0, 0, '1999-04-21', 1, 'Olympique Akbou'),
(235, 'https://apiv3.apifootball.com/badges/players/85703_junior-messias.jpg', 'Junior Messias', 10, 33, '1991-05-13', 1, 'Genoa'),
(236, '', 'N. Messin', 0, 0, '1999-12-18', 0, 'Chênois'),
(237, 'https://apiv3.apifootball.com/badges/players/73418_n-messiniti.jpg', 'N. Messiniti', 11, 28, '1996-02-21', 3, 'Delfín'),
(238, 'https://apiv3.apifootball.com/badges/players/117778_ahmed-adel-messi.jpg', 'Ahmed Adel Messi', 14, 27, '1997-09-25', 0, 'ZED'),
(239, '', 'R. Messi', 47, 17, '2007-05-23', 0, 'Strasbourg'),
(240, 'https://apiv3.apifootball.com/badges/players/44630_messias.jpg', 'Messias', 37, 30, '1994-11-03', 0, 'Goiás'),
(241, '', 'D. Messina', 0, 0, '0000-00-00', 0, 'Águila'),
(242, '', 'A. Messina', 0, 0, '2002-08-12', 0, 'Melita'),
(243, '', 'E. Messias', 0, 0, '0000-00-00', 0, 'Racing United'),
(244, '', 'Messias', 0, 0, '2005-12-17', 0, 'Vizela U23'),
(245, '', 'Messias Neves', 5, 31, '1992-12-10', 0, 'Bravos do Maquis'),
(246, 'https://apiv3.apifootball.com/badges/players/9189_m-pogba.jpg', 'M. Pogba', 0, 0, '1990-08-19', 3, 'Lorca'),
(247, '', 'Abdel Rahman Pogba', 0, 0, '1999-10-20', 0, 'Misr Lel Makkasa'),
(248, 'https://apiv3.apifootball.com/badges/players/6006_f-pogba.jpg', 'F. Pogba', 0, 34, '1990-08-19', 3, 'Excelsior Virton'),
(249, 'https://apiv3.apifootball.com/badges/players/13379_p-pogba.jpg', 'P. Pogba', 0, 31, '1993-03-15', 0, 'Juventus');

-- --------------------------------------------------------

--
-- Estrutura para tabela `log`
--

CREATE TABLE `log` (
  `idlog` int(11) NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT current_timestamp(),
  `numeroregistros` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `log`
--

INSERT INTO `log` (`idlog`, `datahora`, `numeroregistros`) VALUES
(1, '2024-11-27 23:21:29', 1),
(2, '2024-11-27 23:21:29', 1),
(3, '2024-11-27 23:21:29', 1),
(4, '2024-11-27 23:21:29', 1),
(5, '2024-11-27 23:21:29', 1),
(6, '2024-11-27 23:21:29', 1),
(7, '2024-11-27 23:21:29', 1),
(8, '2024-11-27 23:21:29', 1),
(9, '2024-11-27 23:21:29', 1),
(10, '2024-11-27 23:21:29', 1),
(11, '2024-11-27 23:21:29', 1),
(12, '2024-11-27 23:21:29', 1),
(13, '2024-11-27 23:21:29', 1),
(14, '2024-11-27 23:21:29', 1),
(15, '2024-11-27 23:21:29', 1),
(16, '2024-11-27 23:21:29', 1),
(17, '2024-11-27 23:21:29', 1),
(18, '2024-11-27 23:21:29', 1),
(19, '2024-11-27 23:21:30', 1),
(20, '2024-11-27 23:21:30', 1),
(21, '2024-11-27 23:21:30', 1),
(22, '2024-11-27 23:21:30', 1),
(23, '2024-11-27 23:21:30', 1),
(24, '2024-11-27 23:21:30', 1),
(25, '2024-11-27 23:21:30', 1),
(26, '2024-11-27 23:21:30', 1),
(27, '2024-11-27 23:21:30', 1),
(28, '2024-11-27 23:21:30', 1),
(29, '2024-11-27 23:21:30', 1),
(30, '2024-11-27 23:21:30', 1),
(31, '2024-11-27 23:21:30', 1),
(32, '2024-11-27 23:21:30', 1),
(33, '2024-11-27 23:21:30', 1),
(34, '2024-11-27 23:21:30', 1),
(35, '2024-11-27 23:21:30', 1),
(36, '2024-11-27 23:21:30', 1),
(37, '2024-11-27 23:21:30', 1),
(38, '2024-11-27 23:26:51', 1),
(39, '2024-11-27 23:26:51', 1),
(40, '2024-11-27 23:26:51', 1),
(41, '2024-11-27 23:26:51', 1),
(42, '2024-11-27 23:26:51', 1),
(43, '2024-11-27 23:27:41', 1),
(44, '2024-11-27 23:27:41', 1),
(45, '2024-11-27 23:27:41', 1),
(46, '2024-11-27 23:27:42', 1),
(47, '2024-11-27 23:27:42', 1),
(48, '2024-11-27 23:27:42', 1),
(49, '2024-11-27 23:27:42', 1),
(50, '2024-11-27 23:27:42', 1),
(51, '2024-11-27 23:27:42', 1),
(52, '2024-11-27 23:27:42', 1),
(53, '2024-11-27 23:27:42', 1),
(54, '2024-11-27 23:27:42', 1),
(55, '2024-11-27 23:27:42', 1),
(56, '2024-11-27 23:27:42', 1),
(57, '2024-11-27 23:27:42', 1),
(58, '2024-11-27 23:27:42', 1),
(59, '2024-11-27 23:27:42', 1),
(60, '2024-11-27 23:27:42', 1),
(61, '2024-11-27 23:27:42', 1),
(62, '2024-11-27 23:27:42', 1),
(63, '2024-11-27 23:27:42', 1),
(64, '2024-11-27 23:27:42', 1),
(65, '2024-11-27 23:27:42', 1),
(66, '2024-11-27 23:27:42', 1),
(67, '2024-11-27 23:27:42', 1),
(68, '2024-11-27 23:27:42', 1),
(69, '2024-11-27 23:27:42', 1),
(70, '2024-11-27 23:27:42', 1),
(71, '2024-11-27 23:27:42', 1),
(72, '2024-11-27 23:27:42', 1),
(73, '2024-11-27 23:27:42', 1),
(74, '2024-11-27 23:27:42', 1),
(75, '2024-11-27 23:27:42', 1),
(76, '2024-11-27 23:27:42', 1),
(77, '2024-11-27 23:27:42', 1),
(78, '2024-11-27 23:27:42', 1),
(79, '2024-11-27 23:27:42', 1),
(80, '2024-11-27 23:28:35', 1),
(81, '2024-11-27 23:28:35', 1),
(82, '2024-11-27 23:51:42', 1),
(83, '2024-11-27 23:51:42', 1),
(84, '2024-11-27 23:51:43', 1),
(85, '2024-11-27 23:51:43', 1),
(86, '2024-11-27 23:51:43', 1),
(87, '2024-11-27 23:51:43', 1),
(88, '2024-11-27 23:51:43', 1),
(89, '2024-11-27 23:51:43', 1),
(90, '2024-11-27 23:51:43', 1),
(91, '2024-11-27 23:51:43', 1),
(92, '2024-11-27 23:51:43', 1),
(93, '2024-11-27 23:51:43', 1),
(94, '2024-11-27 23:51:43', 1),
(95, '2024-11-27 23:51:43', 1),
(96, '2024-11-27 23:51:43', 1),
(97, '2024-11-27 23:51:43', 1),
(98, '2024-11-27 23:51:43', 1),
(99, '2024-11-27 23:51:43', 1),
(100, '2024-11-27 23:51:43', 1),
(101, '2024-11-27 23:51:43', 1),
(102, '2024-11-27 23:51:43', 1),
(103, '2024-11-27 23:51:43', 1),
(104, '2024-11-27 23:51:43', 1),
(105, '2024-11-27 23:51:43', 1),
(106, '2024-11-27 23:51:43', 1),
(107, '2024-11-27 23:51:43', 1),
(108, '2024-11-27 23:51:43', 1),
(109, '2024-11-27 23:51:43', 1),
(110, '2024-11-27 23:51:43', 1),
(111, '2024-11-27 23:51:43', 1),
(112, '2024-11-27 23:51:43', 1),
(113, '2024-11-27 23:51:43', 1),
(114, '2024-11-27 23:51:43', 1),
(115, '2024-11-27 23:51:43', 1),
(116, '2024-11-27 23:51:43', 1),
(117, '2024-11-27 23:51:43', 1),
(118, '2024-11-27 23:51:43', 1),
(119, '2024-11-27 23:51:43', 1),
(120, '2024-11-27 23:51:43', 1),
(121, '2024-11-27 23:51:55', 1),
(122, '2024-11-27 23:51:55', 1),
(123, '2024-11-27 23:51:55', 1),
(124, '2024-11-27 23:51:55', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`matricula`);

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`idcidade`);

--
-- Índices de tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`idjogador`);

--
-- Índices de tabela `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`idlog`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aluno`
--
ALTER TABLE `aluno`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `idcidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `jogador`
--
ALTER TABLE `jogador`
  MODIFY `idjogador` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT de tabela `log`
--
ALTER TABLE `log`
  MODIFY `idlog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
