--
-- Table structure for table `posts`
--
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
                         `id` int(11) NOT NULL,
                         `title` varchar(255) NOT NULL,
                         `thumbnail` varchar(255) NOT NULL,
                         `description` text NOT NULL,
                         `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
                         `id` int(11) NOT NULL,
                         `name` varchar(50) NOT NULL,
                         `is_admin` tinyint(1) NOT NULL DEFAULT 0,
                         `password_hash` varchar(255) NOT NULL,
                         `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
-- --------------------------------------------------------

--
-- Table structure for table `refresh_token`
--
DROP TABLE IF EXISTS `refresh_token`;
CREATE TABLE `refresh_token` (
                         `token_hash` varchar(64) NOT NULL,
                         `expires_at` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `is_admin`, `password_hash`, `email`) VALUES
(1, 'Hank Do', 1, '$2y$10$V/hPKkDd32QIGelKDH86MepWd6iqlXHitv8vI1UXL8RSYLr/cfAuO', 'hank@litextension.com'),
(2, 'TEST', 0, '$2y$10$shWybI4ZUNPu3qP6AURh6O.Kkfs73gi/kDFjhbSivAflGZSUU.VFu', 'test@test.com');

--
-- Dumping data for table `posts`
--
INSERT INTO `posts` (`id`, `title`, `thumbnail`, `description`, `status`) VALUES
(1, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(2, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(3, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(4, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(5, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(6, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(7, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(8, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(9, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(10, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(11, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(12, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(13, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(14, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(15, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(16, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(17, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(18, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(19, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(20, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(21, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(22, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(23, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(24, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(25, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(26, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(27, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(28, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(29, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(30, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(31, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(32, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(33, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(34, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(35, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(36, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(37, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(38, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(39, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(40, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(41, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(42, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(43, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(44, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(45, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(46, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(47, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(48, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(49, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(50, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(51, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(52, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(53, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(54, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(55, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(56, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(57, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(58, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(59, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(60, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(61, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(62, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(63, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(64, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(65, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(66, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(67, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(68, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(69, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(70, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(71, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(72, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(73, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(74, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(75, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(76, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(77, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(78, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(79, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(80, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(81, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(82, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(83, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(84, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(85, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(86, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(87, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(88, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(89, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(90, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(91, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(92, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(93, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(94, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(95, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(96, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(97, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(98, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(99, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(100, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(101, 'How to draw a dog in 5 steps', 'http://localhost/img/how-to-draw-a-dog.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(102, '10 THINGS YOU DIDN’T KNOW ABOUT AIRPORTS', 'http://localhost/img/world-best-airports.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 0),
(103, 'What We Learned When Attending Content Marketing World 2016', 'http://localhost/img/marketing-world-2016.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(104, '10 Predictions About the Future of Photography', 'http://localhost/img/photography.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1),
(105, '25 Excellent Pieces of Advice That Most People Ignore', 'http://localhost/img/advice.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, ad commodi consequatur delectus dolorum, enim eum fugiat illum inventore labore laborum molestiae nihil qui quibusdam repellendus rerum sapiente, sit vel.', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `refresh_token`
    ADD PRIMARY KEY (`token_hash`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;
