#!/bin/bash

export PGUSER=postgres
psql <<- SHELL
  CREATE DATABASE "Adventureworks";
SHELL
cd /data
psql -d Adventureworks < /data/install.sql
psql -d Adventureworks <<- EOF
  CREATE USER docker WITH PASSWORD 'docker';
  GRANT CONNECT ON DATABASE "Adventureworks" TO docker;
  GRANT USAGE ON SCHEMA hr TO docker;
  GRANT SELECT ON ALL TABLES IN SCHEMA hr TO docker;
  GRANT USAGE ON SCHEMA humanresources TO docker;
  GRANT SELECT ON ALL TABLES IN SCHEMA humanresources TO docker;
  GRANT USAGE ON SCHEMA pe TO docker;
  GRANT SELECT ON ALL TABLES IN SCHEMA pe TO docker;
  GRANT USAGE ON SCHEMA person TO docker;
  GRANT SELECT ON ALL TABLES IN SCHEMA person TO docker;
  GRANT USAGE ON SCHEMA pr TO docker;
  GRANT SELECT ON ALL TABLES IN SCHEMA pr TO docker;
  GRANT USAGE ON SCHEMA production TO docker;
  GRANT SELECT ON ALL TABLES IN SCHEMA production TO docker;
  GRANT USAGE ON SCHEMA pu TO docker;
  GRANT SELECT ON ALL TABLES IN SCHEMA pu TO docker;
  GRANT USAGE ON SCHEMA purchasing TO docker;
  GRANT SELECT ON ALL TABLES IN SCHEMA purchasing TO docker;
  GRANT USAGE ON SCHEMA sa TO docker;
  GRANT SELECT ON ALL TABLES IN SCHEMA sa TO docker;
  GRANT USAGE ON SCHEMA sales TO docker;
  GRANT SELECT ON ALL TABLES IN SCHEMA sales TO docker;
EOF
