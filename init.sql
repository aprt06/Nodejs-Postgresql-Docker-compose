-- Create the role only if it doesn't already exist
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'postgres') THEN
      CREATE ROLE postgres WITH LOGIN PASSWORD '123';
   END IF;
END
$$;

-- Create the database only if it doesn't already exist
DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'testdb') THEN
      CREATE DATABASE testdb WITH OWNER postgres;
      GRANT ALL PRIVILEGES ON DATABASE testdb TO postgres;
   END IF;
END
$$;
