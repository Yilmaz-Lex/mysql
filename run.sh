#!/bin/bash

service mysql start

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

echo "=> Creating user ..."
mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '${PASSWORD}'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"

mysqladmin shutdown

exec /usr/bin/mysqld_safe
