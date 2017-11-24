-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 24 nov. 2017 à 15:57
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `symfony`
--

-- --------------------------------------------------------

--
-- Structure de la table `advert`
--

DROP TABLE IF EXISTS `advert`;
CREATE TABLE IF NOT EXISTS `advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `image_id` int(11) NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `nbApplications` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_54F1F40B3DA5256D` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `advert`
--

INSERT INTO `advert` (`id`, `date`, `title`, `content`, `author`, `published`, `image_id`, `updatedAt`, `nbApplications`) VALUES
(1, '2017-05-09 11:58:12', 'Titre 01', 'Bla bla bla... [01]', 'Author 01', 1, 14, '0000-00-00 00:00:00', 0),
(2, '2017-05-09 11:58:14', 'Titre 02', 'Bla bla bla... [02]', 'Author 02', 1, 15, '0000-00-00 00:00:00', 0),
(3, '2017-05-09 11:58:15', 'Titre 03', 'Bla bla bla... [03]', 'Author 03', 1, 16, '0000-00-00 00:00:00', 0),
(4, '2017-05-09 11:58:16', 'Titre 04', 'Bla bla bla... [04]', 'Author 04', 1, 17, '0000-00-00 00:00:00', 0),
(5, '2017-05-09 11:58:18', 'Titre 05', 'Bla bla bla... [05]', 'Author 05', 1, 18, '0000-00-00 00:00:00', 0),
(6, '2017-05-09 11:58:20', 'Titre 06', 'Bla bla bla... [06]', 'Author 06', 1, 19, '0000-00-00 00:00:00', 0),
(7, '2017-05-09 11:58:21', 'Titre 07', 'Bla bla bla... [07]', 'Author 06', 1, 20, '0000-00-00 00:00:00', 0),
(8, '2017-05-09 12:00:58', 'Titre 08', 'Bla bla bla... [08]', 'Author 08', 1, 21, '0000-00-00 00:00:00', 0),
(9, '2017-05-09 12:01:00', 'Titre 09', 'Bla bla bla... [09]', 'Author 09', 1, 22, '0000-00-00 00:00:00', 0),
(10, '2017-09-14 14:30:56', 'Titre 10', 'Bla bla bla... [10]', 'Author 10', 1, 23, '0000-00-00 00:00:00', 0),
(11, '2017-10-04 14:37:37', 'Titre 11', 'Bla bla bla... [11]', 'Author 11', 1, 24, '0000-00-00 00:00:00', 0),
(12, '2017-10-15 07:44:52', 'Titre 12', 'Bla bla bla... [12]', 'Author 12', 1, 25, '0000-00-00 00:00:00', 0),
(13, '2017-10-15 09:22:39', 'Titre 13', 'Bla bla bla... [13]', 'Author 13', 1, 26, '0000-00-00 00:00:00', 0),
(14, '2017-10-02 09:06:25', 'Titre 01', 'Bla bla bla... [01]', 'Author 01', 1, 27, '0000-00-00 00:00:00', 0),
(15, '2017-10-02 09:29:13', 'Titre 01', 'Bla bla bla... [01]', 'Author 01', 1, 28, '0000-00-00 00:00:00', 0),
(16, '2017-10-02 09:42:20', 'Titre 01', 'Bla bla bla... [01]', 'Author 01', 1, 29, '0000-00-00 00:00:00', 0),
(17, '2017-10-02 11:18:48', 'Titre 01', 'Bla bla bla... [01]', 'Author 01', 1, 30, '0000-00-00 00:00:00', 0),
(18, '2017-10-02 11:19:14', 'Titre 01', 'Bla bla bla... [01]', 'Author 01', 1, 31, '2017-10-25 12:41:13', 0),
(19, '2017-10-25 11:31:28', 'Titre 01', 'Bla bla bla... [01]', 'Author 01', 1, 32, '2017-10-25 12:39:28', 0),
(20, '2017-10-25 11:32:41', 'Titre 01', 'Bla bla bla... [01]', 'Author 01', 1, 33, '2017-10-25 12:26:41', 0),
(21, '2017-10-25 14:35:19', 'Titre 01', 'Bla bla bla... [01]', 'Author 01', 1, 40, '2017-10-25 14:35:27', 0),
(22, '2017-11-09 15:39:35', 'test20171109', 'Annonce test postée le jeudi 09 nov 2017 à 1639', 'Author Admin', 1, 41, NULL, 0),
(23, '2017-11-13 14:44:29', 'test20171113', 'Bla bla bla... Bla bla bla... Bla bla bla... Bla bla bla... Bla bla bla... Bla bla bla... Bla bla bla...!!', 'Author Admin', 1, 42, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `advert_category`
--

DROP TABLE IF EXISTS `advert_category`;
CREATE TABLE IF NOT EXISTS `advert_category` (
  `advert_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`advert_id`,`category_id`),
  KEY `IDX_84EEA340D07ECCB6` (`advert_id`),
  KEY `IDX_84EEA34012469DE2` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `advert_category`
--

INSERT INTO `advert_category` (`advert_id`, `category_id`) VALUES
(7, 21),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(15, 24),
(18, 21),
(18, 22),
(18, 23),
(18, 24),
(18, 25),
(19, 21),
(19, 22),
(19, 23),
(19, 24),
(19, 25),
(20, 21),
(20, 22),
(20, 23),
(20, 24),
(20, 25),
(21, 21),
(21, 22),
(21, 23),
(21, 24),
(21, 25);

-- --------------------------------------------------------

--
-- Structure de la table `advert_skill`
--

DROP TABLE IF EXISTS `advert_skill`;
CREATE TABLE IF NOT EXISTS `advert_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advert_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5619F91BD07ECCB6` (`advert_id`),
  KEY `IDX_5619F91B5585C142` (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `advert_skill`
--

INSERT INTO `advert_skill` (`id`, `advert_id`, `skill_id`, `level`) VALUES
(1, 9, 16, ''),
(2, 9, 19, ''),
(3, 9, 20, ''),
(4, 9, 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advert_id` int(11) NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A45BDDC1D07ECCB6` (`advert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `application`
--

INSERT INTO `application` (`id`, `advert_id`, `author`, `content`, `date`) VALUES
(1, 8, 'Author 01', 'Bla bla bla bla bla bla candidature 01', '2017-10-03 10:00:00'),
(2, 4, 'Author 04', 'Bla bla bla bla bla bla candidature 02', '2017-10-03 10:02:00'),
(3, 2, 'Author 03', 'Bla bla bla bla bla bla candidature 03', '2017-10-03 10:00:00'),
(4, 1, 'Author 02', 'Bla bla bla bla bla bla candidature 04', '2017-10-03 10:00:00'),
(5, 3, 'Author 07', 'Bla bla bla bla bla bla candidature 05', '2017-10-03 10:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(21, 'Développeur'),
(22, 'DéveloppementMobile'),
(23, 'Graphisme'),
(24, 'Intégrateur'),
(25, 'Réseau');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `url`, `alt`) VALUES
(14, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(15, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(16, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(17, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(18, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(19, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(20, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(21, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(22, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(23, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(24, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(25, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(26, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(27, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(28, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(29, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(30, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(31, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(32, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(33, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(40, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(41, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve'),
(42, 'http://sdz-upload.s3.amazonaws.com/prod/upload/job-de-reve.jpg', 'Job de rêve');

-- --------------------------------------------------------

--
-- Structure de la table `skill`
--

DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `skill`
--

INSERT INTO `skill` (`id`, `name`) VALUES
(1, 'Angular JS'),
(2, 'Java'),
(15, 'PHP'),
(16, 'Symfony'),
(17, 'C++'),
(19, 'Photoshop'),
(20, 'Blender'),
(21, 'Bloc-note');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `advert`
--
ALTER TABLE `advert`
  ADD CONSTRAINT `FK_54F1F40B3DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);

--
-- Contraintes pour la table `advert_category`
--
ALTER TABLE `advert_category`
  ADD CONSTRAINT `FK_84EEA34012469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_84EEA340D07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `advert` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `advert_skill`
--
ALTER TABLE `advert_skill`
  ADD CONSTRAINT `FK_5619F91B5585C142` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`),
  ADD CONSTRAINT `FK_5619F91BD07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `advert` (`id`);

--
-- Contraintes pour la table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `FK_A45BDDC1D07ECCB6` FOREIGN KEY (`advert_id`) REFERENCES `advert` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
