import 'package:flutter/material.dart';
import 'package:flutter_proj/models/phone.dart';

class PhoneDetailsScreen extends StatelessWidget {
  final Phone phone;

  const PhoneDetailsScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Brand: ${phone.brand}', style: const TextStyle(fontSize: 22)),
            Text('Model: ${phone.model}', style: const TextStyle(fontSize: 22)),
            Text('Price: \$${phone.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}

