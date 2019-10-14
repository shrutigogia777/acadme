drop table if exists trades cascade;
create table trades (
    id serial primary key,
    name varchar(50),
    code varchar(10) unique
);

drop table if exists groups cascade;
create table groups (
    id serial primary key,
    name varchar(15),
    batch smallint,
    tradeId int references trades(id),
    unique (name, batch)
);

drop table if exists students cascade;
create table students (
    id serial primary key,
    name varchar(100),
    rollno varchar(15) unique,
    contact varchar(10) unique,
    groupId int references groups(id),
    batch smallint
);

drop table if exists subjects cascade;
create table subjects(
    id serial primary key ,
    name varchar(50),
    code varchar(10) unique
);

drop table if exists teachers cascade;
create table teachers(
    id serial primary key ,
    name varchar(100),
    contact varchar(10) unique,
    code varchar(10) unique
);

drop table if exists trade_sem_subs cascade;
create table trade_sem_subs(
    id serial primary key,
    tradeId int references trades(id),
    subjectId int references subjects(id),
    batch smallint
);

drop table if exists teacher_groups cascade;
create table teacher_groups(
    id serial primary key,
    teacherId int references teachers(id),
    groupId int references groups(id),
    tradeSemSubId int references trade_sem_subs(id)
);

drop table if exists attendances cascade;
create table attendances(
    id serial primary key,
    teacherGroupId int references teacher_groups(id),
    studentId int references students(id),
    doa timestamp
);

