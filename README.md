# LunarBar

LunarBar is a lightweight macOS menu bar calendar app built with SwiftUI. It aims to provide a polished native popover for the Gregorian calendar, Chinese lunar calendar, public holiday make-up workday labels, and weather.

The project is currently in early development. Step 1 has implemented the menu bar entry, a floating SwiftUI window, and the basic 7 x 6 calendar grid.

## Features

- Native macOS menu bar app powered by `MenuBarExtra`
- Hidden Dock icon via `LSUIElement`
- Floating panel using `.menuBarExtraStyle(.window)`
- SwiftUI-only interface
- MVVM-oriented project structure
- 7 x 6 month grid with previous and next month padding days
- Monday-first calendar layout for Chinese locale
- Dark Mode friendly base styling
- GitHub Actions macOS build workflow

## Roadmap

- Step 1: Basic macOS menu bar app and calendar grid
- Step 2: Chinese lunar calendar and solar terms
- Step 3: Public holiday and make-up workday badges
- Step 4: Weather header and user settings for API keys

## Requirements

- macOS 13 or later
- Xcode 15 or later for local development

You do not need Xcode just to download and try a build artifact from GitHub Actions, but local development and debugging require Xcode.

## Project Structure

```text
App/
  LunarBarApp.swift
Models/
  DayInfo.swift
ViewModels/
  CalendarViewModel.swift
Views/
  MainPopupView.swift
  Components/
    CalendarGridView.swift
Resources/
  Info.plist
.github/
  workflows/
    macos-build.yml
```

## Build Locally

Open the Xcode project:

```bash
open LunarBar.xcodeproj
```

Then select the `LunarBar` scheme and run it on `My Mac`.

Or build from the command line after selecting a full Xcode installation:

```bash
xcodebuild \
  -project LunarBar.xcodeproj \
  -scheme LunarBar \
  -configuration Debug \
  -destination 'platform=macOS' \
  build
```

## Build in GitHub Actions

This repository includes a macOS GitHub Actions workflow. On push to `main`, it builds the app with Xcode and uploads a zipped debug app artifact.

To download a cloud build:

1. Open the repository on GitHub.
2. Go to the `Actions` tab.
3. Select the latest `macOS Build` run.
4. Download the `LunarBar-debug` artifact.
5. Unzip it and run `LunarBar.app`.

Because the debug artifact is not Developer ID signed or notarized, macOS may block it on first launch. You can right-click the app and choose `Open`, or remove the quarantine attribute:

```bash
xattr -dr com.apple.quarantine /path/to/LunarBar.app
```

## Current Status

The app currently displays a basic calendar panel from the menu bar. Lunar dates, solar terms, holiday badges, weather, and settings are planned for the next steps.

## License

License has not been selected yet.
