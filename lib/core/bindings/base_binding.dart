abstract class BaseBindings {
  List<BaseObjectBindings> dependecies();
}

abstract class BaseObjectBindings<T extends Object> {
  BaseObjectBindings(this.instance);
  final T Function() instance;
  T? register();
  void unregister();
}
