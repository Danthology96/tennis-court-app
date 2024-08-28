# tennis_court_app

Application to reserve tennis courts

## Getting Started

This application should run as any flutter project.

To execute the app, you should do the following:

# To create a release apk
run flutter build apk --release

# To make changes in the local DB entities (Isar)
flutter pub run build_runner build

# Functionallity:

The app uses an API KEY, the API_KEY will be provided, needs to copy the env_template, and rename it
to ".env"

The app uses local database (Isar technology), so, in order to make this app work, user needs to:
1. Register a user.
2. Login with the user credentials.
3. The app should work as expected.