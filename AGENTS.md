# Base Rules
- Follow the existing project structure when creating new files
- If a file does not fit an existing folder, create a new folder that matches the current architecture
- When refactoring, keep existing comments unless they are clearly no longer correct
- Document new code with comments that explain intent and purpose
- Add inline comments for non-obvious logic and doc comments for public classes and methods

# Android Architecture and Stack Rules

## Code Quality Rules
- Do not duplicate logic or models across features or layers
- If shared logic is needed refactor it into a clear shared location
- Keep files cohesive and focused on a single responsibility
- Prioritize readability over brevity and write code that is understandable without hunting for definitions

## Core Stack
- Jetpack Compose for UI
- ViewModel + Kotlin Coroutines for state and logic
- StateFlow for UI state
- SharedFlow or Channel only for one off UI events when needed
- Unidirectional data flow with Repository to ViewModel to UI
- collectAsStateWithLifecycle for lifecycle safety
- Jetpack Navigation Compose with NavHost and composable routes
- Use route arguments and SavedStateHandle instead of family providers
- Hilt for dependency injection (@HiltViewModel, @Module, @Provides, etc.)

## Data and Domain Rules
- Repository is the single source of truth
- Domain models are separate from DTOs
- DTO → Domain mapping in data layer
- Repositories may expose Flow or StateFlow when data must be shared consistently across screens
- Otherwise repository functions return values and ViewModels own state

## Exception and Error Handling
- Exceptions are allowed only in low level code such as data sources or IO boundaries
- Repositories (or the equivalent domain class, if the functionality is not data related) are the exception boundary and must catch all exceptions
- Repositories return feature specific result types, like the following example:
```kotlin
sealed interface ProductResult {
    data class Success(val products: List<Product>) : ProductResult
    sealed interface Failure : ProductResult {
        data object DataNotFound : Failure
        data object InvalidData : Failure
        data object Unknown : Failure
    }
}
```
- ViewModels or use cases then use `when` for the Result types

## Layering and Boundaries
- Each layer only depends on layers below it
- UI never depends on data or DTOs
- Domain never depends on data implementations
- ViewModels must not use try catch for normal control flow

# Key Kotlin conventions excerpt

## Lambdas, callbacks, and control flow
- Use explicit parameter names in callbacks, especially in UI, Compose, or nested lambdas
- Use implicit `it` only for trivial single line non-nested lambdas where meaning is obvious
- Avoid confusing control flow in lambdas and reduce labeled returns, restructure or use an anonymous function when needed
- For multiline lambdas, declare parameters explicitly and place `->` on its own line when needed for clarity
- Keep lambda bodies small and extract to named functions when they grow

## Scope functions, Compose, and state
- Use scope functions only when they improve clarity, avoid long chains, and prefer explicit names in non-trivial blocks
- Expose immutable collection interfaces and keep mutable implementations private

## Parameters and API design
- Use named arguments when multiple primitive or Boolean parameters are involved
- Prefer default parameter values over overloads when semantics are the same
- Use trailing commas in multiline declarations and argument lists
- Use extension functions where they help, but keep visibility tight to avoid API pollution