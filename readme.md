# Hack-Lang-Database-Example

Simple Hack app to demostrate how to interact with MySQL. 

## Getting Set Up

### Install dependencies (Using [Composer](https://getcomposer.org/)):

`composer install`

Then run:
`vendor/bin/hh-autoload`

## Running MySQL For Demo

You will need to have a version of MySQL downloaded and running. This [tutorial](https://medium.com/@jainakansha/installing-and-running-mysql-on-macos-with-errors-resolved-70ef53e3b5b9) is useful for MacOS. Note: be sure to use the legacy password encrpytion instead of the strong password encryption. 

Once you do, to get the demo running, run the following commands in MySQL:
  1. `CREATE DATABASE users;`
  2. `use users;`
  3. `create table users (name VARCHAR(20), user_id INT);`
  4. `INSERT INTO users (name, user_id) VALUES ('joe', 1);`
  5. `INSERT INTO users (name, user_id) VALUES ('mike', 2);`

To run the demo, you will need to fill in some variables in the Hack File to connect to the database. Below is how to get the different variables:
  - Host: should be `127.0.0.1` if you are running MySQL locally.
  - Port: Should be 3306 but type `SHOW GLOBAL VARIABLES LIKE 'PORT';` in MySQL to confirm
  - Username: `SELECT CURRENT_USER();` in MySQL. For me it was `root@localhost` so my username is `root`
  - Password: This was the password you used to create your MySQL user 

## Run:

To run the demo, run:
`hhvm src/App.hack`
