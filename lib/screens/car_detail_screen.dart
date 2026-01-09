import 'package:flutter/material.dart';
import 'package:mvp_car_rent/screens/booking_form.dart';
import '../models/car_model.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;
  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final screenHeight = media.size.height;
    final textScale = media.textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          car.name,
          style: TextStyle(fontSize: 18 * textScale),
        ),
      ),
      body: Column(
        children: [

          Image.network(
            car.imageUrl,
            height: screenHeight * 0.32,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (c, o, s) => Container(
              height: screenHeight * 0.32,
              color: Colors.grey,
              child: Icon(
                Icons.directions_car,
                size: screenWidth * 0.60,
              ),
            ),
          ),

 
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${car.price} / Day",
                  style: TextStyle(
                    fontSize: 28 * textScale,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  "Brand: ${car.brand}",
                  style: TextStyle(fontSize: 18 * textScale),
                ),
                Text(
                  "Transmission: ${car.transmission}",
                  style: TextStyle(fontSize: 18 * textScale),
                ),
                Text(
                  "Seats: ${car.seats}",
                  style: TextStyle(fontSize: 18 * textScale),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  "Availability: Available Now",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16 * textScale,
                  ),
                ),
              ],
            ),
          ),


          Text("// car detailed page"),




          const Spacer(),


          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingFormScreen(car: car),
                    ),
                  );
                },
                child: Text(
                  "Book This Car",
                  style: TextStyle(fontSize: 18 * textScale),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
