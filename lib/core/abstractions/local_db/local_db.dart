abstract interface class LocalDB {
  String? getString(String key);
  bool? getBool(String key);
  int? getInt(String key);
  double? getDouble(String key);
  Future<void> set<T>(String key, T data);
  Future<void> setSecure(String key, String value);
  Future<String?> getSecure(String key);
}
