CREATE TABLE Material
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    last_modified_by   varchar(255)                 null,
    Update_At  datetime(6) null,
    Name  varchar(256) charset utf8mb3 null
);
CREATE TABLE Customer
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    Address            varchar(250) charset utf8mb3 null,
    email         varchar(200) charset utf8mb3 null,
    Name            varchar(50) charset utf8mb3  not null,
    password           varchar(250) charset utf8mb3 null,
    birth_day          date                         null,
    phone      varchar(10) charset utf8mb3  null
);
create table Address
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    Address            varchar(500) charset utf8mb3 null,
    default_address   bit                          null,
    Customer_id      int                       null,
    constraint FKbbd8bxqdl1w9vhasn86u0q9w3
        foreign key (Customer_id) references Customer (id)
);
create table Cart
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    status         int          null,
    Id_Customer    int       null,
    constraint FKtfg3dplbmn3wiwy26si1daye3
        foreign key (Id_Customer) references Customer (id)
);
create table Promotion
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    Begin_date       datetime                     null,
    End_date      datetime                     null,
    Percentage_Reduction     int                          null,
    Name_Promotion     varchar(256) charset utf8mb3 not null,
    Max_discount   int                          null,
    status         int                          null,
    constraint Name_Promotion
        unique (Name_Promotion)
);
create table Size
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    Name_Size  varchar(256) charset utf8mb3 null
);
create table Product_Type
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    Name_Product_Type  varchar(256) charset utf8mb3 null
);
create table color
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    Name_Color  varchar(256) charset utf8mb3 null,
    Code_Color        varchar(256) charset utf8mb3 null,
    constraint Code_Color
        unique (Code_Color)
);
create table supplier
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    Name_Supplier  varchar(256) charset utf8mb3 null,
    Address            varchar(256) charset utf8mb3 null
);
create table staff
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    Address            varchar(250) charset utf8mb3 null,
    email         varchar(200) charset utf8mb3 null,
    Name            varchar(50) charset utf8mb3  not null,
    password           varchar(250) charset utf8mb3 null,
    birth_day          date                         null,
    phone      varchar(10) charset utf8mb3  null,
    status         int                          null,
    constraint email
        unique (email)
);
create table roles
(
    role_id   int auto_increment
        primary key,
    role_name varchar(255) null
);
create table Product
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    Price                varchar(256) charset utf8mb3 null,
    ` Describe`               varchar(256) charset utf8mb3 null,
    Name_Product       varchar(256) charset utf8mb3 null,
    status         int                          null,
    Material_id       int                       null,
    Product_Type_id   int                       null,
    supplier_id    int                       null,
    constraint FK8ixkt2s9hxy5bvdgk6g60ewax
        foreign key (Product_Type_id) references Product_Type (id),
    constraint FK9wph5u6jiq06hnksctrpckl40
        foreign key (Material_id) references Material (id),
    constraint FKdqj1kel5y8obcwr50p9psexa2
        foreign key (supplier_id) references supplier (id)
);
create table images
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    Name_default  varchar(256) charset utf8mb3 null,
    name_images               varchar(256) charset utf8mb3 null,
    id_color           int                       null,
    id_product         int                       null,
    constraint FKdujockiancjr5q3jqf74hc90i
        foreign key (id_product) references Product (id),
    constraint FKg9du18dwb7uy1iyqj45sdwjrw
        foreign key (id_color) references color (id)
);
create table Product_Detail
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    quantity           int          null,
    status         bit          null,
    size_id         int       null,
    color_id         int       null,
    product_id        int       null,
    constraint FK1h21xucteeu2y93ybdvk4i8bw
        foreign key (product_id) references Product (id),
    constraint FK69otryack9hyggsfl8oonges0
        foreign key (color_id) references color (id),
    constraint FKnksu2p5k20le5lqjm55qbtkdi
        foreign key (size_id) references Size (id)
);
create table Cart_Detail
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    price              int          null,
    quantity             int          null,
    Total_payment           varchar(50)  not null,
    Cart_id          int       null,
    Product_Detail_id int       null,
    constraint FKa5oymui7wplf9fwttmw8v1o3o
        foreign key (Cart_id  ) references Cart (id),
    constraint FKk6b7ispaj2wslc2lur78gjrmb
        foreign key (Product_Detail_id) references  Product_Detail (id)
);
create table Status
(
    id   int auto_increment
        primary key,
    name varchar(50) charset utf8mb3 null
);
create table Bill
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    phone      varchar(50) charset utf8mb3  null,
    address  varchar(256) charset utf8mb3 null,
    email   varchar(256) charset utf8mb3 null,
    note            varchar(50) charset utf8mb3  null,
    Bill_Type       int                          null,
    Code_Bill         varchar(256) charset utf8mb3 null,
    People         varchar(256) charset utf8mb3 null,
    price_reduced          int                          null,
    price_ship          int                          null,
    Total_payment int                          null,
    Total_Bill  int                          null,
    customer_id      int                       null,
    Promotion_id      int                       null,
    staff_id       int                       null,
    status_id      int                       null,
    constraint FK5j7yrkoi6k3efhki4ve0foi61
        foreign key (status_id  ) references  Status (id),
    constraint FKd1lm0qoq34dkata2hy0tceye0
        foreign key (Promotion_id ) references Promotion (id),
    constraint FKf3pkyuwrjwl5ru53n1r6fieih
        foreign key (staff_id) references  staff (id),
    constraint FKfvowmias4ycehn19gyv8t5dys
        foreign key ( customer_id) references  Customer (id)
);
create table Bill_Detail
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    price              int          null,
    quantity             int          null,
    Total_payment           int          null,
    Bill_Id           int       null,
    Product_Detail_Id int       null,
    constraint FK8it5rkm179qgy53rxgafr1d5x
        foreign key (Bill_Id  ) references Bill (id),
    constraint FKrypgqa38bfkwp83w0q1vjnsoa
        foreign key (Product_Detail_Id) references Product_Detail (id)
);
create table history_Bill
(
    id  int not null primary key,
    Created_At datetime(6)null,
    Created_By varchar(255) null,
    Is_Delete bit null,
    Last_Modified_By   varchar(255)null,
    Update_At  datetime(6) null,
    people_Operation     varchar(256) charset utf8mb3 null,
    operation           varchar(256) charset utf8mb3 not null,
    Bill_Id         int                       null,
    status_id      int                       null,
    constraint FK3uj2q1qgycfqt50ddaxxc3c2l
        foreign key ( status_id ) references Status (id),
    constraint FKc0waja71tyluwdwdvt6up90f0
        foreign key (Bill_Id) references Bill (id)
);
create table user_role
(
    user_role_id  int not null primary key,
    customer_id int null,
    role_id int null,
    staff_id int null,
    constraint FK7ixe48f90ns40p6a38ip40wwl
        foreign key (customer_id) references Customer(id), -- Assuming Customer table exists
    constraint FK7u21823ktfhu9bmx2350x6n8s
        foreign key (role_id) references roles(role_id),
    constraint FKa1pypoppfjn7hutomafj9ybsv
        foreign key (staff_id) references staff(id) -- Assuming staff table exists
);


