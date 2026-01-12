# Flutter Clean Architecture & TDD Course (2025 Edition) 🚀

This repository contains the source code for the **Number Trivia** app, created based on the legendary "Flutter Clean Architecture & TDD Course" by Reso Coder.

The goal of this project is to **update the original code to 2025 standards**. The original tutorial used older versions of Flutter and Dart. Here you will find an implementation fully compatible with:

* ✅ **Dart 3.x** (Patterns, Records, Sealed classes)
* ✅ **Null Safety**
* ✅ **Flutter 3.x**
* ✅ Latest package versions (including `flutter_bloc 8+`, `mockito` with code generator, `provider`).

## 📺 Original Course

The project is based on this YouTube playlist. I highly recommend watching it while analyzing this code:

👉 **[Flutter Clean Architecture & TDD Course - YouTube Playlist](https://www.youtube.com/watch?v=KjE2IDphA_U&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech&index=1)**

## 📂 How to use this repository? (Branches)

The repository is designed so that you can follow the app creation process **step-by-step**, exactly as in the video course.

Each episode has a dedicated **branch**. To see the code state after finishing a specific episode, switch to the corresponding branch:

* `episode01` - Introduction and Project Structure
* `episode02` - Entities and Use Cases
* `episode03` - Repository Contracts
* `episode04` - Implementing Unit Tests
* ... and so on, up to `episode13`/`episode14`.

To switch to a specific episode in the terminal:

```bash
git checkout episode01
```

The `main` (or `master`) branch contains the **completed, fully functional version of the app**.

## 🛠 Technologies and Packages Used (2025 Update)

The code has been rewritten to eliminate outdated solutions (e.g., old `flutter_bloc` syntax or manual mock generation).

* **Architecture:** Clean Architecture (Domain, Data, Presentation layers)
* **State Management:** `flutter_bloc` (version 8.0+ using `on<Event>`)
* **Dependency Injection:** `get_it` + `injectable` (automated DI code generation)
* **Testing:** `flutter_test`, `mockito` (with `@GenerateMocks` annotation)
* **Functional Programming:** `dartz` (Either type)
* **Object Comparison:** `equatable`
* **API / Cache:** `http`, `shared_preferences`

## 🚀 Running the Project

1. Clone the repository:

```bash
git clone https://github.com/Tinczo/clean-architecture-tdd-course.git
```

2. Get dependencies:

```bash
flutter pub get
```

3. (Optional) If you modify models or DI, run the code generator:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app:

```bash
flutter run
```

---

*Project created for educational purposes to facilitate learning Clean Architecture in Flutter using modern tools.*