-- Shared MySQL initialization script
-- This file is executed on first startup

-- Create a user for healthchecks
CREATE USER IF NOT EXISTS 'healthcheck'@'localhost' IDENTIFIED BY '';
GRANT USAGE ON *.* TO 'healthcheck'@'localhost';

-- App databases and users are dynamically created by Hostura
