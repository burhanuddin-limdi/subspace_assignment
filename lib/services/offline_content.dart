import 'package:hive_flutter/hive_flutter.dart';
import 'package:subspace_project/services/data_manager.dart';

List offlineData = Hive.box('user').get('offlineData', defaultValue: []);

void setOfflineData(List blogs) {
  addOrUpdateData('user', 'offlineData', blogs);
}

List getOfflineData() {
  return offlineData;
}
