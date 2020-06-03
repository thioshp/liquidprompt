#!/bin/sh

echo "Creating Debian's package..."

# Edit the control file
nano ./liquidprompt/DEBIAN/control

# Create directory structure
echo "Creating directories..."
mkdir -p ./liquidprompt/usr/bin
mkdir ./liquidprompt/etc

# Copy required files
echo "Copying files..."
cp ../../../liquidprompt ./liquidprompt/usr/bin/liquidprompt
cp ../../../liquidpromptrc-dist ./liquidprompt/etc/liquidpromptrc

# Make the liquidprompt script executable
chmod a+x ./liquidprompt/usr/bin/liquidprompt

# Generate liquidprompt.deb
echo "Building liquidprompt.deb..."
dpkg-deb -b liquidprompt

# Remove all copied files
echo "Deleting files..."
rm -f ./liquidprompt/etc/*
rm -f ./liquidprompt/usr/bin/*

# Alert on completing the above tasks
echo "Done !"

