-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 28 2016 г., 21:41
-- Версия сервера: 5.5.50
-- Версия PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `chatDb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '3', 1480357146),
('moderator', '2', 1480357135),
('user', '1', 1480357124);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/admin/*', 2, NULL, NULL, NULL, 1480354497, 1480354497),
('/admin/chat/*', 2, NULL, NULL, NULL, 1480356432, 1480356432),
('/admin/room/*', 2, NULL, NULL, NULL, 1480356439, 1480356439),
('/chat/*', 2, NULL, NULL, NULL, 1480354519, 1480354519),
('/chat/send-msg', 2, NULL, NULL, NULL, 1480356413, 1480356413),
('/chat/update-chat', 2, NULL, NULL, NULL, 1480356414, 1480356414),
('/rbac/*', 2, NULL, NULL, NULL, 1480354509, 1480354509),
('/room/*', 2, NULL, NULL, NULL, 1480356401, 1480356401),
('admin', 1, 'Админ - Властелин сайта', NULL, NULL, 1480357093, 1480357093),
('adminAccess', 2, 'Доступ ко всему', NULL, NULL, 1480356717, 1480356717),
('chatAccess', 2, 'Доступ к чату', NULL, NULL, 1480356547, 1480356547),
('moderator', 1, 'role user + модерация', NULL, NULL, 1480357036, 1480357036),
('moderatorAccess', 2, 'Доступ к комнатам и чатам', NULL, NULL, 1480356664, 1480356664),
('roomAccess', 2, 'Доступ к комнатам', NULL, NULL, 1480356592, 1480356592),
('user', 1, 'писать в чат, создавать комнаты', NULL, NULL, 1480356978, 1480356978);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('adminAccess', '/admin/*'),
('moderatorAccess', '/admin/chat/*'),
('moderatorAccess', '/admin/room/*'),
('chatAccess', '/chat/*'),
('adminAccess', '/rbac/*'),
('roomAccess', '/room/*'),
('admin', 'adminAccess'),
('adminAccess', 'chatAccess'),
('moderatorAccess', 'chatAccess'),
('roomAccess', 'chatAccess'),
('user', 'chatAccess'),
('admin', 'moderator'),
('adminAccess', 'moderatorAccess'),
('moderator', 'moderatorAccess'),
('adminAccess', 'roomAccess'),
('moderatorAccess', 'roomAccess'),
('user', 'roomAccess'),
('admin', 'user'),
('moderator', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `chat_type` smallint(6) NOT NULL DEFAULT '0',
  `room_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1480351285),
('m140506_102106_rbac_init', 1480353727),
('m140602_111327_create_menu_table', 1480353700),
('m160312_050000_create_user', 1480353700),
('m161128_163057_create_chat_table', 1480351290),
('m161128_174526_create_room_table', 1480355317);

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'user', 'DDoKHLJQ08bktMy44G4LfyZEKeH5-RXB', '$2y$13$D/BwqjdjPPjNWd.WEI5OhOsUa0x/lxR0bg1eTHOEaYJQRvK.BytH.', NULL, 'user@example.com', 10, 1480354268, 1480354268),
(2, 'moderator', 'H9NExRbh-AY2ACQevLe_pgJk6HlNjP13', '$2y$13$/DY8SNk4F6vscMkMZvo5ceuH6Yp50ezWfjpa2KoK11/OOUTyeeZeS', NULL, 'moderator@example.com', 10, 1480354301, 1480354301),
(3, 'admin', '8Hiw4HP30exk3P0E_zlRlUh-EJCd3ctn', '$2y$13$mwcVCZYuBW1cCz0Zr9zdDuuaQfy4NQh9rCRI/HuOHL2l8djTvtY8i', NULL, 'admin@example.com', 10, 1480354325, 1480354325);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id_idx` (`id`),
  ADD KEY `chat_from_idx` (`from`),
  ADD KEY `chat_to_idx` (`to`),
  ADD KEY `chat_author_idx` (`author_id`),
  ADD KEY `chat_created_idx` (`created`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id_idx` (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
