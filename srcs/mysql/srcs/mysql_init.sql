FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS wordpress;
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
