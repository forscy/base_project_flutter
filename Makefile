.PHONY: build deploy clean help

# Default target when running just 'make'
all: help

# Build the Flutter apk for Android release
b-a:
    @echo "Building Flutter APK for Android release..."
    flutter build apk --release

# Install android apk on connected device
i-a:
    @echo "Installing APK on connected Android device..."
    adb install -r build/app/outputs/flutter-apk/app-release.apk

# Build the Flutter web app for production
build:
    @echo "Building Flutter web app for production..."
    flutter build web --release

# Deploy to Firebase hosting
deploy: build
    @echo "Deploying to Firebase..."
    firebase deploy --only hosting

# Clean build artifacts
clean:
    @echo "Cleaning build artifacts..."
    rm -rf build/
    flutter clean

# Run complete deployment process
d-w: build deploy
    @echo "Deployment complete!"

# Display help information
help:
    @echo "Available commands:"
    @echo "  make build      - Build the Flutter web app for production"
    @echo "  make deploy     - Deploy the already built app to Firebase hosting"
    @echo "  make deploy-web - Build and deploy the app (complete deployment)"
    @echo "  make clean      - Clean build artifacts"
    @echo "  make help       - Display this help message"