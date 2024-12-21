
import 'package:bsc_app/features/Servises/widgets/calendar.dart';
import 'package:bsc_app/hebergement/logic/models/heberge.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationPage extends StatefulWidget {
  final Heberge heberge;

  ReservationPage({required this.heberge});

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  late DateTime checkIn;
  late DateTime checkOut;
  late TextEditingController checkInController;
  late TextEditingController checkOutController;

  bool willEat = false; // Whether the user will eat
  String paymentMethod = 'Cash'; // Selected payment method
@override
  void initState() {
    checkIn = DateTime.now();
    checkOut = DateTime.now().add(const Duration(days: 1));
    checkInController = TextEditingController(text: DateFormat.yMMMMd().format(checkIn));
    checkOutController = TextEditingController(text: DateFormat.yMMMMd().format(checkOut));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Reserve ${widget.heberge.nom}",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xff140C47),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Reservation Details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Check-in Date

            TextField(
              controller: checkInController,
              decoration: InputDecoration(
                labelText: "Check-in Date",
                border: OutlineInputBorder(),
                prefixIcon: IconButton(icon: Icon(Icons.calendar_today),
        onPressed: (){
                    showDialog(context: context, builder: (context)=>
  SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.48,
    child: AlertDialog(
                          content:CalendarAlert(startDate: checkIn, onDaySelected:(curr,focus){
                            setState(() {
                              checkIn=curr;
                              checkInController.text=DateFormat.yMMMMd().format(checkIn);
                            });
                          }) ,
                        ),
  ));
                    
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Check-out Date
            TextField(
              controller: checkOutController,
              decoration: InputDecoration(
                labelText: "Check-out Date",
                border: OutlineInputBorder(),
                prefixIcon: IconButton(icon: Icon(Icons.calendar_today),
        onPressed: (){
                    showDialog(context: context, builder: (context)=>
  SizedBox(
  width: MediaQuery.of(context).size.width * 0.7,
       height: MediaQuery.of(context).size.height * 0.48,                 
    child: AlertDialog(
                          content:CalendarAlert(startDate: checkOut, onDaySelected:(curr,focus){
                            setState(() {
                              checkOut=curr;
                              checkOutController.text=DateFormat.yMMMMd().format(checkOut);
                            });
                          }) ,
                        ),
  ));
                    
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Number of Guests
            const TextField(
              decoration: InputDecoration(
                labelText: "Number of Guests",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            // Will the user eat?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Will you eat during your stay?",
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: willEat,
                  onChanged: (value) {
                    setState(() {
                      willEat = value;
                    });
                  },
                  activeColor: const Color(0xff140C47),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Payment Method Dropdown
            DropdownButtonFormField<String>(
              value: paymentMethod,
              items: ['Cash', 'Credit Card', 'Mobile Payment']
                  .map((method) => DropdownMenuItem(
                        value: method,
                        child: Text(method),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  paymentMethod = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: "Payment Method",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle reservation logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Reservation made successfully!\n"
                        "Will Eat: ${willEat ? 'Yes' : 'No'}\n"
                        "Payment: $paymentMethod"
                      "Check Your Email for Receipt" 
                      ),
                      backgroundColor: const Color(0xff140C47),
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff140C47),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  "Reserve Now",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

