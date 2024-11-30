# **UIKit MVVM Clean Architecture Demo**  

**UIKit MVVM Clean Architecture + RXFlow and Swinject Framework** is a project created to demonstrate how to build an app using the MVVM architecture with the UIKit framework.  

The architecture follows Clean Architecture principles to ensure a clear separation of concerns and improved maintainability.  
- Dependency Injection (DI) is implemented using the **[Swinject](https://github.com/Swinject/Swinject)** framework.  
- Scene coordination and navigation are managed using the **[RXFlow](https://github.com/RxSwiftCommunity/RxFlow)** library.  
- Data is fetched from the free **[Rick and Morty API](https://rickandmortyapi.com)**, which provides a wealth of character, location, and episode information.  

---

## **Overview**

MVVM (Model-View-ViewModel) is a design pattern that helps separate user interface (UI) logic from business logic and behavior, making the application more modular, testable, and maintainable.  

![MVVMPattern svg](https://github.com/user-attachments/assets/63c2743b-1917-4f76-8451-07e8ab30058e)

This project demonstrates:  
- **Using [Swinject](https://github.com/Swinject/Swinject) for Dependency Injection (DI):** Simplifies object creation and improves modularity.  
- **Implementing [RXFlow](https://github.com/RxSwiftCommunity/RxFlow) for Scene Coordination:** Ensures reactive, declarative, and flexible navigation.  
- **Applying Clean Architecture Principles:** Provides a robust structure with clearly defined layers for handling business logic, data, and UI.  
- **Fetching data from [Rick and Morty API](https://rickandmortyapi.com):** Uses a public API to demonstrate data handling and presentation.  

---

## **Project Structure**

- **`APIClient.swift`**  
  Handles networking and API requests to fetch data from the **[Rick and Morty API](https://rickandmortyapi.com)**.  

- **`Model.swift`**  
  Defines the data structures used throughout the application.  

- **`ViewModel.swift`**  
  Contains the logic for transforming model data into a format suitable for the views.  

- **`AppFlow.swift`**  
  Manages scene coordination and navigation using the [RXFlow](https://github.com/RxSwiftCommunity/RxFlow) library.  

- **`AppServiceAssemblies.swift`**  
  Configures and manages dependency injection using the [Swinject](https://github.com/Swinject/Swinject) framework.  

---

## **Features**

- **UIKit-based Views:** Built with UIKit to maintain flexibility for custom UI designs.  
- **Reactive Programming:** Implements reactive principles using **[RxSwift](https://github.com/ReactiveX/RxSwift)** for binding and event handling.  
- **Clean Architecture:** Clearly separates UI, business logic, and data layers.  
- **Flexible Dependency Management:** Uses **[Swinject](https://github.com/Swinject/Swinject)** for easy dependency resolution and injection.  
- **Navigation Coordination:** Employs **[RXFlow](https://github.com/RxSwiftCommunity/RxFlow)** for a structured and reactive navigation flow.  
- **API Integration:** Fetches and displays character, episode, and location data from the **[Rick and Morty API](https://rickandmortyapi.com)**.
  
---

## **Developed By**

**Diana Nareiko**  
Email: diananareiko8@gmail.com  
GitHub: (https://github.com/diananareiko)  
