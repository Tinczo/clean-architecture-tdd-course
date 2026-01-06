# GEMINI.md

## Project Overview

This is a Flutter project for a Number Trivia application. It is designed with a focus on Clean Architecture and Test-Driven Development (TDD). It is a project based on Reso Coder's tutorial about Clean architucture in Flutter development

The project fetches trivia for a given number or a random number.

Key technologies and libraries used:
- **Flutter**: For the UI and mobile application framework.
- **Dart**: The programming language for Flutter.
- **Bloc**: For state management, separating business logic from the UI.
- **GetIt**: A service locator for dependency injection.
- **Equatable**: To compare objects.
- **Dartz**: For functional programming, providing `Either` for error handling.
- **Mockito**: For creating mock objects in tests.
- **Internet Connection Checker**: To check for internet connectivity.
- **Shared Preferences**: For local data caching.
- **HTTP**: For making requests to a remote API.

## Project Structure

The project follows a feature-first architectural approach, with the core logic separated into `data`, `domain`, and `presentation` layers within each feature.

- `lib/`: Contains all the Dart code for the application.
  - `main.dart`: The entry point of the application.
  - `core/`: Shared code used across multiple features, such as utility classes, network info, and base use cases.
  - `features/`: Contains the different features of the application. Each feature is a self-contained module.
    - `number_trivia/`: The main feature of the application.
      - `data/`: Contains data sources (local and remote) and the repository implementation.
      - `domain/`: Contains the core business logic, including entities, repository contracts (interfaces), and use cases.
      - `presentation/`: Contains the UI and state management (Bloc) for the feature.
- `test/`: Contains all the tests for the application. The structure of the `test` directory mirrors the `lib` directory.
- `pubspec.yaml`: The project's dependency management file.

## Building and Running

### Prerequisites
- Flutter SDK installed.
- A configured emulator or a physical device.

### Running the Application
To run the application, use the following command:
```bash
flutter run
```

### Running Tests
To run the tests, use the following command:
```bash
flutter test
```

## Development Conventions

### Code Style
The project follows the lints defined in `package:flutter_lints`. The specific rules are configured in `analysis_options.yaml`.

### State Management
The project uses the BLoC (Business Logic Component) pattern for state management, facilitated by the `flutter_bloc` package. Blocs are responsible for managing the state of a feature and handling events from the UI.

### Dependency Injection
Dependency injection is handled using the `get_it` service locator. Dependencies are registered in a central location and then retrieved when needed.

### Error Handling
The project uses the `dartz` package for functional error handling. Use cases return an `Either<Failure, T>`, where `Failure` represents an error and `T` represents a successful result.

### Testing
The project is heavily focused on TDD. Tests are written for all layers of the application:
- **Domain Layer**: Unit tests for use cases.
- **Data Layer**: Unit tests for repository implementations and data sources.
- **Presentation Layer**: Unit tests for Blocs.

`Mockito` is used to create mock dependencies for tests.

## Data Layer

The data layer is responsible for fetching data from remote and local data sources.
- **`NumberTriviaModel`**: The data transfer object (DTO) that represents the data from the API. It can be serialized to and from JSON.
- **Data Sources**:
  - A remote data source for fetching trivia from an API.
  - A local data source for caching trivia using `shared_preferences`.
- **Repository Implementation**: The repository implementation (`NumberTriviaRepositoryImpl`) orchestrates the data flow from the data sources, handling caching and network connectivity checks. It implements the `NumberTriviaRepositoryContract`.

## Domain Layer

The domain layer contains the core business logic of the application. It is independent of the other layers.
- **`NumberTrivia`**: The entity that represents the core business object.
- **`NumberTriviaRepositoryContract`**: An abstract class that defines the contract for the repository. This allows the domain layer to be independent of the data layer's implementation.
- **Use Cases**: Classes that encapsulate a single business operation (e.g., `GetConcreteNumberTrivia`, `GetRandomNumberTrivia`). They are invoked by the presentation layer.

## Presentation Layer

The presentation layer is responsible for the UI and state management.
- **Widgets**: Flutter widgets are used to build the UI.
- **Blocs**: BLoCs receive events from the UI, execute the corresponding use cases, and emit new states to the UI.
- **Pages**: The screens of the application.
