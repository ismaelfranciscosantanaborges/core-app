
abstract class LocalDB{
  Future<void> save(String key, String value);
  dynamic get(String key);
}