#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Build the project
echo "Building the project..."
flutter build web --release
if [ $? -ne 0 ]; then
    echo "Build failed. Exiting."
    exit 1
fi
echo "Build completed successfully."

# Deploy to Firebase
echo "Deploying to Firebase..."
firebase deploy --only hosting
if [ $? -ne 0 ]; then
    echo "Deployment failed. Exiting."
    exit 1
fi
echo "Deployment completed successfully."
echo "Deployment complete!"