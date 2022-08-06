CREATE TABLE `login` (
`id` int(11) NOT NULL,
`firstname` varchar(10) NOT NULL,
`lastname` varchar(12) NOT NULL,
`email` varchar(40) NOT NULL,
`password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--
-- Dumping data for table `login`
--



INSERT INTO `login` (`id`, `firstname`, `lastname`, `email`, `password`) VALUES
(15, 'hamid', 'shaikh', 'demo@gmail.com', '123456');



--
-- Indexes for dumped tables
--



--
-- Indexes for table `login`
--
ALTER TABLE `login`
ADD PRIMARY KEY (`id`);



--
-- AUTO_INCREMENT for dumped tables
--



--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- CREATE table `orders`
--

CREATE TABLE orders (
`id` int(11) NOT NULL,
`Name` varchar(30) NOT NULL,
`email` varchar(40) NOT NULL,
`contact` varchar(20) NOT NULL ,
`address` varchar(200) NOT NULL,
`brand` varchar(20) NOT NULL,
`status` varchar(20) NOT NULL,
`quantity` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--ALTER TABLE orders CHANGE id order_id int;
ALTER TABLE `orders` ADD PRIMARY KEY (`id`);
ALTER TABLE `orders` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--ALTER TABLE `orders` MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
