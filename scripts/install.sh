sudo cp /home/rails/projects/autodialerold/scripts/autodialerold.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable autodialerold.service
sudo systemctl restart autodialerold.service
