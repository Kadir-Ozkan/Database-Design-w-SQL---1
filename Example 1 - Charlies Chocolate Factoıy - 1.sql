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
    prod_id INT not null,
    comp_id INT not null,
    quantity_comp INT,
        CONSTRAINT pk3 PRIMARY KEY (prod_id, comp_id),
)

--schema Supplier

CREATE TABLE [Supplier].[supplier] (
    supp_id INT,
    supp_name VARCHAR(50),
    supp_location VARCHAR(50),
    supp_country VARCHAR(50),
    is_active BIT,
        CONSTRAINT pk1 PRIMARY KEY (supp_id)
)

CREATE TABLE [Supplier].[comp_supp] (
    supp_id INT,
    comp_id INT,
    oder_date DATE,
    quantity INT,
        CONSTRAINT pk3 PRIMARY KEY (supp_id, comp_id)
)

ALTER TABLE Product.prod_comp ADD FOREIGN KEY (prod_id) REFERENCES Product.product(prod_id);
ALTER TABLE Product.prod_comp ADD FOREIGN KEY (comp_id) REFERENCES Product.component(comp_id);
ALTER TABLE Supplier.comp_supp ADD FOREIGN KEY (supp_id) REFERENCES Supplier.supplier(supp_id);
ALTER TABLE Supplier.comp_supp ADD FOREIGN KEY (comp_id) REFERENCES Product.component(comp_id);
