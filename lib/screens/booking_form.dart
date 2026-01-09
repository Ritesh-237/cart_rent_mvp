import 'package:flutter/material.dart';
import 'package:mvp_car_rent/models/booking_model.dart';
import 'package:mvp_car_rent/providers/app_providers.dart';
import 'package:provider/provider.dart';
import '../models/car_model.dart';
import 'confirmation_page.dart';

class BookingFormScreen extends StatefulWidget {
  final Car car;
  const BookingFormScreen({super.key, required this.car});

  @override
  State<BookingFormScreen> createState() => _BookingFormScreenState();
}

class _BookingFormScreenState extends State<BookingFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _locationController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final screenWidth = media.size.width;
    final screenHeight = media.size.height;
    final textScale = media.textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking Details",
          style: TextStyle(fontSize: 18 * textScale),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.03,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Booking: ${widget.car.name}",
                  style: TextStyle(
                    fontSize: 20 * textScale,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.04),

          
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: "Pick-up Location",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Enter location" : null,
                ),

                SizedBox(height: screenHeight * 0.025),

         
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: "Select Date (YYYY-MM-DD)",
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Date is required";
                    }

                    DateTime selectedDate;
                    try {
                      selectedDate = DateTime.parse(value);
                    } catch (e) {
                      return "Invalid date format";
                    }

                    final today = DateTime.now();
                    final todayDate =
                        DateTime(today.year, today.month, today.day);

                    if (!selectedDate.isAfter(todayDate)) {
                      return "Please select a future date";
                    }
                    return null;
                  },
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());

                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate:
                          DateTime.now().add(const Duration(days: 1)),
                      firstDate:
                          DateTime.now().add(const Duration(days: 1)),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      _dateController.text =
                          pickedDate.toIso8601String().split('T').first;
                    }
                  },
                ),

                SizedBox(height: screenHeight * 0.05),

               
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.065,
                  child: ElevatedButton(
                    onPressed: () {
              

if (_formKey.currentState!.validate()) {

  final newBooking = Booking(
    car: widget.car,
    location: _locationController.text,
    date: _dateController.text,
  );

 
  context.read<AppProvider>().addBooking(newBooking);

  
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => ConfirmationPage(
        car: widget.car,
        location: _locationController.text,
        date: _dateController.text,
      ),
    ),
  );
}
                    },
                    child: Text(
                      "Confirm Booking",
                      style: TextStyle(fontSize: 16 * textScale),
                    ),
                  ),
                ),
     SizedBox(height: screenHeight * 0.05),

                Text("// booking form")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
