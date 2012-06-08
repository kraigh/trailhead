-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 19, 2012 at 03:37 PM
-- Server version: 5.1.62
-- PHP Version: 5.3.2-1ubuntu4.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mt-businessclass7`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
CREATE TABLE IF NOT EXISTS `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique actions ID.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The object that that action acts on (node, user, comment, system or custom types.)',
  `callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback function that executes when the action runs.',
  `parameters` longblob NOT NULL COMMENT 'Parameters to be passed to the callback function.',
  `label` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Label of the action.',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores action information.';

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`aid`, `type`, `callback`, `parameters`, `label`) VALUES
('comment_publish_action', 'comment', 'comment_publish_action', '', 'Publish comment'),
('comment_save_action', 'comment', 'comment_save_action', '', 'Save comment'),
('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment'),
('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make content sticky'),
('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make content unsticky'),
('node_promote_action', 'node', 'node_promote_action', '', 'Promote content to front page'),
('node_publish_action', 'node', 'node_publish_action', '', 'Publish content'),
('node_save_action', 'node', 'node_save_action', '', 'Save content'),
('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove content from front page'),
('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish content'),
('system_block_ip_action', 'user', 'system_block_ip_action', '', 'Ban IP address of current user'),
('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user');

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
CREATE TABLE IF NOT EXISTS `block` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique block ID.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The module from which the block originates; for example, ’user’ for the Who’s Online block, and ’block’ for any custom blocks.',
  `delta` varchar(32) NOT NULL DEFAULT '0' COMMENT 'Unique ID for block within a module.',
  `theme` varchar(64) NOT NULL DEFAULT '' COMMENT 'The theme under which the block settings apply.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Block enabled status. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Block weight within region.',
  `region` varchar(64) NOT NULL DEFAULT '' COMMENT 'Theme region within which the block is set.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how users may control visibility of the block. (0 = Users cannot control, 1 = On by default, but can be hidden, 2 = Hidden by default, but can be shown)',
  `visibility` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how to show blocks on pages. (0 = Show on all pages except listed pages, 1 = Show only on listed pages, 2 = Use custom PHP code to determine visibility)',
  `pages` text NOT NULL COMMENT 'Contents of the "Pages" block; contains either a list of paths on which to include/exclude the block or PHP code, depending on "visibility" setting.',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT 'Custom title for the block. (Empty string will use block default title, <none> will remove the title, text will cause block to use specified title.)',
  `cache` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Binary flag to indicate block cache mode. (-2: Custom cache, -1: Do not cache, 1: Cache per role, 2: Cache per user, 4: Cache per page, 8: Block cache global) See DRUPAL_CACHE_* constants in ../includes/common.inc for more detailed information.',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores block settings, such as region and visibility...' AUTO_INCREMENT=127 ;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `visibility`, `pages`, `title`, `cache`) VALUES
(1, 'system', 'main', 'bartik', 1, 0, 'content', 0, 0, '', '', -1),
(2, 'search', 'form', 'bartik', 1, -1, 'header', 0, 0, '', '', -1),
(3, 'node', 'recent', 'seven', 1, 10, 'dashboard_main', 0, 0, '', '', -1),
(4, 'user', 'login', 'bartik', 1, -7, 'sidebar_first', 0, 1, '<front>', '', -1),
(5, 'system', 'navigation', 'bartik', 1, -8, 'sidebar_first', 0, 0, '', '', -1),
(6, 'system', 'powered-by', 'bartik', 1, -8, 'footer', 0, 0, '', '', -1),
(7, 'system', 'help', 'bartik', 1, 0, 'help', 0, 0, '', '', -1),
(8, 'system', 'main', 'seven', 1, 0, 'content', 0, 0, '', '', -1),
(9, 'system', 'help', 'seven', 1, 0, 'help', 0, 0, '', '', -1),
(10, 'user', 'login', 'seven', 1, 10, 'content', 0, 1, '<front>', '', -1),
(11, 'user', 'new', 'seven', 1, 0, 'dashboard_sidebar', 0, 0, '', '', -1),
(12, 'search', 'form', 'seven', 1, -10, 'dashboard_sidebar', 0, 0, '', '', -1),
(13, 'comment', 'recent', 'bartik', 0, 0, '-1', 0, 0, '', '', 1),
(14, 'node', 'syndicate', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(15, 'node', 'recent', 'bartik', 0, 0, '-1', 0, 0, '', '', 1),
(16, 'shortcut', 'shortcuts', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(17, 'system', 'management', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(18, 'system', 'user-menu', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(19, 'system', 'main-menu', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(20, 'user', 'new', 'bartik', 0, 0, '-1', 0, 0, '', '', 1),
(21, 'user', 'online', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(22, 'comment', 'recent', 'seven', 1, 0, 'dashboard_inactive', 0, 0, '', '', 1),
(23, 'node', 'syndicate', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(24, 'shortcut', 'shortcuts', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(25, 'system', 'powered-by', 'seven', 0, 10, '-1', 0, 0, '', '', -1),
(26, 'system', 'navigation', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(27, 'system', 'management', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(28, 'system', 'user-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(29, 'system', 'main-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(30, 'user', 'online', 'seven', 1, 0, 'dashboard_inactive', 0, 0, '', '', -1),
(31, 'comment', 'recent', 'businessclass', 0, -13, '-1', 0, 0, '', '', 1),
(32, 'node', 'recent', 'businessclass', 0, -12, '-1', 0, 0, '', '', 1),
(33, 'node', 'syndicate', 'businessclass', 0, -9, '-1', 0, 0, '', '', -1),
(34, 'search', 'form', 'businessclass', 1, -15, 'header_right', 0, 0, '', '', -1),
(35, 'shortcut', 'shortcuts', 'businessclass', 0, -11, '-1', 0, 0, '', '', -1),
(36, 'system', 'help', 'businessclass', 1, 0, 'help', 0, 0, '', '', -1),
(37, 'system', 'main', 'businessclass', 1, -17, 'content', 0, 0, '', '', -1),
(38, 'system', 'main-menu', 'businessclass', 0, -17, '-1', 0, 0, '', '', -1),
(39, 'system', 'management', 'businessclass', 0, -16, '-1', 0, 0, '', '', -1),
(40, 'system', 'navigation', 'businessclass', 1, -11, 'sidebar_first', 0, 0, '', '', -1),
(41, 'system', 'powered-by', 'businessclass', 0, -15, '-1', 0, 0, '', '', -1),
(42, 'system', 'user-menu', 'businessclass', 0, -8, '-1', 0, 0, '', '', -1),
(43, 'user', 'login', 'businessclass', 1, -18, 'sidebar_first', 0, 1, '<front>', '', -1),
(44, 'user', 'new', 'businessclass', 0, -7, '-1', 0, 0, '', '', 1),
(45, 'user', 'online', 'businessclass', 0, -6, '-1', 0, 0, '', '', -1),
(46, 'comment', 'recent', 'garland', 0, 0, '-1', 0, 0, '', '', 1),
(47, 'node', 'recent', 'garland', 0, 0, '-1', 0, 0, '', '', 1),
(48, 'node', 'syndicate', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(49, 'search', 'form', 'garland', 1, -1, 'sidebar_first', 0, 0, '', '', -1),
(50, 'shortcut', 'shortcuts', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(51, 'system', 'help', 'garland', 1, 0, 'help', 0, 0, '', '', -1),
(52, 'system', 'main', 'garland', 1, 0, 'content', 0, 0, '', '', -1),
(53, 'system', 'main-menu', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(54, 'system', 'management', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(55, 'system', 'navigation', 'garland', 1, -8, 'sidebar_first', 0, 0, '', '', -1),
(56, 'system', 'powered-by', 'garland', 1, -8, 'footer', 0, 0, '', '', -1),
(57, 'system', 'user-menu', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(58, 'user', 'login', 'garland', 1, -7, 'sidebar_first', 0, 1, '<front>', '', -1),
(59, 'user', 'new', 'garland', 0, 0, '-1', 0, 0, '', '', 1),
(60, 'user', 'online', 'garland', 0, 0, '-1', 0, 0, '', '', -1),
(61, 'nice_menus', '1', 'bartik', 0, 0, '-1', 0, 0, '', '<none>', -1),
(62, 'nice_menus', '2', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(63, 'nice_menus', '1', 'businessclass', 1, -8, 'navigation', 0, 0, '', '<none>', -1),
(64, 'nice_menus', '2', 'businessclass', 0, -7, '-1', 0, 0, '', '', -1),
(65, 'nice_menus', '1', 'seven', 0, 0, '-1', 0, 0, '', '<none>', -1),
(66, 'nice_menus', '2', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(67, 'block', '1', 'bartik', 0, 0, '-1', 0, 1, 'contact*\r\nnode/1', 'Contact Info', -1),
(68, 'block', '1', 'businessclass', 1, -17, 'sidebar_first', 0, 1, 'contact*\r\nnode/1', 'Contact Info', -1),
(69, 'block', '1', 'seven', 0, 0, '-1', 0, 1, 'contact*\r\nnode/1', 'Contact Info', -1),
(70, 'block', '2', 'bartik', 0, 0, '-1', 0, 1, 'contact*\r\nnode/1', 'Our location', -1),
(71, 'block', '2', 'businessclass', 1, -16, 'sidebar_first', 0, 1, 'contact*\r\nnode/1', 'Our location', -1),
(72, 'block', '2', 'seven', 0, 0, '-1', 0, 1, 'contact*\r\nnode/1', 'Our location', -1),
(73, 'blog', 'recent', 'bartik', 0, 0, '-1', 0, 0, '', '', 1),
(74, 'blog', 'recent', 'businessclass', 0, -14, '-1', 0, 0, '', '', 1),
(75, 'blog', 'recent', 'seven', 1, 0, 'dashboard_inactive', 0, 0, '', '', 1),
(76, 'menu', 'menu-browse', 'businessclass', 1, -18, 'footer_first', 0, 0, '', '', -1),
(77, 'menu', 'menu-browse', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(78, 'menu', 'menu-browse', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(79, 'views', 'archive-block', 'businessclass', 1, -12, 'sidebar_first', 0, 0, 'contact*\r\n<front>', '', -1),
(80, 'views', 'latest_blogposts-block_1', 'businessclass', 1, -16, 'footer_second', 0, 0, '', '', -1),
(81, 'menu', 'menu-footer-menu', 'businessclass', 1, -17, 'footer_first', 0, 0, '', '<none>', -1),
(82, 'menu', 'menu-footer-menu', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(83, 'menu', 'menu-footer-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(84, 'block', '3', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(85, 'block', '3', 'businessclass', 1, -16, 'footer', 0, 0, '', '', -1),
(86, 'block', '3', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(87, 'block', '4', 'bartik', 0, 0, '-1', 0, 0, '', 'Connect with us', -1),
(88, 'block', '4', 'businessclass', 1, -18, 'footer_third', 0, 0, '', 'Connect with us', -1),
(89, 'block', '4', 'seven', 0, 0, '-1', 0, 0, '', 'Connect with us', -1),
(90, 'views', 'latest_blogposts-block_1', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(91, 'views', 'archive-block', 'bartik', 0, 0, '-1', 0, 0, 'contact*\r\n<front>', '', -1),
(92, 'views', 'latest_blogposts-block_1', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(93, 'views', 'archive-block', 'seven', 0, 0, '-1', 0, 0, 'contact*\r\n<front>', '', -1),
(94, 'views', 'slideshow-block_1', 'businessclass', 1, -9, 'banner', 0, 1, '<front>', '', -1),
(95, 'views', 'slideshow-block_1', 'bartik', 0, 0, '-1', 0, 1, '<front>', '', -1),
(96, 'views', 'slideshow-block_1', 'seven', 0, 0, '-1', 0, 1, '<front>', '', -1),
(97, 'views', 'latest_products-block_1', 'businessclass', 1, -14, 'sidebar_first', 0, 0, 'contact*\r\n<front>', '', -1),
(98, 'views', 'latest_products-block_1', 'bartik', 0, 0, '-1', 0, 0, 'contact*\r\n<front>', '', -1),
(99, 'views', 'latest_products-block_1', 'seven', 0, 0, '-1', 0, 0, 'contact*\r\n<front>', '', -1),
(100, 'views', 'latest_posts-block_1', 'businessclass', 1, -15, 'sidebar_first', 0, 0, 'contact*\r\nproducts\r\nnode/4\r\nnode/5\r\n<front>', '', -1),
(101, 'views', 'latest_posts-block_1', 'bartik', 0, 0, '-1', 0, 0, 'contact*\r\nproducts\r\nnode/4\r\nnode/5\r\n<front>', '', -1),
(102, 'views', 'latest_posts-block_1', 'seven', 0, 0, '-1', 0, 0, 'contact*\r\nproducts\r\nnode/4\r\nnode/5\r\n<front>', '', -1),
(103, 'views', 'promoted_posts-block_1', 'bartik', 0, 0, '-1', 0, 1, '<front>', '', -1),
(104, 'views', 'promoted_posts-block_1', 'businessclass', 1, -15, 'promoted', 0, 1, '<front>', '', -1),
(105, 'views', 'promoted_posts-block_1', 'seven', 0, 0, '-1', 0, 1, '<front>', '', -1),
(106, 'block', '5', 'bartik', 0, 0, '-1', 0, 1, '<front>', '', -1),
(107, 'block', '5', 'businessclass', 1, -18, 'highlighted', 0, 1, '<front>', '', -1),
(108, 'block', '5', 'seven', 0, 0, '-1', 0, 1, '<front>', '', -1),
(109, 'block', '6', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(110, 'block', '6', 'businessclass', 1, -18, 'header', 0, 0, '', '', -1),
(111, 'block', '6', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(112, 'menu', 'menu-subfooter-menu', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(113, 'menu', 'menu-subfooter-menu', 'businessclass', 0, -10, '-1', 0, 0, '', '', -1),
(114, 'menu', 'menu-subfooter-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(115, 'views', 'testimonials-block_1', 'businessclass', 1, -13, 'sidebar_first', 0, 0, '<front>', '', -1),
(116, 'views', 'testimonials-block_1', 'bartik', 0, 0, '-1', 0, 0, '<front>', '', -1),
(117, 'views', 'testimonials-block_1', 'seven', 0, 0, '-1', 0, 0, '<front>', '', -1),
(118, 'mtt_twitter', 'latest_tweets', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(119, 'mtt_twitter', 'latest_tweets', 'businessclass', 1, -17, 'footer_third', 0, 0, '', '', -1),
(120, 'mtt_twitter', 'latest_tweets', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(121, 'block', '7', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(122, 'block', '7', 'businessclass', 1, -16, 'footer_third', 0, 0, '', '', -1),
(123, 'block', '7', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(124, 'views', 'promoted_posts_2columns-block_1', 'businessclass', 0, -18, '-1', 0, 1, '<front>', '', -1),
(125, 'views', 'promoted_posts_2columns-block_1', 'bartik', 0, 0, '-1', 0, 1, '<front>', '', -1),
(126, 'views', 'promoted_posts_2columns-block_1', 'seven', 0, 0, '-1', 0, 1, '<front>', '', -1);

-- --------------------------------------------------------

--
-- Table structure for table `block_custom`
--

DROP TABLE IF EXISTS `block_custom`;
CREATE TABLE IF NOT EXISTS `block_custom` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The block’s block.bid.',
  `body` longtext COMMENT 'Block contents.',
  `info` varchar(128) NOT NULL DEFAULT '' COMMENT 'Block description.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the block body.',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores contents of custom-made blocks.' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `block_custom`
--

INSERT INTO `block_custom` (`bid`, `body`, `info`, `format`) VALUES
(1, 'Pasadena, CA\r\nUnited States\r\n\r\nTel: +1 (921) 428-0365\r\nFax: +1 (921) 428-0362\r\n\r\nemail: <a>info@businessclass.com</a>\r\nskype: <a>businessclass</a>', 'Contact info', 'full_html'),
(2, '<div class="shadow-medium">\r\n<img class="masked" src="<?php print base_path();?>sites/default/files/map.jpg"/>\r\n </div>', 'Our location', 'php_code'),
(3, '<div>Copyright © 2011 <strong>Business</strong>Class.com. All rights reserved.</div>', 'Footer message', 'full_html'),
(4, 'Stay updated with news, offers and more.\r\n<ul class="social-bookmarks">\r\n<li class="twitter"><a href="http://twitter.com/morethanthemes"></a></li>\r\n<li class="facebook"><a href="http://www.facebook.com/pages/More-than-just-themes/194842423863081"></a></li>\r\n<li class="linkedin"><a href="#"></a></li>\r\n<li class="delicious"><a href="#"></a></li>\r\n<li class="rss"><a href="rss.xml"></a></li>\r\n</ul>', 'Connect with us', 'full_html'),
(5, '<div id="intro">\r\nPraesent dictum auctor augue, a ultricies justo dignissim ac nulla facilisi, donec mattis nibh vitae metus hendrerit vel pharetra turpis convallis.\r\n</div>', 'Intro message', 'full_html'),
(6, '<ul class="company-info">\r\n<li class="phone">1-800-Business-Class</li>\r\n<li class="email">info@businessclass.com</li>\r\n</ul>', 'Header company info', 'full_html'),
(7, '<div id="subscription-block">\r\n\r\n<div class="subscription-title">Subscribe to our newsletter</div>\r\n\r\n<div class="content">\r\n<form id="subscription-block-form" action="#">\r\n<div class="container-inline">\r\n<div class="form-item form-type-textfield">\r\n<input type="text" onblur="if (this.value == '''') {this.value = ''Enter your email address'';}" onfocus="if (this.value == ''Enter your email address'') {this.value = '''';}" name="search_block_form" value="Enter your email address" class="form-text">\r\n</div>\r\n\r\n<div class="form-actions">\r\n<input type="submit" name="submit" value="Submit" class="form-submit">\r\n</div>\r\n</div>\r\n</form>\r\n</div>\r\n\r\n</div>', 'Subscription form', 'full_html');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique comment ID.',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid to which this comment is a reply. If set to 0, this comment is not a reply to an existing comment.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid to which this comment is a reply.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid who authored the comment. If set to 0, this comment was created by an anonymous user.',
  `subject` varchar(64) NOT NULL DEFAULT '' COMMENT 'The comment title.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The author’s host name.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was created, as a Unix timestamp.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was last edited, as a Unix timestamp.',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The published status of a comment. (0 = Not Published, 1 = Published)',
  `thread` varchar(255) NOT NULL COMMENT 'The vancode representation of the comment’s place in a thread.',
  `name` varchar(60) DEFAULT NULL COMMENT 'The comment author’s name. Uses users.name if the user is logged in, otherwise uses the value typed into the comment form.',
  `mail` varchar(64) DEFAULT NULL COMMENT 'The comment author’s e-mail address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'The comment author’s home page address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this comment.',
  PRIMARY KEY (`cid`),
  KEY `comment_status_pid` (`pid`,`status`),
  KEY `comment_num_new` (`nid`,`status`,`created`,`cid`,`thread`),
  KEY `comment_uid` (`uid`),
  KEY `comment_nid_language` (`nid`,`language`),
  KEY `comment_created` (`created`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores comments and associated data.' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`cid`, `pid`, `nid`, `uid`, `subject`, `hostname`, `created`, `changed`, `status`, `thread`, `name`, `mail`, `homepage`, `language`) VALUES
(1, 0, 2, 1, 'Ut enim ad minim veniam', '127.0.0.1', 1314195597, 1314195597, 1, '01/', 'admin', '', '', 'und'),
(2, 1, 2, 1, 'Lorem ipsum dosectetur', '127.0.0.1', 1314195638, 1314195638, 1, '01.00/', 'admin', '', '', 'und'),
(3, 0, 10, 1, 'Ut enim ad minim veniam', '192.168.250.24', 1315646479, 1315646479, 1, '01/', 'admin', '', '', 'und'),
(4, 3, 10, 1, 'Lorem ipsum dosectetur', '192.168.250.24', 1315646555, 1315646555, 1, '01.00/', 'admin', '', '', 'und');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique category ID.',
  `category` varchar(255) NOT NULL DEFAULT '' COMMENT 'Category name.',
  `recipients` longtext NOT NULL COMMENT 'Comma-separated list of recipient e-mail addresses.',
  `reply` longtext NOT NULL COMMENT 'Text of the auto-reply message.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The category’s weight.',
  `selected` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether or not category is selected by default. (1 = Yes, 0 = No)',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `category` (`category`),
  KEY `list` (`weight`,`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Contact form category settings.' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`cid`, `category`, `recipients`, `reply`, `weight`, `selected`) VALUES
