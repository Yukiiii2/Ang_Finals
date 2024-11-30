// Global list to store phones
import 'package:flutter_proj/models/phone.dart';


List<Phone> phoneList = [];

// Function to add a new phone to the global list
void addPhoneToInventory(Phone phone) {
  phoneList.add(phone);
}