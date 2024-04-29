CREATE TABLE IF NOT EXISTS "Locations"
(
    "location_id" SERIAL PRIMARY KEY,
    "country"     TEXT,
    "city"        TEXT,
    "home_number" TEXT
);

CREATE TABLE IF NOT EXISTS "Devices"
(
    "device_id" SERIAL PRIMARY KEY,
    "device_name" TEXT,
    "device_type" TEXT,
    "location_id" BIGINT,
    "status"      TEXT,
    "last_update" TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "Sensors"
(
    "sensor_id" SERIAL PRIMARY KEY,
    "device_id" BIGINT,
    "sensor_type" TEXT,
    "value" DOUBLE PRECISION,
    "timestamp" TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "SecuritySystems"
(
    "security_id" SERIAL PRIMARY KEY,
    "device_id" BIGINT,
    "security_type" TEXT,
    "status" TEXT,
    "timestamp" TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "TrafficControl"
(
    "traffic_id" SERIAL PRIMARY KEY,
    "device_id" BIGINT,
    "traffic_light_status" TEXT,
    "traffic_flow" DOUBLE PRECISION,
    "timestamp" TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "PowerNetworks"
(
    "power_id" SERIAL PRIMARY KEY,
    "device_id" BIGINT,
    "power_consumption" DOUBLE PRECISION,
    "renewable_energy" TEXT,
    "timestamp" TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "DataCollection"
(
    "data_id" SERIAL PRIMARY KEY,
    "device_id" BIGINT,
    "data_type" TEXT,
    "data_content" TEXT
);

ALTER TABLE "Devices"
    ADD CONSTRAINT "Devices_fk3" FOREIGN KEY ("location_id") REFERENCES "Locations" ("location_id");

ALTER TABLE "Sensors"
    ADD CONSTRAINT "Sensors_fk1" FOREIGN KEY ("device_id") REFERENCES "Devices" ("device_id");

ALTER TABLE "SecuritySystems"
    ADD CONSTRAINT "SecuritySystems_fk1" FOREIGN KEY ("device_id") REFERENCES "Devices" ("device_id");

ALTER TABLE "TrafficControl"
    ADD CONSTRAINT "TrafficControl_fk1" FOREIGN KEY ("device_id") REFERENCES "Devices" ("device_id");

ALTER TABLE "PowerNetworks"
    ADD CONSTRAINT "PowerNetworks_fk1" FOREIGN KEY ("device_id") REFERENCES "Devices" ("device_id");

ALTER TABLE "DataCollection"
    ADD CONSTRAINT "DataCollection_fk1" FOREIGN KEY ("device_id") REFERENCES "Devices" ("device_id");
