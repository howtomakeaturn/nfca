-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 03 月 22 日 21:59
-- 服务器版本: 5.5.34-0ubuntu0.13.04.1
-- PHP 版本: 5.4.9-4ubuntu2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `nfca`
--

-- --------------------------------------------------------

--
-- 表的结构 `core_settings`
--

CREATE TABLE IF NOT EXISTS `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';

--
-- 转存表中的数据 `core_settings`
--

INSERT INTO `core_settings` (`slug`, `default`, `value`) VALUES
('date_format', 'g:ia -- m/d/y', 'g:ia -- m/d/y'),
('lang_direction', 'ltr', 'ltr'),
('status_message', 'This site has been disabled by a super-administrator.', 'This site has been disabled by a super-administrator.');

-- --------------------------------------------------------

--
-- 表的结构 `core_sites`
--

CREATE TABLE IF NOT EXISTS `core_sites` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique ref` (`ref`),
  UNIQUE KEY `Unique domain` (`domain`),
  KEY `ref` (`ref`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `core_sites`
--

INSERT INTO `core_sites` (`id`, `name`, `ref`, `domain`, `active`, `created_on`, `updated_on`) VALUES
(1, 'Default Site', 'default', 'pyrocms.local', 1, 1395238750, 0);

-- --------------------------------------------------------

--
-- 表的结构 `core_users`
--

CREATE TABLE IF NOT EXISTS `core_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `core_users`
--

INSERT INTO `core_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(1, 'howtomakeaturn@hotmail.com', 'f142b92c78ced8ce73a538cc895a2835b9b47d0f', '2aa74', 1, '', 1, '', 1395238749, 1395238749, 'å°¤å·è±ª', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `default_blog`
--

CREATE TABLE IF NOT EXISTS `default_blog` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` enum('no','1 day','1 week','2 weeks','1 month','3 months','always') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3 months',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `default_blog`
--

INSERT INTO `default_blog` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `intro`, `title`, `slug`, `category_id`, `body`, `parsed`, `keywords`, `author_id`, `created_on`, `updated_on`, `comments_enabled`, `status`, `type`, `preview_hash`) VALUES
(1, '2014-03-22 13:01:00', NULL, 1, 1, 'this is intro', 'First Article', 'first-article', 0, 'this is the first article', '', '', 1, 1395493260, 0, '3 months', 'live', 'wysiwyg-advanced', ''),
(2, '2014-03-22 13:02:00', NULL, 1, 2, 'This is intro', 'Second Article', 'second-article', 0, 'Second Article', '', '', 1, 1395493320, 0, '3 months', 'live', 'wysiwyg-advanced', '');

-- --------------------------------------------------------

--
-- 表的结构 `default_blog_categories`
--

CREATE TABLE IF NOT EXISTS `default_blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `default_ci_sessions`
--

CREATE TABLE IF NOT EXISTS `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `default_ci_sessions`
--

INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('c0ff44df009f25b0e78fd3cd792a9578', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36', 1395367058, 'a:6:{s:8:"username";s:18:"å°¤å·è±ª";s:5:"email";s:26:"howtomakeaturn@hotmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('fe311ce4446ce4300a772c1827113e01', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36', 1395492093, 'a:6:{s:8:"username";s:18:"å°¤å·è±ª";s:5:"email";s:26:"howtomakeaturn@hotmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('ac48410bacb7862cd602a2d96bdc8541', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36', 1395495739, 'a:6:{s:8:"username";s:18:"å°¤å·è±ª";s:5:"email";s:26:"howtomakeaturn@hotmail.com";s:2:"id";s:1:"1";s:7:"user_id";s:1:"1";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}');

-- --------------------------------------------------------

--
-- 表的结构 `default_comments`
--

CREATE TABLE IF NOT EXISTS `default_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `entry_title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `default_comment_blacklists`
--

CREATE TABLE IF NOT EXISTS `default_comment_blacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `default_contact_log`
--

CREATE TABLE IF NOT EXISTS `default_contact_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `default_data_fields`
--

CREATE TABLE IF NOT EXISTS `default_data_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `default_data_fields`
--

INSERT INTO `default_data_fields` (`id`, `field_name`, `field_slug`, `field_namespace`, `field_type`, `field_data`, `view_options`, `is_locked`) VALUES
(1, 'lang:blog:intro_label', 'intro', 'blogs', 'wysiwyg', 0x613a323a7b733a31313a22656469746f725f74797065223b733a363a2273696d706c65223b733a31303a22616c6c6f775f74616773223b733a313a2279223b7d, NULL, 'no'),
(2, 'lang:pages:body_label', 'body', 'pages', 'wysiwyg', 0x613a323a7b733a31313a22656469746f725f74797065223b733a383a22616476616e636564223b733a31303a22616c6c6f775f74616773223b733a313a2279223b7d, NULL, 'no'),
(3, 'lang:user:first_name_label', 'first_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a35303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(4, 'lang:user:last_name_label', 'last_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a35303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(5, 'lang:profile_company', 'company', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3130303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(6, 'lang:profile_bio', 'bio', 'users', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(7, 'lang:user:lang', 'lang', 'users', 'pyro_lang', 0x613a313a7b733a31323a2266696c7465725f7468656d65223b733a333a22796573223b7d, NULL, 'no'),
(8, 'lang:profile_dob', 'dob', 'users', 'datetime', 0x613a353a7b733a383a227573655f74696d65223b733a323a226e6f223b733a31303a2273746172745f64617465223b733a353a222d31303059223b733a383a22656e645f64617465223b4e3b733a373a2273746f72616765223b733a343a22756e6978223b733a31303a22696e7075745f74797065223b733a383a2264726f70646f776e223b7d, NULL, 'no'),
(9, 'lang:profile_gender', 'gender', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a33343a22203a204e6f742054656c6c696e670a6d203a204d616c650a66203a2046656d616c65223b733a31313a2263686f6963655f74797065223b733a383a2264726f70646f776e223b733a31333a2264656661756c745f76616c7565223b4e3b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(10, 'lang:profile_phone', 'phone', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(11, 'lang:profile_mobile', 'mobile', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(12, 'lang:profile_address_line1', 'address_line1', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(13, 'lang:profile_address_line2', 'address_line2', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(14, 'lang:profile_address_line3', 'address_line3', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(15, 'lang:profile_address_postcode', 'postcode', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(16, 'lang:profile_website', 'website', 'users', 'url', NULL, NULL, 'no');

-- --------------------------------------------------------

--
-- 表的结构 `default_data_field_assignments`
--

CREATE TABLE IF NOT EXISTS `default_data_field_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `default_data_field_assignments`
--

INSERT INTO `default_data_field_assignments` (`id`, `sort_order`, `stream_id`, `field_id`, `is_required`, `is_unique`, `instructions`, `field_name`) VALUES
(1, 1, 1, 1, 'yes', 'no', NULL, NULL),
(2, 1, 2, 2, 'no', 'no', NULL, NULL),
(3, 1, 3, 3, 'yes', 'no', NULL, NULL),
(4, 2, 3, 4, 'yes', 'no', NULL, NULL),
(5, 3, 3, 5, 'no', 'no', NULL, NULL),
(6, 4, 3, 6, 'no', 'no', NULL, NULL),
(7, 5, 3, 7, 'no', 'no', NULL, NULL),
(8, 6, 3, 8, 'no', 'no', NULL, NULL),
(9, 7, 3, 9, 'no', 'no', NULL, NULL),
(10, 8, 3, 10, 'no', 'no', NULL, NULL),
(11, 9, 3, 11, 'no', 'no', NULL, NULL),
(12, 10, 3, 12, 'no', 'no', NULL, NULL),
(13, 11, 3, 13, 'no', 'no', NULL, NULL),
(14, 12, 3, 14, 'no', 'no', NULL, NULL),
(15, 13, 3, 15, 'no', 'no', NULL, NULL),
(16, 14, 3, 16, 'no', 'no', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `default_data_streams`
--

CREATE TABLE IF NOT EXISTS `default_data_streams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_prefix` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_options` blob NOT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` enum('title','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `permissions` text COLLATE utf8_unicode_ci,
  `is_hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `menu_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `default_data_streams`
--

INSERT INTO `default_data_streams` (`id`, `stream_name`, `stream_slug`, `stream_namespace`, `stream_prefix`, `about`, `view_options`, `title_column`, `sorting`, `permissions`, `is_hidden`, `menu_path`) VALUES
(1, 'lang:blog:blog_title', 'blog', 'blogs', NULL, NULL, 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL),
(2, 'Default', 'def_page_fields', 'pages', NULL, 'A simple page type with a WYSIWYG editor that will get you started adding content.', 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL),
(3, 'lang:user_profile_fields_label', 'profiles', 'users', NULL, 'Profiles for users module', 0x613a313a7b693a303b733a31323a22646973706c61795f6e616d65223b7d, 'display_name', 'title', NULL, 'no', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `default_def_page_fields`
--

CREATE TABLE IF NOT EXISTS `default_def_page_fields` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `default_def_page_fields`
--

INSERT INTO `default_def_page_fields` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `body`) VALUES
(1, '2014-03-19 14:19:20', '2014-03-22 13:15:07', 1, NULL, '<p>接觸點社區關懷協會</p>\n'),
(2, '2014-03-19 14:19:20', '2014-03-22 13:39:18', 1, NULL, '<p>歡迎您留訊息給我們</p>\n{{ contact:form name=&quot;text|required&quot; email=&quot;text|required|valid_email&quot; subject=&quot;dropdown|需要幫忙|問題|心得回饋|其他&quot; message=&quot;textarea&quot; attachment=&quot;file|zip&quot; }}\n\n<div><label for="name">名字:</label>{{ name }}</div>\n\n<div><label for="email">Email:</label>{{ email }}</div>\n\n<div><label for="subject">主旨:</label>{{ subject }}</div>\n\n<div><label for="message">訊息:</label>{{ message }}</div>\n\n<div><label for="attachment">Attach a zip file:</label>{{ attachment }}</div>\n{{ /contact:form }}'),
(3, '2014-03-19 14:19:20', NULL, 1, NULL, '{{ search:form class="search-form" }} \n		<input name="q" placeholder="Search terms..." />\n	{{ /search:form }}'),
(4, '2014-03-19 14:19:20', NULL, 1, NULL, '{{ search:form class="search-form" }} \n		<input name="q" placeholder="Search terms..." />\n	{{ /search:form }}\n\n{{ search:results }}\n\n	{{ total }} results for "{{ query }}".\n\n	<hr />\n\n	{{ entries }}\n\n		<article>\n			<h4>{{ singular }}: <a href="{{ url }}">{{ title }}</a></h4>\n			<p>{{ description }}</p>\n		</article>\n\n	{{ /entries }}\n\n        {{ pagination }}\n\n{{ /search:results }}'),
(5, '2014-03-19 14:19:20', NULL, 1, NULL, '<p>We cannot find the page you are looking for, please click <a title="Home" href="{{ pages:url id=''1'' }}">here</a> to go to the homepage.</p>'),
(6, '2014-03-19 15:55:32', NULL, 1, 1, NULL),
(8, '2014-03-19 16:00:02', '2014-03-22 12:47:43', 1, 2, '<table align="right" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12.727272033691406px; line-height: normal; text-align: center; background-color: rgb(255, 255, 247);" width="93%">\n	<tbody>\n		<tr>\n			<td align="left" style="font-size: 13px;" width="96%">\n			<p class="style1" style="font-size: 17px; font-weight: bold; color: rgb(255, 102, 0); line-height: 20px; margin: 0px; padding: 5px 0px;">緣起：</p>\n			</td>\n			<td style="font-size: 13px;" width="4%">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">臺北市是一個高度發達與高度落後、高度富裕與高度貧窮、高度被重視與高度被忽視並存的地方。大多數人看待臺北的態度使得臺北人的窮乏、需要與落後被發達、繁榮與財富所遮掩。身處於臺北的行政區&mdash;內湖，同樣具備著前述臺北市的特點。隨著科技園區的成立、捷運的通車、AIT 的進駐，這些發展使得內湖的房價不斷攀升。然而，這些炒作出來的房價讓人更容易忽略了內湖多數老舊社區中的弱勢居民們。地段漲，房租跟著漲，在內湖的生活對經濟弱勢家庭來說變得更加不容易。</p>\n\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">近幾年來，經濟發展遲滯，所得分配不均日益嚴重，薪資水準不如以往，許多家庭的收入穩定性下降，經濟安全的風險不斷提昇，都會地區的「近貧家庭」問題逐漸浮上檯面。這些家庭的經濟困境不再只是「失業」而致，相反的是一種「工作貧窮」的社會問題。傳統上，我們對於貧窮的概念理解往往等同於「沒有工作」、「失業」、「教育水準低」、「身體狀況不佳」，然而工作貧窮的現象則是顯示「工作」、與「貧窮」這兩個概念已經可以結合。換言之，我們這個時代的經濟與社會困境不再只是有沒有工作的問題，而是工作的報酬不足以應付都會地區的生活水準。<br />\n			近貧家庭的概念主要在描述一種不同於低收入戶、中低收入戶的一個群體，這個群體經常被排除於社會救助體系之外，究其原因，往往不在於家戶所得不夠低，而是其他複雜的認定問題。因此這個群體中有許多人的家庭經濟狀況與中低收入戶或低收入戶相仿，卻因無法取得救助身分而得不到任何的資源，從而在生活中面對不同程度的困境與挑戰。<br />\n			本會係發起人邱頌恩先生有鑑於台灣福利體制的破口，回應神在他心中的感動，於服役結束後便選擇直接走上關懷弱勢的道路，招聚了一群秉持要將神的愛澆灌給窮乏人的心志之基督徒共同成立。主要關懷的對象為都市中特有的「新貧族」或「近貧族」之家庭。我們希望讓社會知道，「低收入戶」、「中低收入戶」並非貧窮的全部（甚至在今日許多政府與民間資源大量重複投注在低收入戶的今日，中低收入戶或低收入戶的生活有可能比近貧家庭擁有更多的選擇與機會），甚至可能是這個時代更值得社會關懷者、福利制度設計者或者社會研究者切入的一個面向或領域。</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">&nbsp;</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" class="style1" style="font-size: 17px; color: rgb(255, 102, 0); font-weight: bold;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">從理念到實際：</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">為成立一個貼近民眾需求的協會，除了理念與理論之外，亦需要參考機構實際之行政運作及執行，因此101 年1月起，有志成立協會的工作人員們即開始進行考察及訪問在地進行社區福利服務工作的團體（以基督教團體為主要觀察對象），經過許多資料的收集與彙整後，4月1日正式展開成立協會之發起人招募，經過數次的理念說明後，終於在7月22日召開第1次協會籌備委員會，後於101年9月9日召開會員大會並成立「臺北市接觸點社區關懷協會」；另為強化協會適法性與公信力，續於10月11日向法院完成法人登記，成為「社團法人臺北市接觸點社區關懷協會」。目前會員共計46 人，人數雖然不多，但皆屬滿腔熱血想要為自己最愛的土地貢獻一番心力之有志之士。</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n'),
(9, '2014-03-19 16:01:13', '2014-03-22 12:50:23', 1, 3, '<table align="right" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12.727272033691406px; line-height: normal; text-align: center; background-color: rgb(255, 255, 247);" width="93%">\n	<tbody>\n		<tr>\n			<td align="left" class="style1" style="font-size: 17px; color: rgb(255, 102, 0); font-weight: bold;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">目標異象與首要任務：</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">本會籌組之初，即決定幾個基要的的方向，1.在地服務：我們希望能夠深入我們所身處的內湖地區，進行在地服務，成為他們生活與生命的幫助者，並建立社區支援網路的系統。日後按著我們的能力再逐漸擴大服務的地理範圍。2.以家庭為核心：我們對於社會問題的界定以「家庭」的概念出發，輻射出五個大略的方向，即兒童、青少年、夫妻、親子與老年人五個問題面向（圖一）。3.先易後難：承前所述五個領域當中，我們決定以專業程度、資本密集與勞力密集程度均較低卻也是一個經濟弱勢家庭的兒童領域作為第一個服務計畫。即決定從經濟弱勢家庭最常出現的問題─「兒童教養」作為切入的領域。我們選定了國小至國中階段學生推出弱勢家庭課後照顧陪讀服務（迎曦計畫），以免費的方式服務符合我們照顧的家庭。</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;"><img alt="" height="309" src="http://nfca.org.tw/images/about.gif" width="654" /></td>\n		</tr>\n	</tbody>\n</table>\n'),
(10, '2014-03-19 16:01:33', '2014-03-22 12:50:52', 1, 4, '<table align="right" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12.727272033691406px; line-height: normal; text-align: center; background-color: rgb(255, 255, 247);" width="93%">\n	<tbody>\n		<tr>\n			<td align="left" class="style1" style="font-size: 17px; color: rgb(255, 102, 0); font-weight: bold;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">社團法人臺北市接觸點社區關懷協會組織圖：</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" height="19" style="font-size: 13px;"><img alt="" height="587" src="http://nfca.org.tw/images/about3.png" width="568" /></td>\n		</tr>\n	</tbody>\n</table>\n'),
(11, '2014-03-22 12:44:57', '2014-03-22 13:23:13', 1, 5, '請到後台上傳影片'),
(12, '2014-03-22 12:46:08', '2014-03-22 12:51:56', 1, 6, '<table align="right" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12.727272033691406px; line-height: normal; text-align: center; background-color: rgb(255, 255, 247);" width="93%">\n	<tbody>\n		<tr>\n			<td align="left" class="style1" style="font-size: 17px; color: rgb(255, 102, 0); font-weight: bold;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">連絡我們：</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<ul>\n				<li class="style2" style="font-size: 15px;">\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">協會行政業務&nbsp;<a href="mailto:contact@nfca.org.tw">contact@nfca.org.tw</a></p>\n				</li>\n				<li class="style2" style="font-size: 15px;">\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">課後照顧陪讀班服務信箱&nbsp;<a href="mailto:class@nfca.org.tw">class@nfca.org.tw</a></p>\n				</li>\n				<li class="style2" style="font-size: 15px;">\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">弱勢家庭學前教育業務信箱&nbsp;<a href="mailto:rye@nfca.org.tw">rye@nfca.org.tw</a></p>\n				</li>\n			</ul>\n			</td>\n		</tr>\n	</tbody>\n</table>\n'),
(13, '2014-03-22 12:54:30', NULL, 1, 7, NULL),
(14, '2014-03-22 12:55:28', '2014-03-22 12:55:32', 1, 8, '<table align="right" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12.727272033691406px; line-height: normal; text-align: center; background-color: rgb(255, 255, 247);" width="93%">\n	<tbody>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p class="style2" style="font-size: 17px; font-weight: bold; color: rgb(0, 51, 153); line-height: 20px; margin: 0px; padding: 5px 0px;">緣起：</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">「新貧族」、「近貧族」和「窮忙族」是這個世代漸漸流行的名詞。「工作」與「貧窮」已經是兩個可以結合在一起的語彙，合稱「工作貧窮」，用來形容台灣日益突顯的社會問題。貧窮不再只是由於不工作、沒有全職的工作、勞工工時不足、中年失業、低教育水準或身體不佳等因素所造成的。</p>\n\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">在台灣，有工作不再是脫貧的保證。台灣每月月薪在2 萬元以下的勞工數，長期維持在100 萬人左右，月薪3 萬元以下的，佔就業人口比例高達42.8％，有350 萬人。收入減少、支出增加所造成的財務惡化，更讓國內所得最低20％的家庭，也就是160 萬戶人家、約500萬人必須借錢或吃老本過活。從數據來推估，這些家庭已經連續5 年沒有儲蓄，他們必須從過往的儲蓄中，拿出某一家庭成員2 個月的薪水，或是舉債，來支應生活所需。過去5 年，平均每戶家庭是「負儲蓄」高達8 萬7 千多元。此外，2012 年行政院主計總處調查，2011年所得最低二十％家庭（一五九．二萬戶）仍入不敷出，平均每戶「負儲蓄」二萬九三○八元，高於前年的二萬○五二五元，已連續五年「負儲蓄」，且透支金額創下史上次高；所得次低二十％家庭，平均每戶儲蓄也降至二萬四八一九元，為二十九年來次低，國內新貧、近貧家庭愈來愈多。台大經濟系教授林向愷認為，低所得家庭連續五年出現「負儲蓄」，次低所得家庭儲蓄金額也大減，原因不只是高齡化或退休人口增加，而是分配出了問題，由於薪資不漲、失業率高，國內四十％家庭無法享受經濟成長果實，工作貧窮問題日益嚴重；值得注意的是，今年物價漲得兇，這些中低所得家庭可能無法應付，基本維生能力出問題。</p>\n\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">除了工作貧窮的問題，根據勞委會最新調查發現，過去一年，全台灣有超過半數勞工加過班，一天工作超過12 小時的勞工，比例更高達27%，也就是有178 萬人超時工作。面對工時不斷增加，實質薪資卻停滯的經濟狀態，許多家庭都將逐漸面臨程度不同的家庭職能失衡，卻也無力改變的了。</p>\n\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">如果要以一句簡單的陳述來描繪我們這個時代的問題，將會是「風險提高、穩定性下降、家庭結構的離散和以家庭為核心的安全網日漸薄弱」。在台灣，過去我們覺得這是不努力的人才會面對的問題，而今許多家庭與孩子在不久的將來都有落入這個危險的可能性，並且他們很可能無法取得中低、或低收入戶的資格，而被排除在社會救助網絡之外。</p>\n\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">然而在當前經濟前景黯淡的大環境中，就業維生與陪伴孩子之間經常只能無奈的選擇前者，從而造成子女問題的每況愈下。將來，這群孩子所延續或繼承的很可能仍然是貧窮的人生處境。首推弱勢家庭課後陪讀計畫-「迎曦計畫」。迎曦，顧名思義即為迎接日出，日出能夠破除黑夜的冰冷，讓人感受光明，充滿希望。期待透過迎曦計畫的運作，讓這些生活過得艱辛的家庭仍能感到社會的溫暖，對未來充滿盼望。</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">&nbsp;</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" class="style2" style="font-size: 17px; color: rgb(0, 51, 153); font-weight: bold;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">計畫內容：</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">迎曦計畫-課後陪讀班的主要對象為6-15歲的學生。國小學童方面，以課後安親為主；國中生部分，除協助其完成作業外，亦包含重點教學課程，如數學、英文等。希望讓弱勢兒童能夠在面對功課難題時，不再因經濟問題無法補習或上安親班而對學業感到無助，減輕貧窮線邊緣的弱勢家庭因孩子學習所帶來之經濟困境。本計畫強調『陪伴』的重要性，讓這些孩子感受到「愛」與「生命的價值」，也是幫助家庭的一部份，進而改善親子關係，讓孩子的課業與課各面能夠自然而然的進步。</p>\n\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;"><a href="http://nfca.org.tw/download/plan.pdf">（詳細文案可以參考2013迎曦計畫pdf）</a></p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">&nbsp;</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" class="style2" style="font-size: 17px; color: rgb(0, 51, 153); font-weight: bold;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">迎曦計畫發展目標</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p class="style3" style="font-weight: bold; line-height: 20px; margin: 0px; padding: 5px 0px;">短程--給予經濟弱勢家庭學童最直接且迫切的幫助</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">近年來社會福利工作在做的已經不只是發錢的工作，許多學者主張的是要增權賦能（empowerment）。給予經濟弱勢家庭學童最直接且迫切幫助的方式即是，讓家長可以放心且沒有壓力的送孩子到我們這裡來，除了每天的餐費（一餐自費30 元，協會補助10 元）和保證金（每個月800 元，當月若無無故缺席則下月不需繳交，依此類堆）之外，不收取任何其他費用。本會沒有提供完全免費之課輔班的目的在於，我們幫助的這群近貧家庭並非窮到沒有飯吃的家庭，我們想保留一些家長照顧子女的責任。透過讓家長自行負擔部分費用，家長才會看重自己父母的角色。從原本憂慮於沒能力負擔孩子課後照顧的費用，到認為自己是有能力可以送孩子到一個不錯的課後照顧班，這是對家長的增權。提供孩子優質的課後照顧環境，幫助孩子在回家前將功課做完。家長在疲憊的工作回家後不用再為了孩子的課業而擔憂，反而可以輕鬆的花些時間跟孩子談談心、看看電視，一起做一些休閒活動，這是一種賦能。幫助家長更有能力扮演好父母的角色，跟孩子建立良好的親子關係。</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">&nbsp;</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" class="style3" style="font-size: 13px; font-weight: bold;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">中程--讓本會成為經濟弱勢家庭學童的第二個家，心靈的家</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">這群孩子有房子可以居住但卻沒有家，許多孩子每天課輔結束以後不願意回到居住的地方，因為父母可能不在家，可能很晚才能夠回來，也可能是單親的狀態。這群孩子有一些人未必適合念書，但是我們也希望透過發掘他們的特質，讓他們找到自己努力的目標，適性發展。我們不願意招收大量的學生，也許這樣的數據會更加的醒目，但是我們秉持基督尋找一百隻羊當中失落的一隻那樣的精神，我們面對每一個所照顧的孩子都是全心全意的關懷，也因此我們目前的能力以及容納的數量相當有限。<br />\n			因此，在幫助孩子的課業之外，本會也努力讓迎曦計畫的課後陪讀班成為這群孩子心靈的家，一個心靈的歸屬。以至於我們能夠將良好的品格，傳遞到這群孩子的生命當中。讓他們在成長過程中，不致於迷失、也不致於誤入歧途。</p>\n\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">我們希望來這裡的孩子他們的生命能夠有所轉變。我們希望在他們生命當中烙印一個很深刻的記號，那便是有一群人他們愛著你們，你們的家庭也許不健全、也許很匱乏，但是有一群不認識他們的人帶著神的愛，願意愛他們如同他們的親人，願意照顧他們，如同他們的家長一樣。我們希望帶給他們的是積極正面，並且長大後願意回饋社會的人生態度，以及行公義好憐憫的品格。這是我們的使命，落實全人關懷與全人照顧是我們的照顧方式。</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">&nbsp;</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" class="style3" style="font-size: 13px; font-weight: bold;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">長程--觀念的傳遞，教育社會大眾新的觀念，且一代接著一代，讓愛傳下去</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">在我們當中無論是受到幫助的家庭或捐助者，我們都花時間致力於傳遞新的觀念，也就是將關懷的焦點放的再寬廣一點，更多關注那些在貧窮線附近得不到社會救助身分的家庭。本會更希望在日後能提供一個平台，讓社會大眾能容易取得相關訊息，更敏銳於這個社會的轉變，也為這個社會能付一己之力，以期達到本會「關注社區之需要、扶助弱勢民眾、凝聚社區意識、發揮彼此相顧之愛心及營造健全美滿家庭」之宗旨。</p>\n\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">對於迎曦計畫中的孩子而言，我們從小教育他們自己不是爛蘋果才被送到我們這裡來，不要樂於當沒人管的野孩子。來到我們這裡的孩子家庭是過的比許多人還要辛苦一點，給予他們幫助就是希望他們能運用這些資源來發揮自己的潛能。與這群孩子相較，也還有更多是比他們還要不幸的孩子。我們期待透過教育，激發孩子彼此相顧的愛心，將來當他們稍稍長大有能力的時候，希望他們也願意擺上一己之力來幫助另一群同樣需要幫助的孩子。讓這個迎曦計畫可以一代接著一代的做下去，我們現在幫助的孩子可以成為日後照顧另一群孩子的人，這是在未來我們期待可以看見的成果。</p>\n			</td>\n		</tr>\n	</tbody>\n</table>\n'),
(15, '2014-03-22 12:56:39', NULL, 1, 9, '<table align="right" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12.727272033691406px; line-height: normal; text-align: center; background-color: rgb(255, 255, 247);" width="93%">\n	<tbody>\n		<tr>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;"><img alt="" height="968" src="http://nfca.org.tw/images/plan.jpg" width="685" /></td>\n		</tr>\n	</tbody>\n</table>'),
(16, '2014-03-22 12:57:51', NULL, 1, 10, '<table align="right" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12.727272033691406px; line-height: normal; text-align: center; background-color: rgb(255, 255, 247);" width="93%">\n	<tbody>\n		<tr>\n			<td align="left" class="style1" style="font-size: 19px; color: rgb(237, 55, 34); font-weight: bold;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">麥田計畫 ─ 學前教育福利服務（臺北市私立麥田幼兒園）</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">&nbsp;</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" class="style2" style="font-size: 17px; color: rgb(0, 51, 153); font-weight: bold;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">園所簡介：</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">臺北市私立麥田幼兒園係屬社團法人台北市接觸點社區關懷協會(以下稱本會)附設之幼兒園。本會基於「關注社區之需要、扶助弱勢民眾、凝聚社區意識、發揮彼此相顧之愛心營造健全美滿家庭」之宗旨，本於非營利之精神，致力於提供低價優質的幼兒學習環境。凡經本會審核符合經濟弱勢家庭之幼兒，其費用將有部分減免；另本會也針對5歲以下之特殊境遇幼兒提供學費全額減免、月費減免七成名額若干。本會希望藉由不同程度的經費補助，讓經濟基礎薄弱家庭之幼兒能夠接受學前教育，因為學前階段是孩子各方面發展的基礎，需要有足夠的刺激、引導、互動與學習的場域。我們鼓勵因辛苦工作而無法長時間陪伴孩子的家長們，讓您的孩子來接受學前教育，豐富孩子的生活經驗，以利其各方面的成長與發展。</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">&nbsp;</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" class="style2" style="font-size: 17px; color: rgb(0, 51, 153); font-weight: bold;">園所理念：</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">「麥田」的名稱來自知名小說家沙林傑的作品《麥田捕手》的啟發。書中的男主角荷頓是個帶有一點反社會性格的青少年，他認為這個社會中的許多事物都很虛偽，而學校也只是社會的縮影而已。當荷頓要被學校退學時，校長對他說：「人生就是比賽，你應該按照規則去參加比賽。」荷頓對於這樣的論述很不以為意，他對自己未來想做的事情的想像是：成千上萬的孩子在懸崖邊的麥田裡玩耍，除了他之外，沒有任何大人在場；他必須時時注意，在崖邊攫住孩子，不讓他們胡亂衝到懸崖外頭去。這樣如此單純的想法讓麥田的老師們深受感動，這個社會還能保有多少這樣的單純。荷頓想做的事情的出發點簡單直接，即是代替成年人守望孩子，不限制他們橫衝直撞，但也不會讓他們受到傷害。</p>\n\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">「讓孩子們奔跑吧！守候與守望，我願做的麥田捕手。」這是麥田幼兒園的老師們的座右銘。<br />\n			這裡不是一個比賽競技場、這裡沒有制式化的教學，這裡也不是小學先修班。相對地，這裡也不是放牛吃草的地方。麥田的老師們有著堅定的基督信仰，我們一方面讓孩子享受童年，給予孩子充分的空間自由探索、盡情歡笑。另一方面，我們也秉持著聖經的教導，「教養孩童，使他走當行的道，就是到老他也不偏離。」我們會鼓勵孩子在尊重他人的前提下，盡情認識自我、發掘自我和展現自我。<br />\n			邀請您帶著您的孩子一同來體驗「麥田」的明媚。</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">教學特色：<br />\n			1)設置多樣學習角落，給予幼兒時間在遊戲中自由探索學習。<br />\n			2)採各學習領域融合式的主題教學課程，透過主題的探討豐富幼兒各方面的經驗，包含 認知、語文、情緒、社會、美感和身體動作等。<br />\n			3)培養孩子獨立思考的精神，勇於提出問題及尋找答案。<br />\n			4)養成孩子正向的人格特質，包括仁愛、喜樂、和平、忍耐、恩慈、良善、信實、溫柔、 節制等。<br />\n			5)蘊涵宗教情操，教導孩子愛人如己。</p>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">招收對象：2-6歲幼兒<br />\n			1. 一般生5名<br />\n			2. 家庭經濟弱勢優待生15名<br />\n			3. 家庭經濟弱勢學費豁免生3名</p>\n			</td>\n		</tr>\n	</tbody>\n</table>'),
(17, '2014-03-22 12:58:21', NULL, 1, 11, '即將推出'),
(18, '2014-03-22 13:10:53', NULL, 1, 12, '<table align="right" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12.727272033691406px; line-height: normal; text-align: center; background-color: rgb(255, 255, 247);" width="93%">\n	<tbody>\n		<tr>\n			<td align="left" style="font-size: 13px;" width="98%">\n			<ul>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">台灣公益資訊中心 <a href="http://www.npo.org.tw/" target="_blank">http://www.npo.org.tw/</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">行政院勞工委員會 <a href="http://www.cla.gov.tw/" target="_blank">http://www.cla.gov.tw/</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">勞工保險局全球資訊網 <a href="http://www.bli.gov.tw/" target="_blank">http://www.bli.gov.tw/</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">台灣世界展望會 <a href="http://www.worldvision.org.tw/" target="_blank">http://www.worldvision.org.tw/</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">Y.M.C.A兒童青少年活動 <a href="http://camp.ywca-taipei.org.tw/index.html" target="_blank">http://camp.ywca-taipei.org.tw/index.html</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">兒童福利聯盟文教基金會 <a href="http://www.children.org.tw/" target="_blank">http://www.children.org.tw/</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">財團法人天主教善牧社會福利基金會 <a href="http://www.goodshepherd.org.tw/chtw/" target="_blank">http://www.goodshepherd.org.tw/chtw/</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">城市生命純福音教會國中課輔班 <a href="http://www.cslfgc.org/page/2/54" target="_blank">http://www.cslfgc.org/page/2/54</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">中華基督教信義會新竹勝利堂課輔班<br />\n				<a href="http://victorychurch.org.tw/index.php?option=com_content&amp;task=view&amp;id=1160&amp;Itemid=1473" target="_blank">http://victorychurch.org.tw/index.php?option=com_content&amp;task=view&amp;id=1160&amp;Itemid=1473</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">社團法人台灣愛鄰社區服務協會-綠色種子課輔班 <a href="http://www.i-link.org.tw/care.php?recordId=715" target="_blank">http://www.i-link.org.tw/care.php?recordId=715</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">財團法人台灣基督教會門諾會課輔班 <a href="http://www.akowf.org.tw/unit_detial.php?unitid=154&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=154&amp;unitkind=27</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">興起教會課輔班 <a href="http://www.akowf.org.tw/unit_detial.php?unitid=153&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=153&amp;unitkind=27</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">大安基督長老教會課輔班 <a href="http://www.akowf.org.tw/unit_detial.php?unitid=96&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=96&amp;unitkind=27</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">財團法人台灣省基督教倫理堂玉里教會課輔班 <a href="http://www.akowf.org.tw/unit_detial.php?unitid=107&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=107&amp;unitkind=27</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">一粒麥子基金會課輔班 <a href="http://www.akowf.org.tw/unit_detial.php?unitid=99&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=99&amp;unitkind=27</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">台灣基督長老教會大南教會課輔班 <a href="http://www.akowf.org.tw/unit_detial.php?unitid=100&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=100&amp;unitkind=27</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">財團法人中華基督教台東縣達旺浸信會課輔班<br />\n				<a href="http://www.akowf.org.tw/unit_detial.php?unitid=103&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=103&amp;unitkind=27</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">台灣基督長老教會溫泉教會課輔班 <a href="http://www.akowf.org.tw/unit_detial.php?unitid=104&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=104&amp;unitkind=27</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">台灣基督長老教會愛國蒲教會課輔班 <a href="http://www.akowf.org.tw/unit_detial.php?unitid=105&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=105&amp;unitkind=27</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">台灣基督長老教會大武教會課輔班 <a href="http://www.akowf.org.tw/unit_detial.php?unitid=106&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=106&amp;unitkind=27</a></p>\n				</li>\n				<li>\n				<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">財團法人蒙恩宣教中心台坂教會課輔班 <a href="http://www.akowf.org.tw/unit_detial.php?unitid=108&amp;unitkind=27" target="_blank">http://www.akowf.org.tw/unit_detial.php?unitid=108&amp;unitkind=27</a></p>\n				</li>\n			</ul>\n			</td>\n		</tr>\n	</tbody>\n</table>'),
(19, '2014-03-22 13:11:45', NULL, 1, 13, NULL),
(20, '2014-03-22 13:12:48', NULL, 1, 14, '請至後台編輯'),
(21, '2014-03-22 13:13:11', '2014-03-22 13:13:50', 1, 15, '請至後台編輯'),
(22, '2014-03-22 13:18:16', NULL, 1, 16, NULL),
(23, '2014-03-22 13:19:39', NULL, 1, 17, '請直接至後台上傳照片'),
(24, '2014-03-22 13:25:14', '2014-03-22 13:29:08', 1, 18, '請到後台上傳檔案<a class="pyro-file" href="{{ url:site }}files/download/3d5b8bf945d6b23">join</a>'),
(25, '2014-03-22 13:31:11', NULL, 1, 19, '<table align="right" border="0" cellpadding="0" cellspacing="0" style="font-family: Arial, Helvetica, sans-serif; font-size: 12.727272033691406px; line-height: normal; text-align: center; background-color: rgb(255, 255, 247);" width="93%">\n	<tbody>\n		<tr>\n			<td align="left" style="font-size: 13px;" width="97%">&nbsp;</td>\n			<td style="font-size: 13px;" width="3%">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">&nbsp;</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">&nbsp;</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<div id="showtext">\n			<div id="text" style="padding: 5px 10px; width: 637.9545288085938px; margin: 0px auto;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">&nbsp;</p>\n\n			<div class="yom-mod yom-art-content " id="yui_3_5_1_1_1347865384802_484" style="margin: 0px 0px 5px; padding: 0px 0px 20px; zoom: 0; border-top-style: none; border-color: rgb(52, 78, 127); font-family: arial, STHeiti, pmingliu, sans-serif; font-size: 13px; line-height: 16px;">\n			<div class="bd" id="yui_3_5_1_1_1347865384802_483" style="margin: 0px; padding: 0px; zoom: 0; font-size: 16px; font-family: Georgia, Times, ''Times New Roman'', serif; line-height: 25px;">&nbsp;</div>\n\n			<table border="2" cellpadding="0" cellspacing="2" style="font-family: Arial, Helvetica, sans-serif; font-size: 12.800000190734863px;">\n				<tbody>\n					<tr>\n						<td colspan="2" style="font-size: 13px;" valign="top">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">捐款方式</p>\n						</td>\n					</tr>\n					<tr>\n						<td style="font-size: 13px;" valign="top" width="81">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">郵政劃撥</p>\n						</td>\n						<td style="font-size: 13px;" valign="top" width="564">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">帳號：50242018<br />\n						戶名：社團法人臺北市接觸點社區關懷協會&nbsp;<br />\n						請至郵局劃撥，並填寫姓名、電話、住址、email，以利寄發收據</p>\n						</td>\n					</tr>\n					<tr>\n						<td style="font-size: 13px;" valign="top" width="81">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">銀行匯款</p>\n						</td>\n						<td style="font-size: 13px;" valign="top" width="564">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">銀行名稱：郵局&nbsp;<br />\n						帳號：0002521-0210046<br />\n						戶名：社團法人臺北市接觸點社區關懷協會&nbsp;<br />\n						匯款後，請將以下資訊Email（contact@nfca.org.tw）、傳真&nbsp;<br />\n						（02-27945667）或傳簡訊（09XXXXXXXX）&nbsp;<br />\n						（1）姓名、電話、地址、Email<br />\n						（2）匯款日期&nbsp;<br />\n						（3）轉帳帳號（後五碼）</p>\n\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">以便核對捐款人及寄發收據</p>\n						</td>\n					</tr>\n					<tr>\n						<td style="font-size: 13px;" valign="top" width="81">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">信用卡捐款</p>\n						</td>\n						<td style="font-size: 13px;" valign="top" width="564">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">（1）請線上填寫或下載授權單（PDF檔案）&nbsp;<br />\n						（2)填妥後請傳真至(02)2794-5667 或 Email:contact@nfca.org.tw</p>\n						</td>\n					</tr>\n					<tr>\n						<td style="font-size: 13px;" valign="top" width="81">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">物資捐贈</p>\n						</td>\n						<td style="font-size: 13px;" valign="top" width="564">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">請致電本會(02)2794-5837 分機14 &nbsp; 聯繫</p>\n						</td>\n					</tr>\n					<tr>\n						<td style="font-size: 13px;" valign="top" width="81">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">發票捐贈</p>\n						</td>\n						<td style="font-size: 13px;" valign="top" width="564">\n						<p style="line-height: 20px; margin: 0px; padding: 5px 0px;">請協助收集發票後，郵寄至臺北市內湖區內湖路三段139號一樓</p>\n						</td>\n					</tr>\n				</tbody>\n			</table>\n			</div>\n			</div>\n			</div>\n			</td>\n			<td style="font-size: 13px;">&nbsp;</td>\n		</tr>\n		<tr>\n			<td align="left" style="font-size: 13px;">\n			<p style="line-height: 20px; margin: 0px; padding: 5px 0px;"><a href="http://nfca.org.tw/download/donate_credit.pdf">信用卡傳真授權單</a>&nbsp;&nbsp;<a href="http://nfca.org.tw/download/credit_revisited.pdf">信用卡傳真授權單-信用卡異動資料</a>&nbsp;&nbsp;</p>\n			</td>\n		</tr>\n	</tbody>\n</table>'),
(26, '2014-03-22 13:36:30', NULL, 1, 20, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `default_email_templates`
--

CREATE TABLE IF NOT EXISTS `default_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_lang` (`slug`,`lang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `default_email_templates`
--

INSERT INTO `default_email_templates` (`id`, `slug`, `name`, `description`, `subject`, `body`, `lang`, `is_default`, `module`) VALUES
(1, 'comments', 'Comment Notification', 'Email that is sent to admin when someone creates a comment', 'You have just received a comment from {{ name }}', '<h3>You have received a comment from {{ name }}</h3>\n				<p>\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}<br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>\n				<p>{{ comment }}</p>\n				<p>View Comment: {{ redirect_url }}</p>', 'en', 1, 'comments'),
(2, 'contact', 'Contact Notification', 'Template for the contact form', '{{ settings:site_name }} :: {{ subject }}', 'This message was sent via the contact form on with the following details:\n				<hr />\n				IP Address: {{ sender_ip }}\n				OS {{ sender_os }}\n				Agent {{ sender_agent }}\n				<hr />\n				{{ message }}\n\n				{{ name }},\n\n				{{ email }}', 'en', 1, 'pages'),
(3, 'registered', 'New User Registered', 'Email sent to the site contact e-mail when a new user registers', '{{ settings:site_name }} :: You have just received a registration from {{ name }}', '<h3>You have received a registration from {{ name }}</h3>\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}</strong><br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>', 'en', 1, 'users'),
(4, 'activation', 'Activation Email', 'The email which contains the activation code that is sent to a new user', '{{ settings:site_name }} - Account Activation', '<p>Hello {{ user:first_name }},</p>\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\n				<p><a href="{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\n				<p>&nbsp;</p>\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\n				<p><a href="{{ url:site }}users/activate">{{ url:site }}users/activate</a></p>\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>', 'en', 1, 'users'),
(5, 'forgotten_password', 'Forgotten Password Email', 'The email that is sent containing a password reset code', '{{ settings:site_name }} - Forgotten Password', '<p>Hello {{ user:first_name }},</p>\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href="{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>', 'en', 1, 'users'),
(6, 'new_password', 'New Password Email', 'After a password is reset this email is sent containing the new password', '{{ settings:site_name }} - New Password', '<p>Hello {{ user:first_name }},</p>\n				<p>Your new password is: {{ new_password }}</p>\n				<p>After logging in you may change your password by visiting <a href="{{ url:site }}edit-profile">{{ url:site }}edit-profile</a></p>', 'en', 1, 'users');

-- --------------------------------------------------------

--
-- 表的结构 `default_files`
--

CREATE TABLE IF NOT EXISTS `default_files` (
  `id` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `alt_attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `download_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `default_files`
--

INSERT INTO `default_files` (`id`, `folder_id`, `user_id`, `type`, `name`, `filename`, `path`, `description`, `extension`, `mimetype`, `keywords`, `width`, `height`, `filesize`, `alt_attribute`, `download_count`, `date_added`, `sort`) VALUES
('3d5b8bf945d6b23', 1, 1, 'd', 'join', '0ab9c614e479d32e01ca013d7f63c866.pdf', '{{ url:site }}files/download/3d5b8bf945d6b23', 'join', '.pdf', 'application/pdf', '', 0, 0, 146, '', 1, 1395494936, 0);

-- --------------------------------------------------------

--
-- 表的结构 `default_file_folders`
--

CREATE TABLE IF NOT EXISTS `default_file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `default_file_folders`
--

INSERT INTO `default_file_folders` (`id`, `parent_id`, `slug`, `name`, `location`, `remote_container`, `date_added`, `sort`, `hidden`) VALUES
(1, 0, '-', '會訊刊物', 'local', '', 1395494791, 1395494791, 0);

-- --------------------------------------------------------

--
-- 表的结构 `default_groups`
--

CREATE TABLE IF NOT EXISTS `default_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `default_groups`
--

INSERT INTO `default_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'user', 'User'),
(3, 'nfca_staff', 'Nfca_staff');

-- --------------------------------------------------------

--
-- 表的结构 `default_keywords`
--

CREATE TABLE IF NOT EXISTS `default_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `default_keywords_applied`
--

CREATE TABLE IF NOT EXISTS `default_keywords_applied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `default_migrations`
--

CREATE TABLE IF NOT EXISTS `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `default_migrations`
--

INSERT INTO `default_migrations` (`version`) VALUES
(128);

-- --------------------------------------------------------

--
-- 表的结构 `default_modules`
--

CREATE TABLE IF NOT EXISTS `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `default_modules`
--

INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(1, 'a:25:{s:2:"en";s:8:"Settings";s:2:"ar";s:18:"الإعدادات";s:2:"br";s:15:"Configurações";s:2:"pt";s:15:"Configurações";s:2:"cs";s:10:"Nastavení";s:2:"da";s:13:"Indstillinger";s:2:"de";s:13:"Einstellungen";s:2:"el";s:18:"Ρυθμίσεις";s:2:"es";s:15:"Configuraciones";s:2:"fa";s:14:"تنظیمات";s:2:"fi";s:9:"Asetukset";s:2:"fr";s:11:"Paramètres";s:2:"he";s:12:"הגדרות";s:2:"id";s:10:"Pengaturan";s:2:"it";s:12:"Impostazioni";s:2:"lt";s:10:"Nustatymai";s:2:"nl";s:12:"Instellingen";s:2:"pl";s:10:"Ustawienia";s:2:"ru";s:18:"Настройки";s:2:"sl";s:10:"Nastavitve";s:2:"tw";s:12:"網站設定";s:2:"cn";s:12:"网站设定";s:2:"hu";s:14:"Beállítások";s:2:"th";s:21:"ตั้งค่า";s:2:"se";s:14:"Inställningar";}', 'settings', '1.0.0', NULL, 'a:25:{s:2:"en";s:89:"Allows administrators to update settings like Site Name, messages and email address, etc.";s:2:"ar";s:161:"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.";s:2:"br";s:120:"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.";s:2:"pt";s:113:"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.";s:2:"cs";s:102:"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.";s:2:"da";s:90:"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.";s:2:"de";s:92:"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.";s:2:"el";s:230:"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.";s:2:"es";s:131:"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.";s:2:"fa";s:105:"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود";s:2:"fi";s:105:"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.";s:2:"fr";s:118:"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.";s:2:"he";s:116:"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו";s:2:"id";s:112:"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.";s:2:"it";s:109:"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.";s:2:"lt";s:104:"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.";s:2:"nl";s:114:"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.";s:2:"pl";s:103:"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.";s:2:"ru";s:135:"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.";s:2:"sl";s:98:"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.";s:2:"tw";s:99:"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。";s:2:"cn";s:99:"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。";s:2:"hu";s:125:"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...";s:2:"th";s:232:"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น";s:2:"se";s:84:"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.";}', 1, 0, 1, 'settings', 1, 1, 1, 1395243348),
(2, 'a:11:{s:2:"en";s:12:"Streams Core";s:2:"pt";s:14:"Núcleo Fluxos";s:2:"fr";s:10:"Noyau Flux";s:2:"el";s:23:"Πυρήνας Ροών";s:2:"se";s:18:"Streams grundmodul";s:2:"tw";s:14:"Streams 核心";s:2:"cn";s:14:"Streams 核心";s:2:"ar";s:31:"الجداول الأساسية";s:2:"it";s:12:"Streams Core";s:2:"fa";s:26:"هسته استریم ها";s:2:"fi";s:13:"Striimit ydin";}', 'streams_core', '1.0.0', NULL, 'a:11:{s:2:"en";s:29:"Core data module for streams.";s:2:"pt";s:37:"Módulo central de dados para fluxos.";s:2:"fr";s:32:"Noyau de données pour les Flux.";s:2:"el";s:113:"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.";s:2:"se";s:50:"Streams grundmodul för enklare hantering av data.";s:2:"tw";s:29:"Streams 核心資料模組。";s:2:"cn";s:29:"Streams 核心资料模组。";s:2:"ar";s:57:"وحدة البيانات الأساسية للجداول";s:2:"it";s:17:"Core dello Stream";s:2:"fa";s:48:"ماژول مرکزی برای استریم ها";s:2:"fi";s:48:"Ydin datan hallinoiva moduuli striimejä varten.";}', 1, 0, 0, '0', 1, 1, 1, 1395243348),
(3, 'a:21:{s:2:"en";s:15:"Email Templates";s:2:"ar";s:48:"قوالب الرسائل الإلكترونية";s:2:"br";s:17:"Modelos de e-mail";s:2:"pt";s:17:"Modelos de e-mail";s:2:"da";s:16:"Email skabeloner";s:2:"el";s:22:"Δυναμικά email";s:2:"es";s:19:"Plantillas de email";s:2:"fa";s:26:"قالب های ایمیل";s:2:"fr";s:17:"Modèles d''emails";s:2:"he";s:12:"תבניות";s:2:"id";s:14:"Template Email";s:2:"lt";s:22:"El. laiškų šablonai";s:2:"nl";s:15:"Email sjablonen";s:2:"ru";s:25:"Шаблоны почты";s:2:"sl";s:14:"Email predloge";s:2:"tw";s:12:"郵件範本";s:2:"cn";s:12:"邮件范本";s:2:"hu";s:15:"E-mail sablonok";s:2:"fi";s:25:"Sähköposti viestipohjat";s:2:"th";s:33:"แม่แบบอีเมล";s:2:"se";s:12:"E-postmallar";}', 'templates', '1.1.0', NULL, 'a:21:{s:2:"en";s:46:"Create, edit, and save dynamic email templates";s:2:"ar";s:97:"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.";s:2:"br";s:51:"Criar, editar e salvar modelos de e-mail dinâmicos";s:2:"pt";s:51:"Criar, editar e salvar modelos de e-mail dinâmicos";s:2:"da";s:49:"Opret, redigér og gem dynamiske emailskabeloner.";s:2:"el";s:108:"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.";s:2:"es";s:54:"Crear, editar y guardar plantillas de email dinámicas";s:2:"fa";s:92:"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا";s:2:"fr";s:61:"Créer, éditer et sauver dynamiquement des modèles d''emails";s:2:"he";s:54:"ניהול של תבניות דואר אלקטרוני";s:2:"id";s:55:"Membuat, mengedit, dan menyimpan template email dinamis";s:2:"lt";s:58:"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.";s:2:"nl";s:49:"Maak, bewerk, en beheer dynamische emailsjablonen";s:2:"ru";s:127:"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны";s:2:"sl";s:52:"Ustvari, uredi in shrani spremenljive email predloge";s:2:"tw";s:61:"新增、編輯與儲存可顯示動態資料的 email 範本";s:2:"cn";s:61:"新增、编辑与储存可显示动态资料的 email 范本";s:2:"hu";s:63:"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat";s:2:"fi";s:66:"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.";s:2:"th";s:129:"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก";s:2:"se";s:49:"Skapa, redigera och spara dynamiska E-postmallar.";}', 1, 0, 1, 'structure', 1, 1, 1, 1395243348),
(4, 'a:25:{s:2:"en";s:7:"Add-ons";s:2:"ar";s:16:"الإضافات";s:2:"br";s:12:"Complementos";s:2:"pt";s:12:"Complementos";s:2:"cs";s:8:"Doplňky";s:2:"da";s:7:"Add-ons";s:2:"de";s:13:"Erweiterungen";s:2:"el";s:16:"Πρόσθετα";s:2:"es";s:9:"Agregados";s:2:"fa";s:17:"افزونه ها";s:2:"fi";s:9:"Lisäosat";s:2:"fr";s:10:"Extensions";s:2:"he";s:12:"תוספות";s:2:"id";s:7:"Pengaya";s:2:"it";s:7:"Add-ons";s:2:"lt";s:7:"Priedai";s:2:"nl";s:7:"Add-ons";s:2:"pl";s:12:"Rozszerzenia";s:2:"ru";s:20:"Дополнения";s:2:"sl";s:11:"Razširitve";s:2:"tw";s:12:"附加模組";s:2:"cn";s:12:"附加模组";s:2:"hu";s:14:"Bővítmények";s:2:"th";s:27:"ส่วนเสริม";s:2:"se";s:8:"Tillägg";}', 'addons', '2.0.0', NULL, 'a:25:{s:2:"en";s:59:"Allows admins to see a list of currently installed modules.";s:2:"ar";s:91:"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.";s:2:"br";s:75:"Permite aos administradores ver a lista dos módulos instalados atualmente.";s:2:"pt";s:75:"Permite aos administradores ver a lista dos módulos instalados atualmente.";s:2:"cs";s:68:"Umožňuje administrátorům vidět seznam nainstalovaných modulů.";s:2:"da";s:63:"Lader administratorer se en liste over de installerede moduler.";s:2:"de";s:56:"Zeigt Administratoren alle aktuell installierten Module.";s:2:"el";s:152:"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.";s:2:"es";s:71:"Permite a los administradores ver una lista de los módulos instalados.";s:2:"fa";s:93:"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت";s:2:"fi";s:60:"Listaa järjestelmänvalvojalle käytössä olevat moduulit.";s:2:"fr";s:66:"Permet aux administrateurs de voir la liste des modules installés";s:2:"he";s:160:"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים";s:2:"id";s:57:"Memperlihatkan kepada admin daftar modul yang terinstall.";s:2:"it";s:83:"Permette agli amministratori di vedere una lista dei moduli attualmente installati.";s:2:"lt";s:75:"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.";s:2:"nl";s:79:"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.";s:2:"pl";s:81:"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.";s:2:"ru";s:83:"Список модулей, которые установлены на сайте.";s:2:"sl";s:65:"Dovoljuje administratorjem pregled trenutno nameščenih modulov.";s:2:"tw";s:54:"管理員可以檢視目前已經安裝模組的列表";s:2:"cn";s:54:"管理员可以检视目前已经安装模组的列表";s:2:"hu";s:79:"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.";s:2:"th";s:162:"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน";s:2:"se";s:67:"Gör det möjligt för administratören att se installerade mouler.";}', 0, 0, 1, '0', 1, 1, 1, 1395243348),
(5, 'a:17:{s:2:"en";s:4:"Blog";s:2:"ar";s:16:"المدوّنة";s:2:"br";s:4:"Blog";s:2:"pt";s:4:"Blog";s:2:"el";s:18:"Ιστολόγιο";s:2:"fa";s:8:"بلاگ";s:2:"he";s:8:"בלוג";s:2:"id";s:4:"Blog";s:2:"lt";s:6:"Blogas";s:2:"pl";s:4:"Blog";s:2:"ru";s:8:"Блог";s:2:"tw";s:6:"文章";s:2:"cn";s:6:"文章";s:2:"hu";s:4:"Blog";s:2:"fi";s:5:"Blogi";s:2:"th";s:15:"บล็อก";s:2:"se";s:5:"Blogg";}', 'blog', '2.0.0', NULL, 'a:25:{s:2:"en";s:18:"Post blog entries.";s:2:"ar";s:48:"أنشر المقالات على مدوّنتك.";s:2:"br";s:30:"Escrever publicações de blog";s:2:"pt";s:39:"Escrever e editar publicações no blog";s:2:"cs";s:49:"Publikujte nové články a příspěvky na blog.";s:2:"da";s:17:"Skriv blogindlæg";s:2:"de";s:47:"Veröffentliche neue Artikel und Blog-Einträge";s:2:"sl";s:23:"Objavite blog prispevke";s:2:"fi";s:28:"Kirjoita blogi artikkeleita.";s:2:"el";s:93:"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.";s:2:"es";s:54:"Escribe entradas para los artículos y blog (web log).";s:2:"fa";s:44:"مقالات منتشر شده در بلاگ";s:2:"fr";s:34:"Poster des articles d''actualités.";s:2:"he";s:19:"ניהול בלוג";s:2:"id";s:15:"Post entri blog";s:2:"it";s:36:"Pubblica notizie e post per il blog.";s:2:"lt";s:40:"Rašykite naujienas bei blog''o įrašus.";s:2:"nl";s:41:"Post nieuwsartikelen en blogs op uw site.";s:2:"pl";s:27:"Dodawaj nowe wpisy na blogu";s:2:"ru";s:49:"Управление записями блога.";s:2:"tw";s:42:"發表新聞訊息、部落格等文章。";s:2:"cn";s:42:"发表新闻讯息、部落格等文章。";s:2:"th";s:48:"โพสต์รายการบล็อก";s:2:"hu";s:32:"Blog bejegyzések létrehozása.";s:2:"se";s:18:"Inlägg i bloggen.";}', 1, 1, 1, 'content', 1, 1, 1, 1395243348),
(6, 'a:25:{s:2:"en";s:8:"Comments";s:2:"ar";s:18:"التعليقات";s:2:"br";s:12:"Comentários";s:2:"pt";s:12:"Comentários";s:2:"cs";s:11:"Komentáře";s:2:"da";s:11:"Kommentarer";s:2:"de";s:10:"Kommentare";s:2:"el";s:12:"Σχόλια";s:2:"es";s:11:"Comentarios";s:2:"fi";s:9:"Kommentit";s:2:"fr";s:12:"Commentaires";s:2:"fa";s:10:"نظرات";s:2:"he";s:12:"תגובות";s:2:"id";s:8:"Komentar";s:2:"it";s:8:"Commenti";s:2:"lt";s:10:"Komentarai";s:2:"nl";s:8:"Reacties";s:2:"pl";s:10:"Komentarze";s:2:"ru";s:22:"Комментарии";s:2:"sl";s:10:"Komentarji";s:2:"tw";s:6:"回應";s:2:"cn";s:6:"回应";s:2:"hu";s:16:"Hozzászólások";s:2:"th";s:33:"ความคิดเห็น";s:2:"se";s:11:"Kommentarer";}', 'comments', '1.1.0', NULL, 'a:25:{s:2:"en";s:76:"Users and guests can write comments for content like blog, pages and photos.";s:2:"ar";s:152:"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.";s:2:"br";s:97:"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.";s:2:"pt";s:100:"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.";s:2:"cs";s:100:"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.";s:2:"da";s:83:"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.";s:2:"de";s:65:"Benutzer und Gäste können für fast alles Kommentare schreiben.";s:2:"el";s:224:"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.";s:2:"es";s:130:"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.";s:2:"fa";s:168:"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند";s:2:"fi";s:107:"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.";s:2:"fr";s:130:"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.";s:2:"he";s:94:"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו";s:2:"id";s:100:"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.";s:2:"it";s:85:"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.";s:2:"lt";s:75:"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.";s:2:"nl";s:52:"Gebruikers en gasten kunnen reageren op bijna alles.";s:2:"pl";s:93:"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.";s:2:"ru";s:187:"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.";s:2:"sl";s:89:"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike";s:2:"tw";s:75:"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。";s:2:"cn";s:75:"用户和访客可以针对新闻、页面与照片等内容发表回应。";s:2:"hu";s:117:"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).";s:2:"th";s:240:"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย";s:2:"se";s:98:"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.";}', 0, 0, 1, 'content', 1, 1, 1, 1395243348),
(7, 'a:25:{s:2:"en";s:7:"Contact";s:2:"ar";s:14:"الإتصال";s:2:"br";s:7:"Contato";s:2:"pt";s:8:"Contacto";s:2:"cs";s:7:"Kontakt";s:2:"da";s:7:"Kontakt";s:2:"de";s:7:"Kontakt";s:2:"el";s:22:"Επικοινωνία";s:2:"es";s:8:"Contacto";s:2:"fa";s:18:"تماس با ما";s:2:"fi";s:13:"Ota yhteyttä";s:2:"fr";s:7:"Contact";s:2:"he";s:17:"יצירת קשר";s:2:"id";s:6:"Kontak";s:2:"it";s:10:"Contattaci";s:2:"lt";s:18:"Kontaktinė formą";s:2:"nl";s:7:"Contact";s:2:"pl";s:7:"Kontakt";s:2:"ru";s:27:"Обратная связь";s:2:"sl";s:7:"Kontakt";s:2:"tw";s:12:"聯絡我們";s:2:"cn";s:12:"联络我们";s:2:"hu";s:9:"Kapcsolat";s:2:"th";s:18:"ติดต่อ";s:2:"se";s:7:"Kontakt";}', 'contact', '1.0.0', NULL, 'a:25:{s:2:"en";s:112:"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.";s:2:"ar";s:157:"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.";s:2:"br";s:139:"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.";s:2:"pt";s:116:"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.";s:2:"cs";s:149:"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.";s:2:"da";s:123:"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse";s:2:"de";s:119:"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.";s:2:"el";s:273:"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.";s:2:"fa";s:239:"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.";s:2:"es";s:156:"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.";s:2:"fi";s:128:"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.";s:2:"fr";s:122:"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.";s:2:"he";s:155:"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות";s:2:"id";s:149:"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka";s:2:"it";s:119:"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.";s:2:"lt";s:124:"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.";s:2:"nl";s:125:"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.";s:2:"pl";s:126:"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.";s:2:"ru";s:234:"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.";s:2:"sl";s:113:"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.";s:2:"tw";s:147:"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。";s:2:"cn";s:147:"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。";s:2:"th";s:316:"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา";s:2:"hu";s:156:"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.";s:2:"se";s:53:"Lägger till ett kontaktformulär till din webbplats.";}', 0, 0, 0, '0', 1, 1, 1, 1395243348),
(8, 'a:24:{s:2:"en";s:5:"Files";s:2:"ar";s:16:"الملفّات";s:2:"br";s:8:"Arquivos";s:2:"pt";s:9:"Ficheiros";s:2:"cs";s:7:"Soubory";s:2:"da";s:5:"Filer";s:2:"de";s:7:"Dateien";s:2:"el";s:12:"Αρχεία";s:2:"es";s:8:"Archivos";s:2:"fa";s:13:"فایل ها";s:2:"fi";s:9:"Tiedostot";s:2:"fr";s:8:"Fichiers";s:2:"he";s:10:"קבצים";s:2:"id";s:4:"File";s:2:"it";s:4:"File";s:2:"lt";s:6:"Failai";s:2:"nl";s:9:"Bestanden";s:2:"ru";s:10:"Файлы";s:2:"sl";s:8:"Datoteke";s:2:"tw";s:6:"檔案";s:2:"cn";s:6:"档案";s:2:"hu";s:7:"Fájlok";s:2:"th";s:12:"ไฟล์";s:2:"se";s:5:"Filer";}', 'files', '2.0.0', NULL, 'a:24:{s:2:"en";s:40:"Manages files and folders for your site.";s:2:"ar";s:50:"إدارة ملفات ومجلّدات موقعك.";s:2:"br";s:53:"Permite gerenciar facilmente os arquivos de seu site.";s:2:"pt";s:59:"Permite gerir facilmente os ficheiros e pastas do seu site.";s:2:"cs";s:43:"Spravujte soubory a složky na vašem webu.";s:2:"da";s:41:"Administrer filer og mapper for dit site.";s:2:"de";s:35:"Verwalte Dateien und Verzeichnisse.";s:2:"el";s:100:"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.";s:2:"es";s:43:"Administra archivos y carpetas en tu sitio.";s:2:"fa";s:79:"مدیریت فایل های چند رسانه ای و فولدر ها سایت";s:2:"fi";s:43:"Hallitse sivustosi tiedostoja ja kansioita.";s:2:"fr";s:46:"Gérer les fichiers et dossiers de votre site.";s:2:"he";s:47:"ניהול תיקיות וקבצים שבאתר";s:2:"id";s:42:"Mengatur file dan folder dalam situs Anda.";s:2:"it";s:38:"Gestisci file e cartelle del tuo sito.";s:2:"lt";s:28:"Katalogų ir bylų valdymas.";s:2:"nl";s:41:"Beheer bestanden en mappen op uw website.";s:2:"ru";s:78:"Управление файлами и папками вашего сайта.";s:2:"sl";s:38:"Uredi datoteke in mape na vaši strani";s:2:"tw";s:33:"管理網站中的檔案與目錄";s:2:"cn";s:33:"管理网站中的档案与目录";s:2:"hu";s:41:"Fájlok és mappák kezelése az oldalon.";s:2:"th";s:141:"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ";s:2:"se";s:45:"Hanterar filer och mappar för din webbplats.";}', 0, 0, 1, 'content', 1, 1, 1, 1395243348),
(9, 'a:24:{s:2:"en";s:6:"Groups";s:2:"ar";s:18:"المجموعات";s:2:"br";s:6:"Grupos";s:2:"pt";s:6:"Grupos";s:2:"cs";s:7:"Skupiny";s:2:"da";s:7:"Grupper";s:2:"de";s:7:"Gruppen";s:2:"el";s:12:"Ομάδες";s:2:"es";s:6:"Grupos";s:2:"fa";s:13:"گروه ها";s:2:"fi";s:7:"Ryhmät";s:2:"fr";s:7:"Groupes";s:2:"he";s:12:"קבוצות";s:2:"id";s:4:"Grup";s:2:"it";s:6:"Gruppi";s:2:"lt";s:7:"Grupės";s:2:"nl";s:7:"Groepen";s:2:"ru";s:12:"Группы";s:2:"sl";s:7:"Skupine";s:2:"tw";s:6:"群組";s:2:"cn";s:6:"群组";s:2:"hu";s:9:"Csoportok";s:2:"th";s:15:"กลุ่ม";s:2:"se";s:7:"Grupper";}', 'groups', '1.0.0', NULL, 'a:24:{s:2:"en";s:54:"Users can be placed into groups to manage permissions.";s:2:"ar";s:100:"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.";s:2:"br";s:72:"Usuários podem ser inseridos em grupos para gerenciar suas permissões.";s:2:"pt";s:74:"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.";s:2:"cs";s:77:"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.";s:2:"da";s:49:"Brugere kan inddeles i grupper for adgangskontrol";s:2:"de";s:85:"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.";s:2:"el";s:168:"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.";s:2:"es";s:75:"Los usuarios podrán ser colocados en grupos para administrar sus permisos.";s:2:"fa";s:149:"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد";s:2:"fi";s:84:"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.";s:2:"fr";s:82:"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.";s:2:"he";s:62:"נותן אפשרות לאסוף משתמשים לקבוצות";s:2:"id";s:68:"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.";s:2:"it";s:69:"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.";s:2:"lt";s:67:"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.";s:2:"nl";s:73:"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.";s:2:"ru";s:134:"Пользователей можно объединять в группы, для управления правами доступа.";s:2:"sl";s:64:"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj";s:2:"tw";s:45:"用戶可以依群組分類並管理其權限";s:2:"cn";s:45:"用户可以依群组分类并管理其权限";s:2:"hu";s:73:"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.";s:2:"th";s:84:"สามารถวางผู้ใช้ลงในกลุ่มเพื่";s:2:"se";s:76:"Användare kan delas in i grupper för att hantera roller och behörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1395243348),
(10, 'a:17:{s:2:"en";s:8:"Keywords";s:2:"ar";s:21:"كلمات البحث";s:2:"br";s:14:"Palavras-chave";s:2:"pt";s:14:"Palavras-chave";s:2:"da";s:9:"Nøgleord";s:2:"el";s:27:"Λέξεις Κλειδιά";s:2:"fa";s:21:"کلمات کلیدی";s:2:"fr";s:10:"Mots-Clés";s:2:"id";s:10:"Kata Kunci";s:2:"nl";s:14:"Sleutelwoorden";s:2:"tw";s:6:"鍵詞";s:2:"cn";s:6:"键词";s:2:"hu";s:11:"Kulcsszavak";s:2:"fi";s:10:"Avainsanat";s:2:"sl";s:15:"Ključne besede";s:2:"th";s:15:"คำค้น";s:2:"se";s:9:"Nyckelord";}', 'keywords', '1.1.0', NULL, 'a:17:{s:2:"en";s:71:"Maintain a central list of keywords to label and organize your content.";s:2:"ar";s:124:"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.";s:2:"br";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"pt";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"da";s:72:"Vedligehold en central liste af nøgleord for at organisere dit indhold.";s:2:"el";s:181:"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.";s:2:"fa";s:110:"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا";s:2:"fr";s:87:"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.";s:2:"id";s:71:"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.";s:2:"nl";s:91:"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.";s:2:"tw";s:64:"集中管理可用於標題與內容的鍵詞(keywords)列表。";s:2:"cn";s:64:"集中管理可用于标题与内容的键词(keywords)列表。";s:2:"hu";s:65:"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.";s:2:"fi";s:92:"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.";s:2:"sl";s:82:"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.";s:2:"th";s:189:"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ";s:2:"se";s:61:"Hantera nyckelord för att organisera webbplatsens innehåll.";}', 0, 0, 1, 'data', 1, 1, 1, 1395243348),
(11, 'a:15:{s:2:"en";s:11:"Maintenance";s:2:"pt";s:12:"Manutenção";s:2:"ar";s:14:"الصيانة";s:2:"el";s:18:"Συντήρηση";s:2:"hu";s:13:"Karbantartás";s:2:"fa";s:15:"نگه داری";s:2:"fi";s:9:"Ylläpito";s:2:"fr";s:11:"Maintenance";s:2:"id";s:12:"Pemeliharaan";s:2:"it";s:12:"Manutenzione";s:2:"se";s:10:"Underhåll";s:2:"sl";s:12:"Vzdrževanje";s:2:"th";s:39:"การบำรุงรักษา";s:2:"tw";s:6:"維護";s:2:"cn";s:6:"维护";}', 'maintenance', '1.0.0', NULL, 'a:15:{s:2:"en";s:63:"Manage the site cache and export information from the database.";s:2:"pt";s:68:"Gerir o cache do seu site e exportar informações da base de dados.";s:2:"ar";s:81:"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.";s:2:"el";s:142:"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.";s:2:"id";s:60:"Mengatur cache situs dan mengexport informasi dari database.";s:2:"it";s:65:"Gestisci la cache del sito e esporta le informazioni dal database";s:2:"fa";s:73:"مدیریت کش سایت و صدور اطلاعات از دیتابیس";s:2:"fr";s:71:"Gérer le cache du site et exporter les contenus de la base de données";s:2:"fi";s:59:"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.";s:2:"hu";s:66:"Az oldal gyorsítótár kezelése és az adatbázis exportálása.";s:2:"se";s:76:"Underhåll webbplatsens cache och exportera data från webbplatsens databas.";s:2:"sl";s:69:"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.";s:2:"th";s:150:"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล";s:2:"tw";s:45:"經由管理介面手動刪除暫存資料。";s:2:"cn";s:45:"经由管理介面手动删除暂存资料。";}', 0, 0, 1, 'data', 1, 1, 1, 1395243348),
(12, 'a:25:{s:2:"en";s:10:"Navigation";s:2:"ar";s:14:"الروابط";s:2:"br";s:11:"Navegação";s:2:"pt";s:11:"Navegação";s:2:"cs";s:8:"Navigace";s:2:"da";s:10:"Navigation";s:2:"de";s:10:"Navigation";s:2:"el";s:16:"Πλοήγηση";s:2:"es";s:11:"Navegación";s:2:"fa";s:11:"منو ها";s:2:"fi";s:10:"Navigointi";s:2:"fr";s:10:"Navigation";s:2:"he";s:10:"ניווט";s:2:"id";s:8:"Navigasi";s:2:"it";s:11:"Navigazione";s:2:"lt";s:10:"Navigacija";s:2:"nl";s:9:"Navigatie";s:2:"pl";s:9:"Nawigacja";s:2:"ru";s:18:"Навигация";s:2:"sl";s:10:"Navigacija";s:2:"tw";s:12:"導航選單";s:2:"cn";s:12:"导航选单";s:2:"th";s:36:"ตัวช่วยนำทาง";s:2:"hu";s:11:"Navigáció";s:2:"se";s:10:"Navigation";}', 'navigation', '1.1.0', NULL, 'a:25:{s:2:"en";s:78:"Manage links on navigation menus and all the navigation groups they belong to.";s:2:"ar";s:85:"إدارة روابط وقوائم ومجموعات الروابط في الموقع.";s:2:"br";s:91:"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.";s:2:"pt";s:93:"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.";s:2:"cs";s:73:"Správa odkazů v navigaci a všech souvisejících navigačních skupin.";s:2:"da";s:82:"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.";s:2:"de";s:76:"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen";s:2:"el";s:207:"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.";s:2:"es";s:102:"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.";s:2:"fa";s:68:"مدیریت منو ها و گروه های مربوط به آنها";s:2:"fi";s:91:"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.";s:2:"fr";s:97:"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.";s:2:"he";s:73:"ניהול שלוחות תפריטי ניווט וקבוצות ניווט";s:2:"id";s:73:"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.";s:2:"it";s:97:"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.";s:2:"lt";s:95:"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.";s:2:"nl";s:92:"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.";s:2:"pl";s:95:"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.";s:2:"ru";s:136:"Управление ссылками в меню навигации и группах, к которым они принадлежат.";s:2:"sl";s:64:"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.";s:2:"tw";s:72:"管理導航選單中的連結，以及它們所隸屬的導航群組。";s:2:"cn";s:72:"管理导航选单中的连结，以及它们所隶属的导航群组。";s:2:"th";s:108:"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง";s:2:"se";s:33:"Hantera länkar och länkgrupper.";s:2:"hu";s:100:"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.";}', 0, 0, 1, 'structure', 1, 1, 1, 1395243348),
(13, 'a:25:{s:2:"en";s:5:"Pages";s:2:"ar";s:14:"الصفحات";s:2:"br";s:8:"Páginas";s:2:"pt";s:8:"Páginas";s:2:"cs";s:8:"Stránky";s:2:"da";s:5:"Sider";s:2:"de";s:6:"Seiten";s:2:"el";s:14:"Σελίδες";s:2:"es";s:8:"Páginas";s:2:"fa";s:14:"صفحه ها ";s:2:"fi";s:5:"Sivut";s:2:"fr";s:5:"Pages";s:2:"he";s:8:"דפים";s:2:"id";s:7:"Halaman";s:2:"it";s:6:"Pagine";s:2:"lt";s:9:"Puslapiai";s:2:"nl";s:13:"Pagina&apos;s";s:2:"pl";s:6:"Strony";s:2:"ru";s:16:"Страницы";s:2:"sl";s:6:"Strani";s:2:"tw";s:6:"頁面";s:2:"cn";s:6:"页面";s:2:"hu";s:7:"Oldalak";s:2:"th";s:21:"หน้าเพจ";s:2:"se";s:5:"Sidor";}', 'pages', '2.2.0', NULL, 'a:25:{s:2:"en";s:55:"Add custom pages to the site with any content you want.";s:2:"ar";s:99:"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.";s:2:"br";s:82:"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.";s:2:"pt";s:86:"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.";s:2:"cs";s:74:"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.";s:2:"da";s:71:"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.";s:2:"de";s:49:"Füge eigene Seiten mit anpassbaren Inhalt hinzu.";s:2:"el";s:152:"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.";s:2:"es";s:77:"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.";s:2:"fa";s:96:"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید";s:2:"fi";s:47:"Lisää mitä tahansa sisältöä sivustollesi.";s:2:"fr";s:89:"Permet d''ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.";s:2:"he";s:35:"ניהול דפי תוכן האתר";s:2:"id";s:75:"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.";s:2:"it";s:73:"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.";s:2:"lt";s:46:"Pridėkite nuosavus puslapius betkokio turinio";s:2:"nl";s:70:"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.";s:2:"pl";s:53:"Dodaj własne strony z dowolną treścią do witryny.";s:2:"ru";s:134:"Управление информационными страницами сайта, с произвольным содержимым.";s:2:"sl";s:44:"Dodaj stran s kakršno koli vsebino želite.";s:2:"tw";s:39:"為您的網站新增自定的頁面。";s:2:"cn";s:39:"为您的网站新增自定的页面。";s:2:"th";s:168:"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ";s:2:"hu";s:67:"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.";s:2:"se";s:39:"Lägg till egna sidor till webbplatsen.";}', 1, 1, 1, 'content', 1, 1, 1, 1395243348),
(14, 'a:25:{s:2:"en";s:11:"Permissions";s:2:"ar";s:18:"الصلاحيات";s:2:"br";s:11:"Permissões";s:2:"pt";s:11:"Permissões";s:2:"cs";s:12:"Oprávnění";s:2:"da";s:14:"Adgangskontrol";s:2:"de";s:14:"Zugriffsrechte";s:2:"el";s:20:"Δικαιώματα";s:2:"es";s:8:"Permisos";s:2:"fa";s:15:"اجازه ها";s:2:"fi";s:16:"Käyttöoikeudet";s:2:"fr";s:11:"Permissions";s:2:"he";s:12:"הרשאות";s:2:"id";s:9:"Perizinan";s:2:"it";s:8:"Permessi";s:2:"lt";s:7:"Teisės";s:2:"nl";s:15:"Toegangsrechten";s:2:"pl";s:11:"Uprawnienia";s:2:"ru";s:25:"Права доступа";s:2:"sl";s:10:"Dovoljenja";s:2:"tw";s:6:"權限";s:2:"cn";s:6:"权限";s:2:"hu";s:14:"Jogosultságok";s:2:"th";s:18:"สิทธิ์";s:2:"se";s:13:"Behörigheter";}', 'permissions', '1.0.0', NULL, 'a:25:{s:2:"en";s:68:"Control what type of users can see certain sections within the site.";s:2:"ar";s:127:"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.";s:2:"br";s:68:"Controle quais tipos de usuários podem ver certas seções no site.";s:2:"pt";s:75:"Controle quais os tipos de utilizadores podem ver certas secções no site.";s:2:"cs";s:93:"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.";s:2:"da";s:72:"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.";s:2:"de";s:70:"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.";s:2:"el";s:180:"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.";s:2:"es";s:81:"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.";s:2:"fa";s:59:"مدیریت اجازه های گروه های کاربری";s:2:"fi";s:72:"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.";s:2:"fr";s:104:"Permet de définir les autorisations des groupes d''utilisateurs pour afficher les différentes sections.";s:2:"he";s:75:"ניהול הרשאות כניסה לאיזורים מסוימים באתר";s:2:"id";s:76:"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.";s:2:"it";s:78:"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.";s:2:"lt";s:72:"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.";s:2:"nl";s:71:"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.";s:2:"pl";s:79:"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.";s:2:"ru";s:209:"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.";s:2:"sl";s:85:"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.";s:2:"tw";s:81:"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。";s:2:"cn";s:81:"用来控制不同类别的用户，设定其浏览特定网站内容的权限。";s:2:"hu";s:129:"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.";s:2:"th";s:117:"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง";s:2:"se";s:27:"Hantera gruppbehörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1395243348),
(15, 'a:24:{s:2:"en";s:9:"Redirects";s:2:"ar";s:18:"التوجيهات";s:2:"br";s:17:"Redirecionamentos";s:2:"pt";s:17:"Redirecionamentos";s:2:"cs";s:16:"Přesměrování";s:2:"da";s:13:"Omadressering";s:2:"el";s:30:"Ανακατευθύνσεις";s:2:"es";s:13:"Redirecciones";s:2:"fa";s:17:"انتقال ها";s:2:"fi";s:18:"Uudelleenohjaukset";s:2:"fr";s:12:"Redirections";s:2:"he";s:12:"הפניות";s:2:"id";s:8:"Redirect";s:2:"it";s:11:"Reindirizzi";s:2:"lt";s:14:"Peradresavimai";s:2:"nl";s:12:"Verwijzingen";s:2:"ru";s:30:"Перенаправления";s:2:"sl";s:12:"Preusmeritve";s:2:"tw";s:6:"轉址";s:2:"cn";s:6:"转址";s:2:"hu";s:17:"Átirányítások";s:2:"pl";s:14:"Przekierowania";s:2:"th";s:42:"เปลี่ยนเส้นทาง";s:2:"se";s:14:"Omdirigeringar";}', 'redirects', '1.0.0', NULL, 'a:24:{s:2:"en";s:33:"Redirect from one URL to another.";s:2:"ar";s:47:"التوجيه من رابط URL إلى آخر.";s:2:"br";s:39:"Redirecionamento de uma URL para outra.";s:2:"pt";s:40:"Redirecionamentos de uma URL para outra.";s:2:"cs";s:43:"Přesměrujte z jedné adresy URL na jinou.";s:2:"da";s:35:"Omadresser fra en URL til en anden.";s:2:"el";s:81:"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη";s:2:"es";s:34:"Redireccionar desde una URL a otra";s:2:"fa";s:63:"انتقال دادن یک صفحه به یک آدرس دیگر";s:2:"fi";s:45:"Uudelleenohjaa käyttäjän paikasta toiseen.";s:2:"fr";s:34:"Redirection d''une URL à un autre.";s:2:"he";s:43:"הפניות מכתובת אחת לאחרת";s:2:"id";s:40:"Redirect dari satu URL ke URL yang lain.";s:2:"it";s:35:"Reindirizza da una URL ad un altra.";s:2:"lt";s:56:"Peradresuokite puslapį iš vieno adreso (URL) į kitą.";s:2:"nl";s:38:"Verwijs vanaf een URL naar een andere.";s:2:"ru";s:78:"Перенаправления с одного адреса на другой.";s:2:"sl";s:44:"Preusmeritev iz enega URL naslova na drugega";s:2:"tw";s:33:"將網址轉址、重新定向。";s:2:"cn";s:33:"将网址转址、重新定向。";s:2:"hu";s:38:"Egy URL átirányítása egy másikra.";s:2:"pl";s:44:"Przekierowanie z jednego adresu URL na inny.";s:2:"th";s:123:"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง";s:2:"se";s:38:"Omdirigera från en URL till en annan.";}', 0, 0, 1, 'structure', 1, 1, 1, 1395243348),
(16, 'a:9:{s:2:"en";s:6:"Search";s:2:"fr";s:9:"Recherche";s:2:"se";s:4:"Sök";s:2:"ar";s:10:"البحث";s:2:"tw";s:6:"搜尋";s:2:"cn";s:6:"搜寻";s:2:"it";s:7:"Ricerca";s:2:"fa";s:10:"جستجو";s:2:"fi";s:4:"Etsi";}', 'search', '1.0.0', NULL, 'a:9:{s:2:"en";s:72:"Search through various types of content with this modular search system.";s:2:"fr";s:84:"Rechercher parmi différents types de contenus avec système de recherche modulaire.";s:2:"se";s:36:"Sök igenom olika typer av innehåll";s:2:"ar";s:102:"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.";s:2:"tw";s:63:"此模組可用以搜尋網站中不同類型的資料內容。";s:2:"cn";s:63:"此模组可用以搜寻网站中不同类型的资料内容。";s:2:"it";s:71:"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare";s:2:"fa";s:115:"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.";s:2:"fi";s:76:"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.";}', 0, 0, 0, '0', 1, 1, 1, 1395243348),
(17, 'a:20:{s:2:"en";s:7:"Sitemap";s:2:"ar";s:23:"خريطة الموقع";s:2:"br";s:12:"Mapa do Site";s:2:"pt";s:12:"Mapa do Site";s:2:"de";s:7:"Sitemap";s:2:"el";s:31:"Χάρτης Ιστότοπου";s:2:"es";s:14:"Mapa del Sitio";s:2:"fa";s:17:"نقشه سایت";s:2:"fi";s:10:"Sivukartta";s:2:"fr";s:12:"Plan du site";s:2:"id";s:10:"Peta Situs";s:2:"it";s:14:"Mappa del sito";s:2:"lt";s:16:"Svetainės medis";s:2:"nl";s:7:"Sitemap";s:2:"ru";s:21:"Карта сайта";s:2:"tw";s:12:"網站地圖";s:2:"cn";s:12:"网站地图";s:2:"th";s:21:"ไซต์แมพ";s:2:"hu";s:13:"Oldaltérkép";s:2:"se";s:9:"Sajtkarta";}', 'sitemap', '1.3.0', NULL, 'a:21:{s:2:"en";s:87:"The sitemap module creates an index of all pages and an XML sitemap for search engines.";s:2:"ar";s:120:"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.";s:2:"br";s:102:"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.";s:2:"pt";s:102:"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.";s:2:"da";s:86:"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.";s:2:"de";s:92:"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.";s:2:"el";s:190:"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.";s:2:"es";s:111:"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.";s:2:"fa";s:150:"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد";s:2:"fi";s:82:"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.";s:2:"fr";s:106:"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.";s:2:"id";s:110:"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.";s:2:"it";s:104:"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.";s:2:"lt";s:86:"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.";s:2:"nl";s:89:"De sitemap module maakt een index van alle pagina''s en een XML sitemap voor zoekmachines.";s:2:"ru";s:144:"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.";s:2:"tw";s:84:"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。";s:2:"cn";s:84:"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。";s:2:"th";s:202:"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.";s:2:"hu";s:94:"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.";s:2:"se";s:86:"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.";}', 0, 1, 0, 'content', 1, 1, 1, 1395243348);
INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(18, 'a:25:{s:2:"en";s:5:"Users";s:2:"ar";s:20:"المستخدمون";s:2:"br";s:9:"Usuários";s:2:"pt";s:12:"Utilizadores";s:2:"cs";s:11:"Uživatelé";s:2:"da";s:7:"Brugere";s:2:"de";s:8:"Benutzer";s:2:"el";s:14:"Χρήστες";s:2:"es";s:8:"Usuarios";s:2:"fa";s:14:"کاربران";s:2:"fi";s:12:"Käyttäjät";s:2:"fr";s:12:"Utilisateurs";s:2:"he";s:14:"משתמשים";s:2:"id";s:8:"Pengguna";s:2:"it";s:6:"Utenti";s:2:"lt";s:10:"Vartotojai";s:2:"nl";s:10:"Gebruikers";s:2:"pl";s:12:"Użytkownicy";s:2:"ru";s:24:"Пользователи";s:2:"sl";s:10:"Uporabniki";s:2:"tw";s:6:"用戶";s:2:"cn";s:6:"用户";s:2:"hu";s:14:"Felhasználók";s:2:"th";s:27:"ผู้ใช้งาน";s:2:"se";s:10:"Användare";}', 'users', '1.1.0', NULL, 'a:25:{s:2:"en";s:81:"Let users register and log in to the site, and manage them via the control panel.";s:2:"ar";s:133:"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.";s:2:"br";s:125:"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.";s:2:"pt";s:125:"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.";s:2:"cs";s:103:"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.";s:2:"da";s:89:"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.";s:2:"de";s:108:"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.";s:2:"el";s:208:"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.";s:2:"es";s:138:"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.";s:2:"fa";s:151:"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید";s:2:"fi";s:126:"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.";s:2:"fr";s:112:"Permet aux utilisateurs de s''enregistrer et de se connecter au site et de les gérer via le panneau de contrôle";s:2:"he";s:62:"ניהול משתמשים: רישום, הפעלה ומחיקה";s:2:"id";s:102:"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.";s:2:"it";s:95:"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.";s:2:"lt";s:106:"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.";s:2:"nl";s:88:"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.";s:2:"pl";s:87:"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.";s:2:"ru";s:155:"Управление зарегистрированными пользователями, активирование новых пользователей.";s:2:"sl";s:96:"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče";s:2:"tw";s:87:"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。";s:2:"cn";s:87:"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。";s:2:"th";s:210:"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม";s:2:"hu";s:120:"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.";s:2:"se";s:111:"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.";}', 0, 0, 1, '0', 1, 1, 1, 1395243348),
(19, 'a:25:{s:2:"en";s:9:"Variables";s:2:"ar";s:20:"المتغيّرات";s:2:"br";s:10:"Variáveis";s:2:"pt";s:10:"Variáveis";s:2:"cs";s:10:"Proměnné";s:2:"da";s:8:"Variable";s:2:"de";s:9:"Variablen";s:2:"el";s:20:"Μεταβλητές";s:2:"es";s:9:"Variables";s:2:"fa";s:16:"متغییرها";s:2:"fi";s:9:"Muuttujat";s:2:"fr";s:9:"Variables";s:2:"he";s:12:"משתנים";s:2:"id";s:8:"Variabel";s:2:"it";s:9:"Variabili";s:2:"lt";s:10:"Kintamieji";s:2:"nl";s:10:"Variabelen";s:2:"pl";s:7:"Zmienne";s:2:"ru";s:20:"Переменные";s:2:"sl";s:13:"Spremenljivke";s:2:"tw";s:12:"系統變數";s:2:"cn";s:12:"系统变数";s:2:"th";s:18:"ตัวแปร";s:2:"se";s:9:"Variabler";s:2:"hu";s:10:"Változók";}', 'variables', '1.0.0', NULL, 'a:25:{s:2:"en";s:59:"Manage global variables that can be accessed from anywhere.";s:2:"ar";s:97:"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.";s:2:"br";s:61:"Gerencia as variáveis globais acessíveis de qualquer lugar.";s:2:"pt";s:58:"Gerir as variáveis globais acessíveis de qualquer lugar.";s:2:"cs";s:56:"Spravujte globální proměnné přístupné odkudkoliv.";s:2:"da";s:51:"Håndtér globale variable som kan tilgås overalt.";s:2:"de";s:74:"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.";s:2:"el";s:129:"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.";s:2:"es";s:50:"Manage global variables to access from everywhere.";s:2:"fa";s:136:"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند";s:2:"fi";s:66:"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.";s:2:"fr";s:92:"Gérer des variables globales pour pouvoir y accéder depuis n''importe quel endroit du site.";s:2:"he";s:96:"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר";s:2:"id";s:59:"Mengatur variabel global yang dapat diakses dari mana saja.";s:2:"it";s:58:"Gestisci le variabili globali per accedervi da ogni parte.";s:2:"lt";s:64:"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.";s:2:"nl";s:54:"Beheer globale variabelen die overal beschikbaar zijn.";s:2:"pl";s:86:"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.";s:2:"ru";s:136:"Управление глобальными переменными, которые доступны в любом месте сайта.";s:2:"sl";s:53:"Urejanje globalnih spremenljivk za dostop od kjerkoli";s:2:"th";s:148:"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.";s:2:"tw";s:45:"管理此網站內可存取的全局變數。";s:2:"cn";s:45:"管理此网站内可存取的全局变数。";s:2:"hu";s:62:"Globális változók kezelése a hozzáféréshez, bárhonnan.";s:2:"se";s:66:"Hantera globala variabler som kan avändas över hela webbplatsen.";}', 0, 0, 1, 'data', 1, 1, 1, 1395243348),
(20, 'a:23:{s:2:"en";s:7:"Widgets";s:2:"br";s:7:"Widgets";s:2:"pt";s:7:"Widgets";s:2:"cs";s:7:"Widgety";s:2:"da";s:7:"Widgets";s:2:"de";s:7:"Widgets";s:2:"el";s:7:"Widgets";s:2:"es";s:7:"Widgets";s:2:"fa";s:13:"ویجت ها";s:2:"fi";s:9:"Vimpaimet";s:2:"fr";s:7:"Widgets";s:2:"id";s:6:"Widget";s:2:"it";s:7:"Widgets";s:2:"lt";s:11:"Papildiniai";s:2:"nl";s:7:"Widgets";s:2:"ru";s:14:"Виджеты";s:2:"sl";s:9:"Vtičniki";s:2:"tw";s:9:"小組件";s:2:"cn";s:9:"小组件";s:2:"hu";s:9:"Widget-ek";s:2:"th";s:21:"วิดเจ็ต";s:2:"se";s:8:"Widgetar";s:2:"ar";s:14:"الودجتس";}', 'widgets', '1.2.0', NULL, 'a:23:{s:2:"en";s:69:"Manage small sections of self-contained logic in blocks or "Widgets".";s:2:"ar";s:132:"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ"ودجتس".";s:2:"br";s:77:"Gerenciar pequenas seções de conteúdos em bloco conhecidos como "Widgets".";s:2:"pt";s:74:"Gerir pequenas secções de conteúdos em bloco conhecidos como "Widgets".";s:2:"cs";s:56:"Spravujte malé funkční části webu neboli "Widgety".";s:2:"da";s:74:"Håndter små sektioner af selv-opretholdt logik i blokke eller "Widgets".";s:2:"de";s:62:"Verwaltet kleine, eigentständige Bereiche, genannt "Widgets".";s:2:"el";s:149:"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή "Widgets".";s:2:"es";s:75:"Manejar pequeñas secciones de lógica autocontenida en bloques o "Widgets"";s:2:"fa";s:76:"مدیریت قسمت های کوچکی از سایت به طور مستقل";s:2:"fi";s:81:"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai "Vimpaimia".";s:2:"fr";s:41:"Gérer des mini application ou "Widgets".";s:2:"id";s:101:"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah "Widget".";s:2:"it";s:70:"Gestisci piccole sezioni di logica a se stante in blocchi o "Widgets".";s:2:"lt";s:43:"Nedidelių, savarankiškų blokų valdymas.";s:2:"nl";s:75:"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel "Widgets".";s:2:"ru";s:91:"Управление небольшими, самостоятельными блоками.";s:2:"sl";s:61:"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)";s:2:"tw";s:103:"可將小段的程式碼透過小組件來管理。即所謂 "Widgets"，或稱為小工具、部件。";s:2:"cn";s:103:"可将小段的程式码透过小组件来管理。即所谓 "Widgets"，或称为小工具、部件。";s:2:"hu";s:56:"Önálló kis logikai tömbök vagy widget-ek kezelése.";s:2:"th";s:152:"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต";s:2:"se";s:83:"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.";}', 1, 0, 1, 'content', 1, 1, 1, 1395243348),
(21, 'a:9:{s:2:"en";s:7:"WYSIWYG";s:2:"fa";s:7:"WYSIWYG";s:2:"fr";s:7:"WYSIWYG";s:2:"pt";s:7:"WYSIWYG";s:2:"se";s:15:"HTML-redigerare";s:2:"tw";s:7:"WYSIWYG";s:2:"cn";s:7:"WYSIWYG";s:2:"ar";s:27:"المحرر الرسومي";s:2:"it";s:7:"WYSIWYG";}', 'wysiwyg', '1.0.0', NULL, 'a:10:{s:2:"en";s:60:"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.";s:2:"fa";s:73:"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. ";s:2:"fr";s:63:"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor";s:2:"pt";s:61:"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.";s:2:"el";s:113:"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.";s:2:"se";s:37:"Redigeringsmodul för HTML, CKEditor.";s:2:"tw";s:83:"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。";s:2:"cn";s:83:"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。";s:2:"ar";s:76:"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.";s:2:"it";s:57:"Fornisce l''editor WYSIWYG per PtroCMS creato con CKEditor";}', 0, 0, 0, '0', 1, 1, 1, 1395243348);

-- --------------------------------------------------------

--
-- 表的结构 `default_navigation_groups`
--

CREATE TABLE IF NOT EXISTS `default_navigation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abbrev` (`abbrev`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `default_navigation_groups`
--

INSERT INTO `default_navigation_groups` (`id`, `title`, `abbrev`) VALUES
(1, 'Header', 'header'),
(2, 'Sidebar', 'sidebar'),
(3, 'Footer', 'footer');

-- --------------------------------------------------------

--
-- 表的结构 `default_navigation_links`
--

CREATE TABLE IF NOT EXISTS `default_navigation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `navigation_group_id` (`navigation_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `default_navigation_links`
--

INSERT INTO `default_navigation_links` (`id`, `title`, `parent`, `link_type`, `page_id`, `module_name`, `url`, `uri`, `navigation_group_id`, `position`, `target`, `restricted_to`, `class`) VALUES
(1, '首頁', 0, 'page', 1, '', '', '', 1, 0, '', '0', ''),
(2, '近期活動', 19, 'module', 0, 'blog', '', '', 1, 0, '', '0', ''),
(3, '留言板', 23, 'page', 2, '', '', '', 1, 0, '', '0', ''),
(4, '認識我們', 0, 'page', 6, '', '', '', 1, 1, '', '0', ''),
(5, '緣起', 4, 'page', 8, '', '', '', 1, 0, '', '0', ''),
(6, '目標異象', 4, 'page', 9, '', '', '', 1, 1, '', '0', ''),
(7, '組織', 4, 'page', 10, '', '', '', 1, 2, '', '0', ''),
(8, '宣傳短片', 4, 'page', 11, '', '', '', 1, 3, '', '0', ''),
(9, '聯絡我們', 4, 'page', 12, '', '', '', 1, 4, '', '0', ''),
(10, '推展計畫', 0, 'page', 13, '', '', '', 1, 2, '', '0', ''),
(11, '迎曦計畫', 10, 'page', 14, '', '', '', 1, 0, '', '0', ''),
(12, '每日五十', 10, 'page', 15, '', '', '', 1, 1, '', '0', ''),
(13, '麥田幼兒園', 10, 'page', 16, '', '', '', 1, 2, '', '0', ''),
(14, '義賣專區', 10, 'page', 17, '', '', '', 1, 3, '', '0', ''),
(15, '資源聯結', 0, 'page', 18, '', '', '', 1, 8, '', '0', ''),
(16, '財務徵信', 0, 'page', 19, '', '', '', 1, 7, '', '0', ''),
(17, '捐款芳名錄', 16, 'page', 20, '', '', '', 1, 0, '', '0', ''),
(18, '財務報告', 16, 'page', 21, '', '', '', 1, 1, '', '0', ''),
(19, '活動花絮', 0, 'page', 22, '', '', '', 1, 6, '', '0', ''),
(20, '活動花絮', 19, 'page', 23, '', '', '', 1, 1, '', '0', ''),
(21, '會訊刊物', 0, 'page', 24, '', '', '', 1, 5, '', '0', ''),
(22, '我要捐款', 0, 'page', 25, '', '', '', 1, 3, '', '0', ''),
(23, '公民論壇', 0, 'page', 26, '', '', '', 1, 4, '', '0', '');

-- --------------------------------------------------------

--
-- 表的结构 `default_pages`
--

CREATE TABLE IF NOT EXISTS `default_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_robots_no_index` tinyint(1) DEFAULT NULL,
  `meta_robots_no_follow` tinyint(1) DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `strict_uri` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `default_pages`
--

INSERT INTO `default_pages` (`id`, `slug`, `class`, `title`, `uri`, `parent_id`, `type_id`, `entry_id`, `css`, `js`, `meta_title`, `meta_keywords`, `meta_robots_no_index`, `meta_robots_no_follow`, `meta_description`, `rss_enabled`, `comments_enabled`, `status`, `created_on`, `updated_on`, `restricted_to`, `is_home`, `strict_uri`, `order`) VALUES
(1, 'home', '', '首頁', 'home', 0, '1', '1', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395238761, 1395494107, '0', 1, 1, 2),
(2, 'contact', '', '留言板', 'contact', 0, '1', '2', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395238761, 1395495558, '0', 0, 1, 3),
(3, 'search', '', 'Search', 'search', 0, '1', '3', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1395238761, 0, '', 0, 1, 4),
(4, 'results', '', 'Results', 'search/results', 3, '1', '4', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1395238761, 0, '', 0, 0, 0),
(5, '404', '', 'Page missing', '404', 0, '1', '5', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1395238761, 0, '', 0, 1, 5),
(6, 'about_us', '', '認識我們', 'about_us', 0, '1', '6', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395244532, 0, '0', 0, 1, 0),
(8, 'origin', '', '緣起', 'about_us/origin', 6, '1', '8', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395244802, 1395492463, '0', 0, 1, 0),
(9, 'target', '', '目標異象', 'about_us/target', 6, '1', '9', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395244873, 1395492623, '0', 0, 1, 1),
(10, 'organization', '', '組織', 'about_us/organization', 6, '1', '10', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395244893, 1395492652, '0', 0, 1, 2),
(11, 'intro_video', '', '宣傳短片', 'about_us/intro_video', 6, '1', '11', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395492297, 1395494593, '0', 0, 1, 3),
(12, 'contact_us', '', '聯絡我們', 'about_us/contact_us', 6, '1', '12', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395492368, 1395492716, '0', 0, 1, 4),
(13, 'promote', '', '推展計畫', 'promote', 0, '1', '13', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395492870, 0, '0', 0, 1, 1),
(14, 'meet_morning', '', '迎曦計畫', 'promote/meet_morning', 13, '1', '14', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395492928, 1395492932, '0', 0, 1, 0),
(15, '50_everyday', '', '每日五十', 'promote/50_everyday', 13, '1', '15', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395492999, 0, '0', 0, 1, 1),
(16, 'kindergarten', '', '麥田幼兒園', 'promote/kindergarten', 13, '1', '16', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395493071, 0, '0', 0, 1, 2),
(17, 'store', '', '義賣專區', 'promote/store', 13, '1', '17', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395493101, 0, '0', 0, 1, 3),
(18, 'links', '', '資源聯結', 'links', 0, '1', '18', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395493853, 0, '0', 0, 1, 7),
(19, 'finance', '', '財務徵信', 'finance', 0, '1', '19', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395493905, 0, '0', 0, 1, 6),
(20, 'donate', '', '捐款芳名錄', 'finance/donate', 19, '1', '20', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395493968, 0, '0', 0, 1, 1395493968),
(21, 'report', '', '財務報告', 'finance/report', 19, '1', '21', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395493991, 1395494030, '0', 0, 1, 1395493991),
(22, 'events', '', '活動花絮', 'events', 0, '1', '22', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395494296, 0, '0', 0, 1, 1395494296),
(23, 'photos', '', '活動花絮', 'photos', 0, '1', '23', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395494379, 0, '0', 0, 1, 1395494379),
(24, 'publication', '', '會訊刊物', 'publication', 0, '1', '24', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395494714, 1395494948, '0', 0, 1, 1395494714),
(25, 'wanna_donate', '', '我要捐款', 'wanna_donate', 0, '1', '25', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395495071, 0, '0', 0, 1, 1395495071),
(26, 'forum', '', '公民論壇', 'forum', 0, '1', '26', '', '', '', '', 0, 0, '', 0, 0, 'live', 1395495390, 0, '0', 0, 1, 1395495390);

-- --------------------------------------------------------

--
-- 表的结构 `default_page_types`
--

CREATE TABLE IF NOT EXISTS `default_page_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `stream_id` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  `save_as_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `content_label` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `default_page_types`
--

INSERT INTO `default_page_types` (`id`, `slug`, `title`, `description`, `stream_id`, `meta_title`, `meta_keywords`, `meta_description`, `body`, `css`, `js`, `theme_layout`, `updated_on`, `save_as_files`, `content_label`, `title_label`) VALUES
(1, 'default', 'Default', 'A simple page type with a WYSIWYG editor that will get you started adding content.', 2, NULL, NULL, NULL, '<h2>{{ page:title }}</h2>\n\n{{ body }}', '', '', 'default', 1395238761, 'n', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `default_permissions`
--

CREATE TABLE IF NOT EXISTS `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `default_profiles`
--

CREATE TABLE IF NOT EXISTS `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `bio` text COLLATE utf8_unicode_ci,
  `dob` int(11) DEFAULT NULL,
  `gender` set('m','f','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `default_profiles`
--

INSERT INTO `default_profiles` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `user_id`, `display_name`, `first_name`, `last_name`, `company`, `lang`, `bio`, `dob`, `gender`, `phone`, `mobile`, `address_line1`, `address_line2`, `address_line3`, `postcode`, `website`, `updated_on`) VALUES
(1, NULL, NULL, NULL, NULL, 1, 'chuan-hao you', 'chuan-hao', 'you', '', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2014-03-20 11:18:21', NULL, 1, 1, 2, 'qweqweqwe', 'qweqweqw', 'eqweqwe', NULL, 'en', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `default_redirects`
--

CREATE TABLE IF NOT EXISTS `default_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302',
  PRIMARY KEY (`id`),
  KEY `from` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `default_search_index`
--

CREATE TABLE IF NOT EXISTS `default_search_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  `keyword_hash` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_edit_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_delete_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`module`,`entry_key`,`entry_id`(190)),
  FULLTEXT KEY `full search` (`title`,`description`,`keywords`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `default_search_index`
--

INSERT INTO `default_search_index` (`id`, `title`, `description`, `keywords`, `keyword_hash`, `module`, `entry_key`, `entry_plural`, `entry_id`, `uri`, `cp_edit_uri`, `cp_delete_uri`) VALUES
(31, '首頁', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '1', 'home', 'admin/pages/edit/1', 'admin/pages/delete/1'),
(42, '留言板', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '2', 'contact', 'admin/pages/edit/2', 'admin/pages/delete/2'),
(3, 'Search', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '3', 'search', 'admin/pages/edit/3', 'admin/pages/delete/3'),
(4, 'Results', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '4', 'search/results', 'admin/pages/edit/4', 'admin/pages/delete/4'),
(5, 'Page missing', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '5', '404', 'admin/pages/edit/5', 'admin/pages/delete/5'),
(6, '認識我們', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '6', 'about_us', 'admin/pages/edit/6', 'admin/pages/delete/6'),
(14, '緣起', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '8', 'about_us/origin', 'admin/pages/edit/8', 'admin/pages/delete/8'),
(15, '目標異象', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '9', 'about_us/target', 'admin/pages/edit/9', 'admin/pages/delete/9'),
(16, '組織', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '10', 'about_us/organization', 'admin/pages/edit/10', 'admin/pages/delete/10'),
(34, '宣傳短片', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '11', 'about_us/intro_video', 'admin/pages/edit/11', 'admin/pages/delete/11'),
(18, '聯絡我們', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '12', 'about_us/contact_us', 'admin/pages/edit/12', 'admin/pages/delete/12'),
(19, '推展計畫', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '13', 'promote', 'admin/pages/edit/13', 'admin/pages/delete/13'),
(21, '迎曦計畫', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '14', 'promote/meet_morning', 'admin/pages/edit/14', 'admin/pages/delete/14'),
(22, '每日五十', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '15', 'promote/50_everyday', 'admin/pages/edit/15', 'admin/pages/delete/15'),
(23, '麥田幼兒園', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '16', 'promote/kindergarten', 'admin/pages/edit/16', 'admin/pages/delete/16'),
(24, '義賣專區', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '17', 'promote/store', 'admin/pages/edit/17', 'admin/pages/delete/17'),
(26, '資源聯結', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '18', 'links', 'admin/pages/edit/18', 'admin/pages/delete/18'),
(27, '財務徵信', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '19', 'finance', 'admin/pages/edit/19', 'admin/pages/delete/19'),
(28, '捐款芳名錄', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '20', 'finance/donate', 'admin/pages/edit/20', 'admin/pages/delete/20'),
(30, '財務報告', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '21', 'finance/report', 'admin/pages/edit/21', 'admin/pages/delete/21'),
(32, '活動花絮', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '22', 'events', 'admin/pages/edit/22', 'admin/pages/delete/22'),
(33, '活動花絮', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '23', 'photos', 'admin/pages/edit/23', 'admin/pages/delete/23'),
(36, '會訊刊物', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '24', 'publication', 'admin/pages/edit/24', 'admin/pages/delete/24'),
(37, '我要捐款', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '25', 'wanna_donate', 'admin/pages/edit/25', 'admin/pages/delete/25'),
(38, '公民論壇', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '26', 'forum', 'admin/pages/edit/26', 'admin/pages/delete/26');

-- --------------------------------------------------------

--
-- 表的结构 `default_settings`
--

CREATE TABLE IF NOT EXISTS `default_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique_slug` (`slug`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `default_settings`
--

INSERT INTO `default_settings` (`slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `is_gui`, `module`, `order`) VALUES
('activation_email', 'Activation Email', 'Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.', 'select', '1', '', '0=activate_by_admin|1=activate_by_email|2=no_activation', 0, 1, 'users', 961),
('addons_upload', 'Addons Upload Permissions', 'Keeps mere admins from uploading addons by default', 'text', '0', '1', '', 1, 0, '', 0),
('admin_force_https', 'Force HTTPS for Control Panel?', 'Allow only the HTTPS protocol when using the Control Panel?', 'radio', '0', '', '1=Yes|0=No', 1, 1, '', 0),
('admin_theme', 'Control Panel Theme', 'Select the theme for the control panel.', '', '', 'pyrocms', 'func:get_themes', 1, 0, '', 0),
('akismet_api_key', 'Akismet API Key', 'Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.', 'text', '', '', '', 0, 1, 'integration', 981),
('api_enabled', 'API Enabled', 'Allow API access to all modules which have an API controller.', 'select', '0', '0', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
('api_user_keys', 'API User Keys', 'Allow users to sign up for API keys (if the API is Enabled).', 'select', '0', '0', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
('auto_username', 'Auto Username', 'Create the username automatically, meaning users can skip making one on registration.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 964),
('cdn_domain', 'CDN Domain', 'CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.', 'text', '', '', '', 0, 1, 'integration', 1000),
('ckeditor_config', 'CKEditor Config', 'You can find a list of valid configuration items in <a target="_blank" href="http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html">CKEditor''s documentation.</a>', 'textarea', '', '{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\n$(''textarea#intro.wysiwyg-simple'').ckeditor({\n	toolbar: [\n		[''pyroimages''],\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'']\n	  ],\n	extraPlugins: ''pyroimages'',\n	width: ''99%'',\n	height: 100,\n	dialog_backgroundCoverColor: ''#000'',\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\n	language: ''{{ global:current_language }}''\n});\n\n{{# this is the config for all wysiwyg-simple textareas #}}\n$(''textarea.wysiwyg-simple'').ckeditor({\n	toolbar: [\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'']\n	  ],\n	width: ''99%'',\n	height: 100,\n	dialog_backgroundCoverColor: ''#000'',\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\n	language: ''{{ global:current_language }}''\n});\n\n{{# and this is the advanced editor #}}\n$(''textarea.wysiwyg-advanced'').ckeditor({\n	toolbar: [\n		[''Maximize''],\n		[''pyroimages'', ''pyrofiles''],\n		[''Cut'',''Copy'',''Paste'',''PasteFromWord''],\n		[''Undo'',''Redo'',''-'',''Find'',''Replace''],\n		[''Link'',''Unlink''],\n		[''Table'',''HorizontalRule'',''SpecialChar''],\n		[''Bold'',''Italic'',''StrikeThrough''],\n		[''JustifyLeft'',''JustifyCenter'',''JustifyRight'',''JustifyBlock'',''-'',''BidiLtr'',''BidiRtl''],\n		[''Format'', ''FontSize'', ''Subscript'',''Superscript'', ''NumberedList'',''BulletedList'',''Outdent'',''Indent'',''Blockquote''],\n		[''ShowBlocks'', ''RemoveFormat'', ''Source'']\n	],\n	extraPlugins: ''pyroimages,pyrofiles'',\n	width: ''99%'',\n	height: 400,\n	dialog_backgroundCoverColor: ''#000'',\n	removePlugins: ''elementspath'',\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\n	language: ''{{ global:current_language }}''\n});', '', 1, 1, 'wysiwyg', 993),
('comment_markdown', 'Allow Markdown', 'Do you want to allow visitors to post comments using Markdown?', 'select', '0', '0', '0=Text Only|1=Allow Markdown', 1, 1, 'comments', 965),
('comment_order', 'Comment Order', 'Sort order in which to display comments.', 'select', 'ASC', 'ASC', 'ASC=Oldest First|DESC=Newest First', 1, 1, 'comments', 966),
('contact_email', 'Contact E-mail', 'All e-mails from users, guests and the site will go to this e-mail address.', 'text', 'howtomakeaturn@hotmail.com', '', '', 1, 1, 'email', 979),
('currency', 'Currency', 'The currency symbol for use on products, services, etc.', 'text', '&pound;', '', '', 1, 1, '', 994),
('dashboard_rss', 'Dashboard RSS Feed', 'Link to an RSS feed that will be displayed on the dashboard.', 'text', 'https://www.pyrocms.com/blog/rss/all.rss', '', '', 0, 1, '', 990),
('dashboard_rss_count', 'Dashboard RSS Items', 'How many RSS items would you like to display on the dashboard?', 'text', '5', '5', '', 1, 1, '', 989),
('date_format', 'Date Format', 'How should dates be displayed across the website and control panel? Using the <a target="_blank" href="http://php.net/manual/en/function.date.php">date format</a> from PHP - OR - Using the format of <a target="_blank" href="http://php.net/manual/en/function.strftime.php">strings formatted as date</a> from PHP.', 'text', 'F j, Y', '', '', 1, 1, '', 995),
('default_theme', 'Default Theme', 'Select the theme you want users to see by default.', '', 'default', 'custom', 'func:get_themes', 1, 0, '', 0),
('enable_comments', 'Enable Comments', 'Enable comments.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 968),
('enable_profiles', 'Enable profiles', 'Allow users to add and edit profiles.', 'radio', '1', '', '1=Enabled|0=Disabled', 1, 1, 'users', 963),
('enable_registration', 'Enable user registration', 'Allow users to register in your site.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 961),
('files_cache', 'Files Cache', 'When outputting an image via site.com/files what shall we set the cache expiration for?', 'select', '480', '480', '0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days', 1, 1, 'files', 986),
('files_cf_api_key', 'Rackspace Cloud Files API Key', 'You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.', 'text', '', '', '', 0, 1, 'files', 989),
('files_cf_username', 'Rackspace Cloud Files Username', 'To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href="https://manage.rackspacecloud.com/APIAccess.do">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 990),
('files_enabled_providers', 'Enabled File Storage Providers', 'Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below', 'checkbox', '0', '0', 'amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files', 0, 1, 'files', 994),
('files_s3_access_key', 'Amazon S3 Access Key', 'To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href="https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 993),
('files_s3_geographic_location', 'Amazon S3 Geographic Location', 'Either US or EU. If you change this you must also change the S3 URL.', 'radio', 'US', 'US', 'US=United States|EU=Europe', 1, 1, 'files', 991),
('files_s3_secret_key', 'Amazon S3 Secret Key', 'You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.', 'text', '', '', '', 0, 1, 'files', 992),
('files_s3_url', 'Amazon S3 URL', 'Change this if using one of Amazon''s EU locations or a custom domain.', 'text', 'http://{{ bucket }}.s3.amazonaws.com/', 'http://{{ bucket }}.s3.amazonaws.com/', '', 0, 1, 'files', 991),
('files_upload_limit', 'Filesize Limit', 'Maximum filesize to allow when uploading. Specify the size in MB. Example: 5', 'text', '5', '5', '', 1, 1, 'files', 987),
('frontend_enabled', 'Site Status', 'Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.', 'radio', '1', '', '1=Open|0=Closed', 1, 1, '', 988),
('ga_email', 'Google Analytic E-mail', 'E-mail address used for Google Analytics, we need this to show the graph on the dashboard.', 'text', '', '', '', 0, 1, 'integration', 983),
('ga_password', 'Google Analytic Password', 'This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href="https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US" target="_blank">Authorized Access to your Google Account</a>', 'password', '', '', '', 0, 1, 'integration', 982),
('ga_profile', 'Google Analytic Profile ID', 'Profile ID for this website in Google Analytics', 'text', '', '', '', 0, 1, 'integration', 984),
('ga_tracking', 'Google Tracking Code', 'Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6', 'text', '', '', '', 0, 1, 'integration', 985),
('mail_line_endings', 'Email Line Endings', 'Change from the standard \\r\\n line ending to PHP_EOL for some email servers.', 'select', '1', '1', '0=PHP_EOL|1=\\r\\n', 0, 1, 'email', 972),
('mail_protocol', 'Mail Protocol', 'Select desired email protocol.', 'select', 'mail', 'mail', 'mail=Mail|sendmail=Sendmail|smtp=SMTP', 1, 1, 'email', 977),
('mail_sendmail_path', 'Sendmail Path', 'Path to server sendmail binary.', 'text', '', '', '', 0, 1, 'email', 972),
('mail_smtp_host', 'SMTP Host Name', 'The host name of your smtp server.', 'text', '', '', '', 0, 1, 'email', 976),
('mail_smtp_pass', 'SMTP password', 'SMTP password.', 'password', '', '', '', 0, 1, 'email', 975),
('mail_smtp_port', 'SMTP Port', 'SMTP port number.', 'text', '', '', '', 0, 1, 'email', 974),
('mail_smtp_user', 'SMTP User Name', 'SMTP user name.', 'text', '', '', '', 0, 1, 'email', 973),
('meta_topic', 'Meta Topic', 'Two or three words describing this type of company/website.', 'text', 'Content Management', 'Neighborhood Family Catcher Association', '', 0, 1, '', 998),
('moderate_comments', 'Moderate Comments', 'Force comments to be approved before they appear on the site.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 967),
('profile_visibility', 'Profile Visibility', 'Specify who can view user profiles on the public site', 'select', 'public', '', 'public=profile_public|owner=profile_owner|hidden=profile_hidden|member=profile_member', 0, 1, 'users', 960),
('records_per_page', 'Records Per Page', 'How many records should we show per page in the admin section?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 992),
('registered_email', 'User Registered Email', 'Send a notification email to the contact e-mail when someone registers.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 962),
('rss_feed_items', 'Feed item count', 'How many items should we show in RSS/blog feeds?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 991),
('server_email', 'Server E-mail', 'All e-mails to users will come from this e-mail address.', 'text', 'admin@localhost', '', '', 1, 1, 'email', 978),
('site_lang', 'Site Language', 'The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.', 'select', 'en', 'tw', 'func:get_supported_lang', 1, 1, '', 997),
('site_name', 'Site Name', 'The name of the website for page titles and for use around the site.', 'text', 'Un-named Website', '社團法人臺北市接觸點社區關懷協會', '', 1, 1, '', 1000),
('site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'en,tw', 'func:get_supported_lang', 1, 1, '', 996),
('site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', 'Neighborhood Family Catcher Association', '', 0, 1, '', 999),
('unavailable_message', 'Unavailable Message', 'When the site is turned off or there is a major problem, this message will show to users.', 'textarea', 'Sorry, this website is currently unavailable.', '', '', 0, 1, '', 987);

-- --------------------------------------------------------

--
-- 表的结构 `default_theme_options`
--

CREATE TABLE IF NOT EXISTS `default_theme_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox','colour-picker') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `default_theme_options`
--

INSERT INTO `default_theme_options` (`id`, `slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `theme`) VALUES
(1, 'show_breadcrumbs', 'Show Breadcrumbs', 'Would you like to display breadcrumbs?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'default'),
(2, 'layout', 'Layout', 'Which type of layout shall we use?', 'select', '2 column', '2 column', '2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page', 1, 'default'),
(3, 'pyrocms_recent_comments', 'Recent Comments', 'Would you like to display recent comments on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(4, 'pyrocms_news_feed', 'News Feed', 'Would you like to display the news feed on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(5, 'pyrocms_quick_links', 'Quick Links', 'Would you like to display quick links on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(6, 'pyrocms_analytics_graph', 'Analytics Graph', 'Would you like to display the graph on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(7, 'background', 'Background', 'Choose the default background for the theme.', 'select', 'fabric', 'texture', 'black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture', 1, 'base'),
(8, 'slider', 'Slider', 'Would you like to display the slider on the homepage?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'base'),
(9, 'color', 'Default Theme Color', 'This changes things like background color, link colors etc…', 'select', 'pink', 'pink', 'red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink', 1, 'base'),
(10, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'base'),
(11, 'background', 'Background', 'Choose the default background for the theme.', 'select', 'fabric', 'texture', 'black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture', 1, 'custom'),
(12, 'slider', 'Slider', 'Would you like to display the slider on the homepage?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'custom'),
(13, 'color', 'Default Theme Color', 'This changes things like background color, link colors etc…', 'select', 'pink', 'pink', 'red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink', 1, 'custom'),
(14, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'custom');

-- --------------------------------------------------------

--
-- 表的结构 `default_users`
--

CREATE TABLE IF NOT EXISTS `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `default_users`
--

INSERT INTO `default_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(1, 'howtomakeaturn@hotmail.com', 'f142b92c78ced8ce73a538cc895a2835b9b47d0f', '2aa74', 1, '', 1, '', 1395238749, 1395492119, 'å°¤å·è±ª', NULL, '5d0ee8f2f446250042a78772d4e2979487e973b4'),
(2, 'qwewqe@qweqwe.ww', 'a285668ea2cc5e89249de5b12c1656469435b362', '1dcf83', 2, '127.0.0.1', 1, NULL, 1395314301, 1395314301, 'wqeqweqweqwe', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `default_variables`
--

CREATE TABLE IF NOT EXISTS `default_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `default_widgets`
--

CREATE TABLE IF NOT EXISTS `default_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `default_widgets`
--

INSERT INTO `default_widgets` (`id`, `slug`, `title`, `description`, `author`, `website`, `version`, `enabled`, `order`, `updated_on`) VALUES
(1, 'google_maps', 'a:10:{s:2:"en";s:11:"Google Maps";s:2:"el";s:19:"Χάρτης Google";s:2:"nl";s:11:"Google Maps";s:2:"br";s:11:"Google Maps";s:2:"pt";s:11:"Google Maps";s:2:"ru";s:17:"Карты Google";s:2:"id";s:11:"Google Maps";s:2:"fi";s:11:"Google Maps";s:2:"fr";s:11:"Google Maps";s:2:"fa";s:17:"نقشه گوگل";}', 'a:10:{s:2:"en";s:32:"Display Google Maps on your site";s:2:"el";s:78:"Προβάλετε έναν Χάρτη Google στον ιστότοπό σας";s:2:"nl";s:27:"Toon Google Maps in uw site";s:2:"br";s:34:"Mostra mapas do Google no seu site";s:2:"pt";s:34:"Mostra mapas do Google no seu site";s:2:"ru";s:80:"Выводит карты Google на страницах вашего сайта";s:2:"id";s:37:"Menampilkan Google Maps di Situs Anda";s:2:"fi";s:39:"Näytä Google Maps kartta sivustollasi";s:2:"fr";s:42:"Publiez un plan Google Maps sur votre site";s:2:"fa";s:59:"نمایش داده نقشه گوگل بر روی سایت ";}', 'Gregory Athons', 'http://www.gregathons.com', '1.0.0', 1, 1, 1395243357),
(2, 'html', 's:4:"HTML";', 'a:10:{s:2:"en";s:28:"Create blocks of custom HTML";s:2:"el";s:80:"Δημιουργήστε περιοχές με δικό σας κώδικα HTML";s:2:"br";s:41:"Permite criar blocos de HTML customizados";s:2:"pt";s:41:"Permite criar blocos de HTML customizados";s:2:"nl";s:30:"Maak blokken met maatwerk HTML";s:2:"ru";s:83:"Создание HTML-блоков с произвольным содержимым";s:2:"id";s:24:"Membuat blok HTML apapun";s:2:"fi";s:32:"Luo lohkoja omasta HTML koodista";s:2:"fr";s:36:"Créez des blocs HTML personnalisés";s:2:"fa";s:58:"ایجاد قسمت ها به صورت اچ تی ام ال";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 2, 1395243357),
(3, 'login', 'a:10:{s:2:"en";s:5:"Login";s:2:"el";s:14:"Σύνδεση";s:2:"nl";s:5:"Login";s:2:"br";s:5:"Login";s:2:"pt";s:5:"Login";s:2:"ru";s:22:"Вход на сайт";s:2:"id";s:5:"Login";s:2:"fi";s:13:"Kirjautuminen";s:2:"fr";s:9:"Connexion";s:2:"fa";s:10:"لاگین";}', 'a:10:{s:2:"en";s:36:"Display a simple login form anywhere";s:2:"el";s:96:"Προβάλετε μια απλή φόρμα σύνδεσης χρήστη οπουδήποτε";s:2:"br";s:69:"Permite colocar um formulário de login em qualquer lugar do seu site";s:2:"pt";s:69:"Permite colocar um formulário de login em qualquer lugar do seu site";s:2:"nl";s:32:"Toon overal een simpele loginbox";s:2:"ru";s:72:"Выводит простую форму для входа на сайт";s:2:"id";s:32:"Menampilkan form login sederhana";s:2:"fi";s:52:"Näytä yksinkertainen kirjautumislomake missä vain";s:2:"fr";s:54:"Affichez un formulaire de connexion où vous souhaitez";s:2:"fa";s:70:"نمایش یک لاگین ساده در هر قسمتی از سایت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 3, 1395243357),
(4, 'navigation', 'a:10:{s:2:"en";s:10:"Navigation";s:2:"el";s:16:"Πλοήγηση";s:2:"nl";s:9:"Navigatie";s:2:"br";s:11:"Navegação";s:2:"pt";s:11:"Navegação";s:2:"ru";s:18:"Навигация";s:2:"id";s:8:"Navigasi";s:2:"fi";s:10:"Navigaatio";s:2:"fr";s:10:"Navigation";s:2:"fa";s:10:"منوها";}', 'a:10:{s:2:"en";s:40:"Display a navigation group with a widget";s:2:"el";s:100:"Προβάλετε μια ομάδα στοιχείων πλοήγησης στον ιστότοπο";s:2:"nl";s:38:"Toon een navigatiegroep met een widget";s:2:"br";s:62:"Exibe um grupo de links de navegação como widget em seu site";s:2:"pt";s:62:"Exibe um grupo de links de navegação como widget no seu site";s:2:"ru";s:88:"Отображает навигационную группу внутри виджета";s:2:"id";s:44:"Menampilkan grup navigasi menggunakan widget";s:2:"fi";s:37:"Näytä widgetillä navigaatio ryhmä";s:2:"fr";s:47:"Affichez un groupe de navigation dans un widget";s:2:"fa";s:71:"نمایش گروهی از منوها با استفاده از ویجت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.2.0', 1, 4, 1395243357),
(5, 'rss_feed', 'a:10:{s:2:"en";s:8:"RSS Feed";s:2:"el";s:24:"Τροφοδοσία RSS";s:2:"nl";s:8:"RSS Feed";s:2:"br";s:8:"Feed RSS";s:2:"pt";s:8:"Feed RSS";s:2:"ru";s:31:"Лента новостей RSS";s:2:"id";s:8:"RSS Feed";s:2:"fi";s:10:"RSS Syöte";s:2:"fr";s:8:"Flux RSS";s:2:"fa";s:19:"خبر خوان RSS";}', 'a:10:{s:2:"en";s:41:"Display parsed RSS feeds on your websites";s:2:"el";s:82:"Προβάλετε τα περιεχόμενα μιας τροφοδοσίας RSS";s:2:"nl";s:28:"Toon RSS feeds op uw website";s:2:"br";s:48:"Interpreta e exibe qualquer feed RSS no seu site";s:2:"pt";s:48:"Interpreta e exibe qualquer feed RSS no seu site";s:2:"ru";s:94:"Выводит обработанную ленту новостей на вашем сайте";s:2:"id";s:42:"Menampilkan kutipan RSS feed di situs Anda";s:2:"fi";s:39:"Näytä purettu RSS syöte sivustollasi";s:2:"fr";s:39:"Affichez un flux RSS sur votre site web";s:2:"fa";s:46:"نمایش خوراک های RSS در سایت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.2.0', 1, 5, 1395243357),
(6, 'social_bookmark', 'a:10:{s:2:"en";s:15:"Social Bookmark";s:2:"el";s:35:"Κοινωνική δικτύωση";s:2:"nl";s:19:"Sociale Bladwijzers";s:2:"br";s:15:"Social Bookmark";s:2:"pt";s:15:"Social Bookmark";s:2:"ru";s:37:"Социальные закладки";s:2:"id";s:15:"Social Bookmark";s:2:"fi";s:24:"Sosiaalinen kirjanmerkki";s:2:"fr";s:13:"Liens sociaux";s:2:"fa";s:52:"بوکمارک های شبکه های اجتماعی";}', 'a:10:{s:2:"en";s:47:"Configurable social bookmark links from AddThis";s:2:"el";s:111:"Παραμετροποιήσιμα στοιχεία κοινωνικής δικτυώσης από το AddThis";s:2:"nl";s:43:"Voeg sociale bladwijzers toe vanuit AddThis";s:2:"br";s:87:"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações";s:2:"pt";s:87:"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações";s:2:"ru";s:90:"Конфигурируемые социальные закладки с сайта AddThis";s:2:"id";s:60:"Tautan social bookmark yang dapat dikonfigurasi dari AddThis";s:2:"fi";s:59:"Konfiguroitava sosiaalinen kirjanmerkki linkit AddThis:stä";s:2:"fr";s:43:"Liens sociaux personnalisables avec AddThis";s:2:"fa";s:71:"تنظیم و نمایش لینک های شبکه های اجتماعی";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 6, 1395243357),
(7, 'archive', 'a:8:{s:2:"en";s:7:"Archive";s:2:"br";s:15:"Arquivo do Blog";s:2:"fa";s:10:"آرشیو";s:2:"pt";s:15:"Arquivo do Blog";s:2:"el";s:33:"Αρχείο Ιστολογίου";s:2:"fr";s:16:"Archives du Blog";s:2:"ru";s:10:"Архив";s:2:"id";s:7:"Archive";}', 'a:8:{s:2:"en";s:64:"Display a list of old months with links to posts in those months";s:2:"br";s:95:"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente";s:2:"fa";s:101:"نمایش لیست ماه های گذشته به همراه لینک به پست های مربوطه";s:2:"pt";s:95:"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente";s:2:"el";s:155:"Προβάλλει μια λίστα μηνών και συνδέσμους σε αναρτήσεις που έγιναν σε κάθε από αυτούς";s:2:"fr";s:95:"Permet d''afficher une liste des mois passés avec des liens vers les posts relatifs à ces mois";s:2:"ru";s:114:"Выводит список по месяцам со ссылками на записи в этих месяцах";s:2:"id";s:63:"Menampilkan daftar bulan beserta tautan post di setiap bulannya";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 7, 1395243357),
(8, 'blog_categories', 'a:8:{s:2:"en";s:15:"Blog Categories";s:2:"br";s:18:"Categorias do Blog";s:2:"pt";s:18:"Categorias do Blog";s:2:"el";s:41:"Κατηγορίες Ιστολογίου";s:2:"fr";s:19:"Catégories du Blog";s:2:"ru";s:29:"Категории Блога";s:2:"id";s:12:"Kateori Blog";s:2:"fa";s:28:"مجموعه های بلاگ";}', 'a:8:{s:2:"en";s:30:"Show a list of blog categories";s:2:"br";s:57:"Mostra uma lista de navegação com as categorias do Blog";s:2:"pt";s:57:"Mostra uma lista de navegação com as categorias do Blog";s:2:"el";s:97:"Προβάλει την λίστα των κατηγοριών του ιστολογίου σας";s:2:"fr";s:49:"Permet d''afficher la liste de Catégories du Blog";s:2:"ru";s:57:"Выводит список категорий блога";s:2:"id";s:35:"Menampilkan daftar kategori tulisan";s:2:"fa";s:55:"نمایش لیستی از مجموعه های بلاگ";}', 'Stephen Cozart', 'http://github.com/clip/', '1.0.0', 1, 8, 1395243357),
(9, 'latest_posts', 'a:8:{s:2:"en";s:12:"Latest posts";s:2:"br";s:24:"Artigos recentes do Blog";s:2:"fa";s:26:"آخرین ارسال ها";s:2:"pt";s:24:"Artigos recentes do Blog";s:2:"el";s:62:"Τελευταίες αναρτήσεις ιστολογίου";s:2:"fr";s:17:"Derniers articles";s:2:"ru";s:31:"Последние записи";s:2:"id";s:12:"Post Terbaru";}', 'a:8:{s:2:"en";s:39:"Display latest blog posts with a widget";s:2:"br";s:81:"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog";s:2:"fa";s:65:"نمایش آخرین پست های وبلاگ در یک ویجت";s:2:"pt";s:81:"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog";s:2:"el";s:103:"Προβάλει τις πιο πρόσφατες αναρτήσεις στο ιστολόγιό σας";s:2:"fr";s:68:"Permet d''afficher la liste des derniers posts du blog dans un Widget";s:2:"ru";s:100:"Выводит список последних записей блога внутри виджета";s:2:"id";s:51:"Menampilkan posting blog terbaru menggunakan widget";}', 'Erik Berman', 'http://www.nukleo.fr', '1.0.0', 1, 9, 1395243357);

-- --------------------------------------------------------

--
-- 表的结构 `default_widget_areas`
--

CREATE TABLE IF NOT EXISTS `default_widget_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `default_widget_areas`
--

INSERT INTO `default_widget_areas` (`id`, `slug`, `title`) VALUES
(1, 'sidebar', 'Sidebar');

-- --------------------------------------------------------

--
-- 表的结构 `default_widget_instances`
--

CREATE TABLE IF NOT EXISTS `default_widget_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
