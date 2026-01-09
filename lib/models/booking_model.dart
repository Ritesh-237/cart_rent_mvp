import 'car_model.dart';

class Booking {
  final Car car;
  final String date;
  final String location;
  final String status; // e.g., "Confirmed", "Completed"

  Booking({
    required this.car, 
    required this.date, 
    required this.location,
    this.status = 'Confirmed',
  });
}