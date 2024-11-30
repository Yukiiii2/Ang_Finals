import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/phone_service.dart';
import '../models/phone.dart';

class RemovePhoneScreen extends StatelessWidget {
  const RemovePhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneService = Provider.of<PhoneService>(context);
    final phones = phoneService.phones;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Remove Phone',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: phones.isEmpty
            ? const Center(
                child: Text(
                  'No phones available!',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: phones.length,
                itemBuilder: (context, index) {
                  final phone = phones[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        phone.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        '${phone.brand} - ${phone.model}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text('Price: \$${phone.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          phoneService.removePhone(phone);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${phone.brand} ${phone.model} removed!',
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
