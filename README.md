# Technical Interview App

This file explains my choices for the app I developed for the technical interview. There is one commit per level as requested.

**I have commented my code in places where I felt it needed more explanations.**

## Levels

- **Level 1**: HomeScreen
- **Level 2**: AppRouter and navigation to details screen, reorganization of UI components
- **Level 3**: Added the favorites feature, and AppRouter.

## Disclaimer
The favorites feature uses `@AppStorage`, which is only available in SwiftUI views, so it is managed directly from views and not from the ViewModel, which is not ideal. However, to avoid spending too much time implementing this feature, I chose to stick with `UserDefaults`.

## Localization
- The app is not localized, and all strings are hardcoded in English.

## Simulating Slow Internet Connection
- A delay of 2 seconds is added when fetching cars to simulate a slow internet connection. This allows time to display a loading screen.

## Main Screen Layout
- The main screen uses a grid layout to display more items per row on larger screens such as iPads.

## Handling Various Scenarios
- The app handles various scenarios including:
  - Device rotation
  - Dark mode
  - No internet connection
  - Server and client errors
- Each scenario displays the corresponding UI to the user.

## Libraries Used
- **SwiftUIGIF**: Used to display GIFs in SwiftUI.
- **SwiftUILayoutGuides**: Used to bring UIKit layout guides such as `.readableContentGuide` to SwiftUI.

## Design System
### Colors
- Colors are numbered 100 to 300, representing different levels in the UI. Each color has a light and dark variant:
  - Level 1 (e.g., background views): Uses 100 variants.
  - Level 2 (e.g., views above the background): Uses 200 variants.
  - Level 3 (e.g., views above level 2 views): Uses 300 variants.
  - Additional variants could be added over time if required.

### UI Consistency
- Padding, corner radius, spacing, aspect ratio, and more are set inside a `DesignSystem` enum, ensuring coherence throughout the app.
- Most of the app's tinted controls use the app's `accentColor`, which is the Getaround pink color.

## Conclusion
This README provides an overview of the design choices and implementation details for the technical interview app. The app is designed to handle various scenarios gracefully and maintain a consistent UI using a structured design system, following the iOS Human Interface Guidelines.

Baptiste FAURE, Getaround 2024