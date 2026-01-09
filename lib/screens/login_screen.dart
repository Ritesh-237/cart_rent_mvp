import 'package:flutter/material.dart';
import 'package:mvp_car_rent/providers/app_providers.dart';
import 'package:mvp_car_rent/screens/navigation_screen.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final screenHeight = media.size.height;
    final textScale = media.textScaleFactor;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
            vertical: screenHeight * 0.12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.car_rental,
                size: screenWidth * 0.22,
                color: Colors.blueAccent,
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Welcome to QuickRent",
                style: TextStyle(
                  fontSize: 24 * textScale,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isNotEmpty) {
                      context
                          .read<AppProvider>()
                          .login(_nameController.text);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NavigationScreen(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Login (Mock)",
                    style: TextStyle(fontSize: 16 * textScale),
                  ),
                ),
              ),


                         SizedBox(height: screenHeight * 0.030),


                         Text("// login screen")
            ],
          ),
        ),
      ),
    );
  }
}
