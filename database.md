# Following MYSQL commands to make a dummy database for this Project :

create table if not exists user
(
	id varchar(20) primary key not null,
	role varchar(20) not null,
	Entry_time timestamp;
);

create table if not exists admin
(
	id varchar(20) not null,
	name varchar(20) not null,
	email varchar(20) not null,
	password varchar(20) not null,
	foreign key (id) references user(id)
);

create table if not exists customer
(
	id varchar(20) not null,
	name varchar(20) not null,
	email varchar(20) not null,
	password varchar(20) not null,
	foreign key (id) references user(id)
);

create table if not exists supplier
(
	id varchar(20) not null,
	name varchar(20) not null,
	email varchar(20) not null,
	password varchar(20) not null,
	foreign key (id) references user(id)
);

create table if not exists password_hashing
{
	id varchar(20) not null,
	secret_key varchar(20) not null
};
