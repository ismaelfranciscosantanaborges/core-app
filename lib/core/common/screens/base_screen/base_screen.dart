import 'package:core_app/core/bindings/base_binding.dart';
import 'package:flutter/widgets.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({required this.bindings, super.key});
  final BaseBinding bindings;

  Widget build(BuildContext context);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() { 
    try {
      final bindings = widget.bindings.dependecies();
      bindings.forEach((e) => e.register());
    } catch (e) {
      print(e);
    }

    super.initState();
  }

  @override
  void dispose() {
    widget.bindings.dependecies().map((e) => e.unregister());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}
