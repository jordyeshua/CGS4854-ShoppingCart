-- schema.sql: database for the Shopping Cart project
CREATE DATABASE IF NOT EXISTS shop_db;
USE shop_db;

CREATE TABLE IF NOT EXISTS users (
    user_id        INT AUTO_INCREMENT PRIMARY KEY,
    full_name      VARCHAR(100) NOT NULL,
    email          VARCHAR(100) NOT NULL UNIQUE,
    password_hash  VARCHAR(255) NOT NULL,
    created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    product_id   INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    description  VARCHAR(255),
    price        DECIMAL(10,2) NOT NULL,
    image        VARCHAR(255),
    stock        INT NOT NULL DEFAULT 100
);

CREATE TABLE IF NOT EXISTS orders (
    order_id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id           INT NOT NULL,
    customer_name     VARCHAR(100) NOT NULL,
    customer_email    VARCHAR(100) NOT NULL,
    shipping_address  VARCHAR(255) NOT NULL,
    total_amount      DECIMAL(10,2) NOT NULL,
    tracking_number   VARCHAR(30) NOT NULL UNIQUE,
    order_status      VARCHAR(30) NOT NULL DEFAULT 'Processing',
    order_date        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS order_items (
    item_id     INT AUTO_INCREMENT PRIMARY KEY,
    order_id    INT NOT NULL,
    product_id  INT NOT NULL,
    quantity    INT NOT NULL,
    price       DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample products (INSERT IGNORE makes re-running safe)
INSERT IGNORE INTO products (product_id, name, description, price, image) VALUES
(1, 'Wireless Headphones', 'Bluetooth over-ear headphones with 30-hour battery.', 59.99, 'images/headphones.jpg'),
(2, 'Mechanical Keyboard', 'RGB backlit keyboard with tactile switches.', 79.99, 'images/keyboard.jpg'),
(3, 'Gaming Mouse', 'Ergonomic mouse with adjustable DPI.', 34.99, 'images/mouse.jpg'),
(4, 'USB-C Hub', '7-in-1 hub with HDMI, USB 3.0, and SD reader.', 29.99, 'images/hub.jpg'),
(5, '27" Monitor', 'Full HD IPS display with thin bezels.', 189.99, 'images/monitor.jpg'),
(6, 'Webcam', '1080p webcam with built-in microphone.', 44.99, 'images/webcam.jpg'),
(7, 'Laptop Stand', 'Adjustable aluminum stand for laptops up to 17".', 24.99, 'images/stand.jpg'),
(8, 'Portable SSD 1TB', 'Fast external drive, USB 3.2.', 99.99, 'images/ssd.jpg');