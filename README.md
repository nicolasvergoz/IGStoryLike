# IGStoryLike

## Case Study - Technical Test

Instagram **Stories** feature recreation in iOS (SwiftUI).

### Features

- User list with their stories (read/unread)
- Stories display by user
- Infinite scroll with pagination
- Instagram signature gradient

### Architecture

**MVVM Clean Architecture**

```
├── Domain/          # Entities, UseCases
├── Data/            # Repositories, DataSources, DTOs
├── Presentation/    # Views, ViewModels, Components
└── Mappers/         # DTOs ↔ Entities
```

### Tech Stack

- SwiftUI
- Async/Await
- MVVM + Clean Architecture
