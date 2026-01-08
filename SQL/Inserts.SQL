USE game_store;
INSERT INTO Custumers (Custumer_Name, Custumer_Birthday, Custumer_Mail)
SELECT 
    CONCAT('Customer ', n),
    DATE_ADD('1980-01-01', INTERVAL FLOOR(RAND() * 12000) DAY),
    CONCAT('customer', n, '@email.com')
FROM (
    SELECT @row := @row + 1 AS n
    FROM information_schema.tables, (SELECT @row := 0) r
    LIMIT 100
) t;

INSERT INTO Games (Game_Name, Game_Price, Game_Genre) VALUES
('The Witcher 3', 79.90, 'RPG'),
('Cyberpunk 2077', 99.90, 'RPG'),
('Red Dead Redemption 2', 119.90, 'Action'),
('Elden Ring', 129.90, 'RPG'),
('Dark Souls III', 89.90, 'RPG'),
('Resident Evil 4', 79.90, 'Horror'),
('Resident Evil Village', 99.90, 'Horror'),
('FIFA 23', 249.90, 'Sports'),
('EA FC 24', 299.90, 'Sports'),
('Call of Duty Modern Warfare', 199.90, 'FPS'),
('Call of Duty Warzone', 0.00, 'FPS'),
('God of War', 149.90, 'Action'),
('God of War Ragnarok', 299.90, 'Action'),
('Horizon Zero Dawn', 99.90, 'Adventure'),
('Horizon Forbidden West', 299.90, 'Adventure'),
('GTA V', 79.90, 'Action'),
('GTA San Andreas', 39.90, 'Action'),
('Forza Horizon 5', 249.90, 'Racing'),
('Need for Speed Heat', 149.90, 'Racing'),
('Gran Turismo 7', 299.90, 'Racing'),
('Mortal Kombat 11', 79.90, 'Fight'),
('Street Fighter 6', 249.90, 'Fight'),
('Tekken 7', 99.90, 'Fight'),
('The Last of Us Part I', 299.90, 'Adventure'),
('The Last of Us Part II', 199.90, 'Adventure'),
('Assassin’s Creed Valhalla', 149.90, 'Action'),
('Assassin’s Creed Odyssey', 99.90, 'Action'),
('Far Cry 6', 149.90, 'FPS'),
('Far Cry 5', 79.90, 'FPS'),
('Dead Space Remake', 249.90, 'Horror'),
('Outlast', 39.90, 'Horror'),
('Outlast 2', 79.90, 'Horror'),
('Subnautica', 79.90, 'Survivor'),
('The Forest', 59.90, 'Survivor'),
('ARK Survival Evolved', 79.90, 'Survivor'),
('Minecraft', 99.90, 'Survivor'),
('Terraria', 29.90, 'Survivor'),
('Skyrim', 79.90, 'RPG'),
('Fallout 4', 79.90, 'RPG'),
('Diablo IV', 349.90, 'RPG'),
('Baldur’s Gate 3', 199.90, 'RPG'),
('Sea of Thieves', 149.90, 'Adventure'),
('Uncharted 4', 79.90, 'Adventure'),
('Crash Bandicoot N. Sane Trilogy', 79.90, 'Adventure'),
('Spyro Reignited Trilogy', 79.90, 'Adventure'),
('Cuphead', 49.90, 'Action'),
('Hades', 79.90, 'Action'),
('Celeste', 39.90, 'Adventure');

INSERT INTO Orders (Custumer_ID, Order_Date)
SELECT
    FLOOR(1 + RAND() * 100),
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY)
FROM (
    SELECT @row2 := @row2 + 1
    FROM information_schema.tables, (SELECT @row2 := 0) r
    LIMIT 200
) t;

INSERT INTO Order_Items (Order_ID, Game_ID, Quantity, Unit_Price)
SELECT
    o.Order_ID,
    g.Game_ID,
    FLOOR(1 + RAND() * 3) AS Quantity,
    g.Game_Price AS Unit_Price
FROM Orders o
JOIN Games g
ON RAND() < 0.05;