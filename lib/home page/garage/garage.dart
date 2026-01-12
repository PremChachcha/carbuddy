import 'package:flutter/material.dart';
import 'package:carbuddy/home page/garage/add_vehicle.dart';

class Garage extends StatelessWidget {
  const Garage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),

      // 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "My Garage",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Add vehicle from top
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehiclePage()));
              print("Add vehicle (AppBar)");
            },
          ),
        ],
      ),

      // 🔹 BODY
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // ICON CIRCLE
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE9EDF5),
                ),
                child: const Icon(
                  Icons.directions_car,
                  size: 60,
                  color: Color(0xFF7E57C2),
                ),
              ),

              const SizedBox(height: 24),

              // TITLE
              const Text(
                "Your Garage is Empty",
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // SUB TITLE
              const Text(
                "Add your vehicles to keep track of services,\ninsurance, and maintenance reminders.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'PoppinsM',
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 32),

              // MAIN BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add,color: Colors.white,),
                  label: const Text(
                    "Add Your First Vehicle",
                    style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'Poppins'),

                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7E57C2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    // 👉 Add first vehicle
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehiclePage()));
                    print("Add Your First Vehicle");
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // 🔹 FLOATING BUTTON
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF7E57C2),
        icon: const Icon(Icons.add,color: Colors.white,),
        label: const Text("Add Vehicle",style: TextStyle(color: Colors.white,fontFamily: 'Poppins'),),
        onPressed: () {
          // 👉 Add vehicle
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddVehiclePage()));
        },
      ),
    );
  }
}