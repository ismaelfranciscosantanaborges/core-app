abstract class BaseBindings {
  List<BaseObjectBindings> dependencies();
}

abstract class BaseObjectBindings<T extends Object> {
  BaseObjectBindings(this.instance);
  final T Function() instance;
  T? register();
  Future<void> unregister();
}
