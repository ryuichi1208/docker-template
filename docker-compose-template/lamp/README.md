# docker-compose for LAMP

## Image

- php:7-apache
- mysql:5.6

## Project

```tree
lamp/
├── README.md
├── db
│   ├── conf
│   │   └── my.cnf
│   └── init
│       └── init.sql
├── docker-compose.yml
├── html
│   └── index.php
└── web
    ├── Dockerfile
    └── conf
        └── php.ini
```
