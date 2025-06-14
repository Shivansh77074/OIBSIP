# UFW Configuration

## Objective

The goal is to set up a basic firewall using UFW (Uncomplicated Firewall) on a Linux system. We configure the firewall to:

- Allow incoming SSH connections (port 22)
- Deny incoming HTTP connections (port 80)

## Configuration Steps

1. **Enable UFW**  
   Activates the firewall.
   ```bash
   sudo ufw enable
