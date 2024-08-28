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

/// Enum for easyloading alert types
/// - [success] : Represents a success easyloading type
/// - [error] : Represents an easyloading error type
/// - [loading] : Represents the general loading blur widget
/// - [warning] : Represents a warning alert
/// - [info] : Represents an info alert dialog
enum AlertType {
  success,
  error,
  loading,
  warning,
  info,
  modal,
}

enum CourtType {
  A,
  B,
  C,
}
