FROM       ubuntu:latest
MAINTAINER Alex Radyuk "alex.radzyuk@gmail.com"
ENV        MYSQLPASS 789123 
RUN        \
           apt-get update && apt-get install -y \                                           
	         && { \
	         echo debconf debconf/frontend select Noninteractive; \
           echo mysql-community-server mysql-community-server/data-dir \
           select ''; \
           echo mysql-community-server mysql-community-server/root-pass \
           password '$MYSQLPASS'; \
           echo mysql-community-server mysql-community-server/re-root-pass \
           password '$MYSQLPASS'; \
           echo mysql-community-server mysql-community-server/remove-test-db \
           select true;} | debconf-set-selections \
           && apt-get install -y --no-install-recommends mysql-server && \
           rm -rf -- /var/lib/apt/lists/*
RUN        /etc/init.d/mysql start && \
           mysql -u root mysql -e "CREATE DATABASE node; GRANT ALL ON node.* TO root@'%' IDENTIFIED BY '$MYSQLPASS' WITH GRANT OPTION; FLUSH PRIVILEGES" && \
           mysql -u root mysql -e "GRANT ALL ON node.* TO root@'localhost' IDENTIFIED BY '$MYSQLPASS' WITH GRANT OPTION; FLUSH PRIVILEGES" && \ 
           sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
#RUN        service mysql start && mysql -u root -p$MYSQLPASS portal < /portal.sql
EXPOSE     3306
CMD        ["mysqld_safe"]
