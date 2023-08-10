#!/bin/bash

# Function to start the SSH tunnel
# This is the template of the code,it's just a helper for ssh
# ssh -p"Foreign SSHport" -N -f -L *:"InCountry Port":localhost:"Foreign Port" "root"@"Foreign IP
# Khodemooni begam behet
# ssh -p"Kharej SSHport" -N -f -L *:"IranCountryPort":localhost:"KharejPort" "root"@"Kharej IP
start_ssh_tunnel() {
    local ssh_command="ssh -p $foreign_ssh_port -N -f -L *:$in_country_port:localhost:$foreign_port $username@$foreign_ip"
    echo "Starting SSH tunnel with the following command:"
    echo "$ssh_command"
    $ssh_command
    echo "SSH tunnel started."
}

# Function to kill the SSH tunnel
kill_ssh_tunnel() {
    echo "Killing SSH tunnel..."
    sudo killall ssh
    echo "SSH tunnel killed."
}

# Main menu
while true; do
    echo "Menu:"
    echo "1. Start SSH Tunnel"
    echo "2. Kill SSH Tunnel"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            read -p "Enter Foreign SSH Port: " foreign_ssh_port
            read -p "Enter In-Country Port: " in_country_port
            read -p "Enter Foreign Port: " foreign_port
            read -p "Enter Foreign IP: " foreign_ip
            read -p "Enter Username: " username
            start_ssh_tunnel
            ;;
        2)
            kill_ssh_tunnel
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please select again."
            ;;
    esac
done
