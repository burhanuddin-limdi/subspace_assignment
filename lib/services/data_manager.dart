import 'package:hive/hive.dart';

void addOrUpdateData(String category, dynamic key, dynamic value) async {
  final box = await _openBox(category);
  await box.put(key, value);
}

Future<Box> _openBox(String category) async {
  if (Hive.isBoxOpen(category)) {
    return Hive.box(category);
  } else {
    return Hive.openBox(category);
  }
}
