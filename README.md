# Burning Bros Product

This Flutter application is the submission for [Burning Bros's home assignment for mobile developer](https://burningbros.notion.site/Coding-Project-Flutter-Infinite-Scrolling-and-Searchable-Product-List-7ba68f55f8c348b98175e0f78530a8d8).

## Getting Started

### Set up

Right after cloning this repository, running this command will install dependencies (packages, other resources) declared in [pubspec.yaml](./pubspec.yaml):

```bash
flutter pub get
```

Next, due to using auto-generation tools like [json_serializable](https://pub.dev/packages/json_serializable) and [freezed](https://pub.dev/packages/freezed), this command should be executed:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Please also ensure language internalization with:

```bash
flutter gen-l10n
```

### Run the app

First, prepare a mobile device (physical or emulator) with option to launch an app in development environment.

Running ``flutter run`` with start the app along with these options:

- Running in debug mode: ``flutter run``
- Running in release mode: ``flutter run --release``

## Troubleshoot

In case ``flutter pub run build_runner build --delete-conflicting-outputs`` fails, let's try with ``flutter clean`` then re-run it.

## Note

For quick experience, some files is included in the remote repository, such as: [.env](./.env) and [/vscode](./.vscode)

The app has yet developed but not been tested beforehand on iOS devices due to the limitation of my Windows device.

## Project information

### System components

The system consists of 1 mobile application (this one), [DummyJSON](https://dummyjson.com/) as back-end server and [Isar](https://isar.dev/) for local database.

### Member

[Huy Le Nguyen Truong](https://github.com/huylnt29)
