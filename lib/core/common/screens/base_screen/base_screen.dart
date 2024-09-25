// ignore_for_file: must_be_immutable

import 'package:core_app/core/bindings/base_binding.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseScreen<T extends Cubit> extends StatefulWidget {
  BaseScreen({required this.bindings, super.key});
  final BaseBindings bindings;
  late T cubit;
  Widget build(BuildContext context);
  void loaded() {}
  void dispose() {}
  @override
  State<BaseScreen> createState() => _BaseScreenState<T>();
}

class _BaseScreenState<T extends Cubit> extends State<BaseScreen> {
  @override
  void initState() {
    try {
      final bindings = widget.bindings.dependencies();
      for (var e in bindings) {
        final instnace = e.register();
        if (instnace is T) widget.cubit = instnace;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    widget.loaded();
    super.initState();
  }

  @override
  void dispose() {
    widget.dispose();
    _dispose();
    super.dispose();
  }

  Future _dispose() async {
    final bindings = widget.bindings.dependencies();
    Future.wait([...bindings.map((e) => e.unregister())]);
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}
