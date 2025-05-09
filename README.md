# Apache Superset Installation Script

This repository provides a ready-to-use script for setting up [Apache Superset](https://superset.apache.org/) on a Linux system with `systemd` support.

---

## 🚀 Quick Setup Instructions

### 1. Download the Script
Clone this repository or download the files.

```bash
git clone <repo-url>
cd superset-setup
```

### 2. Run the Installation Script

```bash
chmod +x install_superset.sh
./install_superset.sh
```

This will:
- Create a virtual environment
- Install Apache Superset and dependencies
- Create an admin user
- Load optional sample data
- Create and start a systemd service

### 3. Access Superset

Visit: [http://localhost:8088](http://localhost:8088)

Login credentials:
- **Username**: `admin`
- **Password**: `admin123`

---

## 🔧 Systemd Service

The script creates a service file at `/etc/systemd/system/superset.service`.

To manage the service manually:

```bash
sudo systemctl status superset
sudo systemctl restart superset
```

---

## 🧼 Uninstallation

To remove Superset:

```bash
sudo systemctl stop superset
sudo systemctl disable superset
sudo rm /etc/systemd/system/superset.service
rm -rf ~/superset
```

---
