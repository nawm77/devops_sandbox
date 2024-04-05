CREATE TABLE IF NOT EXISTS "Locations"
(
    "location_id" integer NOT NULL,
    "country"     text,
    "city"        text,
    "home_number" text,
    PRIMARY KEY ("location_id")
);

CREATE TABLE IF NOT EXISTS "Devices"
(
    "device_id"   integer NOT NULL,
    "device_name" text,
    "device_type" text,
    "location_id" bigint,
    "status"      text,
    "last_update" timestamp,
    PRIMARY KEY ("device_id")
);

CREATE TABLE IF NOT EXISTS "Sensors"
(
    "sensor_id"   integer NOT NULL,
    "device_id"   bigint,
    "sensor_type" text,
    "value"       double precision,
    "timestamp"   timestamp,
    PRIMARY KEY ("sensor_id")
);

CREATE TABLE IF NOT EXISTS "SecuritySystems"
(
    "security_id"   integer NOT NULL,
    "device_id"     bigint,
    "security_type" text,
    "status"        text,
    "timestamp"     timestamp,
    PRIMARY KEY ("security_id")
);

CREATE TABLE IF NOT EXISTS "TrafficControl"
(
    "traffic_id"           integer NOT NULL,
    "device_id"            bigint,
    "traffic_light_status" text,
    "traffic_flow"         double precision,
    "timestamp"            timestamp,
    PRIMARY KEY ("traffic_id")
);

CREATE TABLE IF NOT EXISTS "PowerNetworks"
(
    "power_id"          integer NOT NULL,
    "device_id"         bigint,
    "power_consumption" double precision,
    "renewable_energy"  text,
    "timestamp"         timestamp,
    PRIMARY KEY ("power_id")
);

CREATE TABLE IF NOT EXISTS "DataCollection"
(
    "data_id"      integer NOT NULL,
    "device_id"    bigint,
    "data_type"    text,
    "data_content" text
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