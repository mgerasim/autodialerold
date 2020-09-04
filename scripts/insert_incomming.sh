mysql --user=avtodialer --password=avtodialer avtodialerdb -e "INSERT INTO incommings (created_at, updated_at, phone) VALUES (NOW(), NOW(), 'none')" >> /tmp/insert_incomming_log.log 2>&1
