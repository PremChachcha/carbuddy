import 'package:flutter/material.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final regController = TextEditingController();
  final colorController = TextEditingController();

  String fuelType = "Petrol";
  bool isPrimary = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      // 🔹 APP BAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Add Vehicle",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // 🔹 BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _label("Make / Brand *"),
            _input(
              controller: makeController,
              hint: "e.g., Maruti Suzuki, Hyundai, Tata",
              icon: Icons.factory,
            ),

            _label("Model *"),
            _input(
              controller: modelController,
              hint: "e.g., Swift, i20, Nexon",
              icon: Icons.directions_car,
            ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("Year"),
                      _input(
                        controller: yearController,
                        hint: "e.g., 2022",
                        icon: Icons.calendar_month,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("Fuel Type"),
                      Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: _box(),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: fuelType,
                            isExpanded: true,
                            items: const [
                              DropdownMenuItem(value: "Petrol", child: Text("Petrol")),
                              DropdownMenuItem(value: "Diesel", child: Text("Diesel")),
                              DropdownMenuItem(value: "CNG", child: Text("CNG")),
                              DropdownMenuItem(value: "Electric", child: Text("Electric")),
                            ],
                            onChanged: (value) {
                              setState(() {
                                fuelType = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            _label("Registration Number"),
            _input(
              controller: regController,
              hint: "e.g., GJ01AB1234",
              icon: Icons.confirmation_number,
            ),

            _label("Color"),
            _input(
              controller: colorController,
              hint: "e.g., White, Black, Silver",
              icon: Icons.palette,
            ),

            const SizedBox(height: 12),

            // 🔹 PRIMARY VEHICLE SWITCH
            Container(
              padding: const EdgeInsets.all(16),
              decoration: _box(),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Set as Primary Vehicle",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "This will be your default vehicle for bookings",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: isPrimary,
                    onChanged: (value) {
                      setState(() {
                        isPrimary = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 ADD VEHICLE BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7E57C2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  // ✅ BUTTON CLICK ACTION
                  print("Make: ${makeController.text}");
                  print("Model: ${modelController.text}");
                  print("Fuel: $fuelType");
                  print("Primary: $isPrimary");

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Vehicle Added Successfully")),
                  );
                },
                child: const Text(
                  "Add Vehicle",
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 SMALL WIDGETS
  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 16),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _input({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: _box(),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }

  BoxDecoration _box() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.grey.shade300),
    );
  }
}