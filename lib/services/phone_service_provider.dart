import 'package:provider/provider.dart';
import 'phone_service.dart';

final phoneServiceProvider = ChangeNotifierProvider(
  create: (_) => PhoneService(),
);
