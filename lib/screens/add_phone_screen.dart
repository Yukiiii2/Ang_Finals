import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/phone.dart';
import '../services/phone_service.dart';

class AddPhoneScreen extends StatefulWidget {
  const AddPhoneScreen({Key? key}) : super(key: key);

  @override
  State<AddPhoneScreen> createState() => _AddPhoneScreenState();
}

class _AddPhoneScreenState extends State<AddPhoneScreen> {
  final TextEditingController brandController = TextEditingController();
  final List<TextEditingController> modelControllers = [];
  final List<TextEditingController> priceControllers = [];

  @override
  void initState() {
    super.initState();
    _addPhoneField(); // Add a default phone field on initialization
  }

  @override
  void dispose() {
    brandController.dispose();
    for (var controller in modelControllers) {
      controller.dispose();
    }
    for (var controller in priceControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addPhoneField() {
    setState(() {
      modelControllers.add(TextEditingController());
      priceControllers.add(TextEditingController());
    });
  }

  void _removePhoneField(int index) {
    setState(() {
      modelControllers[index].dispose();
      priceControllers[index].dispose();
      modelControllers.removeAt(index);
      priceControllers.removeAt(index);
    });
  }

  void _addPhone(BuildContext context) {
    final brand = brandController.text.trim();

    if (brand.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a brand name.')),
      );
      return;
    }

    final List<Phone> phones = [];
    for (int i = 0; i < modelControllers.length; i++) {
      final model = modelControllers[i].text.trim();
      final priceText = priceControllers[i].text.trim();
      final price = double.tryParse(priceText);

      if (model.isNotEmpty && price != null && price > 0) {
        phones.add(Phone(brand: brand, model: model, price: price));
      }
    }

    if (phones.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No valid phones to add!')),
      );
      return;
    }

    Provider.of<PhoneService>(context, listen: false).addPhones(phones);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: const Text('Phones added successfully! Redirecting...'),
      ),
    );

    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add a New Phone',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Brand Field
            TextField(
              controller: brandController,
              decoration: InputDecoration(
                labelText: 'Brand',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Model and Price Fields
            Expanded(
              child: ListView.builder(
                itemCount: modelControllers.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: modelControllers[index],
                              decoration: InputDecoration(
                                labelText: 'Model',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: priceControllers[index],
                              decoration: InputDecoration(
                                labelText: 'Price',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.remove_circle,
                                color: Colors.red),
                            onPressed: () => _removePhoneField(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Add Another Phone Button
            ElevatedButton(
              onPressed: _addPhoneField,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade700,
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 48.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Add Another Phone',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Add Phones Button
            ElevatedButton(
              onPressed: () => _addPhone(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 48.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Add Phones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
