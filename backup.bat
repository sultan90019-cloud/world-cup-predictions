@echo off
"C:\Program Files\PostgreSQL\16\bin\pg_dump.exe" -U postgres -d worldcup --clean --if-exists -f "C:\Users\ME\OneDrive - Business Sultan\سطح المكتب\world-cup-sultan-main\backups\backup_%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%%time:~6,2%.sql"
