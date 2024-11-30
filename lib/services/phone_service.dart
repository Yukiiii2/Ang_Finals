import 'package:flutter/foundation.dart';
import '../models/phone.dart';

class PhoneService extends ChangeNotifier {
  final List<Phone> _phones = [];

  List<Phone> get phones => List.unmodifiable(_phones);

  void addPhone(Phone phone) {
    _phones.add(phone);
    notifyListeners(); // Notify listeners of the change
  }

  void addPhones(List<Phone> phones) {
    _phones.addAll(phones);
    notifyListeners(); // Notify listeners of the changes
  }

  void removePhone(Phone phone) {
    _phones.remove(phone);
    notifyListeners(); // Notify listeners of the change
  }
}
