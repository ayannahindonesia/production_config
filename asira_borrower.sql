-- Adminer 4.7.1 PostgreSQL dump

DROP TABLE IF EXISTS "agents";
DROP SEQUENCE IF EXISTS agents_id_seq;
CREATE SEQUENCE agents_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."agents" (
    "id" bigint DEFAULT nextval('agents_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "name" character varying(255),
    "username" character varying(255),
    "password" text,
    "image" text,
    "email" character varying(255),
    "phone" character varying(255),
    "category" character varying(255),
    "agent_provider" bigint,
    "banks" integer[],
    "status" character varying(255),
    "fcm_token" character varying(255),
    CONSTRAINT "agents_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "bank_types";
DROP SEQUENCE IF EXISTS bank_types_id_seq;
CREATE SEQUENCE bank_types_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."bank_types" (
    "id" bigint DEFAULT nextval('bank_types_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "name" character varying(255),
    "description" text,
    CONSTRAINT "bank_types_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "banks";
DROP SEQUENCE IF EXISTS banks_id_seq;
CREATE SEQUENCE banks_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."banks" (
    "id" bigint DEFAULT nextval('banks_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "name" character varying(255),
    "image" text,
    "type" character varying(255),
    "address" text,
    "province" character varying(255),
    "city" character varying(255),
    "pic" character varying(255),
    "phone" character varying(255),
    "adminfee_setup" character varying(255),
    "convfee_setup" character varying(255),
    "services" integer[],
    "products" integer[],
    CONSTRAINT "banks_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "borrowers";
DROP SEQUENCE IF EXISTS borrowers_id_seq;
CREATE SEQUENCE borrowers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS borrowers_bank_seq;
CREATE SEQUENCE borrowers_bank_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS borrowers_agent_referral_seq;
CREATE SEQUENCE borrowers_agent_referral_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."borrowers" (
    "id" bigint DEFAULT nextval('borrowers_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "suspended_time" timestamptz,
    "fullname" character varying(255) NOT NULL,
    "nickname" character varying(255),
    "gender" character varying(1) NOT NULL,
    "image" text,
    "idcard_number" character varying(255) NOT NULL,
    "idcard_image" text,
    "taxid_number" character varying(255),
    "taxid_image" text,
    "nationality" character varying(255),
    "email" character varying(255),
    "birthday" date NOT NULL,
    "birthplace" character varying(255) NOT NULL,
    "last_education" character varying(255) NOT NULL,
    "mother_name" character varying(255) NOT NULL,
    "phone" character varying(255),
    "marriage_status" character varying(255) NOT NULL,
    "spouse_name" character varying(255),
    "spouse_birthday" date,
    "spouse_lasteducation" character varying(255),
    "dependants" integer DEFAULT '0',
    "address" text NOT NULL,
    "province" character varying(255) NOT NULL,
    "city" character varying(255) NOT NULL,
    "neighbour_association" character varying(255) NOT NULL,
    "hamlets" character varying(255) NOT NULL,
    "home_phonenumber" character varying(255) NOT NULL,
    "subdistrict" character varying(255) NOT NULL,
    "urban_village" character varying(255) NOT NULL,
    "home_ownership" character varying(255) NOT NULL,
    "lived_for" integer NOT NULL,
    "occupation" character varying(255) NOT NULL,
    "employee_id" character varying(255),
    "employer_name" character varying(255) NOT NULL,
    "employer_address" text NOT NULL,
    "department" character varying(255) NOT NULL,
    "been_workingfor" integer,
    "direct_superiorname" character varying(255),
    "employer_number" character varying(255) NOT NULL,
    "monthly_income" integer NOT NULL,
    "other_income" integer,
    "other_incomesource" character varying(255),
    "field_of_work" character varying(255) NOT NULL,
    "related_personname" character varying(255) NOT NULL,
    "related_relation" character varying(255) NOT NULL,
    "related_phonenumber" character varying(255) NOT NULL,
    "related_homenumber" character varying(255),
    "related_address" text,
    "bank" bigint DEFAULT nextval('borrowers_bank_seq') NOT NULL,
    "bank_accountnumber" character varying(255),
    "otp_verified" boolean,
    "agent_referral" bigint DEFAULT nextval('borrowers_agent_referral_seq') NOT NULL,
    "status" character varying(255) DEFAULT 'active',
    CONSTRAINT "borrowers_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "borrowers_bank_fkey" FOREIGN KEY (bank) REFERENCES banks(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "clients";
DROP SEQUENCE IF EXISTS clients_id_seq;
CREATE SEQUENCE clients_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."clients" (
    "id" bigint DEFAULT nextval('clients_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "role" character varying(255) NOT NULL,
    "secret" character varying(255) NOT NULL,
    "key" character varying(255) NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    CONSTRAINT "clients_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "clients" ("id", "name", "role", "secret", "key", "created_at", "updated_at", "deleted_at") VALUES
(1,	'Android Client',	'client',	'4cf2b78b-78bd-40d9-8e51-ab74e7acbfc0',	'XodUC3rK9Tob',	'2020-01-23 06:48:29.448323+00',	'2020-01-23 06:48:29.448323+00',	NULL);

DROP TABLE IF EXISTS "goose_db_version";
DROP SEQUENCE IF EXISTS goose_db_version_id_seq;
CREATE SEQUENCE goose_db_version_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."goose_db_version" (
    "id" integer DEFAULT nextval('goose_db_version_id_seq') NOT NULL,
    "version_id" bigint NOT NULL,
    "is_applied" boolean NOT NULL,
    "tstamp" timestamp DEFAULT now(),
    CONSTRAINT "goose_db_version_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "goose_db_version" ("id", "version_id", "is_applied", "tstamp") VALUES
(1,	'0',	'1',	'2020-01-23 06:48:26.560623'),
(2,	1,	'1',	'2020-01-23 06:48:26.581265');

DROP TABLE IF EXISTS "loan_purposes";
DROP SEQUENCE IF EXISTS loan_purposes_id_seq;
CREATE SEQUENCE loan_purposes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."loan_purposes" (
    "id" bigint DEFAULT nextval('loan_purposes_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "name" character varying(255),
    "status" character varying(255),
    CONSTRAINT "loan_purposes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "loans";
DROP SEQUENCE IF EXISTS loans_id_seq;
CREATE SEQUENCE loans_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS loans_borrower_seq;
CREATE SEQUENCE loans_borrower_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS loans_product_seq;
CREATE SEQUENCE loans_product_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."loans" (
    "id" bigint DEFAULT nextval('loans_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "borrower" bigint DEFAULT nextval('loans_borrower_seq') NOT NULL,
    "product" bigint DEFAULT nextval('loans_product_seq') NOT NULL,
    "status" character varying(255) DEFAULT 'processing',
    "loan_amount" double precision NOT NULL,
    "installment" integer NOT NULL,
    "fees" jsonb DEFAULT '[]',
    "interest" double precision NOT NULL,
    "total_loan" double precision NOT NULL,
    "disburse_amount" double precision NOT NULL,
    "due_date" timestamptz,
    "layaway_plan" double precision NOT NULL,
    "loan_intention" character varying(255) NOT NULL,
    "intention_details" text NOT NULL,
    "borrower_info" jsonb DEFAULT '[]',
    "otp_verified" boolean,
    "disburse_date" timestamptz,
    "disburse_date_changed" boolean,
    "disburse_status" character varying(255) DEFAULT 'processing',
    "approval_date" timestamptz,
    "reject_reason" text,
    CONSTRAINT "loans_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "loans_borrower_fkey" FOREIGN KEY (borrower) REFERENCES borrowers(id) NOT DEFERRABLE,
    CONSTRAINT "loans_product_fkey" FOREIGN KEY (product) REFERENCES products(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "notifications";
DROP SEQUENCE IF EXISTS notifications_id_seq;
CREATE SEQUENCE notifications_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS notifications_client_id_seq;
CREATE SEQUENCE notifications_client_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."notifications" (
    "id" bigint DEFAULT nextval('notifications_id_seq') NOT NULL,
    "client_id" bigint DEFAULT nextval('notifications_client_id_seq') NOT NULL,
    "recipient_id" character varying(255),
    "title" character varying(255) NOT NULL,
    "message_body" text,
    "firebase_token" character varying(255),
    "topic" character varying(125),
    "response" character varying(255),
    "send_time" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    CONSTRAINT "notifications_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "products";
DROP SEQUENCE IF EXISTS products_id_seq;
CREATE SEQUENCE products_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS products_service_id_seq;
CREATE SEQUENCE products_service_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."products" (
    "id" bigint DEFAULT nextval('products_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "name" character varying(255),
    "status" character varying(255),
    "service_id" bigint DEFAULT nextval('products_service_id_seq') NOT NULL,
    "min_timespan" integer,
    "max_timespan" integer,
    "interest" integer,
    "min_loan" integer,
    "max_loan" integer,
    "fees" jsonb DEFAULT '[]',
    "collaterals" character varying(255)[],
    "financing_sector" character varying(255)[],
    "assurance" character varying(255),
    CONSTRAINT "products_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "products_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "services";
DROP SEQUENCE IF EXISTS services_id_seq;
CREATE SEQUENCE services_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."services" (
    "id" bigint DEFAULT nextval('services_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "name" character varying(255),
    "image" text,
    "status" character varying(255),
    CONSTRAINT "services_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS users_borrower_seq;
CREATE SEQUENCE users_borrower_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."users" (
    "id" bigint DEFAULT nextval('users_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "borrower" bigint DEFAULT nextval('users_borrower_seq') NOT NULL,
    "password" character varying(255) NOT NULL,
    "fcm_token" character varying(255),
    CONSTRAINT "users_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "users_borrower_fkey" FOREIGN KEY (borrower) REFERENCES borrowers(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "uuid_reset_passwords";
DROP SEQUENCE IF EXISTS uuid_reset_passwords_id_seq;
CREATE SEQUENCE uuid_reset_passwords_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS uuid_reset_passwords_borrower_seq;
CREATE SEQUENCE uuid_reset_passwords_borrower_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."uuid_reset_passwords" (
    "id" bigint DEFAULT nextval('uuid_reset_passwords_id_seq') NOT NULL,
    "uuid" character varying(255) NOT NULL,
    "borrower" bigint DEFAULT nextval('uuid_reset_passwords_borrower_seq') NOT NULL,
    "expired" timestamptz,
    "used" boolean,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    CONSTRAINT "uuid_reset_passwords_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "uuid_reset_passwords_borrower_fkey" FOREIGN KEY (borrower) REFERENCES borrowers(id) NOT DEFERRABLE
) WITH (oids = false);


-- 2020-01-23 07:26:18.358815+00