(1, 'Website feedback', 'george@morethanthemes.com', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_config`
--

DROP TABLE IF EXISTS `field_config`;
CREATE TABLE IF NOT EXISTS `field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field',
  `field_name` varchar(32) NOT NULL COMMENT 'The name of this field. Non-deleted field names are unique, but multiple deleted fields can have the same name.',
  `type` varchar(128) NOT NULL COMMENT 'The type of this field.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the field type.',
  `active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the field type is enabled.',
  `storage_type` varchar(128) NOT NULL COMMENT 'The storage backend for the field.',
  `storage_module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the storage backend.',
  `storage_active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the storage backend is enabled.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '@TODO',
  `data` longblob NOT NULL COMMENT 'Serialized data containing the field properties that do not warrant a dedicated column.',
  `cardinality` tinyint(4) NOT NULL DEFAULT '0',
  `translatable` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_name` (`field_name`),
  KEY `active` (`active`),
  KEY `storage_active` (`storage_active`),
  KEY `deleted` (`deleted`),
  KEY `module` (`module`),
  KEY `storage_module` (`storage_module`),
  KEY `type` (`type`),
  KEY `storage_type` (`storage_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `field_config`
--

INSERT INTO `field_config` (`id`, `field_name`, `type`, `module`, `active`, `storage_type`, `storage_module`, `storage_active`, `locked`, `data`, `cardinality`, `translatable`, `deleted`) VALUES
(1, 'comment_body', 'text_long', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a363a7b733a31323a22656e746974795f7479706573223b613a313a7b693a303b733a373a22636f6d6d656e74223b7d733a31323a227472616e736c617461626c65223b623a303b733a383a2273657474696e6773223b613a303a7b7d733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d733a31323a22666f726569676e206b657973223b613a313a7b733a363a22666f726d6174223b613a323a7b733a353a227461626c65223b733a31333a2266696c7465725f666f726d6174223b733a373a22636f6c756d6e73223b613a313a7b733a363a22666f726d6174223b733a363a22666f726d6174223b7d7d7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d7d, 1, 0, 0),
(2, 'body', 'text_with_summary', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a363a7b733a31323a22656e746974795f7479706573223b613a313a7b693a303b733a343a226e6f6465223b7d733a31323a227472616e736c617461626c65223b623a303b733a383a2273657474696e6773223b613a303a7b7d733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d733a31323a22666f726569676e206b657973223b613a313a7b733a363a22666f726d6174223b613a323a7b733a353a227461626c65223b733a31333a2266696c7465725f666f726d6174223b733a373a22636f6c756d6e73223b613a313a7b733a363a22666f726d6174223b733a363a22666f726d6174223b7d7d7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d7d, 1, 0, 0),
(3, 'field_tags', 'taxonomy_term_reference', 'taxonomy', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a383a2273657474696e6773223b613a313a7b733a31343a22616c6c6f7765645f76616c756573223b613a313a7b693a303b613a323a7b733a31303a22766f636162756c617279223b733a343a2274616773223b733a363a22706172656e74223b693a303b7d7d7d733a31323a22656e746974795f7479706573223b613a303a7b7d733a31323a227472616e736c617461626c65223b733a313a2230223b733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32313a226669656c645f646174615f6669656c645f74616773223b613a313a7b733a333a22746964223b733a31343a226669656c645f746167735f746964223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a32353a226669656c645f7265766973696f6e5f6669656c645f74616773223b613a313a7b733a333a22746964223b733a31343a226669656c645f746167735f746964223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a333a22746964223b613a323a7b733a353a227461626c65223b733a31383a227461786f6e6f6d795f7465726d5f64617461223b733a373a22636f6c756d6e73223b613a313a7b733a333a22746964223b733a333a22746964223b7d7d7d733a373a22696e6465786573223b613a313a7b733a333a22746964223b613a313a7b693a303b733a333a22746964223b7d7d733a323a226964223b733a313a2233223b7d, -1, 0, 0),
(4, 'field_image', 'image', 'image', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a373a22696e6465786573223b613a313a7b733a333a22666964223b613a313a7b693a303b733a333a22666964223b7d7d733a383a2273657474696e6773223b613a323a7b733a31303a227572695f736368656d65223b733a363a227075626c6963223b733a31333a2264656661756c745f696d616765223b693a303b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32323a226669656c645f646174615f6669656c645f696d616765223b613a333a7b733a333a22666964223b733a31353a226669656c645f696d6167655f666964223b733a333a22616c74223b733a31353a226669656c645f696d6167655f616c74223b733a353a227469746c65223b733a31373a226669656c645f696d6167655f7469746c65223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a32363a226669656c645f7265766973696f6e5f6669656c645f696d616765223b613a333a7b733a333a22666964223b733a31353a226669656c645f696d6167655f666964223b733a333a22616c74223b733a31353a226669656c645f696d6167655f616c74223b733a353a227469746c65223b733a31373a226669656c645f696d6167655f7469746c65223b7d7d7d7d7d733a31323a22656e746974795f7479706573223b613a303a7b7d733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22666f726569676e206b657973223b613a313a7b733a333a22666964223b613a323a7b733a353a227461626c65223b733a31323a2266696c655f6d616e61676564223b733a373a22636f6c756d6e73223b613a313a7b733a333a22666964223b733a333a22666964223b7d7d7d733a323a226964223b733a313a2234223b7d, -1, 0, 0),
(7, 'field_teaser_image', 'image', 'image', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a323a7b733a31303a227572695f736368656d65223b733a363a227075626c6963223b733a31333a2264656661756c745f696d616765223b693a303b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32393a226669656c645f646174615f6669656c645f7465617365725f696d616765223b613a333a7b733a333a22666964223b733a32323a226669656c645f7465617365725f696d6167655f666964223b733a333a22616c74223b733a32323a226669656c645f7465617365725f696d6167655f616c74223b733a353a227469746c65223b733a32343a226669656c645f7465617365725f696d6167655f7469746c65223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a33333a226669656c645f7265766973696f6e5f6669656c645f7465617365725f696d616765223b613a333a7b733a333a22666964223b733a32323a226669656c645f7465617365725f696d6167655f666964223b733a333a22616c74223b733a32323a226669656c645f7465617365725f696d6167655f616c74223b733a353a227469746c65223b733a32343a226669656c645f7465617365725f696d6167655f7469746c65223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a333a22666964223b613a323a7b733a353a227461626c65223b733a31323a2266696c655f6d616e61676564223b733a373a22636f6c756d6e73223b613a313a7b733a333a22666964223b733a333a22666964223b7d7d7d733a373a22696e6465786573223b613a313a7b733a333a22666964223b613a313a7b693a303b733a333a22666964223b7d7d733a323a226964223b733a313a2237223b7d, 1, 0, 0),
(8, 'field_subtitle', 'text_with_summary', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a303a7b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32353a226669656c645f646174615f6669656c645f7375627469746c65223b613a333a7b733a353a2276616c7565223b733a32303a226669656c645f7375627469746c655f76616c7565223b733a373a2273756d6d617279223b733a32323a226669656c645f7375627469746c655f73756d6d617279223b733a363a22666f726d6174223b733a32313a226669656c645f7375627469746c655f666f726d6174223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a32393a226669656c645f7265766973696f6e5f6669656c645f7375627469746c65223b613a333a7b733a353a2276616c7565223b733a32303a226669656c645f7375627469746c655f76616c7565223b733a373a2273756d6d617279223b733a32323a226669656c645f7375627469746c655f73756d6d617279223b733a363a22666f726d6174223b733a32313a226669656c645f7375627469746c655f666f726d6174223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a363a22666f726d6174223b613a323a7b733a353a227461626c65223b733a31333a2266696c7465725f666f726d6174223b733a373a22636f6c756d6e73223b613a313a7b733a363a22666f726d6174223b733a363a22666f726d6174223b7d7d7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d733a323a226964223b733a313a2238223b7d, 1, 0, 0),
(9, 'field_teaser', 'text_with_summary', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a303a7b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32333a226669656c645f646174615f6669656c645f746561736572223b613a333a7b733a353a2276616c7565223b733a31383a226669656c645f7465617365725f76616c7565223b733a373a2273756d6d617279223b733a32303a226669656c645f7465617365725f73756d6d617279223b733a363a22666f726d6174223b733a31393a226669656c645f7465617365725f666f726d6174223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a32373a226669656c645f7265766973696f6e5f6669656c645f746561736572223b613a333a7b733a353a2276616c7565223b733a31383a226669656c645f7465617365725f76616c7565223b733a373a2273756d6d617279223b733a32303a226669656c645f7465617365725f73756d6d617279223b733a363a22666f726d6174223b733a31393a226669656c645f7465617365725f666f726d6174223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a363a22666f726d6174223b613a323a7b733a353a227461626c65223b733a31333a2266696c7465725f666f726d6174223b733a373a22636f6c756d6e73223b613a313a7b733a363a22666f726d6174223b733a363a22666f726d6174223b7d7d7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d733a323a226964223b733a313a2239223b7d, 1, 0, 0),
(10, 'field_slideshow', 'list_boolean', 'list', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a323a7b733a31343a22616c6c6f7765645f76616c756573223b613a323a7b693a303b733a333a226f6666223b693a313b733a323a226f6e223b7d733a32333a22616c6c6f7765645f76616c7565735f66756e6374696f6e223b733a303a22223b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32363a226669656c645f646174615f6669656c645f736c69646573686f77223b613a313a7b733a353a2276616c7565223b733a32313a226669656c645f736c69646573686f775f76616c7565223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a33303a226669656c645f7265766973696f6e5f6669656c645f736c69646573686f77223b613a313a7b733a353a2276616c7565223b733a32313a226669656c645f736c69646573686f775f76616c7565223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a303a7b7d733a373a22696e6465786573223b613a313a7b733a353a2276616c7565223b613a313a7b693a303b733a353a2276616c7565223b7d7d733a323a226964223b733a323a223130223b7d, 1, 0, 0),
(11, 'field_slideshow_entry_path', 'text', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a313a7b733a31303a226d61785f6c656e677468223b733a333a22323535223b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a33373a226669656c645f646174615f6669656c645f736c69646573686f775f656e7472795f70617468223b613a323a7b733a353a2276616c7565223b733a33323a226669656c645f736c69646573686f775f656e7472795f706174685f76616c7565223b733a363a22666f726d6174223b733a33333a226669656c645f736c69646573686f775f656e7472795f706174685f666f726d6174223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a34313a226669656c645f7265766973696f6e5f6669656c645f736c69646573686f775f656e7472795f70617468223b613a323a7b733a353a2276616c7565223b733a33323a226669656c645f736c69646573686f775f656e7472795f706174685f76616c7565223b733a363a22666f726d6174223b733a33333a226669656c645f736c69646573686f775f656e7472795f706174685f666f726d6174223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a363a22666f726d6174223b613a323a7b733a353a227461626c65223b733a31333a2266696c7465725f666f726d6174223b733a373a22636f6c756d6e73223b613a313a7b733a363a22666f726d6174223b733a363a22666f726d6174223b7d7d7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d733a323a226964223b733a323a223131223b7d, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_config_instance`
--

DROP TABLE IF EXISTS `field_config_instance`;
CREATE TABLE IF NOT EXISTS `field_config_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field instance',
  `field_id` int(11) NOT NULL COMMENT 'The identifier of the field attached by this instance',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `entity_type` varchar(32) NOT NULL DEFAULT '',
  `bundle` varchar(128) NOT NULL DEFAULT '',
  `data` longblob NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_name_bundle` (`field_name`,`entity_type`,`bundle`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `field_config_instance`
--

INSERT INTO `field_config_instance` (`id`, `field_id`, `field_name`, `entity_type`, `bundle`, `data`, `deleted`) VALUES
(1, 1, 'comment_body', 'comment', 'comment_node_page', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(2, 2, 'body', 'node', 'page', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b693a2d343b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b693a3630303b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(3, 1, 'comment_body', 'comment', 'comment_node_article', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(4, 2, 'body', 'node', 'article', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b693a2d343b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b693a3630303b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(5, 3, 'field_tags', 'node', 'article', 0x613a363a7b733a353a226c6162656c223b733a343a2254616773223b733a31313a226465736372697074696f6e223b733a36333a22456e746572206120636f6d6d612d736570617261746564206c697374206f6620776f72647320746f20646573637269626520796f757220636f6e74656e742e223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32313a227461786f6e6f6d795f6175746f636f6d706c657465223b733a363a22776569676874223b693a2d343b733a383a2273657474696e6773223b613a323a7b733a343a2273697a65223b693a36303b733a31373a226175746f636f6d706c6574655f70617468223b733a32313a227461786f6e6f6d792f6175746f636f6d706c657465223b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b693a31303b733a353a226c6162656c223b733a353a2261626f7665223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d733a363a22746561736572223b613a353a7b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b693a31303b733a353a226c6162656c223b733a353a2261626f7665223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a303b7d, 0),
(6, 4, 'field_image', 'node', 'article', 0x613a363a7b733a353a226c6162656c223b733a353a22496d616765223b733a31313a226465736372697074696f6e223b733a34303a2255706c6f616420616e20696d61676520746f20676f207769746820746869732061727469636c652e223b733a383a227265717569726564223b623a303b733a383a2273657474696e6773223b613a383a7b733a31343a2266696c655f6469726563746f7279223b733a31313a226669656c642f696d616765223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b623a313b733a31313a227469746c655f6669656c64223b733a303a22223b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b7d733a363a22776569676874223b693a2d313b733a363a226d6f64756c65223b733a353a22696d616765223b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a353a22696d616765223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a353a226c61726765223b733a31303a22696d6167655f6c696e6b223b733a303a22223b7d733a363a22776569676874223b693a2d313b733a363a226d6f64756c65223b733a353a22696d616765223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a353a22696d616765223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a363a226d656469756d223b733a31303a22696d6167655f6c696e6b223b733a373a22636f6e74656e74223b7d733a363a22776569676874223b693a2d313b733a363a226d6f64756c65223b733a353a22696d616765223b7d7d7d, 0),
(7, 1, 'comment_body', 'comment', 'comment_node_blog', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(8, 2, 'body', 'node', 'blog', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b733a313a2231223b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b733a333a22343030223b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(9, 4, 'field_image', 'node', 'blog', 0x613a363a7b733a353a226c6162656c223b733a353a22496d616765223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2232223b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b7d7d733a383a2273657474696e6773223b613a383a7b733a31343a2266696c655f6469726563746f7279223b733a303a22223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b693a313b733a31313a227469746c655f6669656c64223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a353a22696d616765223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a353a226c61726765223b733a31303a22696d6167655f6c696e6b223b733a303a22223b7d733a363a226d6f64756c65223b733a353a22696d616765223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a353a22696d616765223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a363a226d656469756d223b733a31303a22696d6167655f6c696e6b223b733a373a22636f6e74656e74223b7d733a363a226d6f64756c65223b733a353a22696d616765223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(10, 3, 'field_tags', 'node', 'blog', 0x613a373a7b733a353a226c6162656c223b733a343a2254616773223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2233223b733a343a2274797065223b733a32313a227461786f6e6f6d795f6175746f636f6d706c657465223b733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b733a363a22616374697665223b693a303b733a383a2273657474696e6773223b613a323a7b733a343a2273697a65223b693a36303b733a31373a226175746f636f6d706c6574655f70617468223b733a32313a227461786f6e6f6d792f6175746f636f6d706c657465223b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b733a313a2232223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b733a313a2232223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(11, 1, 'comment_body', 'comment', 'comment_node_mt_product', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(12, 2, 'body', 'node', 'mt_product', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b733a313a2232223b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b733a333a22343030223b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(13, 4, 'field_image', 'node', 'mt_product', 0x613a363a7b733a353a226c6162656c223b733a363a22496d61676573223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2231223b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b7d7d733a383a2273657474696e6773223b613a383a7b733a31343a2266696c655f6469726563746f7279223b733a303a22223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b693a313b733a31313a227469746c655f6669656c64223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a353a22696d616765223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a303a22223b733a31303a22696d6167655f6c696e6b223b733a303a22223b7d733a363a226d6f64756c65223b733a353a22696d616765223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a353a22696d616765223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a363a226d656469756d223b733a31303a22696d6167655f6c696e6b223b733a373a22636f6e74656e74223b7d733a363a226d6f64756c65223b733a353a22696d616765223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(14, 3, 'field_tags', 'node', 'mt_product', 0x613a373a7b733a353a226c6162656c223b733a343a2254616773223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2233223b733a343a2274797065223b733a32313a227461786f6e6f6d795f6175746f636f6d706c657465223b733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b733a363a22616374697665223b693a303b733a383a2273657474696e6773223b613a323a7b733a343a2273697a65223b693a36303b733a31373a226175746f636f6d706c6574655f70617468223b733a32313a227461786f6e6f6d792f6175746f636f6d706c657465223b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b733a313a2232223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b733a313a2232223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(17, 7, 'field_teaser_image', 'node', 'mt_product', 0x613a363a7b733a353a226c6162656c223b733a31323a2254656173657220696d616765223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2235223b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b7d7d733a383a2273657474696e6773223b613a383a7b733a31343a2266696c655f6469726563746f7279223b733a303a22223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b693a313b733a31313a227469746c655f6669656c64223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2233223b733a383a2273657474696e6773223b613a303a7b7d7d733a363a22746561736572223b613a343a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2234223b733a383a2273657474696e6773223b613a303a7b7d7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(18, 1, 'comment_body', 'comment', 'comment_node_mt_testimonial', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(19, 2, 'body', 'node', 'mt_testimonial', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b733a313a2232223b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b693a3630303b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(20, 8, 'field_subtitle', 'node', 'mt_testimonial', 0x613a373a7b733a353a226c6162656c223b733a383a225375627469746c65223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2231223b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a363a226d6f64756c65223b733a343a2274657874223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b733a313a2232223b733a31323a2273756d6d6172795f726f7773223b693a353b7d7d733a383a2273657474696e6773223b613a333a7b733a31353a22746578745f70726f63657373696e67223b733a313a2231223b733a31353a22646973706c61795f73756d6d617279223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(21, 9, 'field_teaser', 'node', 'mt_product', 0x613a373a7b733a353a226c6162656c223b733a31313a225465617365722074657874223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2236223b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a363a226d6f64756c65223b733a343a2274657874223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b733a313a2232223b733a31323a2273756d6d6172795f726f7773223b693a353b7d7d733a383a2273657474696e6773223b613a333a7b733a31353a22746578745f70726f63657373696e67223b733a313a2231223b733a31353a22646973706c61795f73756d6d617279223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2234223b733a383a2273657474696e6773223b613a303a7b7d7d733a363a22746561736572223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2235223b733a383a2273657474696e6773223b613a303a7b7d7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(22, 10, 'field_slideshow', 'node', 'mt_product', 0x613a373a7b733a353a226c6162656c223b733a32313a2250726f6d6f746564206f6e20736c69646573686f77223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2234223b733a343a2274797065223b733a31333a226f7074696f6e735f6f6e6f6666223b733a363a226d6f64756c65223b733a373a226f7074696f6e73223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a313a7b733a31333a22646973706c61795f6c6162656c223b693a313b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2235223b733a383a2273657474696e6773223b613a303a7b7d7d733a363a22746561736572223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2233223b733a383a2273657474696e6773223b613a303a7b7d7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a35313a2253656c6563742074686973206f7074696f6e20746f2070726f6d6f74652070726f6475637420696e20736c69646573686f772e223b733a31333a2264656661756c745f76616c7565223b613a313a7b693a303b613a313a7b733a353a2276616c7565223b693a303b7d7d7d, 0),
(23, 1, 'comment_body', 'comment', 'comment_node_mt_service', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(24, 2, 'body', 'node', 'mt_service', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b733a313a2232223b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b733a333a22343030223b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(25, 3, 'field_tags', 'node', 'mt_service', 0x613a373a7b733a353a226c6162656c223b733a343a2254616773223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2233223b733a343a2274797065223b733a32313a227461786f6e6f6d795f6175746f636f6d706c657465223b733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b733a363a22616374697665223b693a303b733a383a2273657474696e6773223b613a323a7b733a343a2273697a65223b693a36303b733a31373a226175746f636f6d706c6574655f70617468223b733a32313a227461786f6e6f6d792f6175746f636f6d706c657465223b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b733a313a2232223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b733a313a2232223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(26, 4, 'field_image', 'node', 'mt_service', 0x613a363a7b733a353a226c6162656c223b733a363a22496d61676573223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2231223b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b7d7d733a383a2273657474696e6773223b613a383a7b733a31343a2266696c655f6469726563746f7279223b733a303a22223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b693a313b733a31313a227469746c655f6669656c64223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a353a22696d616765223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a353a226c61726765223b733a31303a22696d6167655f6c696e6b223b733a373a22636f6e74656e74223b7d733a363a226d6f64756c65223b733a353a22696d616765223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a353a22696d616765223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a363a226d656469756d223b733a31303a22696d6167655f6c696e6b223b733a373a22636f6e74656e74223b7d733a363a226d6f64756c65223b733a353a22696d616765223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(27, 10, 'field_slideshow', 'node', 'mt_service', 0x613a373a7b733a353a226c6162656c223b733a32313a2250726f6d6f746564206f6e20736c69646573686f77223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2235223b733a343a2274797065223b733a31333a226f7074696f6e735f6f6e6f6666223b733a363a226d6f64756c65223b733a373a226f7074696f6e73223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a313a7b733a31333a22646973706c61795f6c6162656c223b693a313b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2235223b733a383a2273657474696e6773223b613a303a7b7d7d733a363a22746561736572223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2235223b733a383a2273657474696e6773223b613a303a7b7d7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a35313a2253656c6563742074686973206f7074696f6e20746f2070726f6d6f7465207365727669636520696e20736c69646573686f772e223b733a31333a2264656661756c745f76616c7565223b613a313a7b693a303b613a313a7b733a353a2276616c7565223b693a303b7d7d7d, 0),
(28, 7, 'field_teaser_image', 'node', 'mt_service', 0x613a363a7b733a353a226c6162656c223b733a31323a2254656173657220696d616765223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2237223b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b7d7d733a383a2273657474696e6773223b613a383a7b733a31343a2266696c655f6469726563746f7279223b733a303a22223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b693a313b733a31313a227469746c655f6669656c64223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2233223b733a383a2273657474696e6773223b613a303a7b7d7d733a363a22746561736572223b613a343a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2234223b733a383a2273657474696e6773223b613a303a7b7d7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(29, 9, 'field_teaser', 'node', 'mt_service', 0x613a373a7b733a353a226c6162656c223b733a31313a225465617365722074657874223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2239223b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a363a226d6f64756c65223b733a343a2274657874223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b733a313a2232223b733a31323a2273756d6d6172795f726f7773223b693a353b7d7d733a383a2273657474696e6773223b613a333a7b733a31353a22746578745f70726f63657373696e67223b733a313a2231223b733a31353a22646973706c61795f73756d6d617279223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2234223b733a383a2273657474696e6773223b613a303a7b7d7d733a363a22746561736572223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2233223b733a383a2273657474696e6773223b613a303a7b7d7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(30, 7, 'field_teaser_image', 'node', 'blog', 0x613a363a7b733a353a226c6162656c223b733a31323a2254656173657220696d616765223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2235223b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b7d7d733a383a2273657474696e6773223b613a383a7b733a31343a2266696c655f6469726563746f7279223b733a303a22223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b693a313b733a31313a227469746c655f6669656c64223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2234223b733a383a2273657474696e6773223b613a303a7b7d7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(31, 9, 'field_teaser', 'node', 'blog', 0x613a373a7b733a353a226c6162656c223b733a31313a225465617365722074657874223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2236223b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a363a226d6f64756c65223b733a343a2274657874223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b733a313a2232223b733a31323a2273756d6d6172795f726f7773223b693a353b7d7d733a383a2273657474696e6773223b613a333a7b733a31353a22746578745f70726f63657373696e67223b733a313a2231223b733a31353a22646973706c61795f73756d6d617279223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2233223b733a383a2273657474696e6773223b613a303a7b7d7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(32, 10, 'field_slideshow', 'node', 'blog', 0x613a373a7b733a353a226c6162656c223b733a32313a2250726f6d6f746564206f6e20736c69646573686f77223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2234223b733a343a2274797065223b733a31333a226f7074696f6e735f6f6e6f6666223b733a363a226d6f64756c65223b733a373a226f7074696f6e73223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a313a7b733a31333a22646973706c61795f6c6162656c223b693a313b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2235223b733a383a2273657474696e6773223b613a303a7b7d7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a35343a2253656c6563742074686973206f7074696f6e20746f2070726f6d6f746520626c6f6720656e74727920696e20736c69646573686f772e223b733a31333a2264656661756c745f76616c7565223b613a313a7b693a303b613a313a7b733a353a2276616c7565223b693a303b7d7d7d, 0),
(33, 1, 'comment_body', 'comment', 'comment_node_mt_slideshow_entry', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(35, 7, 'field_teaser_image', 'node', 'mt_slideshow_entry', 0x613a363a7b733a353a226c6162656c223b733a32313a22536c69646573686f7720656e74727920696d616765223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2231223b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b7d7d733a383a2273657474696e6773223b613a383a7b733a31343a2266696c655f6469726563746f7279223b733a303a22223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b693a313b733a31313a227469746c655f6669656c64223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a353a22696d616765223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a353a226c61726765223b733a31303a22696d6167655f6c696e6b223b733a303a22223b7d733a363a226d6f64756c65223b733a353a22696d616765223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(36, 10, 'field_slideshow', 'node', 'mt_slideshow_entry', 0x613a373a7b733a353a226c6162656c223b733a32313a2250726f6d6f746564206f6e20736c69646573686f77223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2234223b733a343a2274797065223b733a31333a226f7074696f6e735f6f6e6f6666223b733a363a226d6f64756c65223b733a373a226f7074696f6e73223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a313a7b733a31333a22646973706c61795f6c6162656c223b693a313b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a31323a226c6973745f64656661756c74223b733a363a22776569676874223b733a313a2233223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a226c697374223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b613a313a7b693a303b613a313a7b733a353a2276616c7565223b693a313b7d7d7d, 0),
(37, 9, 'field_teaser', 'node', 'mt_slideshow_entry', 0x613a373a7b733a353a226c6162656c223b733a32303a22536c69646573686f7720656e7472792074657874223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2233223b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a363a226d6f64756c65223b733a343a2274657874223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b733a313a2232223b733a31323a2273756d6d6172795f726f7773223b693a353b7d7d733a383a2273657474696e6773223b613a333a7b733a31353a22746578745f70726f63657373696e67223b733a313a2231223b733a31353a22646973706c61795f73756d6d617279223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b733a313a2232223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(38, 11, 'field_slideshow_entry_path', 'node', 'mt_slideshow_entry', 0x613a373a7b733a353a226c6162656c223b733a32303a22536c69646573686f7720656e7472792070617468223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2232223b733a343a2274797065223b733a31343a22746578745f746578746669656c64223b733a363a226d6f64756c65223b733a343a2274657874223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a313a7b733a343a2273697a65223b733a323a223630223b7d7d733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b733a313a2230223b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a3133333a22546865207061746820666f72207468697320736c69646573686f7720656e7472792e20546869732063616e20626520616e20696e7465726e616c2044727570616c20706174682073756368206173206e6f64652f616464206f7220616e2065787465726e616c2055524c207375636820617320687474703a2f2f64727570616c2e6f72672e223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_body`
--

DROP TABLE IF EXISTS `field_data_body`;
CREATE TABLE IF NOT EXISTS `field_data_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 2 (body)';

--
-- Dumping data for table `field_data_body`
--

INSERT INTO `field_data_body` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `body_value`, `body_summary`, `body_format`) VALUES
('node', 'page', 0, 1, 1, 'und', 0, '<div class="team-member">\r\n<div class="team-member-picture">\r\n<img class="masked" src="<?php print base_path();?>sites/default/files/ceo.jpg"/>\r\n</div>\r\n\r\n<h2>Helen Taylor</h2>\r\n<div class="team-member-title">\r\nPresident & CEO\r\n</div>\r\n\r\n<div class="team-member-description">\r\n<p>Praesent interdum eleifend consectetur. Nunc felis metus, elementum a eleifend non, placerat ut ipsum. Sed cursus interdum sem, ac commodo turpis. <span class="team-member-email"><a href="#">helen.taylor@businessclass.com</span></a></p>\r\n</div>\r\n</div>\r\n\r\n<div class="team-member">\r\n<div class="team-member-picture">\r\n<img class="masked" src="<?php print base_path();?>sites/default/files/cto.jpg"/>\r\n</div>\r\n\r\n<h2>Jack Flannagan</h2>\r\n<div class="team-member-title">\r\nChief Technology Officer\r\n</div>\r\n<div class="team-member-description">\r\n<p>Praesent interdum eleifend consectetur. Nunc felis metus, elementum a eleifend non, placerat ut ipsum. Sed cursus interdum sem, ac commodo turpis. <span class="team-member-email"><a href="#">jack.flannagan@businessclass.com</a></span></p>\r\n</div>\r\n</div>\r\n\r\n<div class="team-member">\r\n<div class="team-member-picture">\r\n<img class="masked" src="<?php print base_path();?>sites/default/files/cfo.jpg"/>\r\n</div>\r\n\r\n<h2>Jovanna Babeyeva</h2>\r\n<div class="team-member-title">\r\nChief Financial Officer\r\n</div>\r\n<div class="team-member-description">\r\n<p>Praesent interdum eleifend consectetur. Nunc felis metus, elementum a eleifend non, placerat ut ipsum. Sed cursus interdum sem, ac commodo turpis. <span class="team-member-email"><a href="#">jovanna.babeyeva@businessclass.com</a></span></p> \r\n</div>\r\n</div>\r\n\r\n<div class="team-member">\r\n<div class="team-member-picture">\r\n<img class="masked" src="<?php print base_path();?>sites/default/files/vp.jpg"/>\r\n</div>\r\n\r\n<h2>David Daniel</h2>\r\n<div class="team-member-title">\r\nVP, Marketing & Sales\r\n</div>\r\n<div class="team-member-description">\r\n<p>Praesent interdum eleifend consectetur. Nunc felis metus, elementum a eleifend non, placerat ut ipsum. Sed cursus interdum sem, ac commodo turpis. <span class="team-member-email"><a href="#">david.daniel@businessclass.com</a></span></p>\r\n</div>\r\n</div>\r\n', '', 'php_code'),
('node', 'blog', 0, 2, 2, 'und', 0, '<h2>Eiusmod Tempor</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</blockquote>', '', 'full_html'),
('node', 'blog', 0, 3, 3, 'und', 0, '<h2>Dolore Magna</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</blockquote>', '', 'full_html'),
('node', 'mt_product', 0, 4, 4, 'und', 0, '<h2>Architecto Elit</h2>   \r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco...</blockquote>\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '', 'full_html'),
('node', 'mt_product', 0, 5, 5, 'und', 0, '<h2>Architecto Elit</h2>   \r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco...</blockquote>\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '', 'full_html'),
('node', 'page', 0, 6, 6, 'und', 0, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n\r\n<blockquote>"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</blockquote>\r\n\r\n<h2>Header 2</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2><a href="#">Linked Header 2</a></h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h3>Header 3</h3>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h4>Header 4</h4>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2>Code snippet</h2>\r\n\r\n<code>#header h1 a <br />\r\ndisplay: block;<br />\r\nheight: 80px;<br />\r\nwidth: 300px;<br />\r\n</code>\r\n\r\n<h2>Messages</h2>\r\n\r\n<div class="messages status">Sample status message. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>\r\n<div class="messages error">Sample error message. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>\r\n<div class="messages warning">Sample warning message. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>\r\n\r\n<h2>Paragraph With Links</h2>\r\n<p>Lorem ipsum dolor sit amet, <a href="#">consectetuer adipiscing</a> elit. Donec odio. Quisque volutpat mattis eros. <a href="#">Nullam malesuada</a> erat ut turpis. Suspendisse urna nibh, viverra 			non, semper suscipit, posuere a, pede.</p>\r\n\r\n<h2>Ordered List</h2>\r\n<ol>\r\n<li>This is a sample <strong>Ordered List</strong>.</li>\r\n<li>Lorem ipsum dolor sit amet consectetuer.</li>\r\n<li>Condimentum quis.</li>\r\n<li>Congue Quisque augue elit dolor.\r\n<ol>\r\n<li>Something goes here.</li>\r\n<li>And another here</li>\r\n<li>Then one more</li>\r\n</ol>\r\n</li>\r\n<li>Congue Quisque augue elit dolor nibh.</li>\r\n</ol>\r\n\r\n<h2>Unordered List</h2>\r\n<ul>\r\n<li>This is a sample <strong>Unordered List</strong>.</li>\r\n<li>Condimentum quis.</li>\r\n<li>Congue Quisque augue elit dolor.\r\n<ul>\r\n<li>Something goes here.</li>\r\n<li>And another here\r\n<ul>\r\n<li>Something here as well</li>      \r\n<li>Something here as well</li>\r\n<li>Something here as well</li>\r\n</ul>\r\n</li>\r\n<li>Then one more</li>\r\n</ul>\r\n</li>\r\n<li>Nunc cursus sem et pretium sapien eget.</li>\r\n</ul>\r\n\r\n<h2>Fieldset</h2>\r\n<fieldset> <legend>Account information</legend> </fieldset>\r\n\r\n<h2>Table</h2>\r\n\r\n<table border="1">\r\n\r\n<tr>\r\n<th>Header 1</th>\r\n<th>Header 2</th>\r\n</tr>\r\n\r\n<tr class="odd">\r\n<td>row 1, cell 1</td>\r\n<td>row 1, cell 2</td>\r\n</tr>\r\n\r\n<tr class="even">\r\n<td>row 2, cell 1</td>\r\n<td>row 2, cell 2</td>\r\n</tr>\r\n\r\n<tr class="odd">\r\n<td>row 3, cell 1</td>\r\n<td>row 3, cell 2</td>\r\n</tr>\r\n\r\n</table>', '', 'full_html'),
('node', 'mt_testimonial', 0, 7, 7, 'und', 0, '“Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim minim veniam nisi...”', '', 'full_html'),
('node', 'mt_testimonial', 0, 8, 8, 'und', 0, '“Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim minim veniam nisi...”', '', 'full_html'),
('node', 'blog', 0, 10, 10, 'und', 0, '<h2>Minim Veniam</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</blockquote>', '', 'full_html'),
('node', 'mt_service', 0, 11, 11, 'und', 0, '<h2>Architecto Elit</h2>   \r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco...</blockquote>\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '', 'full_html'),
('node', 'mt_service', 0, 12, 12, 'und', 0, '<h2>Laboris Esse</h2>   \r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco...</blockquote>\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '', 'full_html');

-- --------------------------------------------------------

--
-- Table structure for table `field_data_comment_body`
--

DROP TABLE IF EXISTS `field_data_comment_body`;
CREATE TABLE IF NOT EXISTS `field_data_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 1 (comment_body)';

--
-- Dumping data for table `field_data_comment_body`
--

INSERT INTO `field_data_comment_body` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `comment_body_value`, `comment_body_format`) VALUES
('comment', 'comment_node_blog', 0, 1, 1, 'und', 0, 'Ut enim ad minim veniam. Lorem ipsum dosectetur sed do!', 'filtered_html'),
('comment', 'comment_node_blog', 0, 2, 2, 'und', 0, 'Ut enim ad minim veniam. Lorem ipsum dosectetur adipisicing elit, sed do. Vivamus mattis tincidunt dapibu ipsum dosectetur adipisicing elit, sed do.', 'filtered_html'),
('comment', 'comment_node_blog', 0, 3, 3, 'und', 0, 'Ut enim ad minim veniam. Lorem ipsum dosectetur sed do!', 'filtered_html'),
('comment', 'comment_node_blog', 0, 4, 4, 'und', 0, 'Ut enim ad minim veniam. Lorem ipsum dosectetur adipisicing elit, sed do. Vivamus mattis tincidunt dapibu ipsum dosectetur adipisicing elit, sed do.', 'filtered_html');

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_image`
--

DROP TABLE IF EXISTS `field_data_field_image`;
CREATE TABLE IF NOT EXISTS `field_data_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL,
  `field_image_title` varchar(1024) DEFAULT NULL,
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_image_fid` (`field_image_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 4 (field_image)';

--
-- Dumping data for table `field_data_field_image`
--

INSERT INTO `field_data_field_image` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_image_fid`, `field_image_alt`, `field_image_title`, `field_image_width`, `field_image_height`) VALUES
('node', 'blog', 0, 2, 2, 'und', 0, 1, '', '', 535, 225),
('node', 'blog', 0, 2, 2, 'und', 1, 58, '', '', 535, 225),
('node', 'blog', 0, 3, 3, 'und', 0, 2, '', '', 535, 225),
('node', 'mt_product', 0, 4, 4, 'und', 0, 8, '', '', 550, 300),
('node', 'mt_product', 0, 4, 4, 'und', 1, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat.', 550, 300),
('node', 'mt_product', 0, 4, 4, 'und', 2, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing.', 'Lorem ipsum dolor sit amet, consectetur adipiscing.', 550, 300),
('node', 'mt_product', 0, 4, 4, 'und', 3, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat.', 550, 300),
('node', 'mt_product', 0, 4, 4, 'und', 4, 9, '', '', 550, 300),
('node', 'mt_product', 0, 5, 5, 'und', 0, 27, '', '', 550, 300),
('node', 'mt_product', 0, 5, 5, 'und', 1, 26, '', '', 550, 300),
('node', 'mt_product', 0, 5, 5, 'und', 2, 25, '', '', 550, 300),
('node', 'blog', 0, 10, 10, 'und', 0, 53, '', '', 535, 225),
('node', 'mt_service', 0, 11, 11, 'und', 0, 37, 'Starter Service 1', 'Starter Service 1', 940, 395),
('node', 'mt_service', 0, 11, 11, 'und', 1, 41, 'Starter Service 2', 'Starter Service 2', 940, 395),
('node', 'mt_service', 0, 12, 12, 'und', 0, 39, 'Enterprise Service 1', 'Enterprise Service 1', 940, 395),
('node', 'mt_service', 0, 12, 12, 'und', 1, 40, 'Enterprise Service 2', 'Enterprise Service 2', 940, 395);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_slideshow`
--

DROP TABLE IF EXISTS `field_data_field_slideshow`;
CREATE TABLE IF NOT EXISTS `field_data_field_slideshow` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_slideshow_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_slideshow_value` (`field_slideshow_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 10 (field_slideshow)';

--
-- Dumping data for table `field_data_field_slideshow`
--

INSERT INTO `field_data_field_slideshow` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_slideshow_value`) VALUES
('node', 'blog', 0, 2, 2, 'und', 0, 1),
('node', 'blog', 0, 3, 3, 'und', 0, 0),
('node', 'mt_product', 0, 4, 4, 'und', 0, 1),
('node', 'mt_product', 0, 5, 5, 'und', 0, 1),
('node', 'blog', 0, 10, 10, 'und', 0, 0),
('node', 'mt_service', 0, 11, 11, 'und', 0, 1),
('node', 'mt_service', 0, 12, 12, 'und', 0, 0),
('node', 'mt_slideshow_entry', 0, 13, 13, 'und', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_slideshow_entry_path`
--

DROP TABLE IF EXISTS `field_data_field_slideshow_entry_path`;
CREATE TABLE IF NOT EXISTS `field_data_field_slideshow_entry_path` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_slideshow_entry_path_value` varchar(255) DEFAULT NULL,
  `field_slideshow_entry_path_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_slideshow_entry_path_format` (`field_slideshow_entry_path_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 11 (field_slideshow_entry_path)';

--
-- Dumping data for table `field_data_field_slideshow_entry_path`
--

INSERT INTO `field_data_field_slideshow_entry_path` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_slideshow_entry_path_value`, `field_slideshow_entry_path_format`) VALUES
('node', 'mt_slideshow_entry', 0, 13, 13, 'und', 0, 'node/6', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_subtitle`
--

DROP TABLE IF EXISTS `field_data_field_subtitle`;
CREATE TABLE IF NOT EXISTS `field_data_field_subtitle` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_subtitle_value` longtext,
  `field_subtitle_summary` longtext,
  `field_subtitle_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_subtitle_format` (`field_subtitle_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 8 (field_subtitle)';

--
-- Dumping data for table `field_data_field_subtitle`
--

INSERT INTO `field_data_field_subtitle` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_subtitle_value`, `field_subtitle_summary`, `field_subtitle_format`) VALUES
('node', 'mt_testimonial', 0, 7, 7, 'und', 0, '<em>Chief Information Officer</em>', '', 'filtered_html'),
('node', 'mt_testimonial', 0, 8, 8, 'und', 0, '<em>Chief Technology Officer</em>', '', 'filtered_html');

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_tags`
--

DROP TABLE IF EXISTS `field_data_field_tags`;
CREATE TABLE IF NOT EXISTS `field_data_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_tags_tid` (`field_tags_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 3 (field_tags)';

--
-- Dumping data for table `field_data_field_tags`
--

INSERT INTO `field_data_field_tags` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_tags_tid`) VALUES
('node', 'blog', 0, 2, 2, 'und', 0, 1),
('node', 'blog', 0, 2, 2, 'und', 1, 2),
('node', 'blog', 0, 3, 3, 'und', 0, 1),
('node', 'blog', 0, 3, 3, 'und', 1, 2),
('node', 'mt_product', 0, 4, 4, 'und', 0, 4),
('node', 'mt_product', 0, 5, 5, 'und', 0, 4),
('node', 'blog', 0, 10, 10, 'und', 0, 1),
('node', 'blog', 0, 10, 10, 'und', 1, 2),
('node', 'mt_service', 0, 11, 11, 'und', 0, 5),
('node', 'mt_service', 0, 12, 12, 'und', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_teaser`
--

DROP TABLE IF EXISTS `field_data_field_teaser`;
CREATE TABLE IF NOT EXISTS `field_data_field_teaser` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_teaser_value` longtext,
  `field_teaser_summary` longtext,
  `field_teaser_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_teaser_format` (`field_teaser_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 9 (field_teaser)';

--
-- Dumping data for table `field_data_field_teaser`
--

INSERT INTO `field_data_field_teaser` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_teaser_value`, `field_teaser_summary`, `field_teaser_format`) VALUES
('node', 'blog', 0, 2, 2, 'und', 0, 'Promote your blog post to the front-page slideshow', '', 'filtered_html'),
('node', 'mt_product', 0, 4, 4, 'und', 0, 'Celebrated Quality.', '', 'filtered_html'),
('node', 'mt_product', 0, 5, 5, 'und', 0, 'First Class Design and Implementation.', '', 'filtered_html'),
('node', 'mt_service', 0, 11, 11, 'und', 0, 'Enter your super-duper tagline here.', '', 'filtered_html'),
('node', 'mt_service', 0, 12, 12, 'und', 0, 'Enter your super-duper tagline here.', '', 'filtered_html');

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_teaser_image`
--

DROP TABLE IF EXISTS `field_data_field_teaser_image`;
CREATE TABLE IF NOT EXISTS `field_data_field_teaser_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_teaser_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_teaser_image_alt` varchar(512) DEFAULT NULL,
  `field_teaser_image_title` varchar(1024) DEFAULT NULL,
  `field_teaser_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_teaser_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_teaser_image_fid` (`field_teaser_image_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 7 (field_teaser_image)';

--
-- Dumping data for table `field_data_field_teaser_image`
--

INSERT INTO `field_data_field_teaser_image` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_teaser_image_fid`, `field_teaser_image_alt`, `field_teaser_image_title`, `field_teaser_image_width`, `field_teaser_image_height`) VALUES
('node', 'blog', 0, 2, 2, 'und', 0, 56, '', '', 940, 340),
('node', 'mt_product', 0, 4, 4, 'und', 0, 28, '', '', 940, 340),
('node', 'mt_product', 0, 5, 5, 'und', 0, 44, '', '', 940, 340),
('node', 'mt_service', 0, 11, 11, 'und', 0, 33, '', '', 940, 340),
('node', 'mt_service', 0, 12, 12, 'und', 0, 34, '', '', 940, 340),
('node', 'mt_slideshow_entry', 0, 13, 13, 'und', 0, 59, '', '', 940, 340);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_body`
--

DROP TABLE IF EXISTS `field_revision_body`;
CREATE TABLE IF NOT EXISTS `field_revision_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 2 (body)';

--
-- Dumping data for table `field_revision_body`
--

INSERT INTO `field_revision_body` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `body_value`, `body_summary`, `body_format`) VALUES
('node', 'page', 0, 1, 1, 'und', 0, '<div class="team-member">\r\n<div class="team-member-picture">\r\n<img class="masked" src="<?php print base_path();?>sites/default/files/ceo.jpg"/>\r\n</div>\r\n\r\n<h2>Helen Taylor</h2>\r\n<div class="team-member-title">\r\nPresident & CEO\r\n</div>\r\n\r\n<div class="team-member-description">\r\n<p>Praesent interdum eleifend consectetur. Nunc felis metus, elementum a eleifend non, placerat ut ipsum. Sed cursus interdum sem, ac commodo turpis. <span class="team-member-email"><a href="#">helen.taylor@businessclass.com</span></a></p>\r\n</div>\r\n</div>\r\n\r\n<div class="team-member">\r\n<div class="team-member-picture">\r\n<img class="masked" src="<?php print base_path();?>sites/default/files/cto.jpg"/>\r\n</div>\r\n\r\n<h2>Jack Flannagan</h2>\r\n<div class="team-member-title">\r\nChief Technology Officer\r\n</div>\r\n<div class="team-member-description">\r\n<p>Praesent interdum eleifend consectetur. Nunc felis metus, elementum a eleifend non, placerat ut ipsum. Sed cursus interdum sem, ac commodo turpis. <span class="team-member-email"><a href="#">jack.flannagan@businessclass.com</a></span></p>\r\n</div>\r\n</div>\r\n\r\n<div class="team-member">\r\n<div class="team-member-picture">\r\n<img class="masked" src="<?php print base_path();?>sites/default/files/cfo.jpg"/>\r\n</div>\r\n\r\n<h2>Jovanna Babeyeva</h2>\r\n<div class="team-member-title">\r\nChief Financial Officer\r\n</div>\r\n<div class="team-member-description">\r\n<p>Praesent interdum eleifend consectetur. Nunc felis metus, elementum a eleifend non, placerat ut ipsum. Sed cursus interdum sem, ac commodo turpis. <span class="team-member-email"><a href="#">jovanna.babeyeva@businessclass.com</a></span></p> \r\n</div>\r\n</div>\r\n\r\n<div class="team-member">\r\n<div class="team-member-picture">\r\n<img class="masked" src="<?php print base_path();?>sites/default/files/vp.jpg"/>\r\n</div>\r\n\r\n<h2>David Daniel</h2>\r\n<div class="team-member-title">\r\nVP, Marketing & Sales\r\n</div>\r\n<div class="team-member-description">\r\n<p>Praesent interdum eleifend consectetur. Nunc felis metus, elementum a eleifend non, placerat ut ipsum. Sed cursus interdum sem, ac commodo turpis. <span class="team-member-email"><a href="#">david.daniel@businessclass.com</a></span></p>\r\n</div>\r\n</div>\r\n', '', 'php_code'),
('node', 'blog', 0, 2, 2, 'und', 0, '<h2>Eiusmod Tempor</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</blockquote>', '', 'full_html'),
('node', 'blog', 0, 3, 3, 'und', 0, '<h2>Dolore Magna</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</blockquote>', '', 'full_html'),
('node', 'mt_product', 0, 4, 4, 'und', 0, '<h2>Architecto Elit</h2>   \r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco...</blockquote>\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '', 'full_html'),
('node', 'mt_product', 0, 5, 5, 'und', 0, '<h2>Architecto Elit</h2>   \r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco...</blockquote>\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '', 'full_html'),
('node', 'page', 0, 6, 6, 'und', 0, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>\r\n\r\n<blockquote>"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</blockquote>\r\n\r\n<h2>Header 2</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2><a href="#">Linked Header 2</a></h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h3>Header 3</h3>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h4>Header 4</h4>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\n<h2>Code snippet</h2>\r\n\r\n<code>#header h1 a <br />\r\ndisplay: block;<br />\r\nheight: 80px;<br />\r\nwidth: 300px;<br />\r\n</code>\r\n\r\n<h2>Messages</h2>\r\n\r\n<div class="messages status">Sample status message. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>\r\n<div class="messages error">Sample error message. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>\r\n<div class="messages warning">Sample warning message. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</div>\r\n\r\n<h2>Paragraph With Links</h2>\r\n<p>Lorem ipsum dolor sit amet, <a href="#">consectetuer adipiscing</a> elit. Donec odio. Quisque volutpat mattis eros. <a href="#">Nullam malesuada</a> erat ut turpis. Suspendisse urna nibh, viverra 			non, semper suscipit, posuere a, pede.</p>\r\n\r\n<h2>Ordered List</h2>\r\n<ol>\r\n<li>This is a sample <strong>Ordered List</strong>.</li>\r\n<li>Lorem ipsum dolor sit amet consectetuer.</li>\r\n<li>Condimentum quis.</li>\r\n<li>Congue Quisque augue elit dolor.\r\n<ol>\r\n<li>Something goes here.</li>\r\n<li>And another here</li>\r\n<li>Then one more</li>\r\n</ol>\r\n</li>\r\n<li>Congue Quisque augue elit dolor nibh.</li>\r\n</ol>\r\n\r\n<h2>Unordered List</h2>\r\n<ul>\r\n<li>This is a sample <strong>Unordered List</strong>.</li>\r\n<li>Condimentum quis.</li>\r\n<li>Congue Quisque augue elit dolor.\r\n<ul>\r\n<li>Something goes here.</li>\r\n<li>And another here\r\n<ul>\r\n<li>Something here as well</li>      \r\n<li>Something here as well</li>\r\n<li>Something here as well</li>\r\n</ul>\r\n</li>\r\n<li>Then one more</li>\r\n</ul>\r\n</li>\r\n<li>Nunc cursus sem et pretium sapien eget.</li>\r\n</ul>\r\n\r\n<h2>Fieldset</h2>\r\n<fieldset> <legend>Account information</legend> </fieldset>\r\n\r\n<h2>Table</h2>\r\n\r\n<table border="1">\r\n\r\n<tr>\r\n<th>Header 1</th>\r\n<th>Header 2</th>\r\n</tr>\r\n\r\n<tr class="odd">\r\n<td>row 1, cell 1</td>\r\n<td>row 1, cell 2</td>\r\n</tr>\r\n\r\n<tr class="even">\r\n<td>row 2, cell 1</td>\r\n<td>row 2, cell 2</td>\r\n</tr>\r\n\r\n<tr class="odd">\r\n<td>row 3, cell 1</td>\r\n<td>row 3, cell 2</td>\r\n</tr>\r\n\r\n</table>', '', 'full_html'),
('node', 'mt_testimonial', 0, 7, 7, 'und', 0, '“Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim minim veniam nisi...”', '', 'full_html'),
('node', 'mt_testimonial', 0, 8, 8, 'und', 0, '“Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim minim veniam nisi...”', '', 'full_html'),
('node', 'blog', 0, 10, 10, 'und', 0, '<h2>Minim Veniam</h2>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</blockquote>', '', 'full_html'),
('node', 'mt_service', 0, 11, 11, 'und', 0, '<h2>Architecto Elit</h2>   \r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco...</blockquote>\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '', 'full_html'),
('node', 'mt_service', 0, 12, 12, 'und', 0, '<h2>Laboris Esse</h2>   \r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <a href="#">labore et dolore</a> magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\r\n\r\n<blockquote>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco...</blockquote>\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', '', 'full_html');

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_comment_body`
--

DROP TABLE IF EXISTS `field_revision_comment_body`;
CREATE TABLE IF NOT EXISTS `field_revision_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 1 (comment_body)';

--
-- Dumping data for table `field_revision_comment_body`
--

INSERT INTO `field_revision_comment_body` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `comment_body_value`, `comment_body_format`) VALUES
('comment', 'comment_node_blog', 0, 1, 1, 'und', 0, 'Ut enim ad minim veniam. Lorem ipsum dosectetur sed do!', 'filtered_html'),
('comment', 'comment_node_blog', 0, 2, 2, 'und', 0, 'Ut enim ad minim veniam. Lorem ipsum dosectetur adipisicing elit, sed do. Vivamus mattis tincidunt dapibu ipsum dosectetur adipisicing elit, sed do.', 'filtered_html'),
('comment', 'comment_node_blog', 0, 3, 3, 'und', 0, 'Ut enim ad minim veniam. Lorem ipsum dosectetur sed do!', 'filtered_html'),
('comment', 'comment_node_blog', 0, 4, 4, 'und', 0, 'Ut enim ad minim veniam. Lorem ipsum dosectetur adipisicing elit, sed do. Vivamus mattis tincidunt dapibu ipsum dosectetur adipisicing elit, sed do.', 'filtered_html');

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_image`
--

DROP TABLE IF EXISTS `field_revision_field_image`;
CREATE TABLE IF NOT EXISTS `field_revision_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL,
  `field_image_title` varchar(1024) DEFAULT NULL,
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_image_fid` (`field_image_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 4 (field_image)';

--
-- Dumping data for table `field_revision_field_image`
--

INSERT INTO `field_revision_field_image` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_image_fid`, `field_image_alt`, `field_image_title`, `field_image_width`, `field_image_height`) VALUES
('node', 'blog', 0, 2, 2, 'und', 0, 1, '', '', 535, 225),
('node', 'blog', 0, 2, 2, 'und', 1, 58, '', '', 535, 225),
('node', 'blog', 0, 3, 3, 'und', 0, 2, '', '', 535, 225),
('node', 'mt_product', 0, 4, 4, 'und', 0, 8, '', '', 550, 300),
('node', 'mt_product', 0, 4, 4, 'und', 1, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat.', 550, 300),
('node', 'mt_product', 0, 4, 4, 'und', 2, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing.', 'Lorem ipsum dolor sit amet, consectetur adipiscing.', 550, 300),
('node', 'mt_product', 0, 4, 4, 'und', 3, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat.', 550, 300),
('node', 'mt_product', 0, 4, 4, 'und', 4, 9, '', '', 550, 300),
('node', 'mt_product', 0, 5, 5, 'und', 0, 27, '', '', 550, 300),
('node', 'mt_product', 0, 5, 5, 'und', 1, 26, '', '', 550, 300),
('node', 'mt_product', 0, 5, 5, 'und', 2, 25, '', '', 550, 300),
('node', 'blog', 0, 10, 10, 'und', 0, 53, '', '', 535, 225),
('node', 'mt_service', 0, 11, 11, 'und', 0, 37, 'Starter Service 1', 'Starter Service 1', 940, 395),
('node', 'mt_service', 0, 11, 11, 'und', 1, 41, 'Starter Service 2', 'Starter Service 2', 940, 395),
('node', 'mt_service', 0, 12, 12, 'und', 0, 39, 'Enterprise Service 1', 'Enterprise Service 1', 940, 395),
('node', 'mt_service', 0, 12, 12, 'und', 1, 40, 'Enterprise Service 2', 'Enterprise Service 2', 940, 395);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_slideshow`
--

DROP TABLE IF EXISTS `field_revision_field_slideshow`;
CREATE TABLE IF NOT EXISTS `field_revision_field_slideshow` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_slideshow_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_slideshow_value` (`field_slideshow_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 10 (field_slideshow)';

--
-- Dumping data for table `field_revision_field_slideshow`
--

INSERT INTO `field_revision_field_slideshow` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_slideshow_value`) VALUES
('node', 'blog', 0, 2, 2, 'und', 0, 1),
('node', 'blog', 0, 3, 3, 'und', 0, 0),
('node', 'mt_product', 0, 4, 4, 'und', 0, 1),
('node', 'mt_product', 0, 5, 5, 'und', 0, 1),
('node', 'blog', 0, 10, 10, 'und', 0, 0),
('node', 'mt_service', 0, 11, 11, 'und', 0, 1),
('node', 'mt_service', 0, 12, 12, 'und', 0, 0),
('node', 'mt_slideshow_entry', 0, 13, 13, 'und', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_slideshow_entry_path`
--

DROP TABLE IF EXISTS `field_revision_field_slideshow_entry_path`;
CREATE TABLE IF NOT EXISTS `field_revision_field_slideshow_entry_path` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_slideshow_entry_path_value` varchar(255) DEFAULT NULL,
  `field_slideshow_entry_path_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_slideshow_entry_path_format` (`field_slideshow_entry_path_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 11 (field_slideshow...';

--
-- Dumping data for table `field_revision_field_slideshow_entry_path`
--

INSERT INTO `field_revision_field_slideshow_entry_path` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_slideshow_entry_path_value`, `field_slideshow_entry_path_format`) VALUES
('node', 'mt_slideshow_entry', 0, 13, 13, 'und', 0, 'node/6', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_subtitle`
--

DROP TABLE IF EXISTS `field_revision_field_subtitle`;
CREATE TABLE IF NOT EXISTS `field_revision_field_subtitle` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_subtitle_value` longtext,
  `field_subtitle_summary` longtext,
  `field_subtitle_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_subtitle_format` (`field_subtitle_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 8 (field_subtitle)';

--
-- Dumping data for table `field_revision_field_subtitle`
--

INSERT INTO `field_revision_field_subtitle` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_subtitle_value`, `field_subtitle_summary`, `field_subtitle_format`) VALUES
('node', 'mt_testimonial', 0, 7, 7, 'und', 0, '<em>Chief Information Officer</em>', '', 'filtered_html'),
('node', 'mt_testimonial', 0, 8, 8, 'und', 0, '<em>Chief Technology Officer</em>', '', 'filtered_html');

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_tags`
--

DROP TABLE IF EXISTS `field_revision_field_tags`;
CREATE TABLE IF NOT EXISTS `field_revision_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_tags_tid` (`field_tags_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 3 (field_tags)';

--
-- Dumping data for table `field_revision_field_tags`
--

INSERT INTO `field_revision_field_tags` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_tags_tid`) VALUES
('node', 'blog', 0, 2, 2, 'und', 0, 1),
('node', 'blog', 0, 2, 2, 'und', 1, 2),
('node', 'blog', 0, 3, 3, 'und', 0, 1),
('node', 'blog', 0, 3, 3, 'und', 1, 2),
('node', 'mt_product', 0, 4, 4, 'und', 0, 4),
('node', 'mt_product', 0, 5, 5, 'und', 0, 4),
('node', 'blog', 0, 10, 10, 'und', 0, 1),
('node', 'blog', 0, 10, 10, 'und', 1, 2),
('node', 'mt_service', 0, 11, 11, 'und', 0, 5),
('node', 'mt_service', 0, 12, 12, 'und', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_teaser`
--

DROP TABLE IF EXISTS `field_revision_field_teaser`;
CREATE TABLE IF NOT EXISTS `field_revision_field_teaser` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_teaser_value` longtext,
  `field_teaser_summary` longtext,
  `field_teaser_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_teaser_format` (`field_teaser_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 9 (field_teaser)';

--
-- Dumping data for table `field_revision_field_teaser`
--

INSERT INTO `field_revision_field_teaser` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_teaser_value`, `field_teaser_summary`, `field_teaser_format`) VALUES
('node', 'blog', 0, 2, 2, 'und', 0, 'Promote your blog post to the front-page slideshow', '', 'filtered_html'),
('node', 'mt_product', 0, 4, 4, 'und', 0, 'Celebrated Quality.', '', 'filtered_html'),
('node', 'mt_product', 0, 5, 5, 'und', 0, 'First Class Design and Implementation.', '', 'filtered_html'),
('node', 'mt_service', 0, 11, 11, 'und', 0, 'Enter your super-duper tagline here.', '', 'filtered_html'),
('node', 'mt_service', 0, 12, 12, 'und', 0, 'Enter your super-duper tagline here.', '', 'filtered_html');

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_teaser_image`
--

DROP TABLE IF EXISTS `field_revision_field_teaser_image`;
CREATE TABLE IF NOT EXISTS `field_revision_field_teaser_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_teaser_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_teaser_image_alt` varchar(512) DEFAULT NULL,
  `field_teaser_image_title` varchar(1024) DEFAULT NULL,
  `field_teaser_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_teaser_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_teaser_image_fid` (`field_teaser_image_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 7 (field_teaser_image)';

--
-- Dumping data for table `field_revision_field_teaser_image`
--

INSERT INTO `field_revision_field_teaser_image` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_teaser_image_fid`, `field_teaser_image_alt`, `field_teaser_image_title`, `field_teaser_image_width`, `field_teaser_image_height`) VALUES
('node', 'blog', 0, 2, 2, 'und', 0, 56, '', '', 940, 340),
('node', 'mt_product', 0, 4, 4, 'und', 0, 28, '', '', 940, 340),
('node', 'mt_product', 0, 5, 5, 'und', 0, 44, '', '', 940, 340),
('node', 'mt_service', 0, 11, 11, 'und', 0, 33, '', '', 940, 340),
('node', 'mt_service', 0, 12, 12, 'und', 0, 34, '', '', 940, 340),
('node', 'mt_slideshow_entry', 0, 13, 13, 'und', 0, 59, '', '', 940, 340);

-- --------------------------------------------------------

--
-- Table structure for table `file_managed`
--

DROP TABLE IF EXISTS `file_managed`;
CREATE TABLE IF NOT EXISTS `file_managed` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'File ID.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who is associated with the file.',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'The URI to access the file (either local or remote).',
  `filemime` varchar(255) NOT NULL DEFAULT '' COMMENT 'The file’s MIME type.',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The size of the file in bytes.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp for when the file was added.',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `uri` (`uri`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores information for uploaded files.' AUTO_INCREMENT=60 ;

--
-- Dumping data for table `file_managed`
--

INSERT INTO `file_managed` (`fid`, `uid`, `filename`, `uri`, `filemime`, `filesize`, `status`, `timestamp`) VALUES
(1, 1, 'blogpost-1.jpg', 'public://blogpost-1.jpg', 'image/jpeg', 51221, 1, 1314076920),
(2, 1, 'blogpost-2.jpg', 'public://blogpost-2.jpg', 'image/jpeg', 51221, 1, 1314201729),
(5, 1, 'macbookpro-1.png', 'public://macbookpro-1.png', 'image/png', 123927, 1, 1314519957),
(6, 1, 'macbookpro-2.png', 'public://macbookpro-2.png', 'image/png', 49696, 1, 1314519957),
(7, 1, 'macbookpro-3.png', 'public://macbookpro-3.png', 'image/png', 119644, 1, 1314519957),
(8, 1, 'macbookpro-4.png', 'public://macbookpro-4.png', 'image/png', 106618, 1, 1314519957),
(9, 1, 'macbookpro-5.png', 'public://macbookpro-5.png', 'image/png', 158783, 1, 1314519957),
(25, 1, 'imac-1.png', 'public://imac-1.png', 'image/png', 138772, 1, 1314544404),
(26, 1, 'imac-2.png', 'public://imac-2.png', 'image/png', 116163, 1, 1314544404),
(27, 1, 'imac-3.png', 'public://imac-3.png', 'image/png', 28322, 1, 1314544404),
(28, 1, 'macbookpro-slide.png', 'public://macbookpro-slide.png', 'image/png', 363129, 1, 1314639605),
(33, 1, 'service-slide.jpg', 'public://service-slide.jpg', 'image/jpeg', 370295, 1, 1315481250),
(34, 1, 'service-2-slide.jpg', 'public://service-2-slide.jpg', 'image/jpeg', 43529, 1, 1315494017),
(37, 1, 'service-1-1.jpg', 'public://service-1-1.jpg', 'image/jpeg', 123488, 1, 1315578420),
(39, 1, 'service-2-1.jpg', 'public://service-2-1.jpg', 'image/jpeg', 49863, 1, 1315579177),
(40, 1, 'service-2-2.jpg', 'public://service-2-2.jpg', 'image/jpeg', 123488, 1, 1315579177),
(41, 1, 'service-1-2.jpg', 'public://service-1-2.jpg', 'image/jpeg', 49863, 1, 1315581034),
(44, 1, 'imac-slide.png', 'public://imac-slide.png', 'image/png', 212774, 1, 1315640179),
(53, 1, 'blogpost-3.jpg', 'public://blogpost-3.jpg', 'image/jpeg', 53862, 1, 1315642179),
(56, 1, 'blogpost-slide.jpg', 'public://blogpost-slide.jpg', 'image/jpeg', 137113, 1, 1316364237),
(58, 1, 'blogpost-1-1.jpg', 'public://blogpost-1-1.jpg', 'image/jpeg', 62013, 1, 1316425866),
(59, 1, 'slideshow-entry.png', 'public://slideshow-entry.png', 'image/png', 247186, 1, 1318674395);

-- --------------------------------------------------------

--
-- Table structure for table `file_usage`
--

DROP TABLE IF EXISTS `file_usage`;
CREATE TABLE IF NOT EXISTS `file_usage` (
  `fid` int(10) unsigned NOT NULL COMMENT 'File ID.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the module that is using the file.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'The name of the object type in which the file is used.',
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The primary key of the object using the file.',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The number of times this file is used by this object.',
  PRIMARY KEY (`fid`,`type`,`id`,`module`),
  KEY `type_id` (`type`,`id`),
  KEY `fid_count` (`fid`,`count`),
  KEY `fid_module` (`fid`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track where a file is used.';

--
-- Dumping data for table `file_usage`
--

INSERT INTO `file_usage` (`fid`, `module`, `type`, `id`, `count`) VALUES
(1, 'file', 'node', 2, 1),
(2, 'file', 'node', 3, 1),
(5, 'file', 'node', 4, 1),
(6, 'file', 'node', 4, 1),
(7, 'file', 'node', 4, 1),
(8, 'file', 'node', 4, 1),
(9, 'file', 'node', 4, 1),
(25, 'file', 'node', 5, 1),
(26, 'file', 'node', 5, 1),
(27, 'file', 'node', 5, 1),
(28, 'file', 'node', 4, 1),
(33, 'file', 'node', 11, 1),
(34, 'file', 'node', 12, 1),
(37, 'file', 'node', 11, 1),
(39, 'file', 'node', 12, 1),
(40, 'file', 'node', 12, 1),
(41, 'file', 'node', 11, 1),
(44, 'file', 'node', 5, 1),
(53, 'file', 'node', 10, 1),
(56, 'file', 'node', 2, 1),
(58, 'file', 'node', 2, 1),
(59, 'file', 'node', 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

DROP TABLE IF EXISTS `filter`;
CREATE TABLE IF NOT EXISTS `filter` (
  `format` varchar(255) NOT NULL COMMENT 'Foreign key: The filter_format.format to which this filter is assigned.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The origin module of the filter.',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Name of the filter being referenced.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of filter within format.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Filter enabled status. (1 = enabled, 0 = disabled)',
  `settings` longblob COMMENT 'A serialized array of name value pairs that store the filter settings for the specific format.',
  PRIMARY KEY (`format`,`name`),
  KEY `list` (`weight`,`module`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that maps filters (HTML corrector) to text formats ...';

--
-- Dumping data for table `filter`
--

INSERT INTO `filter` (`format`, `module`, `name`, `weight`, `status`, `settings`) VALUES
('filtered_html', 'filter', 'filter_autop', 2, 1, 0x613a303a7b7d),
('filtered_html', 'filter', 'filter_html', 1, 1, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d),
('filtered_html', 'filter', 'filter_htmlcorrector', 10, 1, 0x613a303a7b7d),
('filtered_html', 'filter', 'filter_html_escape', 10, 0, 0x613a303a7b7d),
('filtered_html', 'filter', 'filter_url', 0, 1, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b693a37323b7d),
('full_html', 'filter', 'filter_autop', 1, 1, 0x613a303a7b7d),
('full_html', 'filter', 'filter_html', 10, 0, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d),
('full_html', 'filter', 'filter_htmlcorrector', 10, 1, 0x613a303a7b7d),
('full_html', 'filter', 'filter_html_escape', 10, 0, 0x613a303a7b7d),
('full_html', 'filter', 'filter_url', 0, 1, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b693a37323b7d),
('php_code', 'filter', 'filter_autop', 10, 0, 0x613a303a7b7d),
('php_code', 'filter', 'filter_html', 10, 0, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d),
('php_code', 'filter', 'filter_htmlcorrector', 10, 0, 0x613a303a7b7d),
('php_code', 'filter', 'filter_html_escape', 10, 0, 0x613a303a7b7d),
('php_code', 'filter', 'filter_url', 10, 0, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b693a37323b7d),
('php_code', 'php', 'php_code', 0, 1, 0x613a303a7b7d),
('plain_text', 'filter', 'filter_autop', 2, 1, 0x613a303a7b7d),
('plain_text', 'filter', 'filter_html', 10, 0, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d),
('plain_text', 'filter', 'filter_htmlcorrector', 10, 0, 0x613a303a7b7d),
('plain_text', 'filter', 'filter_html_escape', 0, 1, 0x613a303a7b7d),
('plain_text', 'filter', 'filter_url', 1, 1, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b693a37323b7d);

-- --------------------------------------------------------

--
-- Table structure for table `filter_format`
--

DROP TABLE IF EXISTS `filter_format`;
CREATE TABLE IF NOT EXISTS `filter_format` (
  `format` varchar(255) NOT NULL COMMENT 'Primary Key: Unique machine name of the format.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the text format (Filtered HTML).',
  `cache` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether format is cacheable. (1 = cacheable, 0 = not cacheable)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The status of the text format. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of text format to use when listing.',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`),
  KEY `status_weight` (`status`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores text formats: custom groupings of filters, such as...';

--
-- Dumping data for table `filter_format`
--

INSERT INTO `filter_format` (`format`, `name`, `cache`, `status`, `weight`) VALUES
('filtered_html', 'Filtered HTML', 1, 1, 0),
('full_html', 'Full HTML', 1, 1, 1),
('php_code', 'PHP code', 0, 1, 11),
('plain_text', 'Plain text', 1, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `image_effects`
--

DROP TABLE IF EXISTS `image_effects`;
CREATE TABLE IF NOT EXISTS `image_effects` (
  `ieid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image effect.',
  `isid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The image_styles.isid for an image style.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the effect in the style.',
  `name` varchar(255) NOT NULL COMMENT 'The unique name of the effect to be executed.',
  `data` longblob NOT NULL COMMENT 'The configuration data for the effect.',
  PRIMARY KEY (`ieid`),
  KEY `isid` (`isid`),
  KEY `weight` (`weight`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image effects.' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `image_effects`
--

INSERT INTO `image_effects` (`ieid`, `isid`, `weight`, `name`, `data`) VALUES
(3, 2, 2, 'image_scale_and_crop', 0x613a323a7b733a353a227769647468223b733a333a22323636223b733a363a22686569676874223b733a333a22313435223b7d),
(5, 3, 1, 'image_scale_and_crop', 0x613a323a7b733a353a227769647468223b733a323a223632223b733a363a22686569676874223b733a323a223631223b7d),
(6, 4, 1, 'image_scale_and_crop', 0x613a323a7b733a353a227769647468223b733a333a22313035223b733a363a22686569676874223b733a323a223730223b7d),
(8, 6, 1, 'image_scale_and_crop', 0x613a323a7b733a353a227769647468223b733a333a22393430223b733a363a22686569676874223b733a333a22333430223b7d),
(9, 5, 1, 'image_scale_and_crop', 0x613a323a7b733a353a227769647468223b733a333a22353530223b733a363a22686569676874223b733a333a22333030223b7d),
(10, 1, 1, 'image_scale_and_crop', 0x613a323a7b733a353a227769647468223b733a333a22353335223b733a363a22686569676874223b733a333a22323235223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `image_styles`
--

DROP TABLE IF EXISTS `image_styles`;
CREATE TABLE IF NOT EXISTS `image_styles` (
  `isid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image style.',
  `name` varchar(255) NOT NULL COMMENT 'The style name.',
  PRIMARY KEY (`isid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image styles.' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `image_styles`
--

INSERT INTO `image_styles` (`isid`, `name`) VALUES
(1, 'large'),
(2, 'medium'),
(6, 'slideshow'),
(4, 'small'),
(3, 'thumbnail'),
(5, 'x-large');

-- --------------------------------------------------------

--
-- Table structure for table `menu_custom`
--

DROP TABLE IF EXISTS `menu_custom`;
CREATE TABLE IF NOT EXISTS `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique key for menu. This is used as a block delta so length is 32.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title; displayed at top of block.',
  `description` text COMMENT 'Menu description.',
  PRIMARY KEY (`menu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds definitions for top-level custom menus (for example...';

--
-- Dumping data for table `menu_custom`
--

INSERT INTO `menu_custom` (`menu_name`, `title`, `description`) VALUES
('main-menu', 'Main menu', 'The <em>Main</em> menu is used on many sites to show the major sections of the site, often in a top navigation bar.'),
('management', 'Management', 'The <em>Management</em> menu contains links for administrative tasks.'),
('menu-browse', 'Browse menu', 'Browse menu'),
('menu-footer-menu', 'Footer menu', 'Footer menu'),
('menu-subfooter-menu', 'Subfooter menu', 'Subfooter menu'),
('navigation', 'Navigation', 'The <em>Navigation</em> menu contains links intended for site visitors. Links are added to the <em>Navigation</em> menu automatically by some modules.'),
('user-menu', 'User menu', 'The <em>User</em> menu contains links related to the user''s account, as well as the ''Log out'' link.');

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

DROP TABLE IF EXISTS `menu_links`;
CREATE TABLE IF NOT EXISTS `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The menu name. All links with the same menu name (such as ’navigation’) are part of the same menu.',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The menu link ID (mlid) is the integer primary key.',
  `plid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The parent link ID (plid) is the mlid of the link above in the hierarchy, or zero if the link is at the top level in its menu.',
  `link_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path or external path this link points to.',
  `router_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'For links corresponding to a Drupal path (external = 0), this connects the link to a menu_router.path for joins.',
  `link_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The text displayed for the link, which may be modified by a title callback stored in menu_router.',
  `options` blob COMMENT 'A serialized array of options to be passed to the url() or l() function, such as a query string or HTML attributes.',
  `module` varchar(255) NOT NULL DEFAULT 'system' COMMENT 'The name of the module that generated this link.',
  `hidden` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag for whether the link should be rendered in menus. (1 = a disabled menu item that may be shown on admin screens, -1 = a menu callback, 0 = a normal, visible link)',
  `external` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate if the link points to a full URL starting with a protocol, like http:// (1 = external, 0 = internal).',
  `has_children` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag indicating whether any links have this link as a parent (1 = children exist, 0 = no children).',
  `expanded` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag for whether this link should be rendered as expanded in menus - expanded links always have their child links displayed, instead of only when the link is in the active trail (1 = expanded, 0 = not expanded)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Link weight among links in the same menu at the same depth.',
  `depth` smallint(6) NOT NULL DEFAULT '0' COMMENT 'The depth relative to the top level. A link with plid == 0 will have depth == 1.',
  `customized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate that the user has manually created or edited the link (1 = customized, 0 = not customized).',
  `p1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The first mlid in the materialized path. If N = depth, then pN must equal the mlid. If depth > 1 then p(N-1) must equal the plid. All pX where X > depth must equal zero. The columns p1 .. p9 are also called the parents.',
  `p2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The second mlid in the materialized path. See p1.',
  `p3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The third mlid in the materialized path. See p1.',
  `p4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The fourth mlid in the materialized path. See p1.',
  `p5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The fifth mlid in the materialized path. See p1.',
  `p6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sixth mlid in the materialized path. See p1.',
  `p7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The seventh mlid in the materialized path. See p1.',
  `p8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The eighth mlid in the materialized path. See p1.',
  `p9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The ninth mlid in the materialized path. See p1.',
  `updated` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag that indicates that this link was generated during the update from Drupal 5.',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Contains the individual links within a menu.' AUTO_INCREMENT=624 ;

--
-- Dumping data for table `menu_links`
--

INSERT INTO `menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('management', 1, 0, 'admin', 'admin', 'Administration', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 9, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 2, 0, 'user', 'user', 'User account', 0x613a313a7b733a353a22616c746572223b623a313b7d, 'system', 0, 0, 0, 0, -10, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 4, 0, 'filter/tips', 'filter/tips', 'Compose tips', 0x613a303a7b7d, 'system', 1, 0, 0, 0, 0, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 5, 0, 'node/%', 'node/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 6, 0, 'node/add', 'node/add', 'Add content', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 7, 1, 'admin/appearance', 'admin/appearance', 'Appearance', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33333a2253656c65637420616e6420636f6e66696775726520796f7572207468656d65732e223b7d7d, 'system', 0, 0, 0, 0, -6, 2, 0, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 8, 1, 'admin/config', 'admin/config', 'Configuration', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32303a2241646d696e69737465722073657474696e67732e223b7d7d, 'system', 0, 0, 1, 0, 0, 2, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 9, 1, 'admin/content', 'admin/content', 'Content', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33323a2241646d696e697374657220636f6e74656e7420616e6420636f6d6d656e74732e223b7d7d, 'system', 0, 0, 1, 0, -10, 2, 0, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 10, 2, 'user/register', 'user/register', 'Create new account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 11, 1, 'admin/dashboard', 'admin/dashboard', 'Dashboard', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33343a225669657720616e6420637573746f6d697a6520796f75722064617368626f6172642e223b7d7d, 'system', 0, 0, 0, 0, -15, 2, 0, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 12, 1, 'admin/help', 'admin/help', 'Help', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34383a225265666572656e636520666f722075736167652c20636f6e66696775726174696f6e2c20616e64206d6f64756c65732e223b7d7d, 'system', 0, 0, 0, 0, 9, 2, 0, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 13, 1, 'admin/index', 'admin/index', 'Index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -18, 2, 0, 1, 13, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 14, 2, 'user/login', 'user/login', 'Log in', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 14, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 15, 0, 'user/logout', 'user/logout', 'Log out', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 10, 1, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 16, 1, 'admin/modules', 'admin/modules', 'Modules', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32363a22457874656e6420736974652066756e6374696f6e616c6974792e223b7d7d, 'system', 0, 0, 0, 0, -2, 2, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 17, 0, 'user/%', 'user/%', 'My account', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 18, 1, 'admin/people', 'admin/people', 'People', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a224d616e6167652075736572206163636f756e74732c20726f6c65732c20616e64207065726d697373696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -4, 2, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 19, 1, 'admin/reports', 'admin/reports', 'Reports', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33343a2256696577207265706f7274732c20757064617465732c20616e64206572726f72732e223b7d7d, 'system', 0, 0, 1, 0, 5, 2, 0, 1, 19, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 20, 2, 'user/password', 'user/password', 'Request new password', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 20, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 21, 1, 'admin/structure', 'admin/structure', 'Structure', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a2241646d696e697374657220626c6f636b732c20636f6e74656e742074797065732c206d656e75732c206574632e223b7d7d, 'system', 0, 0, 1, 0, -8, 2, 0, 1, 21, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 22, 1, 'admin/tasks', 'admin/tasks', 'Tasks', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -20, 2, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 27, 0, 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 29, 18, 'admin/people/create', 'admin/people/create', 'Add user', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 18, 29, 0, 0, 0, 0, 0, 0, 0),
('management', 30, 21, 'admin/structure/block', 'admin/structure/block', 'Blocks', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37393a22436f6e666967757265207768617420626c6f636b20636f6e74656e74206170706561727320696e20796f75722073697465277320736964656261727320616e64206f7468657220726567696f6e732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 30, 0, 0, 0, 0, 0, 0, 0),
('navigation', 31, 17, 'user/%/cancel', 'user/%/cancel', 'Cancel account', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 2, 0, 17, 31, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 33, 11, 'admin/dashboard/configure', 'admin/dashboard/configure', 'Configure available dashboard blocks', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35333a22436f6e66696775726520776869636820626c6f636b732063616e2062652073686f776e206f6e207468652064617368626f6172642e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 11, 33, 0, 0, 0, 0, 0, 0, 0),
('management', 34, 9, 'admin/content/node', 'admin/content/node', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 3, 0, 1, 9, 34, 0, 0, 0, 0, 0, 0, 0),
('management', 35, 8, 'admin/config/content', 'admin/config/content', 'Content authoring', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35333a2253657474696e67732072656c6174656420746f20666f726d617474696e6720616e6420617574686f72696e6720636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, -15, 3, 0, 1, 8, 35, 0, 0, 0, 0, 0, 0, 0),
('management', 36, 21, 'admin/structure/types', 'admin/structure/types', 'Content types', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a39323a224d616e61676520636f6e74656e742074797065732c20696e636c7564696e672064656661756c74207374617475732c2066726f6e7420706167652070726f6d6f74696f6e2c20636f6d6d656e742073657474696e67732c206574632e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 36, 0, 0, 0, 0, 0, 0, 0),
('management', 37, 11, 'admin/dashboard/customize', 'admin/dashboard/customize', 'Customize dashboard', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32353a22437573746f6d697a6520796f75722064617368626f6172642e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 11, 37, 0, 0, 0, 0, 0, 0, 0),
('navigation', 38, 5, 'node/%/delete', 'node/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 2, 0, 5, 38, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 39, 8, 'admin/config/development', 'admin/config/development', 'Development', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31383a22446576656c6f706d656e7420746f6f6c732e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 39, 0, 0, 0, 0, 0, 0, 0),
('navigation', 40, 17, 'user/%/edit', 'user/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 17, 40, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 41, 5, 'node/%/edit', 'node/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 5, 41, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 42, 19, 'admin/reports/fields', 'admin/reports/fields', 'Field list', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33393a224f76657276696577206f66206669656c6473206f6e20616c6c20656e746974792074797065732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 42, 0, 0, 0, 0, 0, 0, 0),
('management', 43, 7, 'admin/appearance/list', 'admin/appearance/list', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33313a2253656c65637420616e6420636f6e66696775726520796f7572207468656d65223b7d7d, 'system', -1, 0, 0, 0, -1, 3, 0, 1, 7, 43, 0, 0, 0, 0, 0, 0, 0),
('management', 44, 16, 'admin/modules/list', 'admin/modules/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 16, 44, 0, 0, 0, 0, 0, 0, 0),
('management', 45, 18, 'admin/people/people', 'admin/people/people', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35303a2246696e6420616e64206d616e6167652070656f706c6520696e746572616374696e67207769746820796f757220736974652e223b7d7d, 'system', -1, 0, 0, 0, -10, 3, 0, 1, 18, 45, 0, 0, 0, 0, 0, 0, 0),
('management', 46, 8, 'admin/config/media', 'admin/config/media', 'Media', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31323a224d6564696120746f6f6c732e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 46, 0, 0, 0, 0, 0, 0, 0),
('management', 47, 21, 'admin/structure/menu', 'admin/structure/menu', 'Menus', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38363a22416464206e6577206d656e757320746f20796f757220736974652c2065646974206578697374696e67206d656e75732c20616e642072656e616d6520616e642072656f7267616e697a65206d656e75206c696e6b732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 47, 0, 0, 0, 0, 0, 0, 0),
('management', 48, 8, 'admin/config/people', 'admin/config/people', 'People', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32343a22436f6e6669677572652075736572206163636f756e74732e223b7d7d, 'system', 0, 0, 1, 0, -20, 3, 0, 1, 8, 48, 0, 0, 0, 0, 0, 0, 0),
('management', 49, 18, 'admin/people/permissions', 'admin/people/permissions', 'Permissions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36343a2244657465726d696e652061636365737320746f2066656174757265732062792073656c656374696e67207065726d697373696f6e7320666f7220726f6c65732e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 18, 49, 0, 0, 0, 0, 0, 0, 0),
('management', 50, 19, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log messages', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a2256696577206576656e74732074686174206861766520726563656e746c79206265656e206c6f676765642e223b7d7d, 'system', 0, 0, 0, 0, -1, 3, 0, 1, 19, 50, 0, 0, 0, 0, 0, 0, 0),
('management', 51, 8, 'admin/config/regional', 'admin/config/regional', 'Regional and language', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34383a22526567696f6e616c2073657474696e67732c206c6f63616c697a6174696f6e20616e64207472616e736c6174696f6e2e223b7d7d, 'system', 0, 0, 1, 0, -5, 3, 0, 1, 8, 51, 0, 0, 0, 0, 0, 0, 0),
('navigation', 52, 5, 'node/%/revisions', 'node/%/revisions', 'Revisions', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 2, 2, 0, 5, 52, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 53, 8, 'admin/config/search', 'admin/config/search', 'Search and metadata', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33363a224c6f63616c2073697465207365617263682c206d6574616461746120616e642053454f2e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 53, 0, 0, 0, 0, 0, 0, 0),
('management', 54, 7, 'admin/appearance/settings', 'admin/appearance/settings', 'Settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34363a22436f6e6669677572652064656661756c7420616e64207468656d652073706563696669632073657474696e67732e223b7d7d, 'system', -1, 0, 0, 0, 20, 3, 0, 1, 7, 54, 0, 0, 0, 0, 0, 0, 0),
('management', 55, 19, 'admin/reports/status', 'admin/reports/status', 'Status report', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37343a22476574206120737461747573207265706f72742061626f757420796f757220736974652773206f7065726174696f6e20616e6420616e792064657465637465642070726f626c656d732e223b7d7d, 'system', 0, 0, 0, 0, -60, 3, 0, 1, 19, 55, 0, 0, 0, 0, 0, 0, 0),
('management', 56, 8, 'admin/config/system', 'admin/config/system', 'System', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33373a2247656e6572616c2073797374656d2072656c6174656420636f6e66696775726174696f6e2e223b7d7d, 'system', 0, 0, 1, 0, -20, 3, 0, 1, 8, 56, 0, 0, 0, 0, 0, 0, 0),
('management', 57, 21, 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'Taxonomy', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36373a224d616e6167652074616767696e672c2063617465676f72697a6174696f6e2c20616e6420636c617373696669636174696f6e206f6620796f757220636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 57, 0, 0, 0, 0, 0, 0, 0),
('management', 58, 19, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33353a225669657720276163636573732064656e69656427206572726f7273202834303373292e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 58, 0, 0, 0, 0, 0, 0, 0),
('management', 59, 19, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33363a2256696577202770616765206e6f7420666f756e6427206572726f7273202834303473292e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 59, 0, 0, 0, 0, 0, 0, 0),
('management', 60, 16, 'admin/modules/uninstall', 'admin/modules/uninstall', 'Uninstall', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 20, 3, 0, 1, 16, 60, 0, 0, 0, 0, 0, 0, 0),
('management', 61, 8, 'admin/config/user-interface', 'admin/config/user-interface', 'User interface', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33383a22546f6f6c73207468617420656e68616e636520746865207573657220696e746572666163652e223b7d7d, 'system', 0, 0, 1, 0, -15, 3, 0, 1, 8, 61, 0, 0, 0, 0, 0, 0, 0),
('navigation', 62, 5, 'node/%/view', 'node/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 5, 62, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 63, 17, 'user/%/view', 'user/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 17, 63, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 64, 8, 'admin/config/services', 'admin/config/services', 'Web services', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33303a22546f6f6c732072656c6174656420746f207765622073657276696365732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 8, 64, 0, 0, 0, 0, 0, 0, 0),
('management', 65, 8, 'admin/config/workflow', 'admin/config/workflow', 'Workflow', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22436f6e74656e7420776f726b666c6f772c20656469746f7269616c20776f726b666c6f7720746f6f6c732e223b7d7d, 'system', 0, 0, 0, 0, 5, 3, 0, 1, 8, 65, 0, 0, 0, 0, 0, 0, 0),
('management', 66, 12, 'admin/help/block', 'admin/help/block', 'block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 66, 0, 0, 0, 0, 0, 0, 0),
('management', 67, 12, 'admin/help/color', 'admin/help/color', 'color', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 67, 0, 0, 0, 0, 0, 0, 0),
('management', 69, 12, 'admin/help/contextual', 'admin/help/contextual', 'contextual', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 69, 0, 0, 0, 0, 0, 0, 0),
('management', 70, 12, 'admin/help/dashboard', 'admin/help/dashboard', 'dashboard', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 70, 0, 0, 0, 0, 0, 0, 0),
('management', 71, 12, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 71, 0, 0, 0, 0, 0, 0, 0),
('management', 72, 12, 'admin/help/field', 'admin/help/field', 'field', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 72, 0, 0, 0, 0, 0, 0, 0),
('management', 73, 12, 'admin/help/field_sql_storage', 'admin/help/field_sql_storage', 'field_sql_storage', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 73, 0, 0, 0, 0, 0, 0, 0),
('management', 74, 12, 'admin/help/field_ui', 'admin/help/field_ui', 'field_ui', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 74, 0, 0, 0, 0, 0, 0, 0),
('management', 75, 12, 'admin/help/file', 'admin/help/file', 'file', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 75, 0, 0, 0, 0, 0, 0, 0),
('management', 76, 12, 'admin/help/filter', 'admin/help/filter', 'filter', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 76, 0, 0, 0, 0, 0, 0, 0),
('management', 77, 12, 'admin/help/help', 'admin/help/help', 'help', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 77, 0, 0, 0, 0, 0, 0, 0),
('management', 78, 12, 'admin/help/image', 'admin/help/image', 'image', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 78, 0, 0, 0, 0, 0, 0, 0),
('management', 79, 12, 'admin/help/list', 'admin/help/list', 'list', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 79, 0, 0, 0, 0, 0, 0, 0),
('management', 80, 12, 'admin/help/menu', 'admin/help/menu', 'menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 80, 0, 0, 0, 0, 0, 0, 0),
('management', 81, 12, 'admin/help/node', 'admin/help/node', 'node', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 81, 0, 0, 0, 0, 0, 0, 0),
('management', 82, 12, 'admin/help/options', 'admin/help/options', 'options', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 82, 0, 0, 0, 0, 0, 0, 0),
('management', 83, 12, 'admin/help/system', 'admin/help/system', 'system', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 83, 0, 0, 0, 0, 0, 0, 0),
('management', 84, 12, 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 84, 0, 0, 0, 0, 0, 0, 0),
('management', 85, 12, 'admin/help/text', 'admin/help/text', 'text', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 85, 0, 0, 0, 0, 0, 0, 0),
('management', 86, 12, 'admin/help/user', 'admin/help/user', 'user', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 86, 0, 0, 0, 0, 0, 0, 0),
('navigation', 87, 27, 'taxonomy/term/%/edit', 'taxonomy/term/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 2, 0, 27, 87, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 88, 27, 'taxonomy/term/%/view', 'taxonomy/term/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 27, 88, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 89, 48, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Account settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130393a22436f6e6669677572652064656661756c74206265686176696f72206f662075736572732c20696e636c7564696e6720726567697374726174696f6e20726571756972656d656e74732c20652d6d61696c732c206669656c64732c20616e6420757365722070696374757265732e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 48, 89, 0, 0, 0, 0, 0, 0),
('management', 90, 56, 'admin/config/system/actions', 'admin/config/system/actions', 'Actions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34313a224d616e6167652074686520616374696f6e7320646566696e656420666f7220796f757220736974652e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 56, 90, 0, 0, 0, 0, 0, 0),
('management', 91, 30, 'admin/structure/block/add', 'admin/structure/block/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 30, 91, 0, 0, 0, 0, 0, 0),
('management', 92, 36, 'admin/structure/types/add', 'admin/structure/types/add', 'Add content type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 36, 92, 0, 0, 0, 0, 0, 0),
('management', 93, 47, 'admin/structure/menu/add', 'admin/structure/menu/add', 'Add menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 47, 93, 0, 0, 0, 0, 0, 0),
('management', 94, 57, 'admin/structure/taxonomy/add', 'admin/structure/taxonomy/add', 'Add vocabulary', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 57, 94, 0, 0, 0, 0, 0, 0),
('management', 95, 54, 'admin/appearance/settings/bartik', 'admin/appearance/settings/bartik', 'Bartik', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 54, 95, 0, 0, 0, 0, 0, 0),
('management', 96, 53, 'admin/config/search/clean-urls', 'admin/config/search/clean-urls', 'Clean URLs', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22456e61626c65206f722064697361626c6520636c65616e2055524c7320666f7220796f757220736974652e223b7d7d, 'system', 0, 0, 0, 0, 5, 4, 0, 1, 8, 53, 96, 0, 0, 0, 0, 0, 0),
('management', 97, 56, 'admin/config/system/cron', 'admin/config/system/cron', 'Cron', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34303a224d616e616765206175746f6d617469632073697465206d61696e74656e616e6365207461736b732e223b7d7d, 'system', 0, 0, 0, 0, 20, 4, 0, 1, 8, 56, 97, 0, 0, 0, 0, 0, 0),
('management', 98, 51, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Date and time', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34343a22436f6e66696775726520646973706c617920666f726d61747320666f72206461746520616e642074696d652e223b7d7d, 'system', 0, 0, 0, 0, -15, 4, 0, 1, 8, 51, 98, 0, 0, 0, 0, 0, 0),
('management', 99, 19, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 99, 0, 0, 0, 0, 0, 0, 0),
('management', 100, 46, 'admin/config/media/file-system', 'admin/config/media/file-system', 'File system', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36383a2254656c6c2044727570616c20776865726520746f2073746f72652075706c6f616465642066696c657320616e6420686f772074686579206172652061636365737365642e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 46, 100, 0, 0, 0, 0, 0, 0),
('management', 101, 54, 'admin/appearance/settings/garland', 'admin/appearance/settings/garland', 'Garland', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 54, 101, 0, 0, 0, 0, 0, 0),
('management', 102, 54, 'admin/appearance/settings/global', 'admin/appearance/settings/global', 'Global settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -1, 4, 0, 1, 7, 54, 102, 0, 0, 0, 0, 0, 0),
('management', 103, 48, 'admin/config/people/ip-blocking', 'admin/config/people/ip-blocking', 'IP address blocking', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32383a224d616e61676520626c6f636b6564204950206164647265737365732e223b7d7d, 'system', 0, 0, 1, 0, 10, 4, 0, 1, 8, 48, 103, 0, 0, 0, 0, 0, 0),
('management', 104, 46, 'admin/config/media/image-styles', 'admin/config/media/image-styles', 'Image styles', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37383a22436f6e666967757265207374796c657320746861742063616e206265207573656420666f7220726573697a696e67206f722061646a757374696e6720696d61676573206f6e20646973706c61792e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 46, 104, 0, 0, 0, 0, 0, 0),
('management', 105, 46, 'admin/config/media/image-toolkit', 'admin/config/media/image-toolkit', 'Image toolkit', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37343a2243686f6f736520776869636820696d61676520746f6f6c6b697420746f2075736520696620796f75206861766520696e7374616c6c6564206f7074696f6e616c20746f6f6c6b6974732e223b7d7d, 'system', 0, 0, 0, 0, 20, 4, 0, 1, 8, 46, 105, 0, 0, 0, 0, 0, 0),
('management', 106, 44, 'admin/modules/list/confirm', 'admin/modules/list/confirm', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 16, 44, 106, 0, 0, 0, 0, 0, 0),
('management', 107, 36, 'admin/structure/types/list', 'admin/structure/types/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 36, 107, 0, 0, 0, 0, 0, 0),
('management', 108, 57, 'admin/structure/taxonomy/list', 'admin/structure/taxonomy/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 57, 108, 0, 0, 0, 0, 0, 0),
('management', 109, 47, 'admin/structure/menu/list', 'admin/structure/menu/list', 'List menus', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 47, 109, 0, 0, 0, 0, 0, 0),
('management', 110, 39, 'admin/config/development/logging', 'admin/config/development/logging', 'Logging and errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3135343a2253657474696e677320666f72206c6f6767696e6720616e6420616c65727473206d6f64756c65732e20566172696f7573206d6f64756c65732063616e20726f7574652044727570616c27732073797374656d206576656e747320746f20646966666572656e742064657374696e6174696f6e732c2073756368206173207379736c6f672c2064617461626173652c20656d61696c2c206574632e223b7d7d, 'system', 0, 0, 0, 0, -15, 4, 0, 1, 8, 39, 110, 0, 0, 0, 0, 0, 0),
('management', 111, 39, 'admin/config/development/maintenance', 'admin/config/development/maintenance', 'Maintenance mode', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36323a2254616b65207468652073697465206f66666c696e6520666f72206d61696e74656e616e6365206f72206272696e67206974206261636b206f6e6c696e652e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 39, 111, 0, 0, 0, 0, 0, 0),
('management', 112, 39, 'admin/config/development/performance', 'admin/config/development/performance', 'Performance', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130313a22456e61626c65206f722064697361626c6520706167652063616368696e6720666f7220616e6f6e796d6f757320757365727320616e64207365742043535320616e64204a532062616e647769647468206f7074696d697a6174696f6e206f7074696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 39, 112, 0, 0, 0, 0, 0, 0),
('management', 113, 49, 'admin/people/permissions/list', 'admin/people/permissions/list', 'Permissions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36343a2244657465726d696e652061636365737320746f2066656174757265732062792073656c656374696e67207065726d697373696f6e7320666f7220726f6c65732e223b7d7d, 'system', -1, 0, 0, 0, -8, 4, 0, 1, 18, 49, 113, 0, 0, 0, 0, 0, 0),
('management', 115, 64, 'admin/config/services/rss-publishing', 'admin/config/services/rss-publishing', 'RSS publishing', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3131343a22436f6e666967757265207468652073697465206465736372697074696f6e2c20746865206e756d626572206f66206974656d7320706572206665656420616e6420776865746865722066656564732073686f756c64206265207469746c65732f746561736572732f66756c6c2d746578742e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 64, 115, 0, 0, 0, 0, 0, 0),
('management', 116, 51, 'admin/config/regional/settings', 'admin/config/regional/settings', 'Regional settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35343a2253657474696e677320666f7220746865207369746527732064656661756c742074696d65207a6f6e6520616e6420636f756e7472792e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 51, 116, 0, 0, 0, 0, 0, 0),
('management', 117, 49, 'admin/people/permissions/roles', 'admin/people/permissions/roles', 'Roles', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33303a224c6973742c20656469742c206f7220616464207573657220726f6c65732e223b7d7d, 'system', -1, 0, 1, 0, -5, 4, 0, 1, 18, 49, 117, 0, 0, 0, 0, 0, 0),
('management', 118, 47, 'admin/structure/menu/settings', 'admin/structure/menu/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 5, 4, 0, 1, 21, 47, 118, 0, 0, 0, 0, 0, 0),
('management', 119, 54, 'admin/appearance/settings/seven', 'admin/appearance/settings/seven', 'Seven', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 54, 119, 0, 0, 0, 0, 0, 0),
('management', 120, 56, 'admin/config/system/site-information', 'admin/config/system/site-information', 'Site information', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130343a224368616e67652073697465206e616d652c20652d6d61696c20616464726573732c20736c6f67616e2c2064656661756c742066726f6e7420706167652c20616e64206e756d626572206f6620706f7374732070657220706167652c206572726f722070616765732e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 56, 120, 0, 0, 0, 0, 0, 0),
('management', 121, 54, 'admin/appearance/settings/stark', 'admin/appearance/settings/stark', 'Stark', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 54, 121, 0, 0, 0, 0, 0, 0),
('management', 123, 35, 'admin/config/content/formats', 'admin/config/content/formats', 'Text formats', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3132373a22436f6e66696775726520686f7720636f6e74656e7420696e7075742062792075736572732069732066696c74657265642c20696e636c7564696e6720616c6c6f7765642048544d4c20746167732e20416c736f20616c6c6f777320656e61626c696e67206f66206d6f64756c652d70726f76696465642066696c746572732e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 35, 123, 0, 0, 0, 0, 0, 0),
('management', 125, 60, 'admin/modules/uninstall/confirm', 'admin/modules/uninstall/confirm', 'Uninstall', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 16, 60, 125, 0, 0, 0, 0, 0, 0),
('management', 127, 57, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 57, 127, 0, 0, 0, 0, 0, 0),
('navigation', 129, 40, 'user/%/edit/account', 'user/%/edit/account', 'Account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 17, 40, 129, 0, 0, 0, 0, 0, 0, 0),
('management', 130, 123, 'admin/config/content/formats/%', 'admin/config/content/formats/%', '', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 35, 123, 130, 0, 0, 0, 0, 0),
('management', 131, 104, 'admin/config/media/image-styles/add', 'admin/config/media/image-styles/add', 'Add style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32323a224164642061206e657720696d616765207374796c652e223b7d7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 8, 46, 104, 131, 0, 0, 0, 0, 0),
('management', 132, 127, 'admin/structure/taxonomy/%/add', 'admin/structure/taxonomy/%/add', 'Add term', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 57, 127, 132, 0, 0, 0, 0, 0),
('management', 133, 123, 'admin/config/content/formats/add', 'admin/config/content/formats/add', 'Add text format', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 8, 35, 123, 133, 0, 0, 0, 0, 0),
('management', 134, 30, 'admin/structure/block/list/bartik', 'admin/structure/block/list/bartik', 'Bartik', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 30, 134, 0, 0, 0, 0, 0, 0),
('management', 135, 90, 'admin/config/system/actions/configure', 'admin/config/system/actions/configure', 'Configure an advanced action', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 56, 90, 135, 0, 0, 0, 0, 0),
('management', 136, 47, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Customize menu', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 21, 47, 136, 0, 0, 0, 0, 0, 0),
('management', 137, 127, 'admin/structure/taxonomy/%/edit', 'admin/structure/taxonomy/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 57, 127, 137, 0, 0, 0, 0, 0),
('management', 138, 36, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Edit content type', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 21, 36, 138, 0, 0, 0, 0, 0, 0),
('management', 139, 98, 'admin/config/regional/date-time/formats', 'admin/config/regional/date-time/formats', 'Formats', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35313a22436f6e66696775726520646973706c617920666f726d617420737472696e677320666f72206461746520616e642074696d652e223b7d7d, 'system', -1, 0, 1, 0, -9, 5, 0, 1, 8, 51, 98, 139, 0, 0, 0, 0, 0),
('management', 140, 30, 'admin/structure/block/list/garland', 'admin/structure/block/list/garland', 'Garland', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 30, 140, 0, 0, 0, 0, 0, 0),
('management', 141, 123, 'admin/config/content/formats/list', 'admin/config/content/formats/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 35, 123, 141, 0, 0, 0, 0, 0),
('management', 142, 127, 'admin/structure/taxonomy/%/list', 'admin/structure/taxonomy/%/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -20, 5, 0, 1, 21, 57, 127, 142, 0, 0, 0, 0, 0),
('management', 143, 104, 'admin/config/media/image-styles/list', 'admin/config/media/image-styles/list', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34323a224c697374207468652063757272656e7420696d616765207374796c6573206f6e2074686520736974652e223b7d7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 8, 46, 104, 143, 0, 0, 0, 0, 0),
('management', 144, 90, 'admin/config/system/actions/manage', 'admin/config/system/actions/manage', 'Manage actions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34313a224d616e6167652074686520616374696f6e7320646566696e656420666f7220796f757220736974652e223b7d7d, 'system', -1, 0, 0, 0, -2, 5, 0, 1, 8, 56, 90, 144, 0, 0, 0, 0, 0),
('management', 145, 89, 'admin/config/people/accounts/settings', 'admin/config/people/accounts/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 8, 48, 89, 145, 0, 0, 0, 0, 0),
('management', 146, 30, 'admin/structure/block/list/seven', 'admin/structure/block/list/seven', 'Seven', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 30, 146, 0, 0, 0, 0, 0, 0),
('management', 147, 30, 'admin/structure/block/list/stark', 'admin/structure/block/list/stark', 'Stark', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 30, 147, 0, 0, 0, 0, 0, 0),
('management', 149, 98, 'admin/config/regional/date-time/types', 'admin/config/regional/date-time/types', 'Types', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34343a22436f6e66696775726520646973706c617920666f726d61747320666f72206461746520616e642074696d652e223b7d7d, 'system', -1, 0, 1, 0, -10, 5, 0, 1, 8, 51, 98, 149, 0, 0, 0, 0, 0),
('navigation', 152, 52, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 52, 152, 0, 0, 0, 0, 0, 0, 0),
('navigation', 153, 52, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 52, 153, 0, 0, 0, 0, 0, 0, 0),
('navigation', 154, 52, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 52, 154, 0, 0, 0, 0, 0, 0, 0),
('management', 156, 146, 'admin/structure/block/list/seven/add', 'admin/structure/block/list/seven/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 146, 156, 0, 0, 0, 0, 0),
('management', 157, 147, 'admin/structure/block/list/stark/add', 'admin/structure/block/list/stark/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 147, 157, 0, 0, 0, 0, 0),
('management', 161, 149, 'admin/config/regional/date-time/types/add', 'admin/config/regional/date-time/types/add', 'Add date type', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31383a22416464206e6577206461746520747970652e223b7d7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 51, 98, 149, 161, 0, 0, 0, 0),
('management', 162, 139, 'admin/config/regional/date-time/formats/add', 'admin/config/regional/date-time/formats/add', 'Add format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22416c6c6f7720757365727320746f20616464206164646974696f6e616c206461746520666f726d6174732e223b7d7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 51, 98, 139, 162, 0, 0, 0, 0),
('management', 163, 136, 'admin/structure/menu/manage/%/add', 'admin/structure/menu/manage/%/add', 'Add link', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 47, 136, 163, 0, 0, 0, 0, 0),
('management', 164, 30, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Configure block', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 30, 164, 0, 0, 0, 0, 0, 0),
('navigation', 165, 31, 'user/%/cancel/confirm/%/%', 'user/%/cancel/confirm/%/%', 'Confirm account cancellation', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 17, 31, 165, 0, 0, 0, 0, 0, 0, 0),
('management', 166, 138, 'admin/structure/types/manage/%/delete', 'admin/structure/types/manage/%/delete', 'Delete', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 21, 36, 138, 166, 0, 0, 0, 0, 0),
('management', 167, 103, 'admin/config/people/ip-blocking/delete/%', 'admin/config/people/ip-blocking/delete/%', 'Delete IP address', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 48, 103, 167, 0, 0, 0, 0, 0),
('management', 168, 90, 'admin/config/system/actions/delete/%', 'admin/config/system/actions/delete/%', 'Delete action', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31373a2244656c65746520616e20616374696f6e2e223b7d7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 56, 90, 168, 0, 0, 0, 0, 0),
('management', 169, 136, 'admin/structure/menu/manage/%/delete', 'admin/structure/menu/manage/%/delete', 'Delete menu', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 21, 47, 136, 169, 0, 0, 0, 0, 0),
('management', 170, 47, 'admin/structure/menu/item/%/delete', 'admin/structure/menu/item/%/delete', 'Delete menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 170, 0, 0, 0, 0, 0, 0),
('management', 171, 117, 'admin/people/permissions/roles/delete/%', 'admin/people/permissions/roles/delete/%', 'Delete role', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 18, 49, 117, 171, 0, 0, 0, 0, 0),
('management', 172, 130, 'admin/config/content/formats/%/disable', 'admin/config/content/formats/%/disable', 'Disable text format', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 35, 123, 130, 172, 0, 0, 0, 0),
('management', 173, 138, 'admin/structure/types/manage/%/edit', 'admin/structure/types/manage/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 36, 138, 173, 0, 0, 0, 0, 0),
('management', 174, 136, 'admin/structure/menu/manage/%/edit', 'admin/structure/menu/manage/%/edit', 'Edit menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 47, 136, 174, 0, 0, 0, 0, 0),
('management', 175, 47, 'admin/structure/menu/item/%/edit', 'admin/structure/menu/item/%/edit', 'Edit menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 175, 0, 0, 0, 0, 0, 0),
('management', 176, 117, 'admin/people/permissions/roles/edit/%', 'admin/people/permissions/roles/edit/%', 'Edit role', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 18, 49, 117, 176, 0, 0, 0, 0, 0),
('management', 177, 104, 'admin/config/media/image-styles/edit/%', 'admin/config/media/image-styles/edit/%', 'Edit style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32353a22436f6e66696775726520616e20696d616765207374796c652e223b7d7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 46, 104, 177, 0, 0, 0, 0, 0),
('management', 178, 136, 'admin/structure/menu/manage/%/list', 'admin/structure/menu/manage/%/list', 'List links', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 47, 136, 178, 0, 0, 0, 0, 0),
('management', 179, 47, 'admin/structure/menu/item/%/reset', 'admin/structure/menu/item/%/reset', 'Reset menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 179, 0, 0, 0, 0, 0, 0),
('management', 180, 104, 'admin/config/media/image-styles/delete/%', 'admin/config/media/image-styles/delete/%', 'Delete style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32323a2244656c65746520616e20696d616765207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 46, 104, 180, 0, 0, 0, 0, 0),
('management', 181, 104, 'admin/config/media/image-styles/revert/%', 'admin/config/media/image-styles/revert/%', 'Revert style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32323a2252657665727420616e20696d616765207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 46, 104, 181, 0, 0, 0, 0, 0),
('management', 184, 164, 'admin/structure/block/manage/%/%/configure', 'admin/structure/block/manage/%/%/configure', 'Configure block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 164, 184, 0, 0, 0, 0, 0),
('management', 185, 164, 'admin/structure/block/manage/%/%/delete', 'admin/structure/block/manage/%/%/delete', 'Delete block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 164, 185, 0, 0, 0, 0, 0),
('management', 186, 139, 'admin/config/regional/date-time/formats/%/delete', 'admin/config/regional/date-time/formats/%/delete', 'Delete date format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34373a22416c6c6f7720757365727320746f2064656c657465206120636f6e66696775726564206461746520666f726d61742e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 51, 98, 139, 186, 0, 0, 0, 0),
('management', 187, 149, 'admin/config/regional/date-time/types/%/delete', 'admin/config/regional/date-time/types/%/delete', 'Delete date type', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a22416c6c6f7720757365727320746f2064656c657465206120636f6e66696775726564206461746520747970652e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 51, 98, 149, 187, 0, 0, 0, 0),
('management', 188, 139, 'admin/config/regional/date-time/formats/%/edit', 'admin/config/regional/date-time/formats/%/edit', 'Edit date format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a22416c6c6f7720757365727320746f2065646974206120636f6e66696775726564206461746520666f726d61742e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 51, 98, 139, 188, 0, 0, 0, 0),
('management', 189, 177, 'admin/config/media/image-styles/edit/%/add/%', 'admin/config/media/image-styles/edit/%/add/%', 'Add image effect', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32383a224164642061206e65772065666665637420746f2061207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 46, 104, 177, 189, 0, 0, 0, 0),
('management', 190, 177, 'admin/config/media/image-styles/edit/%/effects/%', 'admin/config/media/image-styles/edit/%/effects/%', 'Edit image effect', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33393a224564697420616e206578697374696e67206566666563742077697468696e2061207374796c652e223b7d7d, 'system', 0, 0, 1, 0, 0, 6, 0, 1, 8, 46, 104, 177, 190, 0, 0, 0, 0),
('management', 191, 190, 'admin/config/media/image-styles/edit/%/effects/%/delete', 'admin/config/media/image-styles/edit/%/effects/%/delete', 'Delete image effect', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33393a2244656c65746520616e206578697374696e67206566666563742066726f6d2061207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 46, 104, 177, 190, 191, 0, 0, 0),
('management', 192, 47, 'admin/structure/menu/manage/main-menu', 'admin/structure/menu/manage/%', 'Main menu', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 192, 0, 0, 0, 0, 0, 0),
('management', 193, 47, 'admin/structure/menu/manage/management', 'admin/structure/menu/manage/%', 'Management', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 193, 0, 0, 0, 0, 0, 0),
('management', 194, 47, 'admin/structure/menu/manage/navigation', 'admin/structure/menu/manage/%', 'Navigation', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 194, 0, 0, 0, 0, 0, 0),
('management', 195, 47, 'admin/structure/menu/manage/user-menu', 'admin/structure/menu/manage/%', 'User menu', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 195, 0, 0, 0, 0, 0, 0),
('navigation', 196, 0, 'search', 'search', 'Search', 0x613a303a7b7d, 'system', 1, 0, 0, 0, 0, 1, 0, 196, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 197, 196, 'search/node', 'search/node', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 196, 197, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 198, 196, 'search/user', 'search/user', 'Users', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 196, 198, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 199, 197, 'search/node/%', 'search/node/%', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 196, 197, 199, 0, 0, 0, 0, 0, 0, 0),
('navigation', 200, 17, 'user/%/shortcuts', 'user/%/shortcuts', 'Shortcuts', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 17, 200, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 201, 19, 'admin/reports/search', 'admin/reports/search', 'Top search phrases', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33333a2256696577206d6f737420706f70756c61722073656172636820706872617365732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 201, 0, 0, 0, 0, 0, 0, 0),
('navigation', 202, 198, 'search/user/%', 'search/user/%', 'Users', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 196, 198, 202, 0, 0, 0, 0, 0, 0, 0),
('management', 203, 12, 'admin/help/number', 'admin/help/number', 'number', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 203, 0, 0, 0, 0, 0, 0, 0),
('management', 204, 12, 'admin/help/overlay', 'admin/help/overlay', 'overlay', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 204, 0, 0, 0, 0, 0, 0, 0),
('management', 205, 12, 'admin/help/path', 'admin/help/path', 'path', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 205, 0, 0, 0, 0, 0, 0, 0),
('management', 206, 12, 'admin/help/rdf', 'admin/help/rdf', 'rdf', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 206, 0, 0, 0, 0, 0, 0, 0),
('management', 207, 12, 'admin/help/search', 'admin/help/search', 'search', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 207, 0, 0, 0, 0, 0, 0, 0),
('management', 208, 12, 'admin/help/shortcut', 'admin/help/shortcut', 'shortcut', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 208, 0, 0, 0, 0, 0, 0, 0),
('management', 209, 53, 'admin/config/search/settings', 'admin/config/search/settings', 'Search settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36373a22436f6e6669677572652072656c6576616e63652073657474696e677320666f722073656172636820616e64206f7468657220696e646578696e67206f7074696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 53, 209, 0, 0, 0, 0, 0, 0),
('management', 210, 61, 'admin/config/user-interface/shortcut', 'admin/config/user-interface/shortcut', 'Shortcuts', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32393a2241646420616e64206d6f646966792073686f727463757420736574732e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 61, 210, 0, 0, 0, 0, 0, 0),
('management', 211, 53, 'admin/config/search/path', 'admin/config/search/path', 'URL aliases', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34363a224368616e676520796f7572207369746527732055524c20706174687320627920616c696173696e67207468656d2e223b7d7d, 'system', 0, 0, 1, 0, -5, 4, 0, 1, 8, 53, 211, 0, 0, 0, 0, 0, 0),
('management', 212, 211, 'admin/config/search/path/add', 'admin/config/search/path/add', 'Add alias', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 53, 211, 212, 0, 0, 0, 0, 0),
('management', 213, 210, 'admin/config/user-interface/shortcut/add-set', 'admin/config/user-interface/shortcut/add-set', 'Add shortcut set', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 61, 210, 213, 0, 0, 0, 0, 0),
('management', 214, 209, 'admin/config/search/settings/reindex', 'admin/config/search/settings/reindex', 'Clear index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 53, 209, 214, 0, 0, 0, 0, 0),
('management', 215, 210, 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Edit shortcuts', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 61, 210, 215, 0, 0, 0, 0, 0),
('management', 216, 211, 'admin/config/search/path/list', 'admin/config/search/path/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 8, 53, 211, 216, 0, 0, 0, 0, 0),
('management', 217, 215, 'admin/config/user-interface/shortcut/%/add-link', 'admin/config/user-interface/shortcut/%/add-link', 'Add shortcut', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 61, 210, 215, 217, 0, 0, 0, 0),
('management', 218, 211, 'admin/config/search/path/delete/%', 'admin/config/search/path/delete/%', 'Delete alias', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 53, 211, 218, 0, 0, 0, 0, 0),
('management', 219, 215, 'admin/config/user-interface/shortcut/%/delete', 'admin/config/user-interface/shortcut/%/delete', 'Delete shortcut set', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 61, 210, 215, 219, 0, 0, 0, 0),
('management', 220, 211, 'admin/config/search/path/edit/%', 'admin/config/search/path/edit/%', 'Edit alias', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 53, 211, 220, 0, 0, 0, 0, 0),
('management', 221, 215, 'admin/config/user-interface/shortcut/%/edit', 'admin/config/user-interface/shortcut/%/edit', 'Edit set name', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 6, 0, 1, 8, 61, 210, 215, 221, 0, 0, 0, 0),
('management', 222, 210, 'admin/config/user-interface/shortcut/link/%', 'admin/config/user-interface/shortcut/link/%', 'Edit shortcut', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 61, 210, 222, 0, 0, 0, 0, 0),
('management', 223, 215, 'admin/config/user-interface/shortcut/%/links', 'admin/config/user-interface/shortcut/%/links', 'List links', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 61, 210, 215, 223, 0, 0, 0, 0),
('management', 224, 222, 'admin/config/user-interface/shortcut/link/%/delete', 'admin/config/user-interface/shortcut/link/%/delete', 'Delete shortcut', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 61, 210, 222, 224, 0, 0, 0, 0),
('shortcut-set-1', 225, 0, 'node/add', 'node/add', 'Add content', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, -20, 1, 0, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('shortcut-set-1', 226, 0, 'admin/content', 'admin/content', 'Find content', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, -19, 1, 0, 226, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 228, 6, 'node/add/article', 'node/add/article', 'Article', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38393a22557365203c656d3e61727469636c65733c2f656d3e20666f722074696d652d73656e73697469766520636f6e74656e74206c696b65206e6577732c2070726573732072656c6561736573206f7220626c6f6720706f7374732e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 228, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 229, 6, 'node/add/page', 'node/add/page', 'Basic page', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37373a22557365203c656d3e62617369632070616765733c2f656d3e20666f7220796f75722073746174696320636f6e74656e742c207375636820617320616e202741626f75742075732720706167652e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 229, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 230, 12, 'admin/help/toolbar', 'admin/help/toolbar', 'toolbar', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 230, 0, 0, 0, 0, 0, 0, 0),
('management', 269, 19, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38323a22476574206120737461747573207265706f72742061626f757420617661696c61626c65207570646174657320666f7220796f757220696e7374616c6c6564206d6f64756c657320616e64207468656d65732e223b7d7d, 'system', 0, 0, 0, 0, -50, 3, 0, 1, 19, 269, 0, 0, 0, 0, 0, 0, 0),
('management', 270, 16, 'admin/modules/install', 'admin/modules/install', 'Install new module', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 3, 0, 1, 16, 270, 0, 0, 0, 0, 0, 0, 0),
('management', 271, 7, 'admin/appearance/install', 'admin/appearance/install', 'Install new theme', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 3, 0, 1, 7, 271, 0, 0, 0, 0, 0, 0, 0),
('management', 272, 16, 'admin/modules/update', 'admin/modules/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 3, 0, 1, 16, 272, 0, 0, 0, 0, 0, 0, 0),
('management', 273, 7, 'admin/appearance/update', 'admin/appearance/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 3, 0, 1, 7, 273, 0, 0, 0, 0, 0, 0, 0),
('management', 274, 12, 'admin/help/update', 'admin/help/update', 'update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 274, 0, 0, 0, 0, 0, 0, 0),
('management', 275, 269, 'admin/reports/updates/install', 'admin/reports/updates/install', 'Install new module or theme', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 4, 0, 1, 19, 269, 275, 0, 0, 0, 0, 0, 0),
('management', 276, 269, 'admin/reports/updates/update', 'admin/reports/updates/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 4, 0, 1, 19, 269, 276, 0, 0, 0, 0, 0, 0),
('management', 277, 269, 'admin/reports/updates/list', 'admin/reports/updates/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 19, 269, 277, 0, 0, 0, 0, 0, 0),
('management', 278, 269, 'admin/reports/updates/settings', 'admin/reports/updates/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 50, 4, 0, 1, 19, 269, 278, 0, 0, 0, 0, 0, 0),
('management', 317, 54, 'admin/appearance/settings/businessclass', 'admin/appearance/settings/businessclass', 'BusinessClass', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 54, 317, 0, 0, 0, 0, 0, 0),
('management', 318, 30, 'admin/structure/block/list/businessclass', 'admin/structure/block/list/businessclass', 'BusinessClass', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 30, 318, 0, 0, 0, 0, 0, 0),
('management', 322, 140, 'admin/structure/block/list/garland/add', 'admin/structure/block/list/garland/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 140, 322, 0, 0, 0, 0, 0),
('management', 323, 134, 'admin/structure/block/list/bartik/add', 'admin/structure/block/list/bartik/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 134, 323, 0, 0, 0, 0, 0),
('navigation', 324, 0, 'contact', 'contact', 'Contact', 0x613a303a7b7d, 'system', 1, 0, 0, 0, 0, 1, 0, 324, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 325, 17, 'user/%/contact', 'user/%/contact', 'Contact', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 2, 0, 17, 325, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 326, 21, 'admin/structure/contact', 'admin/structure/contact', 'Contact form', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37313a2243726561746520612073797374656d20636f6e7461637420666f726d20616e64207365742075702063617465676f7269657320666f722074686520666f726d20746f207573652e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 326, 0, 0, 0, 0, 0, 0, 0),
('management', 327, 12, 'admin/help/contact', 'admin/help/contact', 'contact', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 327, 0, 0, 0, 0, 0, 0, 0),
('management', 328, 326, 'admin/structure/contact/add', 'admin/structure/contact/add', 'Add category', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 4, 0, 1, 21, 326, 328, 0, 0, 0, 0, 0, 0),
('management', 329, 326, 'admin/structure/contact/delete/%', 'admin/structure/contact/delete/%', 'Delete contact', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 326, 329, 0, 0, 0, 0, 0, 0),
('management', 330, 326, 'admin/structure/contact/edit/%', 'admin/structure/contact/edit/%', 'Edit contact category', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 326, 330, 0, 0, 0, 0, 0, 0),
('main-menu', 331, 0, 'contact', 'contact', 'Contact', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a373a22436f6e74616374223b7d7d, 'menu', 0, 0, 0, 0, -48, 1, 1, 331, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 332, 0, 'products', 'products', 'Products', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a383a2250726f6475637473223b7d7d, 'menu', 0, 0, 1, 1, -50, 1, 1, 332, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 334, 332, 'node/4', 'node/%', 'Enterprise Product', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31383a22456e74657270726973652050726f64756374223b7d7d, 'menu', 0, 0, 1, 0, -48, 2, 1, 332, 334, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 335, 334, 'node/4', 'node/%', 'Enterprise Product 2', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32303a22456e74657270726973652050726f647563742032223b7d7d, 'menu', 0, 0, 0, 0, -50, 3, 1, 332, 334, 335, 0, 0, 0, 0, 0, 0, 0),
('management', 336, 12, 'admin/help/nice_menus', 'admin/help/nice_menus', 'nice_menus', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 336, 0, 0, 0, 0, 0, 0, 0),
('management', 337, 61, 'admin/config/user-interface/nice_menus', 'admin/config/user-interface/nice_menus', 'Nice menus', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32313a22436f6e666967757265204e696365206d656e75732e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 61, 337, 0, 0, 0, 0, 0, 0),
('management', 338, 12, 'admin/help/php', 'admin/help/php', 'php', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 338, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 339, 0, 'node/1', 'node/%', 'About us', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a383a2241626f7574207573223b7d7d, 'menu', 0, 0, 0, 0, -47, 1, 1, 339, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 340, 0, 'blog', 'blog', 'Blogs', 0x613a303a7b7d, 'system', 1, 0, 1, 0, 0, 1, 0, 340, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 341, 340, 'blog/%', 'blog/%', 'My blog', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 2, 0, 340, 341, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 342, 6, 'node/add/blog', 'node/add/blog', 'Blog entry', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35383a2255736520666f72206d756c74692d7573657220626c6f67732e20457665727920757365722067657473206120706572736f6e616c20626c6f672e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 342, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 343, 12, 'admin/help/blog', 'admin/help/blog', 'blog', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 343, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 344, 0, 'blog', 'blog', 'Blog', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a343a22426c6f67223b7d7d, 'menu', 0, 0, 0, 0, -46, 1, 1, 344, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 364, 47, 'admin/structure/menu/manage/menu-browse', 'admin/structure/menu/manage/%', 'Browse menu', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 364, 0, 0, 0, 0, 0, 0),
('menu-browse', 365, 0, 'node/1', 'node/%', 'About us', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a383a2241626f7574207573223b7d7d, 'menu', 0, 0, 0, 0, -50, 1, 1, 365, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-browse', 366, 0, 'products', 'products', 'Our Products', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31323a224f75722050726f6475637473223b7d7d, 'menu', 0, 0, 0, 0, -49, 1, 1, 366, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-browse', 367, 0, 'node/6', 'node/%', 'Read our FAQ', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31323a2252656164206f757220464151223b7d7d, 'menu', 0, 0, 0, 0, -48, 1, 1, 367, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-browse', 368, 0, 'testimonials', 'testimonials', 'Testimonials', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31323a2254657374696d6f6e69616c73223b7d7d, 'menu', 0, 0, 0, 0, -47, 1, 1, 368, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-browse', 369, 0, 'node/6', 'node/%', 'Online Store', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31323a224f6e6c696e652053746f7265223b7d7d, 'menu', 0, 0, 0, 0, -46, 1, 1, 369, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-browse', 370, 0, 'node/6', 'node/%', 'Support', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a373a22537570706f7274223b7d7d, 'menu', 0, 0, 0, 0, -45, 1, 1, 370, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 371, 21, 'admin/structure/views', 'admin/structure/views', 'Views', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33353a224d616e61676520637573746f6d697a6564206c69737473206f6620636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 371, 0, 0, 0, 0, 0, 0, 0),
('management', 372, 371, 'admin/structure/views/add', 'admin/structure/views/add', 'Add new view', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 371, 372, 0, 0, 0, 0, 0, 0),
('management', 373, 371, 'admin/structure/views/add-template', 'admin/structure/views/add-template', 'Add view from template', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 371, 373, 0, 0, 0, 0, 0, 0),
('management', 374, 371, 'admin/structure/views/import', 'admin/structure/views/import', 'Import', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 371, 374, 0, 0, 0, 0, 0, 0),
('management', 375, 371, 'admin/structure/views/list', 'admin/structure/views/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 371, 375, 0, 0, 0, 0, 0, 0),
('management', 376, 371, 'admin/structure/views/settings', 'admin/structure/views/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 371, 376, 0, 0, 0, 0, 0, 0),
('management', 377, 376, 'admin/structure/views/settings/advanced', 'admin/structure/views/settings/advanced', 'Advanced', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 21, 371, 376, 377, 0, 0, 0, 0, 0),
('management', 378, 376, 'admin/structure/views/settings/basic', 'admin/structure/views/settings/basic', 'Basic', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 371, 376, 378, 0, 0, 0, 0, 0),
('management', 379, 371, 'admin/structure/views/view/%', 'admin/structure/views/view/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 371, 379, 0, 0, 0, 0, 0, 0),
('management', 380, 379, 'admin/structure/views/view/%/break-lock', 'admin/structure/views/view/%/break-lock', 'Break lock', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 371, 379, 380, 0, 0, 0, 0, 0),
('management', 381, 379, 'admin/structure/views/view/%/edit', 'admin/structure/views/view/%/edit', 'Edit view', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 371, 379, 381, 0, 0, 0, 0, 0),
('management', 382, 379, 'admin/structure/views/view/%/clone', 'admin/structure/views/view/%/clone', 'Clone', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 371, 379, 382, 0, 0, 0, 0, 0),
('management', 383, 379, 'admin/structure/views/view/%/delete', 'admin/structure/views/view/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 371, 379, 383, 0, 0, 0, 0, 0),
('management', 384, 379, 'admin/structure/views/view/%/export', 'admin/structure/views/view/%/export', 'Export', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 371, 379, 384, 0, 0, 0, 0, 0),
('management', 385, 379, 'admin/structure/views/view/%/revert', 'admin/structure/views/view/%/revert', 'Revert', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 371, 379, 385, 0, 0, 0, 0, 0),
('management', 386, 371, 'admin/structure/views/ajax/preview/%/%', 'admin/structure/views/ajax/preview/%/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 371, 386, 0, 0, 0, 0, 0, 0),
('management', 387, 371, 'admin/structure/views/nojs/preview/%/%', 'admin/structure/views/nojs/preview/%/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 371, 387, 0, 0, 0, 0, 0, 0),
('management', 388, 47, 'admin/structure/menu/manage/menu-footer-menu', 'admin/structure/menu/manage/%', 'Footer menu', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 388, 0, 0, 0, 0, 0, 0),
('menu-footer-menu', 389, 0, 'blog', 'blog', 'Our Blog', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a383a224f757220426c6f67223b7d7d, 'menu', 0, 0, 0, 0, -50, 1, 1, 389, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-footer-menu', 390, 0, '<front>', '', 'Careers', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a373a2243617265657273223b7d7d, 'menu', 0, 1, 0, 0, -49, 1, 1, 390, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-footer-menu', 391, 0, 'contact', 'contact', 'Contact', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a373a22436f6e74616374223b7d7d, 'menu', 0, 0, 0, 0, -48, 1, 1, 391, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-footer-menu', 392, 0, '<front>', '', 'Investors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a393a22496e766573746f7273223b7d7d, 'menu', 0, 1, 0, 0, 0, 1, 1, 392, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 393, 6, 'node/add/mt-product', 'node/add/mt-product', 'Product', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3533303a22412050726f6475637420706f737420697320696465616c20666f72206372656174696e6720616e6420646973706c6179696e672070726f64756374732e2049742068617320746865206f7074696f6e20746f20626520646973706c6179656420696e746f2066726f6e74207061676520736c6964652073686f772e2049742070726f766964657320746865206162696c69747920746f2061747461636820616e20696d616765207768696368206973206175746f6d61746963616c6c792061646a757374656420746f2066697420696e746f20746865207765627369746573206c61796f75742e2057686174e280997320706172746963756c61726c7920636f6f6c2061626f757420612050726f6475637420706f73742c20697320746861742069742070726f766964657320746865206162696c69747920746f20617474616368206120736572696573206f6620696d616765732c207468756d626e61696c73206f6620776869636820617265206175746f6d61746963616c6c79206372656174656420616e642061646a757374656420746f2066697420696e746f207468652077656273697465206c61796f75742e2050726f6475637420706f737420656e61626c657320667265652074616767696e6720286a757374206c696b65206c6162656c73292c2074616b696e67207468652062657374732066726f6d20746865207461786f6e6f6d792073797374656d2e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 393, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 394, 332, 'node/5', 'node/%', 'Starter Product', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31353a22537461727465722050726f64756374223b7d7d, 'menu', 0, 0, 0, 0, -50, 2, 1, 332, 394, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 395, 0, 'comment/%', 'comment/%', 'Comment permalink', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 395, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 396, 0, 'comment/reply/%', 'comment/reply/%', 'Add new comment', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 396, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 397, 395, 'comment/%/approve', 'comment/%/approve', 'Approve', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 1, 2, 0, 395, 397, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 398, 395, 'comment/%/delete', 'comment/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 2, 0, 395, 398, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 399, 395, 'comment/%/edit', 'comment/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 395, 399, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 400, 395, 'comment/%/view', 'comment/%/view', 'View comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 395, 400, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 401, 9, 'admin/content/comment', 'admin/content/comment', 'Comments', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35393a224c69737420616e642065646974207369746520636f6d6d656e747320616e642074686520636f6d6d656e7420617070726f76616c2071756575652e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 9, 401, 0, 0, 0, 0, 0, 0, 0),
('management', 402, 12, 'admin/help/comment', 'admin/help/comment', 'comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 402, 0, 0, 0, 0, 0, 0, 0),
('management', 403, 401, 'admin/content/comment/new', 'admin/content/comment/new', 'Published comments', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 9, 401, 403, 0, 0, 0, 0, 0, 0),
('management', 404, 401, 'admin/content/comment/approval', 'admin/content/comment/approval', 'Unapproved comments', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 9, 401, 404, 0, 0, 0, 0, 0, 0),
('management', 405, 138, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%/comment/display', 'Comment display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 4, 5, 0, 1, 21, 36, 138, 405, 0, 0, 0, 0, 0),
('management', 406, 138, 'admin/structure/types/manage/%/comment/fields', 'admin/structure/types/manage/%/comment/fields', 'Comment fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 3, 5, 0, 1, 21, 36, 138, 406, 0, 0, 0, 0, 0),
('main-menu', 414, 0, 'services', 'services', 'Services', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a383a225365727669636573223b7d7d, 'menu', 0, 0, 1, 0, -49, 1, 1, 414, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 415, 332, '<front>', '', 'Professional Product', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32303a2250726f66657373696f6e616c2050726f64756374223b7d7d, 'menu', 0, 1, 0, 0, -49, 2, 1, 332, 415, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 416, 47, 'admin/structure/menu/manage/menu-subfooter-menu', 'admin/structure/menu/manage/%', 'Subfooter menu', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 416, 0, 0, 0, 0, 0, 0),
('menu-subfooter-menu', 417, 0, '<front>', '', 'Privacy Statement', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31373a22507269766163792053746174656d656e74223b7d7d, 'menu', 0, 1, 0, 0, -50, 1, 1, 417, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-subfooter-menu', 418, 0, '<front>', '', 'Terms of Use', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31323a225465726d73206f6620557365223b7d7d, 'menu', 0, 1, 0, 0, -49, 1, 1, 418, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-subfooter-menu', 419, 0, '<front>', '', 'Site Map', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a383a2253697465204d6170223b7d7d, 'menu', 0, 1, 0, 0, -48, 1, 1, 419, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('menu-subfooter-menu', 420, 0, 'user', 'user', 'Login', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a353a224c6f67696e223b7d7d, 'menu', 0, 0, 0, 0, -47, 1, 1, 420, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 421, 6, 'node/add/mt-testimonial', 'node/add/mt-testimonial', 'Testimonial', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3233333a225468652054657374696d6f6e69616c20656e747279206973207065726665637420746f2073686f77636173652074686520776f726473206f66206c6f76652066726f6d20796f757220757365727320616e6420637573746f6d6572732e2055736520697420746f20656173696c79207075626c6973682074657374696d6f6e69616c73206f6e20796f757220736974652e2041207370656369616c205669657720426c6f636b20616e642061205669657720506167652061726520616c726561647920636f6e6669677572656420746f2073686f77207468656d206f666620706572666563746c792e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 421, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 460, 12, 'admin/help/mtt_twitter', 'admin/help/mtt_twitter', 'mtt_twitter', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 460, 0, 0, 0, 0, 0, 0, 0),
('management', 461, 56, 'admin/config/system/mtt_twitter', 'admin/config/system/mtt_twitter', 'MtT Twitter', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33313a224d7454205477697474657220636f6e66696775726174696f6e20706167652e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 56, 461, 0, 0, 0, 0, 0, 0),
('navigation', 462, 6, 'node/add/mt-service', 'node/add/mt-service', 'Service', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3533303a2241205365727669636520706f737420697320696465616c20666f72206372656174696e6720616e6420646973706c6179696e672073657276696365732e2049742068617320746865206f7074696f6e20746f20626520646973706c6179656420696e746f2066726f6e74207061676520736c6964652073686f772e2049742070726f766964657320746865206162696c69747920746f2061747461636820616e20696d616765207768696368206973206175746f6d61746963616c6c792061646a757374656420746f2066697420696e746f20746865207765627369746573206c61796f75742e2057686174e280997320706172746963756c61726c7920636f6f6c2061626f75742061205365727669636520706f73742c20697320746861742069742070726f766964657320746865206162696c69747920746f20617474616368206120736572696573206f6620696d616765732c207468756d626e61696c73206f6620776869636820617265206175746f6d61746963616c6c79206372656174656420616e642061646a757374656420746f2066697420696e746f207468652077656273697465206c61796f75742e205365727669636520706f737420656e61626c657320667265652074616767696e6720286a757374206c696b65206c6162656c73292c2074616b696e67207468652062657374732066726f6d20746865207461786f6e6f6d792073797374656d2e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 462, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 463, 414, 'node/11', 'node/%', 'Starter Service', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31353a22537461727465722053657276696365223b7d7d, 'menu', 0, 0, 0, 0, -50, 2, 1, 414, 463, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 464, 414, 'node/12', 'node/%', 'Enterprise Service', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31383a22456e74657270726973652053657276696365223b7d7d, 'menu', 0, 0, 0, 0, 0, 2, 1, 414, 464, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 465, 6, 'node/add/mt-slideshow-entry', 'node/add/mt-slideshow-entry', 'Slideshow entry', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3236383a224120536c69646573686f7720656e74727920697320696465616c20666f72206372656174696e6720636f6d6d65726369616c2062616e6e6572732061732077656c6c206173206d6573736167657320666f7220796f757220776562736974652e2055736520697420746f2070726f6d6f746520616e792070616765206f6620796f75722077656273697465206f722055524c20696e746f207468652066726f6e74207061676520736c6964652073686f772e2049742063616e2063617272792061207469746c652c20612074656173657220616e6420616e20696d616765206c696e6b696e6720746f20616e20696e7465726e616c2070617468206f722065787465726e616c206c696e6b2e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 465, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 466, 21, 'admin/structure/bulk-export', 'admin/structure/bulk-export', 'Bulk Exporter', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35373a2242756c6b2d6578706f7274206d756c7469706c652043546f6f6c732d68616e646c65642064617461206f626a6563747320746f20636f64652e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 21, 466, 0, 0, 0, 0, 0, 0, 0),
('management', 505, 19, 'admin/reports/views-fields', 'admin/reports/views-fields', 'Fields used in views', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33373a224f76657276696577206f66206669656c6473207573656420696e20616c6c2076696577732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 505, 0, 0, 0, 0, 0, 0, 0),
('management', 509, 379, 'admin/structure/views/view/%/preview/%', 'admin/structure/views/view/%/preview/%', '', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 371, 379, 509, 0, 0, 0, 0, 0),
('management', 586, 127, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 21, 57, 127, 586, 0, 0, 0, 0, 0),
('management', 587, 89, 'admin/config/people/accounts/display', 'admin/config/people/accounts/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 8, 48, 89, 587, 0, 0, 0, 0, 0),
('management', 588, 127, 'admin/structure/taxonomy/%/fields', 'admin/structure/taxonomy/%/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 21, 57, 127, 588, 0, 0, 0, 0, 0),
('management', 589, 89, 'admin/config/people/accounts/fields', 'admin/config/people/accounts/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 8, 48, 89, 589, 0, 0, 0, 0, 0),
('management', 590, 586, 'admin/structure/taxonomy/%/display/default', 'admin/structure/taxonomy/%/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 21, 57, 127, 586, 590, 0, 0, 0, 0),
('management', 591, 587, 'admin/config/people/accounts/display/default', 'admin/config/people/accounts/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 48, 89, 587, 591, 0, 0, 0, 0),
('management', 592, 138, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 21, 36, 138, 592, 0, 0, 0, 0, 0),
('management', 593, 138, 'admin/structure/types/manage/%/fields', 'admin/structure/types/manage/%/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 21, 36, 138, 593, 0, 0, 0, 0, 0),
('management', 594, 586, 'admin/structure/taxonomy/%/display/full', 'admin/structure/taxonomy/%/display/full', 'Taxonomy term page', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 21, 57, 127, 586, 594, 0, 0, 0, 0),
('management', 595, 587, 'admin/config/people/accounts/display/full', 'admin/config/people/accounts/display/full', 'User account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 48, 89, 587, 595, 0, 0, 0, 0),
('management', 596, 589, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 48, 89, 589, 596, 0, 0, 0, 0),
('management', 597, 588, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 21, 57, 127, 588, 597, 0, 0, 0, 0),
('management', 598, 592, 'admin/structure/types/manage/%/display/default', 'admin/structure/types/manage/%/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 21, 36, 138, 592, 598, 0, 0, 0, 0),
('management', 599, 592, 'admin/structure/types/manage/%/display/full', 'admin/structure/types/manage/%/display/full', 'Full content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 21, 36, 138, 592, 599, 0, 0, 0, 0),
('management', 600, 592, 'admin/structure/types/manage/%/display/rss', 'admin/structure/types/manage/%/display/rss', 'RSS', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 6, 0, 1, 21, 36, 138, 592, 600, 0, 0, 0, 0),
('management', 601, 592, 'admin/structure/types/manage/%/display/search_index', 'admin/structure/types/manage/%/display/search_index', 'Search index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 3, 6, 0, 1, 21, 36, 138, 592, 601, 0, 0, 0, 0),
('management', 602, 592, 'admin/structure/types/manage/%/display/search_result', 'admin/structure/types/manage/%/display/search_result', 'Search result', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 4, 6, 0, 1, 21, 36, 138, 592, 602, 0, 0, 0, 0),
('management', 603, 592, 'admin/structure/types/manage/%/display/teaser', 'admin/structure/types/manage/%/display/teaser', 'Teaser', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 6, 0, 1, 21, 36, 138, 592, 603, 0, 0, 0, 0),
('management', 604, 593, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 21, 36, 138, 593, 604, 0, 0, 0, 0),
('management', 605, 597, 'admin/structure/taxonomy/%/fields/%/delete', 'admin/structure/taxonomy/%/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 21, 57, 127, 588, 597, 605, 0, 0, 0),
('management', 606, 597, 'admin/structure/taxonomy/%/fields/%/edit', 'admin/structure/taxonomy/%/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 57, 127, 588, 597, 606, 0, 0, 0),
('management', 607, 597, 'admin/structure/taxonomy/%/fields/%/field-settings', 'admin/structure/taxonomy/%/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 57, 127, 588, 597, 607, 0, 0, 0),
('management', 608, 597, 'admin/structure/taxonomy/%/fields/%/widget-type', 'admin/structure/taxonomy/%/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 57, 127, 588, 597, 608, 0, 0, 0),
('management', 609, 596, 'admin/config/people/accounts/fields/%/delete', 'admin/config/people/accounts/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 8, 48, 89, 589, 596, 609, 0, 0, 0),
('management', 610, 596, 'admin/config/people/accounts/fields/%/edit', 'admin/config/people/accounts/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 48, 89, 589, 596, 610, 0, 0, 0),
('management', 611, 596, 'admin/config/people/accounts/fields/%/field-settings', 'admin/config/people/accounts/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 48, 89, 589, 596, 611, 0, 0, 0),
('management', 612, 596, 'admin/config/people/accounts/fields/%/widget-type', 'admin/config/people/accounts/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 48, 89, 589, 596, 612, 0, 0, 0),
('management', 613, 405, 'admin/structure/types/manage/%/comment/display/default', 'admin/structure/types/manage/%/comment/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 21, 36, 138, 405, 613, 0, 0, 0, 0),
('management', 614, 405, 'admin/structure/types/manage/%/comment/display/full', 'admin/structure/types/manage/%/comment/display/full', 'Full comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 21, 36, 138, 405, 614, 0, 0, 0, 0),
('management', 615, 406, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 21, 36, 138, 406, 615, 0, 0, 0, 0),
('management', 616, 604, 'admin/structure/types/manage/%/fields/%/delete', 'admin/structure/types/manage/%/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 21, 36, 138, 593, 604, 616, 0, 0, 0),
('management', 617, 604, 'admin/structure/types/manage/%/fields/%/edit', 'admin/structure/types/manage/%/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 138, 593, 604, 617, 0, 0, 0),
('management', 618, 604, 'admin/structure/types/manage/%/fields/%/field-settings', 'admin/structure/types/manage/%/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 138, 593, 604, 618, 0, 0, 0),
('management', 619, 604, 'admin/structure/types/manage/%/fields/%/widget-type', 'admin/structure/types/manage/%/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 138, 593, 604, 619, 0, 0, 0),
('management', 620, 615, 'admin/structure/types/manage/%/comment/fields/%/delete', 'admin/structure/types/manage/%/comment/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 21, 36, 138, 406, 615, 620, 0, 0, 0),
('management', 621, 615, 'admin/structure/types/manage/%/comment/fields/%/edit', 'admin/structure/types/manage/%/comment/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 138, 406, 615, 621, 0, 0, 0),
('management', 622, 615, 'admin/structure/types/manage/%/comment/fields/%/field-settings', 'admin/structure/types/manage/%/comment/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 138, 406, 615, 622, 0, 0, 0),
('management', 623, 615, 'admin/structure/types/manage/%/comment/fields/%/widget-type', 'admin/structure/types/manage/%/comment/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 138, 406, 615, 623, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
CREATE TABLE IF NOT EXISTS `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',
  `vid` int(10) unsigned DEFAULT NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The node_type.type of this node.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this node.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that owns this node; initially, this is the user that created it.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The translation set id for this node, which equals the node id of the source post in each set.',
  `translate` int(11) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this translation page needs to be updated.',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='The base table for nodes.' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `sticky`, `tnid`, `translate`) VALUES
(1, 1, 'page', 'und', 'About us', 1, 1, 1314074354, 1315926713, 1, 0, 0, 0, 0),
(2, 2, 'blog', 'und', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat, nisl vel sodales ultricies, augue vel dui', 1, 1, 1314075288, 1318521983, 2, 0, 0, 0, 0),
(3, 3, 'blog', 'und', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat, nisl vel sodales ultricies, augue vel dui', 1, 1, 1311350529, 1318522013, 2, 0, 0, 0, 0),
(4, 4, 'mt_product', 'und', 'Enterprise Product', 1, 1, 1314433557, 1318673078, 2, 1, 0, 0, 0),
(5, 5, 'mt_product', 'und', 'Starter Product', 1, 1, 1314540701, 1318521679, 2, 1, 0, 0, 0),
(6, 6, 'page', 'und', 'Typography', 1, 1, 1314545266, 1314545282, 1, 0, 0, 0, 0),
(7, 7, 'mt_testimonial', 'und', 'John Smith', 1, 1, 1314889152, 1315141384, 1, 1, 0, 0, 0),
(8, 8, 'mt_testimonial', 'und', 'Terry Smith', 1, 1, 1314888118, 1314889803, 1, 1, 0, 0, 0),
(10, 10, 'blog', 'und', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat, nisl vel sodales ultricies, augue vel dui', 1, 1, 1307121983, 1318522042, 2, 0, 0, 0, 0),
(11, 11, 'mt_service', 'und', 'Starter Service', 1, 1, 1307532450, 1318521766, 2, 1, 0, 0, 0),
(12, 12, 'mt_service', 'und', 'Enterprise Service', 1, 1, 1304845217, 1318521889, 2, 0, 0, 0, 0),
(13, 13, 'mt_slideshow_entry', 'und', 'Demo Slideshow entry', 1, 1, 1305734658, 1318674405, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_access`
--

DROP TABLE IF EXISTS `node_access`;
CREATE TABLE IF NOT EXISTS `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record affects.',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The grant ID a user must possess in the specified realm to gain this row’s privileges on the node.',
  `realm` varchar(255) NOT NULL DEFAULT '' COMMENT 'The realm in which the user must possess the grant ID. Each node access node can define one or more realms.',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can view this node.',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can edit this node.',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can delete this node.',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies which realm/grant pairs a user must possess in...';

--
-- Dumping data for table `node_access`
--

INSERT INTO `node_access` (`nid`, `gid`, `realm`, `grant_view`, `grant_update`, `grant_delete`) VALUES
(0, 0, 'all', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_comment_statistics`
--

DROP TABLE IF EXISTS `node_comment_statistics`;
CREATE TABLE IF NOT EXISTS `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid for which the statistics are compiled.',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid of the last comment.',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.',
  `last_comment_name` varchar(60) DEFAULT NULL COMMENT 'The name of the latest author to post a comment on this node, from comment.name.',
  `last_comment_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The user ID of the latest author to post a comment on this node, from comment.uid.',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The total number of comments on this node.',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `comment_count` (`comment_count`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains statistics of node and comments posts to show ...';

--
-- Dumping data for table `node_comment_statistics`
--

INSERT INTO `node_comment_statistics` (`nid`, `cid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES
(1, 0, 1314074354, NULL, 1, 0),
(2, 2, 1314195638, '', 1, 2),
(3, 0, 1314201729, NULL, 1, 0),
(4, 0, 1314519957, NULL, 1, 0),
(5, 0, 1314540701, NULL, 1, 0),
(6, 0, 1314545266, NULL, 1, 0),
(7, 0, 1314887952, NULL, 1, 0),
(8, 0, 1314888118, NULL, 1, 0),
(10, 4, 1315646555, '', 1, 2),
(11, 0, 1315481250, NULL, 1, 0),
(12, 0, 1315494017, NULL, 1, 0),
(13, 0, 1316361858, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_revision`
--

DROP TABLE IF EXISTS `node_revision`;
CREATE TABLE IF NOT EXISTS `node_revision` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node this version belongs to.',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for this version.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that created this version.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this version.',
  `log` longtext NOT NULL COMMENT 'The log entry explaining the changes in this version.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when this version was created.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node (at the time of this revision): 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed at the top of lists in which it appears.',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores information about each saved version of a node.' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `node_revision`
--

INSERT INTO `node_revision` (`nid`, `vid`, `uid`, `title`, `log`, `timestamp`, `status`, `comment`, `promote`, `sticky`) VALUES
(1, 1, 1, 'About us', '', 1315926713, 1, 1, 0, 0),
(2, 2, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat, nisl vel sodales ultricies, augue vel dui', '', 1318521983, 1, 2, 0, 0),
(3, 3, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat, nisl vel sodales ultricies, augue vel dui', '', 1318522013, 1, 2, 0, 0),
(4, 4, 1, 'Enterprise Product', '', 1318673078, 1, 2, 1, 0),
(5, 5, 1, 'Starter Product', '', 1318521679, 1, 2, 1, 0),
(6, 6, 1, 'Typography', '', 1314545282, 1, 1, 0, 0),
(7, 7, 1, 'John Smith', '', 1315141384, 1, 1, 1, 0),
(8, 8, 1, 'Terry Smith', '', 1314889803, 1, 1, 1, 0),
(10, 10, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit feugiat, nisl vel sodales ultricies, augue vel dui', '', 1318522042, 1, 2, 0, 0),
(11, 11, 1, 'Starter Service', '', 1318521766, 1, 2, 1, 0),
(12, 12, 1, 'Enterprise Service', '', 1318521889, 1, 2, 0, 0),
(13, 13, 1, 'Demo Slideshow entry', '', 1318674405, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_type`
--

DROP TABLE IF EXISTS `node_type`;
CREATE TABLE IF NOT EXISTS `node_type` (
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this type.',
  `base` varchar(255) NOT NULL COMMENT 'The base string used to construct callbacks corresponding to this node type.',
  `module` varchar(255) NOT NULL COMMENT 'The module defining this node type.',
  `description` mediumtext NOT NULL COMMENT 'A brief description of this type.',
  `help` mediumtext NOT NULL COMMENT 'Help information shown to the user when creating a node of this type.',
  `has_title` tinyint(3) unsigned NOT NULL COMMENT 'Boolean indicating whether this type uses the node.title field.',
  `title_label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The label displayed for the title field on the edit form.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type is defined by a module (FALSE) or by a user via Add content type (TRUE).',
  `modified` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type has been modified by an administrator; currently not used in any way.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the administrator can change the machine name of this type.',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  `orig_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The original machine-readable name of this node type. This may be different from the current type name if the locked field is 0.',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about all defined node types.';

--
-- Dumping data for table `node_type`
--

INSERT INTO `node_type` (`type`, `name`, `base`, `module`, `description`, `help`, `has_title`, `title_label`, `custom`, `modified`, `locked`, `disabled`, `orig_type`) VALUES
('article', 'Article', 'node_content', 'node', 'Use <em>articles</em> for time-sensitive content like news, press releases or blog posts.', '', 1, 'Title', 1, 1, 0, 0, 'article'),
('blog', 'Blog entry', 'blog', 'blog', 'Use for multi-user blogs. Every user gets a personal blog.', '', 1, 'Title', 0, 1, 1, 0, 'blog'),
('mt_product', 'Product', 'node_content', 'node', 'A Product post is ideal for creating and displaying products. It has the option to be displayed into front page slide show. It provides the ability to attach an image which is automatically adjusted to fit into the websites layout. What’s particularly cool about a Product post, is that it provides the ability to attach a series of images, thumbnails of which are automatically created and adjusted to fit into the website layout. Product post enables free tagging (just like labels), taking the bests from the taxonomy system.', '', 1, 'Title', 1, 1, 0, 0, 'mt_product'),
('mt_service', 'Service', 'node_content', 'node', 'A Service post is ideal for creating and displaying services. It has the option to be displayed into front page slide show. It provides the ability to attach an image which is automatically adjusted to fit into the websites layout. What’s particularly cool about a Service post, is that it provides the ability to attach a series of images, thumbnails of which are automatically created and adjusted to fit into the website layout. Service post enables free tagging (just like labels), taking the bests from the taxonomy system.', '', 1, 'Title', 1, 1, 0, 0, 'mt_service'),
('mt_slideshow_entry', 'Slideshow entry', 'node_content', 'node', 'A Slideshow entry is ideal for creating commercial banners as well as messages for your website. Use it to promote any page of your website or URL into the front page slide show. It can carry a title, a teaser and an image linking to an internal path or external link.', '', 1, 'Title', 1, 1, 0, 0, 'mt_slideshow_entry'),
('mt_testimonial', 'Testimonial', 'node_content', 'node', 'The Testimonial entry is perfect to showcase the words of love from your users and customers. Use it to easily publish testimonials on your site. A special View Block and a View Page are already configured to show them off perfectly.', '', 1, 'Title', 1, 1, 0, 0, 'mt_testimonial'),
('page', 'Basic page', 'node_content', 'node', 'Use <em>basic pages</em> for your static content, such as an ''About us'' page.', '', 1, 'Title', 1, 1, 0, 0, 'page');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE IF NOT EXISTS `queue` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The queue name.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.',
  PRIMARY KEY (`item_id`),
  KEY `name_created` (`name`,`created`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores items in queues.' AUTO_INCREMENT=86 ;

--
-- Dumping data for table `queue`
--


-- --------------------------------------------------------

--
-- Table structure for table `rdf_mapping`
--

DROP TABLE IF EXISTS `rdf_mapping`;
CREATE TABLE IF NOT EXISTS `rdf_mapping` (
  `type` varchar(128) NOT NULL COMMENT 'The name of the entity type a mapping applies to (node, user, comment, etc.).',
  `bundle` varchar(128) NOT NULL COMMENT 'The name of the bundle a mapping applies to.',
  `mapping` longblob COMMENT 'The serialized mapping of the bundle type and fields to RDF terms.',
  PRIMARY KEY (`type`,`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores custom RDF mappings for user defined content types...';

--
-- Dumping data for table `rdf_mapping`
--

INSERT INTO `rdf_mapping` (`type`, `bundle`, `mapping`) VALUES
('node', 'article', 0x613a31313a7b733a31313a226669656c645f696d616765223b613a323a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a383a226f673a696d616765223b693a313b733a31323a22726466733a736565416c736f223b7d733a343a2274797065223b733a333a2272656c223b7d733a31303a226669656c645f74616773223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31303a2264633a7375626a656374223b7d733a343a2274797065223b733a333a2272656c223b7d733a373a2272646674797065223b613a323a7b693a303b733a393a2273696f633a4974656d223b693a313b733a31333a22666f61663a446f63756d656e74223b7d733a353a227469746c65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a383a2264633a7469746c65223b7d7d733a373a2263726561746564223b613a333a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a373a2264633a64617465223b693a313b733a31303a2264633a63726561746564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a373a226368616e676564223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31313a2264633a6d6f646966696564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a343a22626f6479223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31353a22636f6e74656e743a656e636f646564223b7d7d733a333a22756964223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6861735f63726561746f72223b7d733a343a2274797065223b733a333a2272656c223b7d733a343a226e616d65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a393a22666f61663a6e616d65223b7d7d733a31333a22636f6d6d656e745f636f756e74223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6e756d5f7265706c696573223b7d733a383a226461746174797065223b733a31313a227873643a696e7465676572223b7d733a31333a226c6173745f6163746976697479223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a32333a2273696f633a6c6173745f61637469766974795f64617465223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d7d),
('node', 'blog', 0x613a393a7b733a373a2272646674797065223b613a323a7b693a303b733a393a2273696f633a506f7374223b693a313b733a31343a2273696f63743a426c6f67506f7374223b7d733a353a227469746c65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a383a2264633a7469746c65223b7d7d733a373a2263726561746564223b613a333a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a373a2264633a64617465223b693a313b733a31303a2264633a63726561746564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a373a226368616e676564223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31313a2264633a6d6f646966696564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a343a22626f6479223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31353a22636f6e74656e743a656e636f646564223b7d7d733a333a22756964223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6861735f63726561746f72223b7d733a343a2274797065223b733a333a2272656c223b7d733a343a226e616d65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a393a22666f61663a6e616d65223b7d7d733a31333a22636f6d6d656e745f636f756e74223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6e756d5f7265706c696573223b7d733a383a226461746174797065223b733a31313a227873643a696e7465676572223b7d733a31333a226c6173745f6163746976697479223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a32333a2273696f633a6c6173745f61637469766974795f64617465223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d7d),
('node', 'page', 0x613a393a7b733a373a2272646674797065223b613a313a7b693a303b733a31333a22666f61663a446f63756d656e74223b7d733a353a227469746c65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a383a2264633a7469746c65223b7d7d733a373a2263726561746564223b613a333a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a373a2264633a64617465223b693a313b733a31303a2264633a63726561746564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a373a226368616e676564223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31313a2264633a6d6f646966696564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a343a22626f6479223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31353a22636f6e74656e743a656e636f646564223b7d7d733a333a22756964223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6861735f63726561746f72223b7d733a343a2274797065223b733a333a2272656c223b7d733a343a226e616d65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a393a22666f61663a6e616d65223b7d7d733a31333a22636f6d6d656e745f636f756e74223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6e756d5f7265706c696573223b7d733a383a226461746174797065223b733a31313a227873643a696e7465676572223b7d733a31333a226c6173745f6163746976697479223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a32333a2273696f633a6c6173745f61637469766974795f64617465223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role ID.',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Unique role name.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this role in listings and the user interface.',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`),
  KEY `name_weight` (`name`,`weight`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores user roles.' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`rid`, `name`, `weight`) VALUES
(3, 'administrator', 2),
(1, 'anonymous user', 0),
(2, 'authenticated user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE IF NOT EXISTS `role_permission` (
  `rid` int(10) unsigned NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module declaring the permission.',
  PRIMARY KEY (`rid`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the permissions assigned to user roles.';

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`rid`, `permission`, `module`) VALUES
(1, 'access comments', 'comment'),
(1, 'access content', 'node'),
(1, 'access site-wide contact form', 'contact'),
(1, 'search content', 'search'),
(1, 'use text format filtered_html', 'filter'),
(2, 'access comments', 'comment'),
(2, 'access content', 'node'),
(2, 'post comments', 'comment'),
(2, 'skip comment approval', 'comment'),
(2, 'use text format filtered_html', 'filter'),
(3, 'access administration pages', 'system'),
(3, 'access all views', 'views'),
(3, 'access comments', 'comment'),
(3, 'access content', 'node'),
(3, 'access content overview', 'node'),
(3, 'access contextual links', 'contextual'),
(3, 'access dashboard', 'dashboard'),
(3, 'access overlay', 'overlay'),
(3, 'access site in maintenance mode', 'system'),
(3, 'access site reports', 'system'),
(3, 'access site-wide contact form', 'contact'),
(3, 'access toolbar', 'toolbar'),
(3, 'access user contact forms', 'contact'),
(3, 'access user profiles', 'user'),
(3, 'administer actions', 'system'),
(3, 'administer blocks', 'block'),
(3, 'administer comments', 'comment'),
(3, 'administer contact forms', 'contact'),
(3, 'administer content types', 'node'),
(3, 'administer filters', 'filter'),
(3, 'administer image styles', 'image'),
(3, 'administer menu', 'menu'),
(3, 'administer modules', 'system'),
(3, 'administer nodes', 'node'),
(3, 'administer permissions', 'user'),
(3, 'administer search', 'search'),
(3, 'administer shortcuts', 'shortcut'),
(3, 'administer site configuration', 'system'),
(3, 'administer software updates', 'system'),
(3, 'administer taxonomy', 'taxonomy'),
(3, 'administer themes', 'system'),
(3, 'administer url aliases', 'path'),
(3, 'administer users', 'user'),
(3, 'administer views', 'views'),
(3, 'block IP addresses', 'system'),
(3, 'bypass node access', 'node'),
(3, 'cancel account', 'user'),
(3, 'change own username', 'user'),
(3, 'create article content', 'node'),
(3, 'create page content', 'node'),
(3, 'create url aliases', 'path'),
(3, 'customize shortcut links', 'shortcut'),
(3, 'delete any article content', 'node'),
(3, 'delete any page content', 'node'),
(3, 'delete own article content', 'node'),
(3, 'delete own page content', 'node'),
(3, 'delete revisions', 'node'),
(3, 'delete terms in 1', 'taxonomy'),
(3, 'edit any article content', 'node'),
(3, 'edit any page content', 'node'),
(3, 'edit own article content', 'node'),
(3, 'edit own comments', 'comment'),
(3, 'edit own page content', 'node'),
(3, 'edit terms in 1', 'taxonomy'),
(3, 'post comments', 'comment'),
(3, 'revert revisions', 'node'),
(3, 'search content', 'search'),
(3, 'select account cancellation method', 'user'),
(3, 'skip comment approval', 'comment'),
(3, 'switch shortcut sets', 'shortcut'),
(3, 'use advanced search', 'search'),
(3, 'use bulk exporter', 'bulk_export'),
(3, 'use PHP for settings', 'php'),
(3, 'use text format filtered_html', 'filter'),
(3, 'use text format full_html', 'filter'),
(3, 'view own unpublished content', 'node'),
(3, 'view revisions', 'node'),
(3, 'view the administration theme', 'system');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
CREATE TABLE IF NOT EXISTS `sequences` (
  `value` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The value of the sequence.',
  PRIMARY KEY (`value`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores IDs.' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sequences`
--

INSERT INTO `sequences` (`value`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `uid` int(10) unsigned NOT NULL COMMENT 'The users.uid corresponding to a session, or 0 for anonymous user.',
  `sid` varchar(128) NOT NULL COMMENT 'A session ID. The value is generated by Drupal’s session handlers.',
  `ssid` varchar(128) NOT NULL DEFAULT '' COMMENT 'Secure session ID. The value is generated by Drupal’s session handlers.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The IP address that last used this session ID (sid).',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when this session last requested a page. Old records are purged by PHP automatically.',
  `cache` int(11) NOT NULL DEFAULT '0' COMMENT 'The time of this user’s last post. This is used when the site has specified a minimum_cache_lifetime. See cache_get().',
  `session` longblob COMMENT 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.',
  PRIMARY KEY (`sid`,`ssid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`),
  KEY `ssid` (`ssid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Drupal’s session handlers read and write into the...';

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`uid`, `sid`, `ssid`, `hostname`, `timestamp`, `cache`, `session`) VALUES
(1, '-i0HWzvbNxd9MrgJ0DiN_zphZpteQrBIqrxqKPS86QQ', '', '127.0.0.1', 1334689072, 0, ''),
(1, '6MN1iE8yi3sQdMwJiD7cAbUNj3niTdfDd_vIPhoOMpc', '', '127.0.0.1', 1337441684, 0, 0x64626c6f675f6f766572766965775f66696c7465727c613a303a7b7d),
(1, 'jXK-fFNprBiIUHrfb55vf_T3CIk_IRezifHdVAiBNCk', '', '127.0.0.1', 1335184731, 0, ''),
(1, 'mLPIknrl1Mv6xuV3k7z7956IoZFcDzHVtJBE5KkupZg', '', '::1', 1336486596, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set`
--

DROP TABLE IF EXISTS `shortcut_set`;
CREATE TABLE IF NOT EXISTS `shortcut_set` (
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: The menu_links.menu_name under which the set’s links are stored.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of the set.',
  PRIMARY KEY (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about sets of shortcuts links.';

--
-- Dumping data for table `shortcut_set`
--

INSERT INTO `shortcut_set` (`set_name`, `title`) VALUES
('shortcut-set-1', 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set_users`
--

DROP TABLE IF EXISTS `shortcut_set_users`;
CREATE TABLE IF NOT EXISTS `shortcut_set_users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid for this set.',
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.',
  PRIMARY KEY (`uid`),
  KEY `set_name` (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps users to shortcut sets.';

--
-- Dumping data for table `shortcut_set_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_index`
--

DROP TABLE IF EXISTS `taxonomy_index`;
CREATE TABLE IF NOT EXISTS `taxonomy_index` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  KEY `term_node` (`tid`,`sticky`,`created`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';

--
-- Dumping data for table `taxonomy_index`
--

INSERT INTO `taxonomy_index` (`nid`, `tid`, `sticky`, `created`) VALUES
(5, 4, 0, 1314540701),
(11, 5, 0, 1307532450),
(12, 5, 0, 1304845217),
(2, 1, 0, 1314075288),
(2, 2, 0, 1314075288),
(3, 1, 0, 1311350529),
(3, 2, 0, 1311350529),
(10, 1, 0, 1307121983),
(10, 2, 0, 1307121983),
(4, 4, 0, 1314433557);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_data`
--

DROP TABLE IF EXISTS `taxonomy_term_data`;
CREATE TABLE IF NOT EXISTS `taxonomy_term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique term ID.',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The taxonomy_vocabulary.vid of the vocabulary to which the term is assigned.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The term name.',
  `description` longtext COMMENT 'A description of the term.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the description.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this term in relation to other terms.',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores term information.' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `taxonomy_term_data`
--

INSERT INTO `taxonomy_term_data` (`tid`, `vid`, `name`, `description`, `format`, `weight`) VALUES
(1, 1, 'Business', NULL, NULL, 0),
(2, 1, 'World', NULL, NULL, 0),
(4, 1, 'Product Line 2011', NULL, NULL, 0),
(5, 1, 'Services 2011', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_hierarchy`
--

DROP TABLE IF EXISTS `taxonomy_term_hierarchy`;
CREATE TABLE IF NOT EXISTS `taxonomy_term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term.',
  `parent` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term’s parent. 0 indicates no parent.',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the hierarchical relationship between terms.';

--
-- Dumping data for table `taxonomy_term_hierarchy`
--

INSERT INTO `taxonomy_term_hierarchy` (`tid`, `parent`) VALUES
(1, 0),
(2, 0),
(4, 0),
(5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_vocabulary`
--

DROP TABLE IF EXISTS `taxonomy_vocabulary`;
CREATE TABLE IF NOT EXISTS `taxonomy_vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique vocabulary ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the vocabulary.',
  `machine_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The vocabulary machine name.',
  `description` longtext COMMENT 'Description of the vocabulary.',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module which created the vocabulary.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `machine_name` (`machine_name`),
  KEY `list` (`weight`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores vocabulary information.' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `taxonomy_vocabulary`
--

INSERT INTO `taxonomy_vocabulary` (`vid`, `name`, `machine_name`, `description`, `hierarchy`, `module`, `weight`) VALUES
(1, 'Tags', 'tags', 'Use tags to group articles on similar topics into categories.', 1, 'taxonomy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

DROP TABLE IF EXISTS `url_alias`;
CREATE TABLE IF NOT EXISTS `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'A unique path alias identifier.',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path this alias is for; e.g. node/12.',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'The alias for this path; e.g. title-of-the-story.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The language this alias is for; if ’und’, the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.',
  PRIMARY KEY (`pid`),
  KEY `alias_language_pid` (`alias`,`language`,`pid`),
  KEY `source_language_pid` (`source`,`language`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of URL aliases for Drupal paths; a user may visit...' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `url_alias`
--


-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
CREATE TABLE IF NOT EXISTS `variable` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the variable.',
  `value` longblob NOT NULL COMMENT 'The value of the variable.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Named variable/value pairs created by Drupal core or any...';

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` (`name`, `value`) VALUES
('additional_settings__active_tab_blog', 0x733a31333a22656469742d776f726b666c6f77223b),
('additional_settings__active_tab_mt_product', 0x733a31353a22656469742d7375626d697373696f6e223b),
('additional_settings__active_tab_mt_service', 0x733a31333a22656469742d776f726b666c6f77223b),
('additional_settings__active_tab_mt_slideshow_entry', 0x733a31353a22656469742d7375626d697373696f6e223b),
('additional_settings__active_tab_mt_testimonial', 0x733a31353a22656469742d7375626d697373696f6e223b),
('admin_theme', 0x733a353a22736576656e223b),
('anonymous', 0x733a393a22416e6f6e796d6f7573223b),
('block_cache', 0x693a303b),
('cache', 0x693a303b),
('cache_lifetime', 0x733a313a2230223b),
('clean_url', 0x693a303b),
('comment_anonymous_blog', 0x693a303b),
('comment_anonymous_mt_product', 0x693a303b),
('comment_anonymous_mt_service', 0x693a303b),
('comment_anonymous_mt_slideshow_entry', 0x693a303b),
('comment_anonymous_mt_testimonial', 0x693a303b),
('comment_blog', 0x733a313a2232223b),
('comment_default_mode_blog', 0x693a313b),
('comment_default_mode_mt_product', 0x693a313b),
('comment_default_mode_mt_service', 0x693a313b),
('comment_default_mode_mt_slideshow_entry', 0x693a313b),
('comment_default_mode_mt_testimonial', 0x693a313b),
('comment_default_per_page_blog', 0x733a323a223530223b),
('comment_default_per_page_mt_product', 0x733a323a223530223b),
('comment_default_per_page_mt_service', 0x733a323a223530223b),
('comment_default_per_page_mt_slideshow_entry', 0x733a323a223530223b),
('comment_default_per_page_mt_testimonial', 0x733a323a223530223b),
('comment_form_location_blog', 0x693a313b),
('comment_form_location_mt_product', 0x693a313b),
('comment_form_location_mt_service', 0x693a313b),
('comment_form_location_mt_slideshow_entry', 0x693a313b),
('comment_form_location_mt_testimonial', 0x693a313b),
('comment_mt_product', 0x733a313a2232223b),
('comment_mt_service', 0x733a313a2232223b),
('comment_mt_slideshow_entry', 0x733a313a2231223b),
('comment_mt_testimonial', 0x733a313a2231223b),
('comment_page', 0x693a303b),
('comment_preview_blog', 0x733a313a2231223b),
('comment_preview_mt_product', 0x733a313a2231223b),
('comment_preview_mt_service', 0x733a313a2231223b),
('comment_preview_mt_slideshow_entry', 0x733a313a2231223b),
('comment_preview_mt_testimonial', 0x733a313a2230223b),
('comment_subject_field_blog', 0x693a313b),
('comment_subject_field_mt_product', 0x693a313b),
('comment_subject_field_mt_service', 0x693a313b),
('comment_subject_field_mt_slideshow_entry', 0x693a313b),
('comment_subject_field_mt_testimonial', 0x693a313b),
('contact_default_status', 0x693a313b),
('cron_key', 0x733a34333a22484d516471644265656677506b496636386167524f7761515742516b703169725374344a496a714f6f7967223b),
('cron_last', 0x693a313333373433383735323b),
('css_js_query_string', 0x733a363a226d3461306c6f223b),
('ctools_last_cron', 0x693a313333373433383736313b),
('date_default_timezone', 0x733a31353a224575726f70652f48656c73696e6b69223b),
('default_nodes_main', 0x733a313a2235223b),
('drupal_http_request_fails', 0x623a303b),
('drupal_private_key', 0x733a34333a22314d786f6e4c36524d49506d53436d5a3341553135584c4b526f6f6a6236316d5259585436437658557538223b),
('email__active_tab', 0x733a32343a22656469742d656d61696c2d61646d696e2d63726561746564223b),
('field_bundle_settings_node__blog', 0x613a323a7b733a31303a22766965775f6d6f646573223b613a353a7b733a363a22746561736572223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a313b7d733a343a2266756c6c223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a333a22727373223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31323a227365617263685f696e646578223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31333a227365617263685f726573756c74223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d7d733a31323a2265787472615f6669656c6473223b613a323a7b733a343a22666f726d223b613a313a7b733a353a227469746c65223b613a313a7b733a363a22776569676874223b733a313a2230223b7d7d733a373a22646973706c6179223b613a303a7b7d7d7d),
('field_bundle_settings_node__mt_product', 0x613a323a7b733a31303a22766965775f6d6f646573223b613a353a7b733a363a22746561736572223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a313b7d733a343a2266756c6c223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a333a22727373223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31323a227365617263685f696e646578223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31333a227365617263685f726573756c74223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d7d733a31323a2265787472615f6669656c6473223b613a323a7b733a343a22666f726d223b613a313a7b733a353a227469746c65223b613a313a7b733a363a22776569676874223b733a313a2230223b7d7d733a373a22646973706c6179223b613a303a7b7d7d7d),
('field_bundle_settings_node__mt_service', 0x613a323a7b733a31303a22766965775f6d6f646573223b613a353a7b733a363a22746561736572223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a313b7d733a343a2266756c6c223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a333a22727373223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31323a227365617263685f696e646578223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31333a227365617263685f726573756c74223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d7d733a31323a2265787472615f6669656c6473223b613a323a7b733a343a22666f726d223b613a313a7b733a353a227469746c65223b613a313a7b733a363a22776569676874223b733a313a2230223b7d7d733a373a22646973706c6179223b613a303a7b7d7d7d),
('field_bundle_settings_node__mt_slideshow_entry', 0x613a323a7b733a31303a22766965775f6d6f646573223b613a353a7b733a363a22746561736572223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a313b7d733a343a2266756c6c223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a333a22727373223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31323a227365617263685f696e646578223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31333a227365617263685f726573756c74223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d7d733a31323a2265787472615f6669656c6473223b613a323a7b733a343a22666f726d223b613a313a7b733a353a227469746c65223b613a313a7b733a363a22776569676874223b733a313a2230223b7d7d733a373a22646973706c6179223b613a303a7b7d7d7d),
('field_bundle_settings_node__mt_testimonial', 0x613a323a7b733a31303a22766965775f6d6f646573223b613a353a7b733a363a22746561736572223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a313b7d733a343a2266756c6c223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a333a22727373223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31323a227365617263685f696e646578223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31333a227365617263685f726573756c74223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d7d733a31323a2265787472615f6669656c6473223b613a323a7b733a343a22666f726d223b613a313a7b733a353a227469746c65223b613a313a7b733a363a22776569676874223b733a313a2230223b7d7d733a373a22646973706c6179223b613a303a7b7d7d7d),
('file_default_scheme', 0x733a363a227075626c6963223b),
('file_private_path', 0x733a303a22223b),
('file_public_path', 0x733a31393a2273697465732f64656661756c742f66696c6573223b),
('file_temporary_path', 0x733a32333a2273697465732f64656661756c742f66696c65732f746d70223b),
('filter_fallback_format', 0x733a31303a22706c61696e5f74657874223b),
('install_profile', 0x733a383a227374616e64617264223b),
('install_task', 0x733a343a22646f6e65223b),
('install_time', 0x693a313331323830363938393b),
('maintenance_mode', 0x623a303b),
('maintenance_mode_message', 0x733a3130313a22427573696e657373436c6173732069732063757272656e746c7920756e646572206d61696e74656e616e63652e2057652073686f756c64206265206261636b2073686f72746c792e205468616e6b20796f7520666f7220796f75722070617469656e63652e223b),
('menu_default_active_menus', 0x613a373a7b693a303b733a31303a226e617669676174696f6e223b693a313b733a31303a226d616e6167656d656e74223b693a323b733a393a22757365722d6d656e75223b693a333b733a393a226d61696e2d6d656e75223b693a343b733a31313a226d656e752d62726f777365223b693a353b733a31363a226d656e752d666f6f7465722d6d656e75223b693a363b733a31393a226d656e752d737562666f6f7465722d6d656e75223b7d),
('menu_expanded', 0x613a313a7b693a303b733a393a226d61696e2d6d656e75223b7d),
('menu_main_links_source', 0x733a393a226d61696e2d6d656e75223b),
('menu_masks', 0x613a33363a7b693a303b693a3530313b693a313b693a3439333b693a323b693a3235303b693a333b693a3234373b693a343b693a3234363b693a353b693a3234353b693a363b693a3132353b693a373b693a3132343b693a383b693a3132333b693a393b693a3132323b693a31303b693a3132313b693a31313b693a3131373b693a31323b693a36333b693a31333b693a36323b693a31343b693a36313b693a31353b693a36303b693a31363b693a35393b693a31373b693a35383b693a31383b693a34343b693a31393b693a33313b693a32303b693a33303b693a32313b693a32393b693a32323b693a32383b693a32333b693a32353b693a32343b693a32343b693a32353b693a32313b693a32363b693a31353b693a32373b693a31343b693a32383b693a31333b693a32393b693a31313b693a33303b693a373b693a33313b693a363b693a33323b693a353b693a33333b693a333b693a33343b693a323b693a33353b693a313b7d),
('menu_options_blog', 0x613a313a7b693a303b733a393a226d61696e2d6d656e75223b7d),
('menu_options_mt_product', 0x613a313a7b693a303b733a393a226d61696e2d6d656e75223b7d),
('menu_options_mt_service', 0x613a313a7b693a303b733a393a226d61696e2d6d656e75223b7d),
('menu_options_mt_slideshow_entry', 0x613a303a7b7d),
('menu_options_mt_testimonial', 0x613a303a7b7d),
('menu_parent_blog', 0x733a31313a226d61696e2d6d656e753a30223b),
('menu_parent_mt_product', 0x733a31313a226d61696e2d6d656e753a30223b),
('menu_parent_mt_service', 0x733a31313a226d61696e2d6d656e753a30223b),
('menu_parent_mt_slideshow_entry', 0x733a31313a226d61696e2d6d656e753a30223b),
('menu_parent_mt_testimonial', 0x733a31313a226d61696e2d6d656e753a30223b),
('menu_secondary_links_source', 0x733a31393a226d656e752d737562666f6f7465722d6d656e75223b),
('mtt_twitter_account', 0x733a31343a226d6f72657468616e7468656d6573223b),
('mtt_twitter_interval', 0x733a313a2235223b),
('mtt_twitter_title', 0x733a32373a224c617465737420757064617465732066726f6d2054776974746572223b),
('nice_menus_custom_css', 0x733a303a22223b),
('nice_menus_depth_1', 0x733a313a2233223b),
('nice_menus_js', 0x693a313b),
('nice_menus_menu_1', 0x733a393a226d61696e2d6d656e75223b),
('nice_menus_name_1', 0x733a303a22223b),
('nice_menus_number', 0x733a313a2231223b),
('nice_menus_sf_delay', 0x733a333a22323030223b),
('nice_menus_sf_speed', 0x733a343a2266617374223b),
('nice_menus_type_1', 0x733a343a22646f776e223b),
('node_admin_theme', 0x693a313b),
('node_cron_last', 0x733a31303a2231333138363734343035223b),
('node_options_blog', 0x613a313a7b693a303b733a363a22737461747573223b7d),
('node_options_mt_product', 0x613a313a7b693a303b733a363a22737461747573223b7d),
('node_options_mt_service', 0x613a313a7b693a303b733a363a22737461747573223b7d),
('node_options_mt_slideshow_entry', 0x613a313a7b693a303b733a363a22737461747573223b7d),
('node_options_mt_testimonial', 0x613a323a7b693a303b733a363a22737461747573223b693a313b733a373a2270726f6d6f7465223b7d),
('node_options_page', 0x613a313a7b693a303b733a363a22737461747573223b7d),
('node_preview_blog', 0x733a313a2231223b),
('node_preview_mt_product', 0x733a313a2231223b),
('node_preview_mt_service', 0x733a313a2231223b),
('node_preview_mt_slideshow_entry', 0x733a313a2231223b),
('node_preview_mt_testimonial', 0x733a313a2231223b),
('node_submitted_blog', 0x693a313b),
('node_submitted_mt_product', 0x693a303b),
('node_submitted_mt_service', 0x693a303b),
('node_submitted_mt_slideshow_entry', 0x693a303b),
('node_submitted_mt_testimonial', 0x693a303b),
('node_submitted_page', 0x623a303b),
('page_cache_maximum_age', 0x733a313a2230223b),
('page_compression', 0x693a313b),
('path_alias_whitelist', 0x613a303a7b7d),
('preprocess_css', 0x693a303b),
('preprocess_js', 0x693a303b),
('save_continue_mt_product', 0x733a31393a225361766520616e6420616464206669656c6473223b),
('save_continue_mt_service', 0x733a31393a225361766520616e6420616464206669656c6473223b),
('save_continue_mt_slideshow_entry', 0x733a31393a225361766520616e6420616464206669656c6473223b),
('save_continue_mt_testimonial', 0x733a31393a225361766520616e6420616464206669656c6473223b),
('site_403', 0x733a303a22223b),
('site_404', 0x733a303a22223b),
('site_default_country', 0x733a303a22223b),
('site_frontpage', 0x733a343a226e6f6465223b),
('site_mail', 0x733a32353a2267656f726765406d6f72657468616e7468656d65732e636f6d223b),
('site_name', 0x733a31333a22427573696e657373436c617373223b),
('site_slogan', 0x733a32383a2248656c7020796f757220627573696e657373207374616e64206f7574223b),
('theme_businessclass_settings', 0x613a32363a7b733a31313a22746f67676c655f6c6f676f223b693a303b733a31313a22746f67676c655f6e616d65223b693a313b733a31333a22746f67676c655f736c6f67616e223b693a313b733a32343a22746f67676c655f6e6f64655f757365725f70696374757265223b693a313b733a32373a22746f67676c655f636f6d6d656e745f757365725f70696374757265223b693a313b733a33323a22746f67676c655f636f6d6d656e745f757365725f766572696669636174696f6e223b693a313b733a31343a22746f67676c655f66617669636f6e223b693a313b733a31363a22746f67676c655f6d61696e5f6d656e75223b693a313b733a32313a22746f67676c655f7365636f6e646172795f6d656e75223b693a313b733a31323a2264656661756c745f6c6f676f223b693a313b733a393a226c6f676f5f70617468223b733a303a22223b733a31313a226c6f676f5f75706c6f6164223b733a303a22223b733a31353a2264656661756c745f66617669636f6e223b693a313b733a31323a2266617669636f6e5f70617468223b733a303a22223b733a31343a2266617669636f6e5f75706c6f6164223b733a303a22223b733a31383a2262726561646372756d625f646973706c6179223b693a313b733a31373a227363726f6c6c746f705f646973706c6179223b693a313b733a31323a22636f6c6f725f736368656d65223b733a373a2264656661756c74223b733a32303a22736974656e616d655f666f6e745f66616d696c79223b733a31313a227366662d64656661756c74223b733a32303a2268656164696e67735f666f6e745f66616d696c79223b733a31313a226866662d64656661756c74223b733a32313a227061726167726170685f666f6e745f66616d696c79223b733a31313a227066662d64656661756c74223b733a31363a22736c69646573686f775f656666656374223b733a343a2266616465223b733a32313a22736c69646573686f775f6566666563745f74696d65223b733a323a223130223b733a31373a2266726f6e74706167655f656d756c617465223b693a303b733a32333a2266726f6e74706167655f636f6e74656e745f7072696e74223b693a303b733a32313a226e6963655f6d656e75735f637573746f6d5f637373223b733a303a22223b7d),
('theme_default', 0x733a31333a22627573696e657373636c617373223b),
('update_last_check', 0x693a313333373433393436363b),
('update_notify_emails', 0x613a313a7b693a303b733a32353a2267656f726765406d6f72657468616e7468656d65732e636f6d223b7d),
('user_admin_role', 0x733a313a2233223b),
('user_cancel_method', 0x733a31373a22757365725f63616e63656c5f626c6f636b223b),
('user_email_verification', 0x693a313b),
('user_mail_cancel_confirm_body', 0x733a3338313a225b757365723a6e616d655d2c0d0a0d0a41207265717565737420746f2063616e63656c20796f7572206163636f756e7420686173206265656e206d616465206174205b736974653a6e616d655d2e0d0a0d0a596f75206d6179206e6f772063616e63656c20796f7572206163636f756e74206f6e205b736974653a75726c2d62726965665d20627920636c69636b696e672074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420696e746f20796f75722062726f777365723a0d0a0d0a5b757365723a63616e63656c2d75726c5d0d0a0d0a4e4f54453a205468652063616e63656c6c6174696f6e206f6620796f7572206163636f756e74206973206e6f742072657665727369626c652e0d0a0d0a54686973206c696e6b206578706972657320696e206f6e652064617920616e64206e6f7468696e672077696c6c2068617070656e206966206974206973206e6f7420757365642e0d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_cancel_confirm_subject', 0x733a35393a224163636f756e742063616e63656c6c6174696f6e207265717565737420666f72205b757365723a6e616d655d206174205b736974653a6e616d655d223b),
('user_mail_password_reset_body', 0x733a3430373a225b757365723a6e616d655d2c0d0a0d0a41207265717565737420746f207265736574207468652070617373776f726420666f7220796f7572206163636f756e7420686173206265656e206d616465206174205b736974653a6e616d655d2e0d0a0d0a596f75206d6179206e6f77206c6f6720696e20627920636c69636b696e672074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420746f20796f75722062726f777365723a0d0a0d0a5b757365723a6f6e652d74696d652d6c6f67696e2d75726c5d0d0a0d0a54686973206c696e6b2063616e206f6e6c792062652075736564206f6e636520746f206c6f6720696e20616e642077696c6c206c65616420796f7520746f2061207061676520776865726520796f752063616e2073657420796f75722070617373776f72642e2049742065787069726573206166746572206f6e652064617920616e64206e6f7468696e672077696c6c2068617070656e2069662069742773206e6f7420757365642e0d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_password_reset_subject', 0x733a36303a225265706c6163656d656e74206c6f67696e20696e666f726d6174696f6e20666f72205b757365723a6e616d655d206174205b736974653a6e616d655d223b),
('user_mail_register_admin_created_body', 0x733a3437363a225b757365723a6e616d655d2c0d0a0d0a4120736974652061646d696e6973747261746f72206174205b736974653a6e616d655d20686173206372656174656420616e206163636f756e7420666f7220796f752e20596f75206d6179206e6f77206c6f6720696e20627920636c69636b696e672074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420746f20796f75722062726f777365723a0d0a0d0a5b757365723a6f6e652d74696d652d6c6f67696e2d75726c5d0d0a0d0a54686973206c696e6b2063616e206f6e6c792062652075736564206f6e636520746f206c6f6720696e20616e642077696c6c206c65616420796f7520746f2061207061676520776865726520796f752063616e2073657420796f75722070617373776f72642e0d0a0d0a41667465722073657474696e6720796f75722070617373776f72642c20796f752077696c6c2062652061626c6520746f206c6f6720696e206174205b736974653a6c6f67696e2d75726c5d20696e2074686520667574757265207573696e673a0d0a0d0a757365726e616d653a205b757365723a6e616d655d0d0a70617373776f72643a20596f75722070617373776f72640d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_register_admin_created_subject', 0x733a35383a22416e2061646d696e6973747261746f72206372656174656420616e206163636f756e7420666f7220796f75206174205b736974653a6e616d655d223b),
('user_mail_register_no_approval_required_body', 0x733a3435303a225b757365723a6e616d655d2c0d0a0d0a5468616e6b20796f7520666f72207265676973746572696e67206174205b736974653a6e616d655d2e20596f75206d6179206e6f77206c6f6720696e20627920636c69636b696e672074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420746f20796f75722062726f777365723a0d0a0d0a5b757365723a6f6e652d74696d652d6c6f67696e2d75726c5d0d0a0d0a54686973206c696e6b2063616e206f6e6c792062652075736564206f6e636520746f206c6f6720696e20616e642077696c6c206c65616420796f7520746f2061207061676520776865726520796f752063616e2073657420796f75722070617373776f72642e0d0a0d0a41667465722073657474696e6720796f75722070617373776f72642c20796f752077696c6c2062652061626c6520746f206c6f6720696e206174205b736974653a6c6f67696e2d75726c5d20696e2074686520667574757265207573696e673a0d0a0d0a757365726e616d653a205b757365723a6e616d655d0d0a70617373776f72643a20596f75722070617373776f72640d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_register_no_approval_required_subject', 0x733a34363a224163636f756e742064657461696c7320666f72205b757365723a6e616d655d206174205b736974653a6e616d655d223b),
('user_mail_register_pending_approval_body', 0x733a3238373a225b757365723a6e616d655d2c0d0a0d0a5468616e6b20796f7520666f72207265676973746572696e67206174205b736974653a6e616d655d2e20596f7572206170706c69636174696f6e20666f7220616e206163636f756e742069732063757272656e746c792070656e64696e6720617070726f76616c2e204f6e636520697420686173206265656e20617070726f7665642c20796f752077696c6c207265636569766520616e6f7468657220652d6d61696c20636f6e7461696e696e6720696e666f726d6174696f6e2061626f757420686f7720746f206c6f6720696e2c2073657420796f75722070617373776f72642c20616e64206f746865722064657461696c732e0d0a0d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_register_pending_approval_subject', 0x733a37313a224163636f756e742064657461696c7320666f72205b757365723a6e616d655d206174205b736974653a6e616d655d202870656e64696e672061646d696e20617070726f76616c29223b),
('user_mail_status_activated_body', 0x733a3436313a225b757365723a6e616d655d2c0d0a0d0a596f7572206163636f756e74206174205b736974653a6e616d655d20686173206265656e206163746976617465642e0d0a0d0a596f75206d6179206e6f77206c6f6720696e20627920636c69636b696e672074686973206c696e6b206f7220636f7079696e6720616e642070617374696e6720697420696e746f20796f75722062726f777365723a0d0a0d0a5b757365723a6f6e652d74696d652d6c6f67696e2d75726c5d0d0a0d0a54686973206c696e6b2063616e206f6e6c792062652075736564206f6e636520746f206c6f6720696e20616e642077696c6c206c65616420796f7520746f2061207061676520776865726520796f752063616e2073657420796f75722070617373776f72642e0d0a0d0a41667465722073657474696e6720796f75722070617373776f72642c20796f752077696c6c2062652061626c6520746f206c6f6720696e206174205b736974653a6c6f67696e2d75726c5d20696e2074686520667574757265207573696e673a0d0a0d0a757365726e616d653a205b757365723a6e616d655d0d0a70617373776f72643a20596f75722070617373776f72640d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_status_activated_notify', 0x693a313b),
('user_mail_status_activated_subject', 0x733a35373a224163636f756e742064657461696c7320666f72205b757365723a6e616d655d206174205b736974653a6e616d655d2028617070726f76656429223b),
('user_mail_status_blocked_body', 0x733a38353a225b757365723a6e616d655d2c0d0a0d0a596f7572206163636f756e74206f6e205b736974653a6e616d655d20686173206265656e20626c6f636b65642e0d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_status_blocked_notify', 0x693a303b),
('user_mail_status_blocked_subject', 0x733a35363a224163636f756e742064657461696c7320666f72205b757365723a6e616d655d206174205b736974653a6e616d655d2028626c6f636b656429223b),
('user_mail_status_canceled_body', 0x733a38363a225b757365723a6e616d655d2c0d0a0d0a596f7572206163636f756e74206f6e205b736974653a6e616d655d20686173206265656e2063616e63656c65642e0d0a0d0a2d2d20205b736974653a6e616d655d207465616d223b),
('user_mail_status_canceled_notify', 0x693a303b),
('user_mail_status_canceled_subject', 0x733a35373a224163636f756e742064657461696c7320666f72205b757365723a6e616d655d206174205b736974653a6e616d655d202863616e63656c656429223b),
('user_pictures', 0x693a313b),
('user_picture_default', 0x733a33393a2273697465732f64656661756c742f66696c65732f70696374757265732f6176617461722e706e67223b),
('user_picture_dimensions', 0x733a393a22313032347831303234223b),
('user_picture_file_size', 0x733a333a22383030223b),
('user_picture_guidelines', 0x733a303a22223b),
('user_picture_path', 0x733a383a227069637475726573223b),
('user_picture_style', 0x733a393a227468756d626e61696c223b),
('user_register', 0x733a313a2230223b),
('user_signatures', 0x693a313b),
('views_defaults', 0x613a333a7b733a373a2261726368697665223b623a303b733a31333a227461786f6e6f6d795f7465726d223b623a303b733a31353a22636f6d6d656e74735f726563656e74223b623a313b7d);
