
# modern Linux distirbutions using systemd rely on journal logs
# managed by journalctl

journalctl          # Show all logs from systemd journal.
journalctl -xe      # Show recent logs with details.
journalctl -f       # Follow logs in real time.
journalctl --since "1 hour ago"   # View logs from the last hour.
journalctl -u sshd  # Show logs for a specific service

journalctl --disk-usage   # check disk usage

sudo journalctl --vacuum-time=7d    # clear old logs

# enable persistent logging (logs stored in /var/log/journal)
sudo mkdir -p /var/log/journal
sudo systemctl restart systemd-journald
