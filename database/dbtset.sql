-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 11 juin 2021 à 18:23
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbtset`
--

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id` int(11) NOT NULL,
  `nom` varchar(11) NOT NULL,
  `prenom` varchar(11) NOT NULL,
  `tel` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `titulaire` enum('oui','non') NOT NULL,
  `école_actuelle` int(11) NOT NULL,
  `num_carte` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id`, `nom`, `prenom`, `tel`, `email`, `titulaire`, `école_actuelle`, `num_carte`) VALUES
(71, 'abdelhamid', 'mim', 758426155, 'ablhamid@gmail.com', 'oui', 2, '4587620001'),
(72, 'ahmed', 'meh', 758426185, 'abdemid@gmail.com', 'non', 3, '4587162566'),
(74, 'abdelhamid', 'mim', 758427185, 'abdelid@gmail.com', 'non', 2, '458716256600'),
(75, 'abdis', 'meh', 758786185, 'abdmid@gmail.com', 'non', 1, '458762001');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `num_etud` int(11) NOT NULL,
  `nom` varchar(11) NOT NULL,
  `prenom` varchar(11) NOT NULL,
  `age` int(11) NOT NULL,
  `sexe` enum('male','femelle') NOT NULL,
  `groupe` int(11) NOT NULL,
  `redoublant` enum('oui','non') NOT NULL,
  `num_tel_parent` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`num_etud`, `nom`, `prenom`, `age`, `sexe`, `groupe`, `redoublant`, `num_tel_parent`) VALUES
(88, 'hadjer', 'mim', 11, 'femelle', 5, 'non', 662534340),
(98, 'amira', 'ben ahmed', 14, 'femelle', 20, 'non', 662534340),
(100, 'amel', 'meh', 13, 'femelle', 19, 'non', 662534340),
(101, 'nour', 'lach', 11, 'femelle', 6, 'non', 662534340),
(102, 'ahmed', 'ben', 11, 'male', 1, 'non', 662534340);

-- --------------------------------------------------------

--
-- Structure de la table `e_moyenne`
--

CREATE TABLE `e_moyenne` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `daira` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `e_moyenne`
--

INSERT INTO `e_moyenne` (`id`, `nom`, `daira`) VALUES
(1, 'ben boulaid', 'khenchela'),
(2, 'abdelhamid ben badis', 'khenchela'),
(3, 'ibn sina', 'khenchela');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `ecole` int(11) NOT NULL,
  `etape_groupe` int(11) NOT NULL,
  `nom_groupe` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nombre`, `ecole`, `etape_groupe`, `nom_groupe`) VALUES
(1, 35, 2, 1, '1m1'),
(2, 31, 2, 1, '1m2'),
(3, 38, 2, 1, '1m3'),
(4, 30, 2, 1, '1m4'),
(5, 32, 1, 1, '1m1'),
(6, 30, 1, 1, '1m2'),
(7, 31, 1, 2, '2m1'),
(8, 39, 1, 2, '2m2'),
(9, 30, 1, 2, '2m3'),
(10, 31, 2, 2, '2m1'),
(11, 32, 2, 2, '2m2'),
(12, 31, 3, 1, '1m1'),
(13, 32, 3, 1, '1m2'),
(14, 35, 3, 1, '1m3'),
(15, 30, 3, 2, '2m1'),
(16, 38, 3, 2, '2m2'),
(17, 30, 2, 3, '3m1'),
(18, 32, 2, 4, '4m1'),
(19, 32, 1, 3, '3m1'),
(20, 31, 1, 4, '4m1'),
(21, 31, 3, 3, '3m1'),
(22, 38, 3, 4, '4m1');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `matière` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `matière`) VALUES
(1, 'histoire'),
(2, 'geographie'),
(3, 'eduction islamique'),
(5, 'eduction civique'),
(6, 'sciences'),
(8, 'physique'),
(9, 'mathematiques'),
(10, 'sport'),
(11, 'informatique'),
(12, 'musique'),
(13, 'langue arabe'),
(14, 'francaise'),
(15, 'anglais');

-- --------------------------------------------------------

--
-- Structure de la table `module_enseignant`
--

CREATE TABLE `module_enseignant` (
  `id` int(11) NOT NULL,
  `ensignant_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `module_enseignant`
--

INSERT INTO `module_enseignant` (`id`, `ensignant_id`, `module_id`) VALUES
(22, 71, 3),
(23, 72, 5),
(24, 72, 5),
(25, 74, 5),
(26, 71, 12),
(27, 75, 8);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `id` int(11) NOT NULL,
  `etape` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id`, `etape`) VALUES
(1, '1er annee moyenne'),
(2, '2eme annee moyenne'),
(3, '3eme annee moyenne'),
(4, '4eme annee moyenne');

-- --------------------------------------------------------

--
-- Structure de la table `niveau_ensignant`
--

CREATE TABLE `niveau_ensignant` (
  `id_enseignant` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `niveau_ensignant`
--

INSERT INTO `niveau_ensignant` (`id_enseignant`, `id_niveau`, `id`) VALUES
(71, 2, 23),
(71, 3, 24),
(72, 4, 25),
(72, 3, 26),
(74, 2, 27),
(74, 3, 28),
(75, 4, 29);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tel` (`tel`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `num_carte` (`num_carte`),
  ADD KEY `école_actuelle` (`école_actuelle`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`num_etud`),
  ADD KEY `groupe` (`groupe`);

--
-- Index pour la table `e_moyenne`
--
ALTER TABLE `e_moyenne`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etape_groupe` (`etape_groupe`),
  ADD KEY `ecole` (`ecole`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `module_enseignant`
--
ALTER TABLE `module_enseignant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ensignant_id` (`ensignant_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `etape` (`etape`);

--
-- Index pour la table `niveau_ensignant`
--
ALTER TABLE `niveau_ensignant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_niveau` (`id_niveau`),
  ADD KEY `id_enseignant` (`id_enseignant`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT pour la table `e_moyenne`
--
ALTER TABLE `e_moyenne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `module_enseignant`
--
ALTER TABLE `module_enseignant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `niveau_ensignant`
--
ALTER TABLE `niveau_ensignant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD CONSTRAINT `enseignant_ibfk_1` FOREIGN KEY (`école_actuelle`) REFERENCES `e_moyenne` (`id`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`groupe`) REFERENCES `groupe` (`id`);

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `groupe_ibfk_1` FOREIGN KEY (`etape_groupe`) REFERENCES `niveau` (`id`),
  ADD CONSTRAINT `groupe_ibfk_2` FOREIGN KEY (`ecole`) REFERENCES `e_moyenne` (`id`);

--
-- Contraintes pour la table `module_enseignant`
--
ALTER TABLE `module_enseignant`
  ADD CONSTRAINT `module_enseignant_ibfk_1` FOREIGN KEY (`ensignant_id`) REFERENCES `enseignant` (`id`),
  ADD CONSTRAINT `module_enseignant_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`);

--
-- Contraintes pour la table `niveau_ensignant`
--
ALTER TABLE `niveau_ensignant`
  ADD CONSTRAINT `niveau_ensignant_ibfk_2` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id`),
  ADD CONSTRAINT `niveau_ensignant_ibfk_3` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
