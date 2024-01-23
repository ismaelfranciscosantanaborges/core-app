abstract class BaseBinding {
  List<BaseObjectBinding> dependecies();
}

abstract class BaseObjectBinding<T extends Object> {
  BaseObjectBinding(this.instance);
  final T Function() instance;
  void register();
  void unregister();
}
