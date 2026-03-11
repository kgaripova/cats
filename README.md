# Cats

Cat breeds browser powered by [The Cat API](https://thecatapi.com/).

## Features

- Breeds list with infinite scrolling (paginated loading)
- Breed details screen
- Favorite / unfavorite
- Favorites screen
- Weight unit toggle (`kg` / `lbs`) persisted in settings
- Offline support for cached breeds and favorites
- Localization-ready strings (`l10n`)

## Stack

- Flutter
- `flutter_bloc` (state management)
- `go_router` (navigation)
- `dio` (HTTP)
- `hive_flutter` (offline cache)
- `shared_preferences` (lightweight app settings)
- `freezed` + `json_serializable` (models)

## Run

```bash
flutter pub get
flutter run --dart-define=CAT_API_KEY=YOUR_API_KEY
```

## Tests

```bash
flutter test
```

Current tests include:
- `test/breed_repository_test.dart`
- `test/weight_utils_test.dart`

## Project Structure

`lib/core`  
App-level setup: API client, constants, navigation, theme

`lib/data`  
Models, remote/local sources, repositories

`lib/presentation`  
Screens, widgets, blocs/cubits

`lib/l10n`  
Localization resources and generated localization classes

## Offline Behavior

- **Breeds**
  - First page is cached in Hive and reused when offline-like network errors happen
  - Additional pages are not reconstructed from cache (to avoid incorrect pagination state)
- **Breed details**
  - Falls back to cached breed data when offline
- **Favorites**
  - Favorites are cached and can be viewed offline
  - Add/remove is disabled in offline mode with user feedback

## Design Decisions

- **Sorting by size:** intentionally not implemented
  - The API does not provide server-side sorting for this use case; with infinite pagination, client-side sorting is only partial and misleading
  - The only way to make it globally correct on the client would be to download the entire dataset first and sort it locally, which is fundamentally the wrong approach for paginated data

- **Offline favorite toggle:** intentionally disabled
  - Allowing add/remove favorites while offline would require a proper sync queue and conflict-resolution strategy after reconnection
  - This synchronization flow is outside the scope of the test assignment, so offline toggling is blocked and the user sees a toast/snackbar

- **Theming and styling:** intentionally simplified
  - The current theme/UI styling is functional but not production-grade (no full design system, token set, or comprehensive component theming)
  - For this test assignment, implementation priority was given to core product behavior and architecture over final visual polish



 