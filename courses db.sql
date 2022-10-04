CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" integer NOT NULL,
  "role_id" uuid NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "description" text NOT NULL,
  "level" varchar NOT NULL,
  "teacher" varchar NOT NULL,
  "teacher_id" uuid NOT NULL,
  "category_id" integer NOT NULL
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "course_id" uuid UNIQUE NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id") REFERENCES "courses_videos" ("course_id");

--here you will enter the user data
insert into users(id,"name",email,"password",age,role_id) values('7ce25845-f4e1-41d7-a413-7c64cd7244d2','Marcelo','Marcelo451@gmail.com','user123',21,'c2a1b651-4114-4fce-bf59-d4556f2b101a');
insert into users(id,"name",email,"password",age,role_id) values('e58b4558-e57c-4d7e-95e3-bd25291f7077','Lazaro','Lazaro157@gmail.com','goal159',30,'b4afce93-b347-4fff-a265-ee88889e523c');
insert into users(id,"name",email,"password",age,role_id) values('05a3efd7-3780-4962-833a-a040572ee54d','Jose','Jose184@gmail.com','pepe123',32,'b4afce93-b347-4fff-a265-ee88889e523c');
insert into users(id,"name",email,"password",age,role_id) values('bf2d3fa4-5a6b-4c13-ac43-9ce026ed5f7e','Manfer','Manfer574@gmail.com','inner182',25,'1023c396-3399-4184-b7fe-73c9129f88bf');
--here you will enter the courses data
insert into courses(id,description,"level",teacher,teacher_id,category_id) values('75c392b1-6083-45ac-98ef-5c96ce97eedf','En este curso aprenderas todo lo necesario para ser un Developer Frontend','Principiante','Jose','05a3efd7-3780-4962-833a-a040572ee54d',2);
insert into courses(id,description,"level",teacher,teacher_id,category_id) values('1d8eb218-5aaf-4c36-8d12-b5ba75b3836b','En este curso aprenderas todo lo necesario para ser un Developer Backend','Principiante a Avanzado','Lazaro','e58b4558-e57c-4d7e-95e3-bd25291f7077',1);
--here you will enter the courses_videos data
insert into courses_videos(id,title,url,course_id) values('fe44496d-838c-4efc-99ec-6dacb9053052','fundamentos de React','https://youtu.be/nN0DrXR893M','75c392b1-6083-45ac-98ef-5c96ce97eedf');
insert into courses_videos(id,title,url,course_id) values('75d9a9e5-e8c0-4f16-85e0-b123ab6518c5','postgreSQL desde cero','https://youtu.be/HGfrzsGg3As','1d8eb218-5aaf-4c36-8d12-b5ba75b3836b');
--here you will enter the categories data
insert into categories(id,"name") values(1,'Backend');
insert into categories(id,"name") values(2,'Frontend');
--here you will enter the roles data
insert into roles(id,"name") values('b4afce93-b347-4fff-a265-ee88889e523c','Teacher');
insert into roles(id,"name") values('c2a1b651-4114-4fce-bf59-d4556f2b101a','Student');
insert into roles(id,"name") values('1023c396-3399-4184-b7fe-73c9129f88bf','Admin');


create view view_courses_teacher as select users.id, users."name", courses.description from users inner join courses on users.id = courses.teacher_id; 
