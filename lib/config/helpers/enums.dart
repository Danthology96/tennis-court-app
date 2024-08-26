/// Enum to represent the status of the user authentication
enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
  registered,
  notRegistered,
  unknown,
}

/// Enum for any form in the application
/// - [invalid] : when the data inside the form is not valid
/// - [valid] : when the data inside the form is valid according the format
/// - [validating] : when the cubit is validating the data
/// - [posting] : when the form is valid, the next step is post the data to the
/// db.
/// - [success] : when the db returns a success code
/// - [failed] : when the db returns an error code
enum FormStatus { invalid, valid, validating, posting, success, failed }
