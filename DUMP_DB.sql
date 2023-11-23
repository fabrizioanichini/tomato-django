-- -------------------------------------------------------------
-- TablePlus 5.6.2(516)
--
-- https://tableplus.com/
--
-- Database: tomato
-- Generation Time: 2023-11-23 12:46:22.3650
-- -------------------------------------------------------------


-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."auth_group" (
    "id" int4 NOT NULL,
    "name" varchar(150) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."auth_group_permissions" (
    "id" int8 NOT NULL,
    "group_id" int4 NOT NULL,
    "permission_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."auth_permission" (
    "id" int4 NOT NULL,
    "name" varchar(255) NOT NULL,
    "content_type_id" int4 NOT NULL,
    "codename" varchar(100) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."auth_user" (
    "id" int4 NOT NULL,
    "password" varchar(128) NOT NULL,
    "last_login" timestamptz,
    "is_superuser" bool NOT NULL,
    "username" varchar(150) NOT NULL,
    "first_name" varchar(150) NOT NULL,
    "last_name" varchar(150) NOT NULL,
    "email" varchar(254) NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."auth_user_groups" (
    "id" int8 NOT NULL,
    "user_id" int4 NOT NULL,
    "group_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."auth_user_user_permissions" (
    "id" int8 NOT NULL,
    "user_id" int4 NOT NULL,
    "permission_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."django_admin_log" (
    "id" int4 NOT NULL,
    "action_time" timestamptz NOT NULL,
    "object_id" text,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" int2 NOT NULL CHECK (action_flag >= 0),
    "change_message" text NOT NULL,
    "content_type_id" int4,
    "user_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."django_content_type" (
    "id" int4 NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."django_migrations" (
    "id" int8 NOT NULL,
    "app" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "applied" timestamptz NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."django_session" (
    "session_key" varchar(40) NOT NULL,
    "session_data" text NOT NULL,
    "expire_date" timestamptz NOT NULL,
    PRIMARY KEY ("session_key")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."tomatoai_ingredient" (
    "id" int8 NOT NULL,
    "name" varchar(255) NOT NULL,
    "description" text NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."tomatoai_recipe" (
    "id" int8 NOT NULL,
    "name" varchar(255) NOT NULL,
    "description" text NOT NULL,
    "instructions" text NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."tomatoai_recipe_ingredients" (
    "id" int8 NOT NULL,
    "recipe_id" int8 NOT NULL,
    "ingredient_id" int8 NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."tomatoai_restaurant" (
    "id" int8 NOT NULL,
    "name" varchar(255) NOT NULL,
    "description" text NOT NULL,
    "address" varchar(255) NOT NULL,
    "phone_number" varchar(15) NOT NULL,
    "email" varchar(254) NOT NULL,
    PRIMARY KEY ("id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."tomatoai_restaurant_recipes" (
    "id" int8 NOT NULL,
    "restaurant_id" int8 NOT NULL,
    "recipe_id" int8 NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."auth_permission" ("id", "name", "content_type_id", "codename") VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add restaurant', 7, 'add_restaurant'),
(26, 'Can change restaurant', 7, 'change_restaurant'),
(27, 'Can delete restaurant', 7, 'delete_restaurant'),
(28, 'Can view restaurant', 7, 'view_restaurant'),
(29, 'Can add recipe', 8, 'add_recipe'),
(30, 'Can change recipe', 8, 'change_recipe'),
(31, 'Can delete recipe', 8, 'delete_recipe'),
(32, 'Can view recipe', 8, 'view_recipe'),
(33, 'Can add ingredient', 9, 'add_ingredient'),
(34, 'Can change ingredient', 9, 'change_ingredient'),
(35, 'Can delete ingredient', 9, 'delete_ingredient'),
(36, 'Can view ingredient', 9, 'view_ingredient');

INSERT INTO "public"."django_content_type" ("id", "app_label", "model") VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'tomatoai', 'restaurant'),
(8, 'tomatoai', 'recipe'),
(9, 'tomatoai', 'ingredient');

INSERT INTO "public"."django_migrations" ("id", "app", "name", "applied") VALUES
(1, 'contenttypes', '0001_initial', '2023-11-23 11:45:37.226171+00'),
(2, 'auth', '0001_initial', '2023-11-23 11:45:37.276089+00'),
(3, 'admin', '0001_initial', '2023-11-23 11:45:37.288966+00'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-11-23 11:45:37.292935+00'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-23 11:45:37.297441+00'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-11-23 11:45:37.305716+00'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-11-23 11:45:37.310003+00'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-11-23 11:45:37.314079+00'),
(9, 'auth', '0004_alter_user_username_opts', '2023-11-23 11:45:37.318175+00'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-11-23 11:45:37.323245+00'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-11-23 11:45:37.324318+00'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-11-23 11:45:37.328138+00'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-11-23 11:45:37.334416+00'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-11-23 11:45:37.338314+00'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-11-23 11:45:37.342844+00'),
(16, 'auth', '0011_update_proxy_permissions', '2023-11-23 11:45:37.346772+00'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-11-23 11:45:37.350814+00'),
(18, 'sessions', '0001_initial', '2023-11-23 11:45:37.357957+00'),
(19, 'tomatoai', '0001_initial', '2023-11-23 11:45:37.362772+00'),
(20, 'tomatoai', '0002_recipe', '2023-11-23 11:45:37.369107+00'),
(21, 'tomatoai', '0003_ingredient', '2023-11-23 11:45:37.374232+00'),
(22, 'tomatoai', '0004_recipe_ingredients_restaurant_recipes', '2023-11-23 11:45:37.396172+00');

INSERT INTO "public"."tomatoai_ingredient" ("id", "name", "description") VALUES
(1, 'Ingrediente 0', 'descrizione per ingrediente 0'),
(2, 'Ingrediente 1', 'descrizione per ingrediente 1'),
(3, 'Ingrediente 2', 'descrizione per ingrediente 2'),
(4, 'Ingrediente 3', 'descrizione per ingrediente 3'),
(5, 'Ingrediente 4', 'descrizione per ingrediente 4'),
(6, 'Ingrediente 5', 'descrizione per ingrediente 5'),
(7, 'Ingrediente 6', 'descrizione per ingrediente 6'),
(8, 'Ingrediente 7', 'descrizione per ingrediente 7'),
(9, 'Ingrediente 8', 'descrizione per ingrediente 8'),
(10, 'Ingrediente 9', 'descrizione per ingrediente 9');

INSERT INTO "public"."tomatoai_recipe" ("id", "name", "description", "instructions") VALUES
(1, 'Ricetta 0', 'Descrizione per ricetta 0', 'Istruzioni per ricetta 0'),
(2, 'Ricetta 1', 'Descrizione per ricetta 1', 'Istruzioni per ricetta 1'),
(3, 'Ricetta 2', 'Descrizione per ricetta 2', 'Istruzioni per ricetta 2'),
(4, 'Ricetta 3', 'Descrizione per ricetta 3', 'Istruzioni per ricetta 3'),
(5, 'Ricetta 4', 'Descrizione per ricetta 4', 'Istruzioni per ricetta 4'),
(6, 'Ricetta 5', 'Descrizione per ricetta 5', 'Istruzioni per ricetta 5'),
(7, 'Ricetta 6', 'Descrizione per ricetta 6', 'Istruzioni per ricetta 6'),
(8, 'Ricetta 7', 'Descrizione per ricetta 7', 'Istruzioni per ricetta 7'),
(9, 'Ricetta 8', 'Descrizione per ricetta 8', 'Istruzioni per ricetta 8'),
(10, 'Ricetta 9', 'Descrizione per ricetta 9', 'Istruzioni per ricetta 9');

INSERT INTO "public"."tomatoai_recipe_ingredients" ("id", "recipe_id", "ingredient_id") VALUES
(1, 1, 9),
(2, 1, 2),
(3, 1, 4),
(4, 2, 2),
(5, 2, 4),
(6, 2, 5),
(7, 3, 10),
(8, 3, 5),
(9, 3, 6),
(10, 4, 1),
(11, 4, 2),
(12, 4, 4),
(13, 5, 8),
(14, 5, 10),
(15, 5, 3),
(16, 6, 8),
(17, 6, 1),
(18, 6, 4),
(19, 7, 2),
(20, 7, 4),
(21, 7, 5),
(22, 8, 8),
(23, 8, 9),
(24, 8, 10),
(25, 9, 3),
(26, 9, 5),
(27, 9, 7),
(28, 10, 4),
(29, 10, 5),
(30, 10, 7);

INSERT INTO "public"."tomatoai_restaurant" ("id", "name", "description", "address", "phone_number", "email") VALUES
(1, 'Ristorante 0', 'Descrizione per ristorante 0', 'Indirizzo 0', '123456780', ''),
(2, 'Ristorante 1', 'Descrizione per ristorante 1', 'Indirizzo 1', '123456781', ''),
(3, 'Ristorante 2', 'Descrizione per ristorante 2', 'Indirizzo 2', '123456782', ''),
(4, 'Ristorante 3', 'Descrizione per ristorante 3', 'Indirizzo 3', '123456783', ''),
(5, 'Ristorante 4', 'Descrizione per ristorante 4', 'Indirizzo 4', '123456784', '');

INSERT INTO "public"."tomatoai_restaurant_recipes" ("id", "restaurant_id", "recipe_id") VALUES
(1, 1, 1),
(2, 4, 1),
(3, 3, 2),
(4, 4, 2),
(5, 1, 3),
(6, 5, 3),
(7, 4, 4),
(8, 5, 4),
(9, 1, 5),
(10, 5, 5),
(11, 1, 6),
(12, 3, 6),
(13, 2, 7),
(14, 3, 7),
(15, 2, 8),
(16, 4, 8),
(17, 1, 9),
(18, 2, 9),
(19, 3, 10),
(20, 5, 10);

ALTER TABLE "public"."auth_group_permissions" ADD FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id");
ALTER TABLE "public"."auth_group_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id");
ALTER TABLE "public"."auth_permission" ADD FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id");
ALTER TABLE "public"."auth_user_groups" ADD FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id");
ALTER TABLE "public"."auth_user_groups" ADD FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id");
ALTER TABLE "public"."auth_user_user_permissions" ADD FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id");
ALTER TABLE "public"."auth_user_user_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id");
ALTER TABLE "public"."django_admin_log" ADD FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id");
ALTER TABLE "public"."django_admin_log" ADD FOREIGN KEY ("user_id") REFERENCES "public"."auth_user"("id");
ALTER TABLE "public"."tomatoai_recipe_ingredients" ADD FOREIGN KEY ("ingredient_id") REFERENCES "public"."tomatoai_ingredient"("id");
ALTER TABLE "public"."tomatoai_recipe_ingredients" ADD FOREIGN KEY ("recipe_id") REFERENCES "public"."tomatoai_recipe"("id");
ALTER TABLE "public"."tomatoai_restaurant_recipes" ADD FOREIGN KEY ("restaurant_id") REFERENCES "public"."tomatoai_restaurant"("id");
ALTER TABLE "public"."tomatoai_restaurant_recipes" ADD FOREIGN KEY ("recipe_id") REFERENCES "public"."tomatoai_recipe"("id");
