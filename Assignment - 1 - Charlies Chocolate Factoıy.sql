CREATE DATABASE manufacturer;

USE manufacturer;

CREATE SCHEMA Product;

CREATE SCHEMA Supplier;

--schema Product

CREATE TABLE [Product].[product] (
    prod_id INT,
    prod_name VARCHAR(50),
    quantity INT,
        CONSTRAINT pk1 PRIMARY KEY (prod_id)
)

CREATE TABLE [Product].[component] (
    comp_id INT,
    comp_name VARCHAR(50),
    description VARCHAR(50),
    quantity_comp INT,
        CONSTRAINT pk2 PRIMARY KEY (comp_id)
)

CREATE TABLE [Product].[prod_comp] (
    prod_id INT,
    comp_id INT,
    quantity_comp INT,
        CONSTRAINT pk3 FOREIGN KEY (prod_id, comp_id),
        CONSTRAINT fk1 FOREIGN KEY (prod_id),
        CONSTRAINT fk2 FOREIGN KEY (comp_id)
)

--schema Supplier

CREATE TABLE [Supplier].[supplier] (
    supp_id INT,
    supp_name VARCHAR(50),
    supp_location VARCHAR(50),
    supp_country VARCHAR(50),
    is_active LOGICAL,
        CONSTRAINT pk1 PRIMARY KEY (supp_id)
)

CREATE TABLE [Supplier].[comp_supp] (
    supp_id INT,
    comp_id INT,
    oder_date DATE,
    quantity INT,
        CONSTRAINT pk3 FOREIGN KEY (supp_id, comp_id),
        CONSTRAINT fk1 FOREIGN KEY (supp_id),
        CONSTRAINT fk2 FOREIGN KEY (comp_id)
)

