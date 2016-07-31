-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 31 2016 г., 16:00
-- Версия сервера: 5.5.50
-- Версия PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `zf2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` float NOT NULL,
  `photo` varchar(2083) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `photo`) VALUES
(1, 'Grape', 'A grape is a fruiting berry of the deciduous woody vines of the botanical genus Vitis.', 15.5, 'http://www.hd-wallpapersdownload.com/script/bulk-upload/fruit-wallpaper-free-download.jpg'),
(2, 'Apple', 'The apple tree (Malus domestica) is a deciduous tree in the rose family best known for its sweet, pomaceous fruit, the apple.', 7.2, 'http://www.hd-wallpapersdownload.com/script/apple-wallpaper/green-apple-fruit-wallpapers.jpg'),
(3, 'Orange', 'The orange (specifically, the sweet orange) is the fruit of the citrus species Citrus × sinensis in the family Rutaceae.', 3.86, 'http://www.hd-wallpapersdownload.com/script/orange-wallpaper/desktop-orange-fruit-background-dowload.jpg'),
(4, 'Pineapple', 'The pineapple (Ananas comosus) is a tropical plant with edible multiple fruit consisting of coalesced berries, also called pineapples, and the most economically significant plant in the Bromeliaceae family.', 18.12, 'http://www.hd-wallpapersdownload.com/script/pineapple-wallpaper/desktop-pineapple-fruit-images.jpg'),
(5, 'Lemon', 'The lemon (Citrus × limon) is a species of small evergreen tree native to Asia.', 11.02, 'http://www.hd-wallpapersdownload.com/script/lemon-wallpaper/desktop-lemon-wallpaper-fruit-dowload.jpg'),
(6, 'Mango', 'The mango is a juicy stone fruit (drupe) belonging to the genus Mangifera, consisting of numerous tropical fruiting trees, cultivated mostly for edible fruit.', 20.1, 'http://www.hd-wallpapersdownload.com/script/mango-wallpaper/desktop-mango-fruit-picture-dowload.jpg'),
(7, 'Strawberry', 'The garden strawberry (or simply strawberry; Fragaria × ananassa) is a widely grown hybrid species of the genus Fragaria (collectively known as the strawberries).', 19.99, 'http://www.hd-wallpapersdownload.com/script/strawberry-wallpaper/desktop-berry-pictures-fruit.jpg'),
(8, 'Apricot', 'An apricot is a fruit or the tree that bears the fruit of several species in the genus Prunus (stone fruits).', 11.8, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Apricot_and_cross_section.jpg/220px-Apricot_and_cross_section.jpg'),
(9, 'Cherry', 'A cherry is the fruit of many plants of the genus Prunus, and is a fleshy drupe (stone fruit).', 8.78, 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Cherry_Stella444.jpg/220px-Cherry_Stella444.jpg'),
(10, 'Grapefruit', 'The grapefruit (Citrus × paradisi) is a subtropical citrus tree known for its sour to semi-sweet fruit.', 12.5, 'http://www.hd-wallpapersdownload.com/script/orange-wallpaper/desktop-orange-fruit-wallpapers-dowload.jpg'),
(11, 'Kiwi', 'Kiwifruit (often shortened to kiwi) or Chinese gooseberry is the name given to the edible berries of several species of woody vines in the genus Actinidia.', 20.9, 'http://pngimg.com/upload/kiwi_PNG4028.png'),
(12, 'Lime', 'A lime (from French lime, from Arabic līma, from Persian līmū, "lemon") is a hybrid citrus fruit, which is typically round, lime green, 3–6 centimetres (1.2–2.4 in) in diameter, and containing acidic juice vesicles.', 8.61, 'http://photo.elsoar.com/wp-content/images/Fresh-lime-Photo-D.jpg'),
(13, 'Bergamot', 'Citrus bergamia, the bergamot orange (pronounced /ˈbɜːrɡəˌmɒt/), is a fragrant fruit the size of an orange, with a yellow color similar to a lemon.', 25, 'http://mamapedia.com.ua/UploadImages/bergamot-pri-beremennosti.jpg'),
(14, 'Pear', 'The pear is any of several tree and shrub species of genus Pyrus /ˈpaɪrəs/, in the family Rosaceae.', 11.12, 'http://clipartmania.ru/uploads/gallery/comthumb/344/pear-73.png'),
(15, 'Mulberry', 'Morus, a genus of flowering plants in the family Moraceae, comprises 10–16 species of deciduous trees commonly known as mulberries, growing wild and under cultivation in many temperate world regions.', 9.04, 'http://genuineaid.com/wp-content/uploads/mulberries.jpg'),
(16, 'Raspberry', 'The raspberry is the edible fruit of a multitude of plant species in the genus Rubus of the rose family, most of which are in the subgenus Idaeobatus; the name also applies to these plants themselves.', 14.08, 'http://kingofwallpapers.com/raspberry/raspberry-006.jpg'),
(17, 'Avocado', 'The avocado (Persea americana) is a tree that is native to South Central Mexico, classified as a member of the flowering plant family Lauraceae.', 22.14, 'http://edaplus.info/food_pictures/avocado.jpg'),
(18, 'Coffee', 'A coffee seed, commonly called coffee bean is a seed of the coffee plant, and is the source for coffee. It is the pit inside the red or purple fruit often referred to as a cherry.', 35.14, 'https://rdaltoncoffee.com/wp-content/uploads/2015/03/roasted-coffee-beans.jpg'),
(19, 'Cocoa', 'The cocoa bean, also cacao bean or simply cocoa or cacao, is the dried and fully fermented fatty seed of Theobroma cacao, from which cocoa solids and cocoa butter can be extracted. They are the basis of chocolate, as well as many Mesoamerican foods such as mole and tejate.', 40.08, 'http://media.salon.com/2013/02/shutterstock_cocoa-beans-1280x960.jpg'),
(20, 'Peanut', 'Peanut, also known as groundnut and goober (Arachis hypogaea), is a crop of global importance. It is widely grown in the tropics and subtropics, being important to both smallholder and large commercial producers.', 33.98, 'http://voloski.ru/wp-content/uploads/2015/06/c95547ef25b4d5fbe026651828e60a21-830x519.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `usr_name` varchar(256) NOT NULL,
  `usr_password` varchar(100) NOT NULL,
  `usr_email` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `usr_name`, `usr_password`, `usr_email`) VALUES
(1, 'user1', '698d51a19d8a121ce581499d7b701668', 'user1@ldomain.com'),
(2, 'user2', 'bcbe3365e6ac95ea2c0343a2395834dd', 'user2@ldomain.com'),
(3, 'user3', '310dcbbf4cce62f762a2aaa148d556bd', 'user3@ldomain.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
