CREATE OR REPLACE VIEW public.nextcloud_groups
 AS
 SELECT cwd_group.group_name AS gid
   FROM cwd_group;

ALTER TABLE public.nextcloud_groups
    OWNER TO postgres;