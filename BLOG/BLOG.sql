CREATE TABLE "user_blogs" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar(8) NOT NULL
);

CREATE TABLE "posts" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "user_id" int NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "update_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "comments" (
  "id" serial PRIMARY KEY,
  "contain" text NOT NULL,
  "post_id" int NOT NULL,
  "user_id" int NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "update_at" timestamp DEFAULT 'now()'
);

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "user_blogs" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "user_blogs" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");
