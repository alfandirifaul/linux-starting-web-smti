#!/bin/bash

# Display waiting message
echo "Please wait, the process is starting..."

# Start the MySQL service
sudo service mysql start
if [ $? -ne 0 ]; then
  echo "Failed to start MySQL service."
  exit 1
fi

# Navigate to the Laravel project directory
cd ~/Documents/Inventory-Stock-SMTI-Pontianak
if [ $? -ne 0 ]; then
  echo "Failed to navigate to the Laravel project directory. Please check the path."
  exit 1
fi

# Start the Laravel development server
nohup php artisan serve --host=0.0.0.0 --port=8000 > /dev/null 2>&1 &
if [ $? -ne 0 ]; then
  echo "Failed to start the Laravel development server."
  exit 1
fi

# Get the server's IP address
ip_address=$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d/ -f1 | head -n 1)

echo " "
echo "=================================================================================="
echo " "
echo "   _____ __  __ _______ _____  __          __  _                                "
echo "  / ____|  \/  |__   __|_   _| \ \        / / | |         /\                    "
echo " | (___ | \  / |  | |    | |    \ \  /\  / /__| |__      /  \   _ __  _ __  ___ "
echo "  \___ \| |\/| |  | |    | |     \ \/  \/ / _ \ '_ \    / /\ \ | '_ \| '_ \/ __|"
echo "  ____) | |  | |  | |   _| |_     \  /\  /  __/ |_) |  / ____ \| |_) | |_) \__ \ "
echo " |_____/|_|  |_|  |_|  |_____|     \/  \/ \___|_.__/  /_/    \_\ .__/| .__/|___/"
echo "                                                               | |   | |        "
echo "                                                               |_|   |_|        "
echo " "
echo "  Web Server is active."
echo "  You can access - Inventory Stock Management Web Apps - by:"
echo "  http://$ip_address:8000"
echo " "
echo "=================================================================================="
