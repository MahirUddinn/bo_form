# BO Account Form

A Flutter application for managing BO (Beneficiary Owner) account forms. This project demonstrates a multi-step form implementation using `flutter_bloc` for state management, featuring a clean UI with light and dark mode support.

## Features

- **Multi-step Form Wizard**: Guided form submission using a stepper.
- **State Management**: Robust state handling with `flutter_bloc` (Cubit).
- **Theme Support**: Fully supported Light and Dark modes.
- **Form Validation**: Real-time validation for account holder details.
- **Dynamic Nominees**: Functionality to add extra nominees.

## Screenshots

### Light & Dark Mode
| Light Mode | Dark Mode |
|:---:|:---:|
| <img src="assets/light mode.jpg" width="300" /> | <img src="assets/dark mode.jpg" width="300" /> |

### Form Steps

| Account Holder | Bank Info |
|:---:|:---:|
| <img src="assets/screenshots/account_holder.png" width="300" /> | <img src="assets/screenshots/bank_info.png" width="300" /> |

| Nominee | Extra Nominee |
|:---:|:---:|
| <img src="assets/screenshots/nominee.png" width="300" /> | <img src="assets/screenshots/extra_nominee_functionality.png" width="300" /> |

| Documents | Authorization |
|:---:|:---:|
| <img src="assets/screenshots/document.png" width="300" /> | <img src="assets/screenshots/authorize.png" width="300" /> |

### Validation
<img src="assets/screenshots/account_holder_validation_error.png" width="300" />

## Getting Started

To run this project locally, you will need Flutter installed.

1.  **Clone the repository**
2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the app**:
    ```bash
    flutter run
    ```

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [image_picker](https://pub.dev/packages/image_picker)
- [path_provider](https://pub.dev/packages/path_provider)
- [intl](https://pub.dev/packages/intl)
