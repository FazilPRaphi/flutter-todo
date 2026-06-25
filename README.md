<div align="center">
  <img src="assets/icon/app_icon.png" alt="Todo App Icon" width="120" height="120" style="border-radius: 24px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);" />

  # Flutter Offline Todo App

  A clean, lightweight, and high-performance offline Todo application built using **Flutter** and **Hive Database**. 

  [![Flutter](https://img.shields.io/badge/Flutter-v3.12.1-blue.svg?logo=flutter&logoColor=white)](#)
  [![Hive](https://img.shields.io/badge/Hive-Database-orange.svg)](#)
  [![License](https://img.shields.io/badge/License-MIT-green.svg)](#)
  [![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey.svg)](#)

  [**✨ View Live Demo ✨**](YOUR_LIVE_LINK_HERE)
</div>

---

## 📖 Table of Contents
- [✨ Key Features](#-key-features)
- [🛠 How It Works](#-how-it-works)
  - [1. Data Persistence (Hive)](#1-data-persistence-hive)
  - [2. Reactive State Management](#2-reactive-state-management)
  - [3. Codeflow & Component Overview](#3-codeflow--component-overview)
- [📂 Folder Structure](#-folder-structure)
- [🚀 Getting Started](#-getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation Steps](#installation-steps)
- [🌐 Live Demo Link](#-live-demo-link)
- [👥 Contributors & Collaboration](#-contributors--collaboration)
- [📄 License](#-license)

---

## ✨ Key Features
- **Offline First**: All your tasks are saved locally on your device and are accessible even without internet connectivity.
- **Ultra-Fast Performance**: Built on top of **Hive**, a lightweight and blazing-fast key-value database written in pure Dart.
- **Reactive UI**: Uses Flutter's `ValueListenableBuilder` to reflect local database updates on the screen instantaneously with zero delay.
- **Material Design UI**: Clean and minimal interface featuring a custom-styled floating dialog box and vibrant cards.

---

## 🛠 How It Works

This application follows a clean architecture for managing state and persistence:

```mermaid
graph TD
    A[User Actions] -->|Add / Delete| B[Home Screen]
    B -->|Triggers UI Dialog / Delete| C[Hive Box "todos"]
    C -->|Auto Notify Changes| D[ValueListenableBuilder]
    D -->|Triggers Rebuild| B
    B -->|Renders List| E[TodoCard Widgets]
```

### 1. Data Persistence (Hive)
Instead of SQL-based solutions, this app uses [Hive](https://pub.dev/packages/hive), which stores data locally as strongly-typed Dart objects. 
- The `Todo` model extends `HiveObject`, enabling quick local operations like `.save()` and `.delete()`.
- Data is stored in boxes, which are lightweight, key-value stores.

### 2. Reactive State Management
To prevent heavy state-management boilerplate, the UI listens directly to database operations:
- A `ValueListenableBuilder` is bound to `todoBox.listenable()`.
- Whenever a Todo item is added or deleted from the Hive box, the builder triggers a reactive rebuild of the `ListView.builder`.

### 3. Codeflow & Component Overview
- **`lib/main.dart`**: The entry point. Initializes Flutter binding, starts up Hive, registers the generated adapter, opens the `todos` box, and boots up the app.
- **`lib/models/todo.dart`**: Defines the `Todo` data structure with Hive annotations.
- **`lib/home.dart`**: Renders the scaffold, reads todos dynamically from the database, and provides an add button that opens a prompt overlay.
- **`lib/card.dart`**: A reusable stateless card widget representing an individual todo item with a completion button.

---

## 📂 Folder Structure

Here is a breakdown of the repository's layout:

```text
todo/
├── assets/
│   └── icon/
│       └── app_icon.png           # Application Icon used for launchers
├── lib/
│   ├── models/
│   │   ├── todo.dart              # Todo data model with Hive annotations
│   │   └── todo.g.dart            # Auto-generated Hive adapter code
│   ├── card.dart                  # Stateless widget for displaying todo list items
│   ├── home.dart                  # Main Stateful screen containing the todo list & dialog form
│   └── main.dart                  # Application entry point & Hive initialization
├── test/                          # Unit & widget tests directory
├── pubspec.yaml                   # Dependency list & package settings
└── README.md                      # Project documentation
```

---

## 🚀 Getting Started

Follow these steps to run the application locally on your machine.

### Prerequisites
Make sure you have the [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
Verify by running:
```bash
flutter doctor
```

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/FazilPRaphi/flutter-todo.git
   cd flutter-todo
   ```

2. **Fetch Dependencies**
   Retrieve the packages listed in `pubspec.yaml`:
   ```bash
   flutter pub get
   ```

3. **Generate Hive Adapters**
   Generate `todo.g.dart` using the build runner:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Launch the App**
   Connect a device/emulator and run:
   ```bash
   flutter run
   ```

---

## 🌐 Live Demo Link
You can access the live web build or release binaries here:
👉 **[Click Here to Access Live App](YOUR_LIVE_LINK_HERE)** *(Replace this URL with your live hosting URL, e.g., GitHub Pages, Codemagic, or Firebase Hosting).*

---

## 👥 Contributors & Collaboration
Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](#) if you want to contribute.

- **Developer**: Fazil P Raphi
- **Collaboration**: Open a Pull Request with your feature branch or submit an issue to suggest improvements.

---

## 📄 License
This project is licensed under the MIT License. See the [LICENSE](#) file for details.
