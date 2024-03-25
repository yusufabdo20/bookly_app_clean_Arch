import 'package:hive_flutter/adapters.dart';

void saveSingleDataLocal({required var value, required String boxName}) {
  var box = Hive.box(boxName);
  box.add(value);
}
