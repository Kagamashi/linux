

# firewalld
sudo firewall-cmd --list-all                      # list firewall rules for firewalld
sudo firewall-cmd --permanent --add-service=ssh   # allow SSH permanently
sudo firewall-cmd --permanent --add-service=http  # allow HTTP permanently
sudo firewall-cmd --permanent --add-service=https # allow HTTPS permanently
sudo firewall-cmd --reload                        # reload firewalld to apply changes
