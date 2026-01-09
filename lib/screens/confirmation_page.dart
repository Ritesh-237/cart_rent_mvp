import 'package:flutter/material.dart';
import '../models/car_model.dart';

class ConfirmationPage extends StatelessWidget {
  final Car car;
  final String location;
  final String date;

  const ConfirmationPage({super.key, required this.car, required this.location, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 100, color: Colors.green),
              const SizedBox(height: 20),
              const Text("Booking Confirmed!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text("Car: ${car.name}"),
                      Text("Date: $date"),
                      Text("Location: $location"),
                      Text("Total: \$${car.price}", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
    
                  Navigator.popUntil(context, (route) => route.isFirst); 
                },
                child: const Text("Back to Home"),
              ),

         SizedBox(height: 20),
         Text("// booking confirm page")
              
            ],
          ),
        ),
      ),
    );
  }
}