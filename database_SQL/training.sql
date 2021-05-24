-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 24 mai 2021 à 19:40
-- Version du serveur :  10.3.28-MariaDB-cll-lve
-- Version de PHP : 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `training`
--

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `course`
--

INSERT INTO `course` (`id`, `theme`) VALUES
(13, 'PHP'),
(14, 'JavaScript'),
(15, 'HTML'),
(16, 'CSS'),
(17, 'Bootstrap'),
(20, 'windows os'),
(22, 'SQL'),
(24, 'Symfony 5'),
(25, 'C#');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210508114134', '2021-05-09 14:26:27', 59),
('DoctrineMigrations\\Version20210508123001', '2021-05-09 14:26:27', 137),
('DoctrineMigrations\\Version20210508133052', '2021-05-09 14:26:27', 88),
('DoctrineMigrations\\Version20210508144215', '2021-05-09 14:26:27', 7),
('DoctrineMigrations\\Version20210509142647', '2021-05-09 14:26:54', 27),
('DoctrineMigrations\\Version20210509143629', '2021-05-09 14:36:33', 211);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `title`) VALUES
(1, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Structure de la table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 55);

-- --------------------------------------------------------

--
-- Structure de la table `training`
--

CREATE TABLE `training` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `candidates` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `student` int(11) DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `training`
--

