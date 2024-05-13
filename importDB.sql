
CREATE TABLE IF NOT EXISTS `carjack_occupiedLocations` (
  `occupiedLocationsID` int(11) NOT NULL AUTO_INCREMENT,
  `occupied` tinyint(1) NOT NULL,
  `citizen_id` varchar(255) DEFAULT NULL,
  `vehicle_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`occupiedLocationsID`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE IF NOT EXISTS `carjack_SavedCars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `plate` varchar(20) NOT NULL,
  `color` text NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `vehicle_id` bigint(20) NOT NULL DEFAULT 0,
  `random_vehicle_id` bigint(20) DEFAULT 0,
  `color_R` int(11) DEFAULT NULL,
  `color_G` int(11) DEFAULT NULL,
  `color_B` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

