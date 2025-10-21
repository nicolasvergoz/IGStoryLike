# IGStoryLike

## Case Study - Test Technique

Reproduction de la feature **Stories d'Instagram** en iOS (SwiftUI).

### Fonctionnalités

- Liste des utilisateurs avec leurs stories (lues/non lues)
- Affichage des stories par utilisateur
- Défilement infini avec pagination
- Gradient Instagram signature

### Architecture

**MVVM Clean Architecture**

```
├── Domain/          # Entities, UseCases
├── Data/            # Repositories, DataSources, DTOs
├── Presentation/    # Views, ViewModels, Components
└── Mappers/         # DTOs ↔ Entities
```

### Stack Technique

- SwiftUI
- Async/Await
- MVVM + Clean Architecture
