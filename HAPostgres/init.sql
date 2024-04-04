CREATE TABLE IF NOT EXISTS Locations (
    location_id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    city VARCHAR(255),
    home_number varchar(255)
);

CREATE TABLE IF NOT EXISTS Devices (
    device_id SERIAL PRIMARY KEY,
    device_name VARCHAR(255),
    device_type VARCHAR(50),
    location_id INT REFERENCES Locations(location_id),
    status VARCHAR(10) CHECK (status IN ('active', 'inactive')),
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Sensors (
    sensor_id SERIAL PRIMARY KEY,
    device_id INT REFERENCES Devices(device_id),
    sensor_type VARCHAR(50),
    value FLOAT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS SecuritySystems (
    security_id SERIAL PRIMARY KEY,
    device_id INT REFERENCES Devices(device_id),
    security_type VARCHAR(50),
    status VARCHAR(10) CHECK (status IN ('active', 'inactive')),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS TrafficControl (
    traffic_id SERIAL PRIMARY KEY,
    device_id INT REFERENCES Devices(device_id),
    traffic_light_status VARCHAR(10) CHECK (traffic_light_status IN ('red', 'yellow', 'green')),
    traffic_flow FLOAT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS PowerNetworks (
    power_id SERIAL PRIMARY KEY,
    device_id INT REFERENCES Devices(device_id),
    power_consumption FLOAT,
    renewable_energy VARCHAR(3) CHECK (renewable_energy IN ('yes', 'no')),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS DataCollection (
    data_id SERIAL PRIMARY KEY,
    device_id INT REFERENCES Devices(device_id),
    data_type VARCHAR(50),
    data_content TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- добавить табличку с маппингом местоположения в формате таблицы : страна, город, улица, дом
-- описать баш скрипт для создания бэкапа в формате backup-дата.sql
-- добавить скрипт в образ постгрес
-- добавить в образ скрипт для загрузки последнего бэкапа из папки backup, чтобы при запуске автоматом создавались все таблички. Возможно нужно задать переменную среды в которой определять надо ли создавать таблички из бэкап папки