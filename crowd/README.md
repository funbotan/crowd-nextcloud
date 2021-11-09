# Configuring Crowd

In this part of the guide, we'll be working primarily with the database backend of Crowd, and specifically PostgreSQL. The same code should be applicable to other databases, although the configuration process will differ.

First, log into your database. This can be done with [pgAdmin](https://www.pgadmin.org) or any similar tool. The login credentials can be found in the crowd config file, which on my installation was in `/opt/crowd/crowd-home/shared/crowd.cfg.xml`. There, the login and password can be found in properties `hibernate.connection.username` and `hibernate.connection.password` respectively.

Now, create the views by executing the following scripts from the database console:
- [For users](nextcloud_users.sql)
- [For groups](nextcloud_groups.sql)
- [For mapping users to groups](nextcloud_user_group.sql)

Next step is to create a role for Nextcloud with permissions to read these views and only them. This can be done via the GUI or by executing a [script](create_user.sql).

By default, Postgres does not accept remote connections. For maximum security, we will configure it to only accept connections from the Nextcloud server. For that, you need to modify Postgres configuration files (usually located in `/var/lib/pgsql/<postgres_version>/data/postgresql.conf` and `/etc/postgresql/<postgres_version>/main/pg_hba.conf`, replace `<postgres_version>` accordingly):
- In `postgresql.conf`, uncomment and set `listen_addresses = 'localhost, <your_nextcloud_ip>'`
- In `pg_hba.conf`, append line `host crowd nextcloud <your_nextcloud_ip>/32 md5`

After that, execute `sudo service postgres restart`.

Finally, open port `5432` in your firewall. On Ubuntu, this can be done by `sudo ufw allow postgres` provided that UFW is active.
