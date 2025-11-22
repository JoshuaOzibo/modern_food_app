
<p align="center">
    <img src="assets/gif/modern_food_app_latest_update.gif" alt="Home Screen" width="800" width="800"/>
</p>


🍽️ Modern Mobile Food App

A modern, feature-rich Flutter food ordering application built using clean architecture principles.
This app allows users to explore food items, interact with smooth animations, find nearby food spots, and manage their orders efficiently.

🚀 Features

🏷️ Browse food items with images, prices, and ratings

🛒 Add and remove items from cart

➕➖ Increase and decrease item quantity

❤️ Add and remove items from favorites

🔄 Real-time cart & favorites updates using Provider

🎞️ Smooth animations when adding to cart or favorites

🗺️ Map location support to find nearby food spots

📱 Fully responsive mobile UI

📦 Cached images using CachedNetworkImage for better performance

📄 Modal Bottom Sheet for detailed food information

🏗️ App Architecture

This project follows the Clean Architecture approach for better separation of concerns and scalability:

Data Layer – Handles API calls, data sources, and models

Domain Layer – Contains business logic and use cases

ViewModel Layer – Manages app state and connects UI with business logic

🛠️ Tech Stack & Packages

This project uses modern Flutter tools and packages:

Flutter – UI toolkit for building natively compiled apps

Provider – State management

GetIt – Dependency injection

fpdart – Functional error handling using Either

CachedNetworkImage – Image caching for faster loading

Google Maps / Location API – For nearby food spot detection (based on your setup)

✅ What’s Implemented

Implemented smooth UI animations for cart and favorites interactions.

Structured the project using Clean Architecture: Data ▸ Domain ▸ ViewModel.

Integrated GetIt to handle dependency injection and improve modularity.

Used fpdart to manage failure and success states in a functional way.

Integrated CachedNetworkImage to optimize image loading and caching.

Built a location-based feature to help users find nearby food stores.

Implemented a Modal Bottom Sheet for displaying food details.

🔮 Upcoming Features

🔐 User authentication

🌐 Backend integration

🖥️ Admin dashboard for content management

💳 Payment integration


👨‍💻 About Developer

Built with ❤️ using Flutter and Clean Architecture principles.

If you love this project, consider giving it a ⭐ on GitHub.

