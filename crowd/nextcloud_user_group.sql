CREATE OR REPLACE VIEW public.nextcloud_user_group
 AS
 WITH RECURSIVE nested AS (
         SELECT cwd_membership.child_name AS uid,
            cwd_membership.parent_name AS gid
           FROM cwd_membership
        UNION ALL
         SELECT cm.child_name AS uid,
            n.gid
           FROM cwd_membership cm,
            nested n
          WHERE cm.parent_name::text = n.uid::text
        )
 SELECT DISTINCT nested.uid,
    nested.gid
   FROM nested
  WHERE (nested.uid::text IN ( SELECT cwd_user.user_name
           FROM cwd_user));

ALTER TABLE public.nextcloud_user_group
    OWNER TO postgres;
