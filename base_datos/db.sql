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
use delivery_;

create table roles(
id bigint primary key auto_increment,
name varchar(90) not null unique,
image varchar(255) null,
route varchar(180) not null,
created_at timestamp(0) not null,
updated_at timestamp(0) not null
);

Insert into roles(
    name,
    route,
    created_at,
    updated_at
)

Values(
'RESTAURANTE',
'/restaurant/orders/list',
'2023-10-25',
'2023-10-25'
);
Insert into roles(
    name,
    route,
    created_at,
    updated_at
)

Values(
'REPARTIDOR',
'/delivery/orders/list',
'2023-10-25',
'2023-10-25'
);
Insert into roles(
    name,
    route,
    created_at,
    updated_at
)

Values(
'CLIENTE',
'/client/products/list',
'2023-10-25',
'2023-10-25'
);
create table user_has_roles(
	id_user bigint not null,
    id_rol bigint not null,
    created_at timestamp(0) not null,
	updated_at timestamp(0) not null,
    foreign key(id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE, 
	foreign key(id_rol) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE, 
	primary key(id_user, id_rol)
    );