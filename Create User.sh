#!/bin/bash

# Benutzername und Passwort abfragen
read -p "Enter username: " username
read -s -p "Enter password: " password
echo

# Benutzer hinzufügen
sudo adduser --disabled-password --gecos "" $username
echo "$username:$password" | sudo chpasswd

# Abfrage, ob der Benutzer sudo-Rechte haben soll
read -p "Should the user have sudo privileges? (y/n): " sudo_choice
if [[ "$sudo_choice" == "y" || "$sudo_choice" == "Y" ]]; then
    sudo usermod -aG sudo $username
    echo "$username has been granted sudo privileges."
else
    echo "$username does not have sudo privileges."
fi

echo "User $username has been created successfully."
