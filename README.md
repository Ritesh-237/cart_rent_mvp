# Car Rental App (MVP)

A simple multi-screen mobile application built with Flutter. This project demonstrates a **Minimum Viable Product (MVP)** for a car rental platform, focusing on the core user flow: browsing, viewing details, and confirming a booking.

 **Note:** This project uses **Mock Data** and local state management. No real backend or API is connected.

## App Preview

<p align="center">
  <img src="assets/screenshots/login.jpg" width="200" />
  <img src="assets/screenshots/home.jpg" width="200" />
  <img src="assets/screenshots/details.jpg" width="200" />
</p>

## Features

* **Mock Authentication:** Simple login screen (Simulated).
* **Car Catalog:** Browse a list of available vehicles with images and pricing.
* **Car Details:** View specifications (Transmission, Seats, Price).
* **Booking System:** Select dates and location to reserve a car.
* **My Account:** View booking history and profile status.
* **State Management:** Uses `Provider` for managing app state (User session & Bookings) and i'm more comfortable with 'Bloc'.

## Tech Stack

* **Framework:** Flutter (Dart)
* **State Management:** Provider
* **Architecture:** MVC (Model-View-Controller) / Layered Architecture

## Project Structure

The codebase is organized for scalability and clean separation of concerns:


lib/
├── models/         # Data blueprints (Car, Booking)
├── providers/      # State management logic (Auth, Cart)
├── screens/        # UI Pages (Login, Home, Details, Account)
└── main.dart       # App entry point