import 'package:flutter/material.dart';
import 'package:mvp_car_rent/providers/app_providers.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access provider logic
    final provider = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              provider.logout();
              // Navigate back to Login and remove all previous routes
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                (route) => false,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // -- Profile Header --
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              provider.currentUser ?? "Guest",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Gold Member", // Mock status
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // -- Booking History Section --
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: const Text(
                "My Bookings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            
            // Logic: Check if list is empty
            provider.bookings.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Text("No bookings yet.", style: TextStyle(color: Colors.grey)),
                  )
                : ListView.builder(
                    shrinkWrap: true, // Important for nesting in SingleChildScrollView
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.bookings.length,
                    itemBuilder: (context, index) {
                      // Show newest first
                      final booking = provider.bookings.reversed.toList()[index];
                      
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: Container(
                            width: 60, 
                            color: Colors.grey[200],
                            child: Image.network(booking.car.imageUrl, fit: BoxFit.cover,
                                errorBuilder: (_,__,___) => const Icon(Icons.car_rental)),
                          ),
                          title: Text(booking.car.name),
                          subtitle: Text("${booking.date} • ${booking.location}"),
                          trailing: Chip(
                            label: Text(booking.status, style: const TextStyle(fontSize: 10, color: Colors.white)),
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}