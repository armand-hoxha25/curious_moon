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