# Apache Superset Installation Script

This repository provides a one-click installation script for setting up Apache Superset on a Linux system.

## Features

- Creates a Python virtual environment
- Installs compatible versions of Superset and Flask
- Initializes the Superset database
- Creates an admin user
- Registers a systemd service to manage Superset as a background process

## Usage

1. Clone this repository or download the script archive.
2. Make the script executable:

```bash
chmod +x install_superset.sh
```

3. Run the script:

```bash
./install_superset.sh
```

4. Access Superset in your browser:

```
http://<your-ip>:8088
```

Login credentials:

- **Username:** admin  
- **Password:** admin123

## Notes

- The script assumes Python 3 and `systemd` are installed on the machine.
- You may modify the default username, password, or Superset version inside the script.
