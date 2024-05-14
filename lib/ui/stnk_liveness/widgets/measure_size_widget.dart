import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MeasureSizeWidget extends StatefulWidget {
  final Widget child;
  final void Function(Size size) onSized;

  const MeasureSizeWidget({
    Key? key,
    required this.onSized,
    required this.child,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MeasureSizeWidgetState createState() => _MeasureSizeWidgetState();
}

class _MeasureSizeWidgetState extends State<MeasureSizeWidget> {
  @override
  Widget build(BuildContext context) {
    var widgetKey = GlobalKey();
    Size? oldSize;

    void postFrameCallback(_) {
      var context = widgetKey.currentContext;
      if (context == null) return;

      var newSize = context.size;
      if (oldSize == newSize) return;

      oldSize = newSize;
      widget.onSized(newSize ?? const Size(0, 0));
    }

    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }
}
