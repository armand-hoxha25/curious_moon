create schema if not exists import;
drop table if exists import.master_plan;

create table import.master_plan(
  start_time_utc text,
  duration text,
  date text,
  team text,
  spass_type text,
  target text,
  request_name text,
  library_definition text,
  title text,
  description text
);


COPY import.master_plan
FROM '/home/juggernaut/Documents/curious_moon/curious_data/data/master_plan.csv'
WITH DELIMITER ',' HEADER CSV;
drop table if exists events;

create table events(
    id serial primary key,
    time_stamp timestamptz not null,
    title varchar(500),
    description text,
    event_type_id int,
    spass_type_id int,
    target_id int,
    team_id int,
    request_id int
);


insert into events(
    time_stamp,
    title,
    description
)
select
import.master_plan.date::timestamptz at time zone 'UTC',
import.master_plan.title,
import.master_plan.description
from import.master_plan;drop table if exists events;

create table events(
    id serial primary key,
    time_stamp timestamptz not null,
    title varchar(500),
    description text,
    event_type_id int,
    spass_type_id int,
    target_id int,
    team_id int,
    request_id int
);


insert into events(
    time_stamp,
    title,
    description
)
select
import.master_plan.date::timestamptz at time zone 'UTC',
import.master_plan.title,
import.master_plan.description
from import.master_plan;drop table if exists events;

create table events(
    id serial primary key,
    time_stamp timestamptz not null,
    title varchar(500),
    description text,
    event_type_id int,
    spass_type_id int,
    target_id int,
    team_id int,
    request_id int
);


insert into events(
    time_stamp,
    title,
    description
)
select
import.master_plan.date::timestamptz at time zone 'UTC',
import.master_plan.title,
import.master_plan.description
from import.master_plan;drop table if exists events;

create table events(
    id serial primary key,
    time_stamp timestamptz not null,
    title varchar(500),
    description text,
    event_type_id int,
    spass_type_id int,
    target_id int,
    team_id int,
    request_id int
);


insert into events(
    time_stamp,
    title,
    description
)
select
import.master_plan.date::timestamptz at time zone 'UTC',
import.master_plan.title,
import.master_plan.description
from import.master_plan;drop table if exists events;

create table events(
    id serial primary key,
    time_stamp timestamptz not null,
    title varchar(500),
    description text,
    event_type_id int,
    spass_type_id int,
    target_id int,
    team_id int,
    request_id int
);


insert into events(
    time_stamp,
    title,
    description
)
select
import.master_plan.date::timestamptz at time zone 'UTC',
import.master_plan.title,
import.master_plan.description
from import.master_plan;drop table if exists events;

create table events(
    id serial primary key,
    time_stamp timestamptz not null,
    title varchar(500),
    description text,
    event_type_id int,
    spass_type_id int,
    target_id int,
    team_id int,
    request_id int
);


insert into events(
    time_stamp,
    title,
    description
)
select
import.master_plan.date::timestamptz at time zone 'UTC',
import.master_plan.title,
import.master_plan.description
from import.master_plan;drop table if exists events;

create table events(
    id serial primary key,
    time_stamp timestamptz not null,
    title varchar(500),
    description text,
    event_type_id int,
    spass_type_id int,
    target_id int,
    team_id int,
    request_id int
);


insert into events(
    time_stamp,
    title,
    description
)
select
import.master_plan.date::timestamptz at time zone 'UTC',
import.master_plan.title,
import.master_plan.description
from import.master_plan;COPY import.master_plan FROM '/home/juggernaut/Documents/curious_moon/curious_data/armand_codes/../data/master_plan.csv' WITH DELIMITER ',' HEADER CSV;
/* team */
drop table if exists teams;
select distinct(team)
as description 
into teams
from import.master_plan;

alter table teams
add id serial primary key;

/* spass_type */
drop table if exists spass_types;
select distinct(spass_type)
as description 
into spass_types
from import.master_plan;

alter table spass_types
add id serial primary key;

/* event */
insert into events(
    time_stamp,
    title,
    description,
    event_type_id,
    target_id,
    team_id,
    request_id,
    spass_type_id
)

select 
import.master_plan.start_time_utc::timestamp,
import.master_plan.title,
import.master_plan.description,
event_types.id as event_type_id,
targets.id as target_id,
teams.id as team_id,
requests.id as request_id,
spass_types.id as spass_type_id