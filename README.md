
# MySQL Setup Guide

This guide provides instructions for setting up and managing MySQL databases.

## Prerequisites
Ensure you have the following installed on your system:
- MySQL Server
- MySQL Client (e.g., `mysql` command-line tool)

## Installation
For installation steps, refer to the official MySQL documentation: [MySQL Installation Guide](https://dev.mysql.com/doc/mysql-installation-excerpt/5.7/en/).

## Access MySQL
To access your MySQL server from the command line:

```bash
mysql -u root -p
```

## Creating a Database
Create a new database to store your tables:

```sql
CREATE DATABASE your_database_name;
USE your_database_name;
```

## Importing Tables
To import SQL files into your database:

```bash
mysql -u root -p your_database_name < your_sql_file.sql
```

## Example SQL Structure

The following example creates a simple `wallet` table:

```sql
CREATE TABLE wallet (
  user_id VARCHAR(255),
  wallet_id VARCHAR(255) PRIMARY KEY,
  wallet_currency ENUM('USD', 'EUR', 'CNY', 'GBP'),
  balance FLOAT
);
```

To create more complex tables, refer to the `schema.sql` file.

## Managing Users
To create a new user with access to your database:

```sql
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON your_database_name.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
```

## Backup and Restore
To back up your database:

```bash
mysqldump -u root -p your_database_name > backup.sql
```

To restore from a backup:

```bash
mysql -u root -p your_database_name < backup.sql
```

## References
For more detailed instructions, visit the [MySQL Documentation](https://dev.mysql.com/doc/).
