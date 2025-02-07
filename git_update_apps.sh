#!/bin/bash

# Display greeting message
echo " "
echo "=================================================================="
echo " Hello! "
echo ""
echo " Please wait while we process your request."
echo " The website will be set to maintenance mode and cannot be used."
echo "=================================================================="
echo " "

# Navigate to the web apps project directory
cd ~/Documents/Inventory-Stock-SMTI-Pontianak
if [ $? -ne 0 ]; then
  echo "Failed to navigate to the web apps project directory. Please check the path."
  exit 1
fi

# Put the web apps application into maintenance mode
php artisan down
if [ $? -ne 0 ]; then
  echo "Failed to put web apps into maintenance mode."
  exit 1
fi

# Stash any changes
git stash
if [ $? -ne 0 ]; then
  echo "Failed to stash changes."
  exit 1
fi

# Pull the latest changes from the main branch
git pull origin main
if [ $? -ne 0 ]; then
  echo "Failed to pull changes from the main branch."
  exit 1
fi

# Pop the stashed changes
git stash pop
if [ $? -ne 0 ]; then
  echo "Failed to pop stashed changes."
  exit 1
fi

# Bring the web apps application out of maintenance mode
php artisan up
if [ $? -ne 0 ]; then
  echo "Failed to bring web apps out of maintenance mode."
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
echo "  Web Server is back up and running."
echo "  Thank you for your patience!"
echo "  You can access - Inventory Stock Management Web Apps - by:"
echo "  http://$ip_address:8000"
echo " "
echo "=================================================================================="
