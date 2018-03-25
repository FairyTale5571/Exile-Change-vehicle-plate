ALTER TABLE `vehicle`
ADD COLUMN `plate`  varchar(32) NOT NULL DEFAULT 'Sexy server' AFTER `nickname`;

