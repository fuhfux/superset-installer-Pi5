#!/bin/bash

set -e

echo "Creating directory structure..."
mkdir -p ~/superset
cd ~/superset

echo "Creating Python virtual environment..."
python3 -m venv venv_superset
source venv_superset/bin/activate

echo "Upgrading pip and setuptools..."
pip install --upgrade pip setuptools

echo "Installing Apache Superset with compatible versions..."
pip install apache-superset==4.1.2
pip install flask==2.2.5 werkzeug>=2.2.2,<3.0

echo "Setting Flask app environment variable..."
export FLASK_APP=superset.app:create_app

echo "Initializing Superset database..."
superset db upgrade

echo "Creating admin user..."
superset fab create-admin \
    --username admin \
    --firstname Admin \
    --lastname User \
    --email admin@admin.com \
    --password admin123

echo "Loading example data (optional)..."
superset load_examples || true

echo "Initializing Superset..."
superset init

echo "Creating systemd service file..."
sudo tee /etc/systemd/system/superset.service > /dev/null <<EOF
[Unit]
Description=Apache Superset Service
After=network.target

[Service]
User=$USER
Group=$USER
WorkingDirectory=/home/$USER/superset
Environment="FLASK_APP=superset.app:create_app"
ExecStart=/home/$USER/superset/venv_superset/bin/superset run -h 0.0.0.0 -p 8088 --with-threads
Restart=always

[Install]
WantedBy=multi-user.target
EOF

echo "Enabling and starting Superset service..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable superset
sudo systemctl restart superset

echo "Superset is now running at http://<your-ip>:8088"
echo "Login with username: admin and password: admin123"
