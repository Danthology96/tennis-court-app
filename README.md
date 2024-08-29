# Tennis Court App

Application to reserve tennis courts

## Getting Started

This application should run as any flutter project.

To execute the app, you should do the following:

# To create a release apk
run flutter build apk --release

# To make changes in the local DB entities (Isar)
flutter pub run build_runner build

# Functionallity:

The app uses an API KEY and a JWT_SECRET_KEY, both will be provided, but needs to copy the env_template, and rename it to ".env" because it will not be on the repository.


The app uses local database (Isar Database Technology), so, in order to make this app work, user needs to:
1. Register a user.
2. Login with the user credentials.
3. The app should work as expected (Can add to favorites, can make reservations, can delete reservations).


# Future work:
The app is not done yet due to lack of time, some features will be nice to implement:
1. Check reservations of the court in the calendar and hours on reserve page. In the example, I marked with a red box.
to simulate unavailability.
2. Label in login/register forms. To a better ux/ui, a label should be pop up when form field is focused.
3. Better tests: Due lack of time, would be nice to implement a mockito test to test the db connection.
4. Better code documentation: Due lack of time, there are some files that are not documented.

# 🚀 ENJOY 🚀
# Made with love by Daniel Novillo, Mobile Developer.
