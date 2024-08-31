```console
docker compose up
```

```console
zig build test
```

## Log Output

```
postgres-1  | 2024-08-31 19:01:18.577 UTC [1] LOG:  starting PostgreSQL 16.4 (Debian 16.4-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
postgres-1  | 2024-08-31 19:01:18.577 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
postgres-1  | 2024-08-31 19:01:18.577 UTC [1] LOG:  listening on IPv6 address "::", port 5432
postgres-1  | 2024-08-31 19:01:18.579 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
postgres-1  | 2024-08-31 19:01:18.583 UTC [62] LOG:  database system was shut down at 2024-08-31 19:01:18 UTC
postgres-1  | 2024-08-31 19:01:18.587 UTC [1] LOG:  database system is ready to accept connections
postgres-1  | 2024-08-31 19:01:20.997 UTC [67] ERROR:  relation "foo" already exists
postgres-1  | 2024-08-31 19:01:20.997 UTC [67] STATEMENT:  create table foo (bar varchar(255))
```

## Test Output

```
connection.err: null
connection.err: null
Build Summary: 3/3 steps succeeded; 1/1 tests passed
test success
└─ run test 1 passed 143ms MaxRSS:6M
   └─ zig test Debug native cached 11ms MaxRSS:38M
```
