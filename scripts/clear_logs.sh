# sudo chmod 777 -R /var/log/asterisk/
# sudo chmod 777 -R /var/log/

rm -rf /var/log/asterisk/cdr-csv/
rm -rf /var/log/asterisk/messages-*
rm -rf /var/log/asterisk/messages.*

rm -rf /var/log/asterisk/messages
rm -rf /var/log/asterisk/cdr-csv/
rm -rf /var/log/asterisk/security

rm -f /home/rails/projects/autodialerold/log/*.log
rm -f /home/rails/apps/autodialerold/current/log/*.log
rm -rf /var/log/*-*
rm -rf /var/log/*.gz
rm -rf /var/log/*.log
rm -rf /var/log/*.1
rm -rf /var/log/*.log.* 
rm -rf /home/rails/projects/autodialerold/log/*.log
