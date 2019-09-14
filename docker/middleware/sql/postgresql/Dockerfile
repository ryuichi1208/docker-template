postgres:
  build: postgres/
  ports:
    - "5432:5432"
  volumes:
    - /var/log/docker/postgresql:/var/log/pg_log
    - /var/lib/postgresql:/var/lib/postgresql
  environment:
    - POSTGRES_PASSWORD=yoruhasizukanisitekudasai
