// import 'package:drivecare/src/data/models/servicerequest.dart';
import 'package:drivecare/src/data/models/service.dart';
import 'package:drivecare/src/presentation/customer/providers/customer_cart_provider.dart';
import 'package:drivecare/src/presentation/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  final Service service;

  const CartPage({super.key, required this.service});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  DateTime? _selectedDate;
  List<bool> _morningSlots = List.generate(2, (index) => false);
  List<bool> _afternoonSlots = List.generate(4, (index) => false);

  String? _getTimeSlot() {
    int morningIndex = _morningSlots.indexWhere((element) => element);
    int afternoonIndex = _afternoonSlots.indexWhere((element) => element);
    if (morningIndex != -1) {
      return ["10-11 AM", "11-12 AM"][morningIndex];
    } else if (afternoonIndex != -1) {
      return ["12-1 PM", "1-2 PM", "2-3 PM", "3-4 PM"][afternoonIndex];
    }
    return null;
  }

  void _placeOrder() {
    if (_selectedDate == null || _getTimeSlot() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select a date and a time slot")));
      return;
    }

    Navigator.pushReplacementNamed(context, '/welcomePage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Your Service'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Choose Your Preferred Date:'),
                    subtitle: Text(
                      _selectedDate != null
                          ? _selectedDate!.toIso8601String().substring(0, 10)
                          : 'No date chosen',
                    ),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () => _pickDate(context),
                  ),
                  SizedBox(height: 20),
                  _buildTimeSlotSection(
                      "Morning Slot", _morningSlots, ["10-11 AM", "11-12 AM"]),
                  _buildTimeSlotSection("Afternoon Slot", _afternoonSlots,
                      ["12-1 PM", "1-2 PM", "2-3 PM", "3-4 PM"]),
                  Divider(),
                ],
              ),
            ),
          ),
          _buildSummary(),
        ],
      ),
    );
  }

  Widget _buildTimeSlotSection(
      String title, List<bool> slots, List<String> times) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: slots.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3,
          ),
          itemBuilder: (context, index) => Card(
            color: slots[index] ? Colors.orange : Colors.white,
            child: InkWell(
              onTap: () {
                setState(() {
                  for (int i = 0; i < slots.length; i++) {
                    slots[i] = i == index;
                  }
                });
              },
              child: Center(
                child: Text(
                  times[index],
                  style: TextStyle(
                    color: slots[index] ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Amount: \n' + '${widget.service.price} Rs',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ElevatedButton(
              onPressed: () {
                // Implement your order logic here
                if (_selectedDate == null || _getTimeSlot() == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please select a date and a time slot")));
                  return;
                } else {
                    Provider.of<CustomerCartProvider>(context, listen: false).submitRequest(
                        widget.service, _selectedDate!, _getTimeSlot()!);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                }
              },
              child: Text('Place Order'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange)),
        ],
      ),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
