import 'dart:convert';
import 'package:core_app/core/abstractions/local_db/local_db.dart';
import 'package:hive/hive.dart';

class LocalDBImpl implements LocalDB {
  LocalDBImpl({required this.box});
  final Box<String> box;
  @override
  dynamic get(String key) {
    final stg = box.get(key);
    if (stg is String) {
      return json.decode(stg);
    }
    return ''; 
  }

  @override
  Future<void> save(String key, String value) {
    return box.put(key, value);
  }
}
