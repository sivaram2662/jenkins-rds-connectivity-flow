
pipeline {
    agent any

    stages {
        stage('to connect the rds') {
            steps {
                sh'mysql -h terraform-20230222045831428500000002.c8tuxdxxknoj.us-west-2.rds.amazonaws.com -u sivadev -psriram2662 -e "show databases"' 
                // sh'mysql -u sivadev -psriram2662 -e CREATE DATABASE ramdatabases;'
                sh 'mysql -h terraform-20230222045831428500000002.c8tuxdxxknoj.us-west-2.rds.amazonaws.com -u sivadev -psriram2662 -e "create database seshuvalue"'                
            }
        }
    }
}





































mysql -h terraform-20230222045831428500000002.c8tuxdxxknoj.us-west-2.rds.amazonaws.com -u sivadev -psriram2662 -e "show databases"
#mysql -u sivadev -p'sriram2662' -e 'CREATE TABLE mytable (id INT, name VARCHAR(255));'newname
mysql -h terraform-20230222045831428500000002.c8tuxdxxknoj.us-west-2.rds.amazonaws.com -u sivadev -psriram2662 -e "create database seshuvalue"
mysql -u sivadev -p'sriram2662' -e 'CREATE TABLE mytable (id INT, name VARCHAR(255));'seshuvalue