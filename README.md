# Medicine Manager App

The **Medicine Manager App** is a Flutter mobile application designed to help users organize and track their medication schedules easily. It allows users to add medicines with specific dosage information and select the days of the week when the medicine should be taken. The app sends timely reminders to improve medication adherence and supports storing data securely in Firebase Firestore.

## Features

- Add and manage medicines with dosage, timing, and day selection  
- Schedule reminders/notifications to alert users when it’s time to take their medicine  
- Store medicine information in Firebase Firestore for secure, cloud-based persistence  
- User-friendly and intuitive interface designed with Flutter for smooth performance on Android and iOS  
- Local persistence ensures data remains accessible offline  
- Simple navigation and clean UI focused on enhancing user experience  

## Installation

1. **Prerequisites:**  
    - Flutter SDK installed ([flutter.dev](https://flutter.dev/docs/get-started/install))  
    - Firebase project setup with Firestore and Authentication enabled  

2. **Clone the repository:**  
    ```bash
    git clone https://github.com/yourusername/medicine-manager-app.git
    cd medicine-manager-app
    ```

3. **Install dependencies:**  
    ```bash
    flutter pub get
    ```
4. **Run the app:**  
    ```bash
    flutter run
    ```
## Usage

- Open the app and create an account or sign in using Firebase Authentication
- Add a new medicine by entering its name, dosage details, and select the days you need to take it
- Set up reminders that will notify you at the scheduled times
- View, edit, or delete medicines from your list as needed
- The app syncs your data with Firestore, so your medicines are backed up and accessible across devices

## Technologies Used
- Flutter
- Firebase Firestore
- Firebase Authentication
- Local notifications (alarm/reminder package)
- Riverpod 
