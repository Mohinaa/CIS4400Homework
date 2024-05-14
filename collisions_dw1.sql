CREATE SCHEMA IF NOT EXISTS "collisions";

CREATE  TABLE "collisions".dim__date ( 
	crash_date           date  NOT NULL  ,
	crash_time           date  NOT NULL  ,
	date_key             date  NOT NULL  ,
	CONSTRAINT pk_dim__date PRIMARY KEY ( date_key )
 );

CREATE  TABLE "collisions".dim_contributing_factor ( 
	contributing_factor_vehicle_1 varchar  NOT NULL  ,
	contributing_factor_vehicle_2 varchar  NOT NULL  ,
	contributing_factor_vehicle_3 varchar  NOT NULL  ,
	contributing_factor_vehicle_4 varchar  NOT NULL  ,
	contributing_factor_vehicle_5 varchar  NOT NULL  ,
	contributing_factor_key varchar  NOT NULL  ,
	CONSTRAINT pk_dim_contributing_factor PRIMARY KEY ( contributing_factor_key )
 );

CREATE  TABLE "collisions".dim_damages ( 
	number_of_persons_injured integer  NOT NULL  ,
	number_of_persons_killed integer  NOT NULL  ,
	number_of_pedestrians_injured integer  NOT NULL  ,
	number_of_pedestrians_killed integer  NOT NULL  ,
	number_of_cyclists_injured integer  NOT NULL  ,
	number_of_cyclists_killed integer  NOT NULL  ,
	number_of_motorist_injured integer  NOT NULL  ,
	number_of_motorists_killed integer  NOT NULL  ,
	damages_key          varchar  NOT NULL  ,
	CONSTRAINT pk_dim_damages PRIMARY KEY ( damages_key )
 );

CREATE  TABLE "collisions".dim_location ( 
	borough              varchar  NOT NULL  ,
	zipcode              varchar  NOT NULL  ,
	location             varchar  NOT NULL  ,
	location_key         varchar  NOT NULL  ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( location_key )
 );

CREATE  TABLE "collisions".facts_table ( 
	collision_id         integer  NOT NULL  ,
	facts_key            varchar  NOT NULL  ,
	location_key         varchar  NOT NULL  ,
	date_key             date  NOT NULL  ,
	damages_key          integer  NOT NULL  ,
	contributing_factor_key varchar  NOT NULL  ,
	CONSTRAINT pk_facts_table PRIMARY KEY ( facts_key )
 );

ALTER TABLE "collisions".facts_table ADD CONSTRAINT fk_facts_table_dim_location FOREIGN KEY ( location_key ) REFERENCES "collisions".dim_location( location_key );

ALTER TABLE "collisions".facts_table ADD CONSTRAINT fk_facts_table_dim__date FOREIGN KEY ( date_key ) REFERENCES "collisions".dim__date( date_key );

ALTER TABLE "collisions".facts_table ADD CONSTRAINT fk_facts_table_dim_damages FOREIGN KEY ( damages_key ) REFERENCES "collisions".dim_damages( damages_key );

ALTER TABLE "collisions".facts_table ADD CONSTRAINT fk_facts_table_dim_contributing_factor FOREIGN KEY ( contributing_factor_key ) REFERENCES "collisions".dim_contributing_factor( contributing_factor_key );
