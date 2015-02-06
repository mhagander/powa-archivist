#!/bin/bash
# This script is meant to install every PostgreSQL extension compatbile with
# PoWA.
git clone https://github.com/dalibo/pg_qualstats.git > /dev/null 2>&1
cd pg_qualstats/
(make && sudo make install)  > /dev/null 2>&1
cd ..
rm pg_qualstats/ -rf
git clone https://github.com/dalibo/pg_stat_kcache.git > /dev/null 2>&1
cd pg_stat_kcache
(make && sudo make install)  > /dev/null 2>&1
cd ..
rm pg_stat_kcache -rf
(make && sudo make install)  > /dev/null 2>&1
echo ""
echo "You should add the following line to your postgresql.conf:"
echo ''
echo "shared_preload_libraries='pg_stat_statements,powa,pg_stat_kcache,pg_qualstats'"
echo ""
echo "Once done, restart your postgresql server and run the install_all.sql file"
echo "with a superuser, for example: "
echo "  psql -U postgres -f install_all.sql"
