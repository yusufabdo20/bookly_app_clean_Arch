import 'package:hive_flutter/hive_flutter.dart';

class CachHelper {
  static init() async {
    await Hive.initFlutter();
  }

  static getData<ReturnType>({
    required String boxName,
  }) {
    var box = Hive.box<ReturnType>(boxName);
    return box.values.toList();
  }

  static saveSingleData({
    required String boxName,
    required var value,
  }) {
    var box = Hive.box(boxName);
    box.add(value);
  }

  static saveListData({
    required String boxName,
    required var values,
  }) {
    var box = Hive.box(boxName);
    box.addAll(values);
  }

  static putSingleData({
    required String boxName,
    required dynamic key,
    required dynamic value,
  }) {
    var box = Hive.box(boxName);
    box.put(key, value);
  }

  static putListData({
    required String boxName,
    required Map<dynamic, dynamic> entries,
  }) {
    var box = Hive.box(boxName);
    box.putAll(entries);
  }
}
