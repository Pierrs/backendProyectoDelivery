use delivery_;


CREATE TABLE users(
	id bigint primary KEY auto_increment,
    email varchar(180) NOT NULL UNIQUE,
    name varchar(90) NOT NULL,
    lastname Varchar(90) NOT NULL,
    phone varchar(90) NOT NULL UNIQUE,
    image varchar(255) NOT NULL,
    password varchar(90) NOT NULL,
    created_at timestamp(0) NOT NULL,
    updated_at timestamp(0) NOT NULL
);