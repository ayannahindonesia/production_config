-- Adminer 4.7.1 PostgreSQL dump

DROP TABLE IF EXISTS "agent_providers";
DROP SEQUENCE IF EXISTS agent_providers_id_seq;
CREATE SEQUENCE agent_providers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."agent_providers" (
    "id" bigint DEFAULT nextval('agent_providers_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "name" character varying(255),
    "pic" character varying(255),
    "phone" character varying(255),
    "address" text,
    "status" character varying(255),
    CONSTRAINT "agent_providers_phone_key" UNIQUE ("phone"),
    CONSTRAINT "agent_providers_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


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
    CONSTRAINT "agents_email_key" UNIQUE ("email"),
    CONSTRAINT "agents_phone_key" UNIQUE ("phone"),
    CONSTRAINT "agents_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "agents_username_key" UNIQUE ("username"),
    CONSTRAINT "agents_agent_provider_fkey" FOREIGN KEY (agent_provider) REFERENCES agent_providers(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "bank_representatives";
DROP SEQUENCE IF EXISTS bank_representatives_id_seq;
CREATE SEQUENCE bank_representatives_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS bank_representatives_bank_id_seq;
CREATE SEQUENCE bank_representatives_bank_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS bank_representatives_user_id_seq;
CREATE SEQUENCE bank_representatives_user_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."bank_representatives" (
    "id" bigint DEFAULT nextval('bank_representatives_id_seq') NOT NULL,
    "bank_id" bigint DEFAULT nextval('bank_representatives_bank_id_seq') NOT NULL,
    "user_id" bigint DEFAULT nextval('bank_representatives_user_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    CONSTRAINT "bank_representatives_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "bank_representatives_bank_id_fkey" FOREIGN KEY (bank_id) REFERENCES banks(id) NOT DEFERRABLE,
    CONSTRAINT "bank_representatives_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) NOT DEFERRABLE
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

DROP SEQUENCE IF EXISTS banks_type_seq;
CREATE SEQUENCE banks_type_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."banks" (
    "id" bigint DEFAULT nextval('banks_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "name" character varying(255),
    "image" text,
    "type" bigint DEFAULT nextval('banks_type_seq') NOT NULL,
    "address" text,
    "province" character varying(255),
    "city" character varying(255),
    "pic" character varying(255),
    "phone" character varying(255),
    "adminfee_setup" character varying(255),
    "convfee_setup" character varying(255),
    "services" integer[],
    "products" integer[],
    CONSTRAINT "banks_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "banks_type_fkey" FOREIGN KEY (type) REFERENCES bank_types(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "borrowers";
DROP SEQUENCE IF EXISTS borrowers_id_seq;
CREATE SEQUENCE borrowers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

DROP SEQUENCE IF EXISTS borrowers_bank_seq;
CREATE SEQUENCE borrowers_bank_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."borrowers" (
    "id" bigint DEFAULT nextval('borrowers_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "status" character varying(255),
    "fullname" character varying(255) NOT NULL,
    "nickname" character varying(255),
    "gender" character varying(1) NOT NULL,
    "image" text,
    "idcard_number" character varying(255) NOT NULL,
    "idcard_image" text,
    "taxid_number" character varying(255),
    "taxid_image" text,
    "email" character varying(255) NOT NULL,
    "birthday" date NOT NULL,
    "birthplace" character varying(255) NOT NULL,
    "last_education" character varying(255) NOT NULL,
    "mother_name" character varying(255) NOT NULL,
    "phone" character varying(255) NOT NULL,
    "marriage_status" character varying(255) NOT NULL,
    "spouse_name" character varying(255),
    "spouse_birthday" date,
    "spouse_lasteducation" character varying(255),
    "dependants" integer DEFAULT '0',
    "address" text,
    "province" character varying(255),
    "city" character varying(255),
    "neighbour_association" character varying(255),
    "hamlets" character varying(255),
    "home_phonenumber" character varying(255),
    "subdistrict" character varying(255),
    "urban_village" character varying(255),
    "home_ownership" character varying(255),
    "lived_for" integer,
    "occupation" character varying(255),
    "employee_id" character varying(255),
    "employer_name" character varying(255),
    "employer_address" text,
    "department" character varying(255),
    "been_workingfor" integer,
    "direct_superiorname" character varying(255),
    "employer_number" character varying(255),
    "monthly_income" integer,
    "other_income" integer,
    "other_incomesource" character varying(255),
    "field_of_work" character varying(255),
    "related_personname" character varying(255),
    "related_relation" character varying(255),
    "related_phonenumber" character varying(255),
    "related_homenumber" character varying(255),
    "related_address" text,
    "bank" bigint DEFAULT nextval('borrowers_bank_seq') NOT NULL,
    "bank_accountnumber" character varying(255),
    "agent_referral" bigint,
    CONSTRAINT "borrowers_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "borrowers_bank_fkey" FOREIGN KEY (bank) REFERENCES banks(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "clients";
DROP SEQUENCE IF EXISTS clients_id_seq;
CREATE SEQUENCE clients_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."clients" (
    "id" bigint DEFAULT nextval('clients_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "name" character varying(255) NOT NULL,
    "key" character varying(255) NOT NULL,
    "secret" character varying(255) NOT NULL,
    CONSTRAINT "clients_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "clients" ("id", "created_at", "updated_at", "deleted_at", "name", "key", "secret") VALUES
(1,	'2020-01-23 05:34:57.946279+00',	'2020-01-23 05:34:57.946279+00',	NULL,	'Dashboard Client',	'BpLnfgDsc3WD',	'7cae1fb7-2c24-4c4d-aee7-5eab8bd5397f');

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
(1,	'0',	'1',	'2020-01-23 05:09:09.365854'),
(4,	1,	'1',	'2020-01-23 05:34:54.923755');

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


DROP TABLE IF EXISTS "roles";
DROP SEQUENCE IF EXISTS roles_id_seq;
CREATE SEQUENCE roles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."roles" (
    "id" bigint DEFAULT nextval('roles_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "name" character varying(255) NOT NULL,
    "description" text,
    "system" character varying(255),
    "status" character varying(255),
    "permissions" character varying(255)[],
    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "roles" ("id", "created_at", "updated_at", "deleted_at", "name", "description", "system", "status", "permissions") VALUES
(1,	'2020-01-23 05:34:57.948464+00',	'2020-01-23 05:34:57.948464+00',	NULL,	'Administrator',	'Super Admin',	'Core',	'active',	'{all}');

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

CREATE TABLE "public"."users" (
    "id" bigint DEFAULT nextval('users_id_seq') NOT NULL,
    "created_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" timestamptz,
    "roles" integer[],
    "username" character varying(255) NOT NULL,
    "password" text NOT NULL,
    "email" character varying(255),
    "phone" character varying(255),
    "status" character varying(255),
    "first_login" boolean DEFAULT true,
    CONSTRAINT "users_email_key" UNIQUE ("email"),
    CONSTRAINT "users_phone_key" UNIQUE ("phone"),
    CONSTRAINT "users_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "users_username_key" UNIQUE ("username")
) WITH (oids = false);

INSERT INTO "users" ("id", "created_at", "updated_at", "deleted_at", "roles", "username", "password", "email", "phone", "status", "first_login") VALUES
(1,	'2020-01-23 05:34:58.030793+00',	'2020-01-23 05:34:58.030793+00',	NULL,	'{1}',	'coreadmin',	'$2a$10$qffb2S4OZNxLCCZd79Jsl.yG1qeBnvVFt8AvPnOTdzJQsDxD3kjtq',	'admin@ayannah.co.id',	'',	'active',	'1');

-- 2020-01-23 05:38:34.911057+00
