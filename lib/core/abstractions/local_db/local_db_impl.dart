import 'package:core_app/core/abstractions/local_db/local_db.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDBImpl implements LocalDB {
  LocalDBImpl({
    required SharedPreferences preferences,
    required FlutterSecureStorage secureStorage,
  })  : _preferences = preferences,
        _secureStorage = secureStorage;

  final SharedPreferences _preferences;
  final FlutterSecureStorage _secureStorage;

  @override
  Future<void> set<T>(String key, T data) {
    switch (data.runtimeType.toString()) {
      case 'int':
        return _preferences.setInt(key, data as int);
      case 'double':
        return _preferences.setDouble(key, data as double);
      case 'bool':
        return _preferences.setBool(key, data as bool);
      default:
        return _preferences.setString(key, data as String);
    }
  }

  @override
  bool? getBool(String key) {
    return _preferences.getBool(key);
  }

  @override
  double? getDouble(String key) {
    return _preferences.getDouble(key);
  }

  @override
  int? getInt(String key) {
    return _preferences.getInt(key);
  }

  @override
  String? getString(String key) {
    return _preferences.getString(key);
  }

  @override
  Future<void> setSecure(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> getSecure(String key) async {
    return await _secureStorage.read(key: key);
  }
}
