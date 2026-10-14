CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (255) NOT NULL,
    last_name VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL,
    phone_number INT (11)NOT NULL,
    driver_license_no INT (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS vehicle_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_type VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS vehicle_brand (
    model_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR (250) NOT NULL,
    model_name VARCHAR (250) NOT NULL
);

CREATE TABLE IF NOT EXISTS vehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    model_id INT NOT NULL,
    license_plate VARCHAR (20) NOT NULL UNIQUE,
    vin_number VARCHAR (100) NOT NULL UNIQUE,
    vehicle_status VARCHAR (20) NOT NULL,

    FOREIGN KEY (category_id) REFERENCES vehicle_category(category_id),
    FOREIGN KEY (model_id) REFERENCES vehicle_brand(model_id)
);

CREATE TABLE IF NOT EXISTS rent_transactions (
    rental_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    booking_date DATETIME NOT NULL,
    pickup_date DATETIME NOT NULL,
    rental_status VARCHAR (20) NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

CREATE TABLE IF NOT EXISTS return_logs (
    return_id INT PRIMARY KEY AUTO_INCREMENT,
    rental_id INT NOT NULL,
    return_date DATETIME NOT NULL,

    FOREIGN KEY (rental_id) REFERENCES rent_transactions(rental_id)
);