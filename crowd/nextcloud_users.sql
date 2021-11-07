CREATE OR REPLACE VIEW public.nextcloud_users
 AS
 SELECT cwd_user.user_name AS uid,
    cwd_user.display_name,
    cwd_user.email_address AS email,
    cwd_user.active::boolean AS active,
    cwd_user_credential_record.password_hash AS password
   FROM cwd_user
     JOIN cwd_user_credential_record ON cwd_user.id = cwd_user_credential_record.user_id;

ALTER TABLE public.nextcloud_users
    OWNER TO postgres;
