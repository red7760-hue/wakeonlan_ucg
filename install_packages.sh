# List of applications to install
REQUIRED_PKGS=("nano" "etherwake")
sudo apt update

# Function to check and install a package
install_package() {
    package=$1
    echo "Checking for $package..."

    # Use dpkg-query to check if the package is installed
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' "$package" | grep "install ok installed")

    if [ "" = "$PKG_OK" ]; then
        echo "No $package found. Installing..."
        # Use sudo apt-get with --yes flag to avoid interactive prompts
        sudo apt-get --yes install "$package"
    else
        echo "$package is already installed."
    fi
}

# Update package lists before attempting installation
echo "Updating package lists..."
sudo apt-get update

# Loop through the array and call the installation function for each package
for pkg in "${REQUIRED_PKGS[@]}"; do
    install_package "$pkg"
done