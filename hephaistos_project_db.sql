-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Okt 06. 22:08
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `hephaistos_project_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `classroom`
--

CREATE TABLE `classroom` (
  `ID` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `responsible_teacher_id` int(11) DEFAULT NULL,
  `size` double DEFAULT NULL,
  `projector` tinyint(4) DEFAULT NULL,
  `smartboard` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `classroom`
--

INSERT INTO `classroom` (`ID`, `capacity`, `responsible_teacher_id`, `size`, `projector`, `smartboard`, `created_at`, `updated_at`) VALUES
(1, 30, 1, 50.5, 1, 1, '2024-10-06 22:02:33', '2024-10-06 22:02:33'),
(2, 25, 2, 40, 1, 0, '2024-10-06 22:02:33', '2024-10-06 22:02:33');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `permission`
--

CREATE TABLE `permission` (
  `ID` int(11) NOT NULL,
  `permission_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `permission`
--

INSERT INTO `permission` (`ID`, `permission_name`) VALUES
(3, 'Add Student'),
(2, 'Edit Grades'),
(6, 'Edit Schedule'),
(4, 'Remove Student'),
(1, 'View Grades'),
(5, 'View Schedule');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `role`
--

CREATE TABLE `role` (
  `ID` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `role`
--

INSERT INTO `role` (`ID`, `role_name`) VALUES
(4, 'Admin'),
(3, 'Principal'),
(1, 'Student'),
(2, 'Teacher');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rolepermission`
--

CREATE TABLE `rolepermission` (
  `ID` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `student`
--

CREATE TABLE `student` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(10) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `educational_id` varchar(50) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `student`
--

INSERT INTO `student` (`ID`, `user_id`, `title`, `first_name`, `last_name`, `birth_date`, `mother_name`, `class_id`, `educational_id`, `gender`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mr.', 'Tom', 'Anderson', '2005-05-15', 'Linda Anderson', 1, 'EDU123', 1, '2024-10-06 22:02:33', '2024-10-06 22:02:33'),
(2, 2, 'Ms.', 'Jessica', 'Davis', '2005-06-01', 'Emily Davis', 1, 'EDU124', 0, '2024-10-06 22:02:33', '2024-10-06 22:02:33');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `subject`
--

CREATE TABLE `subject` (
  `ID` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `is_cancelled` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `credits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `subject`
--

INSERT INTO `subject` (`ID`, `teacher_id`, `classroom_id`, `name`, `date`, `is_cancelled`, `created_at`, `updated_at`, `credits`) VALUES
(1, 2, 1, 'Mathematics', '2024-10-01', 0, '2024-10-06 22:02:33', '2024-10-06 22:02:33', 5),
(2, 1, 2, 'History', '2024-10-02', 0, '2024-10-06 22:02:33', '2024-10-06 22:02:33', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `teacher`
--

CREATE TABLE `teacher` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(10) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `employment_start_date` date DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `teacher`
--

INSERT INTO `teacher` (`ID`, `user_id`, `title`, `first_name`, `last_name`, `birth_date`, `mother_name`, `employment_start_date`, `gender`, `created_at`, `updated_at`) VALUES
(1, 3, 'Mr.', 'John', 'Doe', '1980-03-10', 'Jane Doe', '2010-09-01', 1, '2024-10-06 22:02:33', '2024-10-06 22:02:33'),
(2, 4, 'Ms.', 'Emily', 'Johnson', '1985-07-15', 'Linda Johnson', '2012-09-01', 0, '2024-10-06 22:02:33', '2024-10-06 22:02:33');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `timetable`
--

CREATE TABLE `timetable` (
  `ID` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `semester` varchar(50) DEFAULT NULL,
  `credits_earned` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `timetable`
--

INSERT INTO `timetable` (`ID`, `teacher_id`, `subject_id`, `classroom_id`, `semester`, `credits_earned`) VALUES
(1, 1, 1, 1, 'Fall 2024', 5),
(2, 2, 2, 2, 'Fall 2024', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `userpermission`
--

CREATE TABLE `userpermission` (
  `ID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `last_login` datetime DEFAULT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`ID`, `username`, `email`, `password_hash`, `created_at`, `last_login`, `role`) VALUES
(1, 'student_user1', 'student1@example.com', 'hash_student1', '2024-10-06 22:02:33', NULL, 'Student'),
(2, 'student_user2', 'student2@example.com', 'hash_student2', '2024-10-06 22:02:33', NULL, 'Student'),
(3, 'teacher_user1', 'teacher1@example.com', 'hash_teacher1', '2024-10-06 22:02:33', NULL, 'Teacher'),
(4, 'teacher_user2', 'teacher2@example.com', 'hash_teacher2', '2024-10-06 22:02:33', NULL, 'Teacher'),
(5, 'principal_user', 'principal@example.com', 'hash_principal', '2024-10-06 22:02:33', NULL, 'Principal');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `responsible_teacher_id` (`responsible_teacher_id`);

--
-- A tábla indexei `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `permission_name` (`permission_name`);

--
-- A tábla indexei `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- A tábla indexei `rolepermission`
--
ALTER TABLE `rolepermission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- A tábla indexei `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `classroom_id` (`classroom_id`);

--
-- A tábla indexei `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`);

--
-- A tábla indexei `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `classroom_id` (`classroom_id`);

--
-- A tábla indexei `userpermission`
--
ALTER TABLE `userpermission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `classroom`
--
ALTER TABLE `classroom`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `permission`
--
ALTER TABLE `permission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `role`
--
ALTER TABLE `role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `rolepermission`
--
ALTER TABLE `rolepermission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `student`
--
ALTER TABLE `student`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `subject`
--
ALTER TABLE `subject`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `teacher`
--
ALTER TABLE `teacher`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `timetable`
--
ALTER TABLE `timetable`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `userpermission`
--
ALTER TABLE `userpermission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `classroom`
--
ALTER TABLE `classroom`
  ADD CONSTRAINT `classroom_ibfk_1` FOREIGN KEY (`responsible_teacher_id`) REFERENCES `teacher` (`ID`);

--
-- Megkötések a táblához `rolepermission`
--
ALTER TABLE `rolepermission`
  ADD CONSTRAINT `rolepermission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`ID`),
  ADD CONSTRAINT `rolepermission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`ID`);

--
-- Megkötések a táblához `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`);

--
-- Megkötések a táblához `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`ID`),
  ADD CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`ID`);

--
-- Megkötések a táblához `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`);

--
-- Megkötések a táblához `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`ID`),
  ADD CONSTRAINT `timetable_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`ID`),
  ADD CONSTRAINT `timetable_ibfk_3` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`ID`);

--
-- Megkötések a táblához `userpermission`
--
ALTER TABLE `userpermission`
  ADD CONSTRAINT `userpermission_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `userpermission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
