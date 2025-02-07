#!/bin/bash

# Display waiting message
echo "Please wait, the process is starting..."

# Kill any process using port 8000
fuser -k 8000/tcp

# Stop the MySQL service
sudo service mysql stop

echo " "
echo "====================================================================================="
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
echo "  Web Server is deactivate."
echo "  To restart the web server, run the 'run_apps.sh' script in your Desktop directory."
echo " "
echo "  Bye."
echo " "
echo "====================================================================================="

