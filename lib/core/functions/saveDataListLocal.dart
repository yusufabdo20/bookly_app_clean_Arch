import 'package:hive_flutter/adapters.dart';

void saveListDataLocal({required var values, required String boxName}) {
  var box = Hive.box(boxName);
  box.addAll(values);
}
