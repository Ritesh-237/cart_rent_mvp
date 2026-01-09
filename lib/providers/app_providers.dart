import 'package:flutter/material.dart';
import 'package:mvp_car_rent/models/booking_model.dart';
import '../models/car_model.dart';

class AppProvider extends ChangeNotifier {

  bool _isLoggedIn = false;
  String? _currentUser;







  final List<Booking> _bookings = [];

  bool get isLoggedIn => _isLoggedIn;
  String? get currentUser => _currentUser;
  List<Booking> get bookings => _bookings;





  void login(String username) {
    _isLoggedIn = true;
    _currentUser = username;
    notifyListeners(); 
  }

  void logout() {
    _isLoggedIn = false;
    _currentUser = null;
    _bookings.clear();
    notifyListeners();
  }
void addBooking(Booking booking) {
    _bookings.add(booking);
    notifyListeners();
  }

  final List<Car> _cars = [ 
        Car(id: '1', name: 'Model S', brand: 'Tesla', price: 120, seats: 5, transmission: 'Auto', imageUrl: 'https://images.unsplash.com/photo-1617788138017-80ad40651399?w=500'),
    Car(id: '2', name: 'Mustang', brand: 'Ford', price: 95, seats: 4, transmission: 'Manual', imageUrl: 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=500'),
    Car(id: '3', name: 'X5', brand: 'BMW', price: 110, seats: 7, transmission: 'Auto', imageUrl: 'https://pixabay.com/photos/bmw-x5-suv-car-luxury-car-bmw-5264945/'),     Car(id: '1', name: 'Model S', brand: 'Tesla', price: 120, seats: 5, transmission: 'Auto', imageUrl: 'https://images.unsplash.com/photo-1617788138017-80ad40651399?w=500'),
    Car(id: '2', name: 'Mustang', brand: 'Ford', price: 95, seats: 4, transmission: 'Manual', imageUrl: 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=500'),
    Car(id: '3', name: 'X5', brand: 'BMW', price: 110, seats: 7, transmission: 'Auto', imageUrl: 'https://images.unsplash.com/photo-1556189250-72ba95452242?w=500'),
      Car(id: '1', name: 'Model S', brand: 'Tesla', price: 120, seats: 5, transmission: 'Auto', imageUrl: 'https://images.unsplash.com/photo-1617788138017-80ad40651399?w=500'),
    Car(id: '2', name: 'Mustang', brand: 'Ford', price: 95, seats: 4, transmission: 'Manual', imageUrl: 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=500'),
    Car(id: '3', name: 'X5', brand: 'BMW', price: 110, seats: 7, transmission: 'Auto', imageUrl: 'https://images.unsplash.com/photo-1556189250-72ba95452242?w=500'),
    Car(id: '1', name: 'Model S', brand: 'Tesla', price: 120, seats: 5, transmission: 'Auto', imageUrl: 'https://images.unsplash.com/photo-1617788138017-80ad40651399?w=500'),
    Car(id: '2', name: 'Mustang', brand: 'Ford', price: 95, seats: 4, transmission: 'Manual', imageUrl: 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?w=500'),
    Car(id: '3', name: 'X5', brand: 'BMW', price: 110, seats: 7, transmission: 'Auto', imageUrl: 'https://images.unsplash.com/photo-1556189250-72ba95452242?w=500'),
  ];

  List<Car> get cars => _cars;
}