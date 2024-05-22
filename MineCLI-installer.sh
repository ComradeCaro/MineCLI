#!/usr/bin/env bash

function install_dependencies() {
    # Placeholder for actual dependency installation commands
    echo "Dependencies installed."
}

function setup() {
   # Checks if all dependencies are installed. TODO
   echo "Checking dependencies..."
   dependencies_installed=false
   
   if [[ "$dependencies_installed" != true ]]; then
       read -p "This installer and its associated program depends on several other pieces of software. Would you like to try and install them? (likely requires sudo)[y/N] " install
       
       if [[ "$install" == "y" || "$install" == "Y" ]]; then
           echo "Installing dependencies"
           install_dependencies
       elif [[ "$install" == "n" || "$install" == "N" || "$install" == "" ]]; then
       
           read -p "Would you like to exit or continue without installing dependencies? [y/N] " continue_without_dependencies
           if [[ "$continue_without_dependencies" != "y" && "$continue_without_dependencies" != "Y" ]]; then
               echo "Exiting"
               exit 0
           fi
       else
           echo "Invalid input. Exiting"
           exit 1
       fi
   fi
   
# Ask for where servers will be located
   read -p "Where do you want your servers to be located? [/opt] " base_location
   if [[ "$base_location" == "" ]]; then
       base_location="/opt"
   fi
   cd "$base_location"
   install_location="$base_location/minecli"
   
   mkdir -p "minecli" || { echo "This requires sudo permissions."; sudo mkdir -p "minecli" && echo "Successfully created directory in $base_location"; }

   
   # Install script
   
   
   # END
   echo "export MINECLI_PATH=$install_location" >> "$HOME/.bashrc"
   
   echo "MineCLI path is set to $install_location"
   echo "Please reopen your terminal session or do: source $HOME/.bashrc to update the path"
}

# START: Asks if the user wants to continue setup
read -p "MineCLI is a command-line utility for creating and managing Minecraft servers. Would you like to proceed to setup? [Y/n] " continue_setup

if [[ "$continue_setup" == "y" || "$continue_setup" == "Y" || "$continue_setup" == "" ]]; then
    echo "Continuing setup"
    setup
elif [[ "$continue_setup" == "n" || "$continue_setup" == "N" ]]; then
    echo "Exiting"
    exit 0
else
    echo "Invalid input. Exiting"
    exit 1
fi

