# Wait to be sure that SQL Server came up
sleep 90s

# Run the setup script to create the DB and the schema in the DB
# Note: make sure that your password matches what is in the Dockerfile
# Restore the database (adjust names as needed)
BAK="/var/opt/mssql/backups/localpim.bak"
DBNAME="pim"
DATAFILE="/var/opt/mssql/data/pim.mdf"
LOGFILE="/var/opt/mssql/data/pim_log.ldf"

echo "Restoring ${DBNAME} from ${BAK}…"
/opt/mssql-tools18/bin/sqlcmd \
  -S localhost -U SA -P "LocalPassword1" -C \
  -Q "RESTORE DATABASE [${DBNAME}]
      FROM DISK='${BAK}'
      WITH MOVE N'${DBNAME}' TO '${DATAFILE}',
           MOVE N'${DBNAME}_Log'  TO '${LOGFILE}';"

echo "Restore complete, handing control back to SQL Server."
