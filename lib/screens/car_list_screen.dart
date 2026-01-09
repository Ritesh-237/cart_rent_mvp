import 'package:flutter/material.dart';
import 'package:mvp_car_rent/providers/app_providers.dart';
import 'package:mvp_car_rent/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'car_detail_screen.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final screenHeight = media.size.height;
    final textScale = media.textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello, ${provider.currentUser}",
          style: TextStyle(fontSize: 18 * textScale),
        ),
        
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
                   provider.logout();
              
              
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.red,
                  content: Text("Quick Logout"),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(screenWidth * 0.03),
        itemCount: provider.cars.length,
        itemBuilder: (context, index) {
          final car = provider.cars[index];

          return Card(
            elevation: 4,
            margin: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: ListTile(
              contentPadding: EdgeInsets.all(screenWidth * 0.03),
              leading: Container(
                width: screenWidth * 0.22,
                height: screenHeight * 0.08,
                color: Colors.grey[300],
                child: Image.network(
                  car.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (c,o,s) =>
                      const Icon(Icons.directions_car),
                ),
              ),
              title: Text(
                car.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16 * textScale,
                ),
              ),
              subtitle: Text(
                "${car.brand} • ${car.transmission}",
                style: TextStyle(fontSize: 13 * textScale),
              ),
              trailing: Text(
                "\$${car.price}/day",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 14 * textScale,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CarDetailScreen(car: car),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
