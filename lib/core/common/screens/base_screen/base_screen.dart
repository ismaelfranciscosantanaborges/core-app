import 'package:core_app/core/bindings/base_binding.dart';
import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';

abstract class BaseScreen<T extends Cubit> extends StatefulWidget {
  BaseScreen({required this.bindings, super.key});
  final BaseBindings bindings;
  late T cubit;
  Widget build(BuildContext context);
  void loaded() {}
  @override
  State<BaseScreen> createState() => _BaseScreenState<T>();
}

class _BaseScreenState<T extends Cubit> extends State<BaseScreen> {
  @override
  void initState() {
    try {
      final bindings = widget.bindings.dependecies();
      bindings.forEach((e) {
        final instnace = e.register();
        if (instnace is T) widget.cubit = instnace;
      });
    } catch (e) {
      print(e);
    }
    widget.loaded();
    super.initState();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  Future _dispose() async {
    final bindings = widget.bindings.dependecies();
    Future.wait([...bindings.map((e) => e.unregister())]);
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}
