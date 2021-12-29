CREATE ROLE nextcloud WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  ENCRYPTED PASSWORD 'md5a29036ebb0fa0f38fc0ad7da867d5b02'; -- The password is "atlassian sucks ass"
COMMENT ON ROLE nextcloud IS 'Entry point for the Nextcloud user_sql app with read only permissions';

GRANT CONNECT ON DATABASE crowd TO nextcloud;
GRANT USAGE ON SCHEMA public TO nextcloud;
GRANT SELECT ON TABLE public.nextcloud_groups TO nextcloud;
GRANT SELECT ON TABLE public.nextcloud_user_group TO nextcloud;
GRANT SELECT ON TABLE public.nextcloud_users TO nextcloud;