INSERT INTO `training` (`id`, `title`, `start_date`, `candidates`, `location`, `description`, `picture`, `student`, `image_name`, `updated_at`) VALUES
(1, 'JS', '2021-07-29 00:00:00', 15, 'Paris', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam euismod risus in felis volutpat aliquet. Aliquam magna justo, dapibus ut elit nec, cursus dictum ex. Phasellus porta risus ac turpis gravida, efficitur elementum nunc suscipit. Pellentesque ultricies accumsan leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae odio a velit varius faucibus. In id vestibulum eros. Sed in euismod felis.\r\n\r\nCurabitur vulputate in orci sed vestibulum. Integer sit amet purus eget diam dapibus pretium. Donec nibh tellus, cursus ac fringilla quis, molestie id metus. Ut tortor diam, imperdiet non enim sit amet, gravida porttitor erat. Integer sed sapien eu arcu laoreet mollis id suscipit turpis. Etiam viverra est quam, vel tempus ante tincidunt vitae. Ut ut nisi velit. Mauris malesuada porta mauris. Nullam elementum vehicula tortor, efficitur euismod nibh semper vitae. Sed scelerisque nunc ut lectus aliquet venenatis. Curabitur volutpat venenatis neque vitae auctor. Praesent faucibus rhoncus sodales.\r\n\r\nPellentesque eu tortor mollis augue ullamcorper rhoncus. Fusce elit est, placerat ut molestie vitae, bibendum ac mauris. Vestibulum id magna nec nunc laoreet iaculis. Ut convallis nisi sem, non feugiat ex auctor quis. Integer ex diam, mollis sit amet laoreet ut, maximus et purus. Sed eget turpis vel sapien ullamcorper volutpat. Vestibulum non elit cursus, molestie mi eget, consequat augue. Donec condimentum odio vitae ex lobortis, at malesuada tortor aliquam. Curabitur nec magna quis arcu accumsan interdum. Sed tempor interdum dui a facilisis. Donec enim massa, euismod vitae metus sed, ullamcorper fermentum dui. Nullam at risus arcu. Donec semper est sit amet venenatis ultrices.\r\n\r\nNulla facilisi. Mauris ut aliquam mi, a dapibus tortor. Nulla nec arcu auctor nisi interdum eleifend sed ut leo. Sed et aliquam mauris. Suspendisse tristique vehicula dui at molestie. Nunc augue odio, rhoncus vestibulum justo et, volutpat accumsan mi. Etiam commodo, neque vitae consequat ultrices, elit.', 'img/js.png', NULL, '6097f8185cdcf463661654.png', '2021-05-09 14:56:24'),
(6, 'PHP', '2021-05-10 00:00:00', 15, 'Cergy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dignissim mi id quam aliquet, quis faucibus nisi luctus. Mauris ultrices ex augue, a consequat urna dignissim at. Nulla facilisi. Curabitur rutrum vestibulum erat, vitae volutpat nunc venenatis nec. Quisque venenatis arcu non erat imperdiet sodales. Pellentesque laoreet, metus et vulputate ultricies, nisl massa mollis purus, vel finibus enim purus vitae sem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut eu enim eget urna cursus pretium. Nulla volutpat urna velit, posuere convallis justo aliquam sed. Sed ac tempus neque, eu mollis nunc. Donec varius dui neque, sed sodales lectus fringilla eu. Duis dapibus urna arcu, ultricies ullamcorper tortor lacinia vel.\r\n\r\nDuis bibendum iaculis lacus sit amet aliquet. Nulla quis justo magna. Duis vel nunc sagittis, dictum sapien at, mollis tortor. Proin velit lectus, lobortis sit amet odio id, fringilla pellentesque mauris. Sed venenatis aliquet ipsum ac suscipit. Ut viverra, lorem in molestie feugiat, arcu neque lacinia arcu, at condimentum elit ligula a purus. Aenean a risus rhoncus, pulvinar ligula ut, cursus turpis. Nunc condimentum euismod ex. Quisque magna justo, posuere sit amet iaculis ac, elementum quis magna. Nam semper dapibus dolor. Aliquam tortor magna, vulputate at.', 'img/php.png', NULL, '6097f85e5f03c701229123.png', '2021-05-09 14:57:34'),
(7, 'Windows', '2021-10-12 00:00:00', 25, 'Paris', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a ante tempor, porta magna a, fermentum enim. Sed eget est suscipit, condimentum tellus id, finibus velit. Aenean id accumsan enim. Quisque non dolor eu odio rutrum condimentum. Fusce nec pharetra sem, et gravida nunc. Sed elementum efficitur ipsum et sagittis. Donec vitae iaculis elit. Quisque maximus, nisi vitae elementum luctus, odio justo rhoncus leo, ut mattis sapien libero non magna. Aenean viverra ullamcorper nunc vitae pretium. Fusce bibendum elementum venenatis. Cras id quam nibh. Curabitur orci ex, porta ac posuere vitae, dapibus nec felis. Curabitur at aliquet nisl. Nunc quis laoreet ipsum, vitae tempus justo.\r\n\r\nMauris aliquam suscipit elit, ac ultricies tortor ultricies et. Aenean pellentesque purus a ante condimentum tristique. Aliquam enim velit, ornare at eleifend vel, scelerisque eget massa. Vivamus mollis nunc at sem eleifend bibendum ac quis orci. Curabitur cursus tortor mi, eu feugiat ex fringilla ac. Vestibulum hendrerit, nunc sit amet fringilla dapibus, tortor nulla faucibus elit, ut commodo enim ligula non urna. Nulla mollis imperdiet lacinia. Vivamus feugiat purus sed ipsum rutrum venenatis. Nam vulputate tortor vitae tellus mollis, in ullamcorper ante placerat. Donec sit amet mi a mi semper tincidunt. Aenean rhoncus orci ac nulla consectetur, ut interdum ex varius. Mauris quam massa, interdum vitae tortor nec, mattis efficitur diam. Integer viverra dui sapien, ac lacinia odio convallis ut.\r\n\r\nDonec quis lacus vel eros consectetur maximus non a ante. Maecenas quis tristique dui. Etiam sed justo bibendum, finibus turpis at, mattis urna. Lorem ipsum.', 'img/windows.png', NULL, '6097fb2e09ecb489597312.png', '2021-05-09 15:09:33'),
(8, 'Android', '2021-09-08 00:00:00', 30, 'Créteil', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a ante tempor, porta magna a, fermentum enim. Sed eget est suscipit, condimentum tellus id, finibus velit. Aenean id accumsan enim. Quisque non dolor eu odio rutrum condimentum. Fusce nec pharetra sem, et gravida nunc. Sed elementum efficitur ipsum et sagittis. Donec vitae iaculis elit. Quisque maximus, nisi vitae elementum luctus, odio justo rhoncus leo, ut mattis sapien libero non magna. Aenean viverra ullamcorper nunc vitae pretium. Fusce bibendum elementum venenatis. Cras id quam nibh. Curabitur orci ex, porta ac posuere vitae, dapibus nec felis. Curabitur at aliquet nisl. Nunc quis laoreet ipsum, vitae tempus justo.\r\n\r\nMauris aliquam suscipit elit, ac ultricies tortor ultricies et. Aenean pellentesque purus a ante condimentum tristique. Aliquam enim velit, ornare at eleifend vel, scelerisque eget massa. Vivamus mollis nunc at sem eleifend bibendum ac quis orci. Curabitur cursus tortor mi, eu feugiat ex fringilla ac. Vestibulum hendrerit, nunc sit amet fringilla dapibus, tortor nulla faucibus elit, ut commodo enim ligula non urna. Nulla mollis imperdiet lacinia. Vivamus feugiat purus sed ipsum rutrum venenatis. Nam vulputate tortor vitae tellus mollis, in ullamcorper ante placerat. Donec sit amet mi a mi semper tincidunt. Aenean rhoncus orci ac nulla consectetur, ut interdum ex varius. Mauris quam massa, interdum vitae tortor nec, mattis efficitur diam. Integer viverra dui sapien, ac lacinia odio convallis ut.\r\n\r\nDonec quis lacus vel eros consectetur maximus non a ante. Maecenas quis tristique dui. Etiam sed justo bibendum, finibus turpis at, mattis urna. Lorem ipsum.', 'img/android.png', NULL, '6097f7f80eed1474073762.png', '2021-05-09 14:55:52'),
(9, 'AngularJS', '2021-11-23 00:00:00', 12, 'Ulis', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ipsum nunc, aliquam ac dignissim a, sollicitudin sed neque. Nunc feugiat felis eu quam interdum semper. Quisque eu nunc at neque molestie iaculis eget eget odio. Nullam et leo aliquam nisi volutpat tempus. Donec vel elit elementum, vehicula tortor at, faucibus tortor. Donec elit nibh, facilisis a aliquet id, fringilla a felis. Donec dapibus dolor ut risus iaculis sollicitudin. Suspendisse sodales nisi eu feugiat lobortis. Praesent eu enim iaculis, consectetur elit nec, aliquam sem. Sed pulvinar malesuada nunc. Mauris imperdiet sed diam vel convallis.\r\n\r\nSed velit neque, placerat at facilisis et, maximus non nibh. Fusce ultrices nibh dolor, eget eleifend ex suscipit ut. Nam at congue massa. Sed eget molestie ante. Proin a lectus lacinia, imperdiet enim rutrum, bibendum lectus. Integer ut est semper odio commodo pretium. Morbi cursus posuere turpis, eget iaculis dui. Vivamus venenatis erat a condimentum vestibulum. Duis faucibus, nibh quis tristique consectetur, lacus lectus finibus velit, nec sollicitudin arcu diam eu ipsum. Phasellus rhoncus placerat massa. Morbi ligula justo, gravida non tempus a, malesuada eu lorem.\r\n\r\nInteger facilisis urna sapien, sed vulputate lectus tristique at. Cras euismod lacinia tellus fermentum tristique. Donec quis gravida neque. Ut sapien nulla, feugiat eget neque sit amet, volutpat blandit mauris. Nulla facilisi. Suspendisse tempor porta diam in tristique. Integer id libero nisi. Donec at lacus non quam tristique mattis.\r\n\r\nNam nec pretium justo. Nam nec odio commodo, condimentum nibh vel, vehicula nisl. Vestibulum pharetra scelerisque lorem, posuere venenatis ipsum semper a.', 'img/angular.png', NULL, '6097f805dc200010964703.png', '2021-05-09 14:56:05'),
(10, 'NodeJs', '2021-09-28 00:00:00', 18, 'Paris', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis consectetur tellus et sapien lobortis dictum. Maecenas lobortis euismod pulvinar. Sed aliquet tristique auctor. Proin scelerisque, ipsum sed mollis lacinia, augue sapien malesuada sapien, id volutpat orci diam in dui. Nam at quam neque. Fusce non pharetra eros. Sed rhoncus lacus massa, a convallis ante posuere in. Nunc quis nunc nisi.\r\n\r\nCras orci felis, mattis rhoncus consectetur et, pellentesque id ex. Aenean sapien metus, interdum in fringilla sed, posuere quis massa. Quisque ac magna ut tellus porttitor finibus. Nulla libero ipsum, facilisis facilisis diam non, tincidunt ullamcorper libero. Donec aliquet arcu sed fringilla suscipit. Quisque in nisi lacinia, auctor leo nec, sollicitudin tellus. Vestibulum ultricies pretium diam ut aliquet.\r\n\r\nNullam a placerat justo. Maecenas dapibus, lacus ac dapibus mattis, lorem libero finibus velit, ut imperdiet sem lectus in turpis. Praesent luctus vestibulum enim, at tempor tellus euismod lobortis. Integer mattis non lectus eu efficitur. Mauris suscipit ut ipsum quis ultrices. Mauris id elementum nulla. Sed eget elementum sem. Pellentesque sodales enim purus, at finibus purus lobortis in. Vestibulum nec tincidunt mi. In rutrum metus vel nisl aliquam blandit.\r\n\r\nSuspendisse maximus leo ac congue pretium. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In sit amet elit risus. Etiam iaculis vehicula sollicitudin. Etiam dictum, nisi eget ultrices euismod, velit nibh laoreet turpis, vel consequat ligula quam quis sapien. Sed at velit eu nisl hendrerit consequat. Aliquam efficitur neque et libero porttitor consectetur. Pellentesque blandit placerat justo non.', 'img/nodejs.png', NULL, '6097f820c8b2f173778222.png', '2021-05-09 14:56:32'),
(11, 'Ruby', '2021-06-02 00:00:00', 15, 'Nanterre', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sem odio, hendrerit viverra nisi et, porta iaculis tellus. Nulla pharetra suscipit ultrices. Curabitur at condimentum odio, ut consectetur felis. Praesent a sollicitudin diam. Curabitur sit amet tellus finibus, hendrerit sem in, iaculis dui. Proin eu iaculis arcu, sit amet varius augue. Donec enim felis, facilisis in justo quis, tempor hendrerit orci. Nunc sed sem ac risus venenatis consequat ut ac neque. Quisque mollis quis velit a vulputate. Mauris libero elit, molestie vel enim a, feugiat venenatis eros. Proin a lectus sit amet magna luctus porttitor. Quisque non enim posuere, dictum tortor quis, sagittis enim. Donec a ex venenatis, rhoncus nulla quis, facilisis nulla. Donec porttitor euismod magna nec pretium. In placerat varius volutpat.\r\n\r\nDonec fringilla ac libero a vulputate. Suspendisse nec nibh et orci condimentum lacinia venenatis viverra sapien. Donec euismod pretium mi, sit amet gravida massa maximus in. Integer ac pulvinar nunc, ut volutpat sem. Ut condimentum dignissim quam, quis convallis nulla semper eu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Maecenas viverra neque eu pulvinar porta. In eu nisl orci. Duis justo nunc, auctor non rutrum sit amet, accumsan et nulla.\r\n\r\nSuspendisse ultricies mollis risus, varius varius velit hendrerit vel. Praesent dictum ex vel justo vestibulum, et tincidunt est accumsan. Ut ligula sem, blandit non lorem vitae, tempus mattis massa. Etiam tincidunt dui lobortis, rhoncus ante id, laoreet lacus. Donec iaculis laoreet dignissim. Ut id augue posuere, dictum mauris ut, faucibus magna.', 'img/ruby.png', NULL, '6097f79992847228866762.png', '2021-05-09 14:54:17'),
(12, 'WordPress', '2021-09-15 00:00:00', 25, 'Paris', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque volutpat dui vitae est bibendum pharetra. Nam in commodo diam, in interdum ipsum. Integer sit amet est blandit, mattis orci et, dapibus odio. Quisque a tincidunt purus. Nullam ut est euismod, aliquam nulla sed, facilisis felis. Mauris lobortis urna id nunc egestas mattis. Vestibulum porta varius elit quis tincidunt. Morbi ornare hendrerit nulla, vel vehicula justo scelerisque at. Aliquam non nisl nulla. Vivamus neque ipsum, bibendum in dui vitae, suscipit accumsan nunc. Praesent pharetra orci ut augue malesuada varius. Mauris eget feugiat urna, dictum tempus velit. Praesent at pharetra felis.\r\n\r\nIn vel semper lacus, eu congue dui. Pellentesque et ligula in tortor ultricies pharetra. Suspendisse nunc nisl, tempus vitae sodales nec, vulputate vel turpis. Sed et mi ornare, viverra lectus sit amet, fermentum erat. Aliquam aliquet varius enim, vel mollis odio elementum eget. Integer eget magna maximus, pharetra nisi sed, molestie neque. Quisque scelerisque, lectus et condimentum euismod, libero est suscipit magna, id fringilla mauris lorem vel turpis. Proin ut est molestie, hendrerit ante a, vehicula neque.\r\n\r\nMaecenas maximus velit sit amet lacus volutpat varius. Integer sem risus, consectetur ac purus non, aliquet ullamcorper nunc. Morbi a sem lacus. Quisque purus ipsum, suscipit vitae velit vitae, scelerisque auctor leo. Sed lacinia nisl eget dui aliquam, nec vehicula metus volutpat. Nullam in nisi lacinia, mattis magna sed, mollis nulla. Vivamus laoreet fringilla blandit. Vivamus dictum justo in nisl sodales imperdiet. Ut non pulvinar odio. Phasellus vel tortor turpis. Duis commodo tempor augue.', 'img/wp.png', NULL, '6097f84a310d3037134354.png', '2021-05-09 14:57:14'),
(13, 'HTML', '2021-09-29 00:00:00', 35, 'Paris', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean et augue nec leo fringilla pulvinar a sed purus. Morbi erat nisl, interdum eget viverra nec, gravida a purus. Nam eu fringilla quam. Pellentesque pharetra tellus vitae ipsum dictum, sit amet ullamcorper sem lacinia. Aenean massa erat, hendrerit eget fermentum vitae, rutrum sit amet metus. Proin luctus eget mi quis luctus. Fusce sollicitudin vel massa at accumsan. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla sed volutpat nisi. Ut malesuada molestie elit. Pellentesque hendrerit dui vitae lacinia sagittis. Pellentesque nunc ipsum, sollicitudin sed vulputate vitae, cursus sit amet ligula. Pellentesque dolor nibh, sagittis vel placerat vel, rhoncus sit amet ipsum. Nulla luctus nisi sit amet aliquet cursus. Nullam nisi justo, interdum eu commodo eu, finibus vel nibh. Morbi nec augue quis metus molestie gravida in id mauris.\r\n\r\nCurabitur eget ligula at lectus consectetur aliquam vitae vel lacus. Sed luctus massa at tellus ultricies cursus. Curabitur et venenatis elit. Cras vel dolor mauris. Aenean imperdiet ac tellus non ornare. Donec posuere ut enim at lacinia. Proin sagittis nisl lacus, eu iaculis dolor auctor in. Maecenas a neque ornare, lacinia leo vitae, pellentesque ligula. Vestibulum porttitor turpis sit amet lacus consectetur mollis. Vivamus eleifend nulla a interdum vulputate. Nunc consequat neque turpis, non egestas mauris rutrum eu. Duis commodo tempor fringilla. Cras quam neque, vehicula ac quam eu, volutpat molestie velit. Integer egestas, turpis at fermentum ultricies, turpis erat consectetur justo, venenatis eleifend leo turpis quis sapien. Curabitur.', 'img/html.png', NULL, '6097f81035802926495294.png', '2021-05-09 14:56:16');

-- --------------------------------------------------------

--
-- Structure de la table `training_course`
--

CREATE TABLE `training_course` (
  `training_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `training_course`
--

INSERT INTO `training_course` (`training_id`, `course_id`) VALUES
(1, 14),
(1, 15),
(1, 16),
(6, 13),
(6, 15),
(6, 16),
(6, 17),
(6, 22),
(6, 24),
(7, 20),
(8, 14),
(8, 15),
(8, 16),
(9, 14),
(9, 15),
(9, 16),
(10, 14),
(10, 22),
(11, 14),
(11, 15),
(12, 13),
(12, 14),
(12, 15),
(12, 16),
(13, 15),
(13, 16);

-- --------------------------------------------------------

--
-- Structure de la table `training_user`
--

CREATE TABLE `training_user` (
  `training_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `training_user`
--

INSERT INTO `training_user` (`training_id`, `user_id`) VALUES
(1, 94),
(1, 95),
(1, 96),
(1, 105),
(7, 103),
(8, 72),
(8, 73),
(8, 74),
(8, 75),
(8, 76),
(8, 104),
(9, 77),
(9, 78),
(9, 79),
(9, 80),
(9, 85),
(9, 86),
(9, 97),
(9, 98),
(9, 99),
(9, 100),
(9, 101),
(9, 102),
(12, 92),
(12, 93);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `lastname`, `firstname`, `birthday`, `email`, `password`, `message`, `username`, `validation`) VALUES
(55, 'L', 'F', NULL, 'demo@free.fr', '$2y$13$aVsZXTvKNoti4fiGijgx.uZNwMa2npH5b0zcv91vvFFP3ZEJX6pkm', NULL, 'demo', NULL),
(72, 'Deschamps-Pasquier', 'Adrien', '1995-06-03 00:00:00', 'becker.paulette@gddao.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas hendrerit.', NULL, NULL),
(73, 'Fleury', 'Antoinette', NULL, 'aimee.cousin@ecallen.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec viverra dui nec erat ultricies, id dignissim odio laoreet. Donec interdum cursus leo, sit amet luctus ex porttitor sed. Proin laoreet dignissim elit eget lacinia. Aliquam.', NULL, NULL),
(74, 'Poirier', 'Alfred Leclerc', NULL, 'edith16@nufsh.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ante sapien, viverra sed sagittis vitae, pellentesque non risus. Aenean auctor condimentum dolor, ac venenatis ante auctor ac', NULL, NULL),
(75, 'Valette', 'Martin', '1994-09-03 00:00:00', 'penelope91@singmails.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sed elit in mauris dignissim pretium. Nulla velit felis, tempor vel nisl eget, ornare ullamcorper est. Suspendisse id sapien lacinia, convallis metus quis, convallis libero. Aenean.', NULL, NULL),
(76, 'Boulanger', 'Georges-Édouard', '1990-09-03 00:00:00', 'thomas79@godobolet.buzz', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', NULL, NULL),
(77, 'Munoz', 'Marthe', '1983-06-03 00:00:00', 'gauthier.alexan@codg.site', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In suscipit ut sem vitae mattis.', NULL, 1),
(78, 'Picard', 'Diane', '1985-05-22 00:00:00', 'laine.gerard@urbansvg.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas vitae ex vitae nisl lobortis varius. Suspendisse potenti. Proin velit nisl, bibendum at consectetur id, fringilla id orci. Phasellus feugiat vel elit sed tristique. Mauris ultrices enim turpis, quis mollis est eleifend non. In tincidunt odio a velit tincidunt iaculis. Integer.', NULL, 1),
(79, 'Reynaud', 'Sophie', '1985-05-04 00:00:00', 'stephanie01@packiu.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut fringilla nunc. Aenean vitae magna sed ante hendrerit ultricies. Maecenas ac venenatis odio, nec egestas tellus.', NULL, 1),
(80, 'Dufour', 'Thibault', '1985-05-29 00:00:00', 'xmaillot@opakenak.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec et urna eget nisi gravida auctor sed in quam. Aenean a purus sagittis, aliquam odio tempor, suscipit risus. Proin eu elementum nisl. Quisque odio quam, tincidunt eu laoreet vitae, pulvinar eu mi. Duis non lectus ut metus rhoncus ultrices.', NULL, 1),
(85, 'Vallee', 'Guy Delorme', NULL, 'diane02@pianoxltd.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eleifend dui non tincidunt semper. Vestibulum at sem vitae sapien fringilla luctus vitae tristique diam. Integer ut ipsum tellus. Sed lacinia risus ullamcorper maximus lobortis. Nam enim magna, semper ac tincidunt at, bibendum quis libero. Duis efficitur augue ante, quis cursus.', NULL, 1),
(86, 'Royer', 'Stéphanie', '1999-05-13 00:00:00', 'alfred.allard@jimong.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eleifend dui non tincidunt semper. Vestibulum at sem vitae sapien fringilla luctus vitae tristique diam. Integer ut ipsum tellus. Sed lacinia risus ullamcorper maximus lobortis. Nam enim magna, semper ac tincidunt at, bibendum quis libero. Duis efficitur augue ante, quis cursus.', NULL, 1),
(92, 'Thomas', 'Arnaude', NULL, 'dherve@region13.ml', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum aliquam nibh, eget viverra ex pulvinar nec. Fusce tincidunt felis lorem, nec laoreet ex efficitur sed.', NULL, NULL),
(93, 'Klein', 'Tristan', '1984-05-06 00:00:00', 'aleclercq@dikitin.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed posuere erat ut tortor accumsan, dapibus porttitor felis fringilla. Quisque sed massa ut enim fermentum placerat. Fusce nibh libero, consequat ut luctus et, dictum vel sapien. Nulla luctus mauris id tellus accumsan, sit amet dignissim leo pharetra. Nullam non urna egestas.', NULL, 1),
(94, 'Besnard', 'Denis', '1991-04-29 00:00:00', 'alfred.allard@wj5518.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat lacinia libero. Nunc arcu orci, convallis vitae cursus at, suscipit non magna.', NULL, NULL),
(95, 'Cohen', 'Nath', '1985-06-29 00:00:00', 'gdeschamps@soilsuperfood.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur suscipit ullamcorper est quis tempus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, 1),
(96, 'Brunel', 'David-Roger', '1984-06-01 00:00:00', 'ybenard@brillionhistoricalsociety.com', NULL, 'Curabitur tempor volutpat mollis. Nullam iaculis feugiat sollicitudin. Cras suscipit erat lectus, in dapibus magna blandit id. Maecenas pretium quam hendrerit sem.', NULL, 1),
(97, 'Berger', 'Capucine', '1988-02-04 00:00:00', 'joly.raymond@btcmod.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed elementum in eros in consequat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, 1),
(98, 'Gallet', 'Capucine', '1974-02-04 00:00:00', 'blebreton@nasigoreng.buzz', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean commodo magna vel dolor lobortis fringilla. Nunc est turpis, posuere eget quam mattis, consequat imperdiet mauris. Maecenas nulla sem, sodales pretium sollicitudin non, condimentum et lectus. Nam turpis nisl, imperdiet vitae feugiat id, pretium ac erat. Sed dignissim efficitur elit, quis.', NULL, 1),
(99, 'Charrier', 'Thibault', '1974-01-23 00:00:00', 'gilles.fabre@emvil.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean commodo magna vel dolor lobortis fringilla. Nunc est turpis, posuere eget quam mattis, consequat imperdiet mauris. Maecenas nulla sem, sodales pretium sollicitudin non, condimentum et lectus. Nam turpis nisl, imperdiet vitae feugiat id, pretium ac erat. Sed dignissim efficitur elit, quis.', NULL, 1),
(100, 'De Oliveira', 'Chantal', '1990-01-23 00:00:00', 'victor39@moxianmusic.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut interdum quam at dapibus lobortis. Aliquam vel molestie orci. Pellentesque aliquet sem ut libero vulputate accumsan.', NULL, 1),
(101, 'Chartier', 'Gabrielle', '2000-01-23 00:00:00', 'rbuisson@alogon.net', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus justo nunc, volutpat at fringilla sed, convallis id eros. Maecenas tempor massa ut dictum sollicitudin. Fusce a magna metus. Vivamus lobortis metus et dui vulputate semper. Integer at lorem magna. Integer pellentesque eget ligula vitae sollicitudin. Phasellus id enim vitae orci.', NULL, 1),
(102, 'Fernandez', 'Adèle', '2002-07-05 00:00:00', 'gdacosta@duybuy.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl sapien, fermentum et lorem sed, sollicitudin vestibulum ex. Nunc imperdiet nisi est, tristique sodales nunc venenatis vel.', NULL, 1),
(103, 'Bourdon', 'Nathalie', NULL, 'pelletier.david@mobilefirstcms.org', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi blandit nibh et nibh ultricies, in malesuada ex faucibus. Etiam turpis neque, dapibus ut mi in, pulvinar molestie mi. Sed non vulputate neque. Fusce auctor, magna a porta fermentum, ipsum tortor iaculis risus, vel facilisis massa risus fringilla erat. Nam tempor.', NULL, NULL),
(104, 'Carlier', 'Andrée', NULL, 'pthierry@avmike.com', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac eleifend neque. Aenean a tortor neque. Etiam accumsan erat nec ex vulputate, vel eleifend magna semper. Vivamus at faucibus metus.', NULL, 1),
(105, 'Ayot', 'Julien', '2015-02-07 00:00:00', 'julienayot@freee.fr', NULL, 'College, en Virginie, s\'est intéressé à un des mots latins les plus obscurs, consectetur, extrait d\'un passage du Lorem Ipsum, et en étudiant tous les usages de ce', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `IDX_332CA4DDD60322AC` (`role_id`),
  ADD KEY `IDX_332CA4DDA76ED395` (`user_id`);

--
-- Index pour la table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `training_course`
--
ALTER TABLE `training_course`
  ADD PRIMARY KEY (`training_id`,`course_id`),
  ADD KEY `IDX_2572A8D6591CC992` (`course_id`),
  ADD KEY `IDX_2572A8D6BEFD98D1` (`training_id`);

--
-- Index pour la table `training_user`
--
ALTER TABLE `training_user`
  ADD PRIMARY KEY (`training_id`,`user_id`),
  ADD KEY `IDX_8209910ABEFD98D1` (`training_id`),
  ADD KEY `IDX_8209910AA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `training`
--
ALTER TABLE `training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `FK_332CA4DDA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_332CA4DDD60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `training_course`
--
ALTER TABLE `training_course`
  ADD CONSTRAINT `FK_2572A8D6591CC992` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2572A8D6BEFD98D1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `training_user`
--
ALTER TABLE `training_user`
  ADD CONSTRAINT `FK_8209910AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8209910ABEFD98D1` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
