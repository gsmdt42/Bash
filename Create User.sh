#!/bin/bash

#Input for username and password
read -p "Enter username: " username
read -s -p "Enter password: " password
echo

#Add user and set password
sudo adduser --disabled-password --gecos "" $username
echo "$username:$password" | sudo chpasswd

#Request whether the user should be a superuser (sudo)
read -p "Should the user have sudo privileges? (y/n): " sudo_choice
if [[ "$sudo_choice" == "y" || "$sudo_choice" == "Y" ]]; then
    sudo usermod -aG sudo $username
    echo "User $username has been granted sudo privileges."
else
    echo "User $username does not have sudo privileges."
fi

echo "User $username has been created successfully."
