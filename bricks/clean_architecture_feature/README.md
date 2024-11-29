# Clean Architecture Feature Generator 🏗️

A Mason brick that generates a folder structure for Clean Architecture features in Flutter projects 🎯

## Overview ⭐
This brick helps you quickly set up the folder structure for a new feature following Clean Architecture principles. It creates all necessary directories for your data, domain, and presentation layers, saving you time and ensuring consistency across your project.

## What is Mason? 🤔
Mason is a code generation tool that helps Flutter/Dart developers create consistent project structures. Think of it as a scaffolding tool that can generate folders and files based on templates (called "bricks").

## Installation 🚀
1. Install Mason CLI globally:
```bash
dart pub global activate mason_cli
```

2. Add the following to your `mason.yaml`:
```yaml
bricks:
  clean_architecture_feature:
    git:
      url: https://github.com/Jpumpkin1223/mason_bricks.git
      path: bricks/clean_architecture_feature
```

3. Get the brick:
```bash
mason get
```

## Usage 📝
To generate the folder structure for a new feature, run:
```bash
mason make clean_architecture_feature --name your_feature_name
```

For example, if you want to create folders for an authentication feature:
```bash
mason make clean_architecture_feature --name authentication
```

This command will create the following empty folder structure:
```
authentication/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── pages/
    ├── providers/
    └── widgets/
```

## Folder Structure Guide 🔍
### Data Layer 💾
- **datasources/**: Place your API clients and local storage implementations here
- **models/**: For your data models and DTOs
- **repositories/**: For your repository implementations

### Domain Layer ⚙️
- **entities/**: For your business objects
- **repositories/**: For your repository interfaces
- **usecases/**: For your business logic units

### Presentation Layer 🎨
- **providers/**: For your state management files
- **pages/**: For your screen widgets
- **widgets/**: For your reusable UI components

## Note 📝
This brick only creates the folder structure. You'll need to create the actual implementation files yourself based on your feature requirements.

## Benefits 🌟
- ✅ Consistent folder structure across features
- ✅ Quick setup for new features
- ✅ Follows Clean Architecture principles
- ✅ No need to manually create directories

## Requirements 📋
- Dart SDK: >=2.19.0 <4.0.0
- Flutter: >=3.0.0
- Mason CLI: Latest version
