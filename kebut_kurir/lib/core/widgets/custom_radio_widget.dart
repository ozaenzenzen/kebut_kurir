import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final String value;
  final String groupValue;
  final void Function(String) onChanged;
  const CustomRadio({Key? key, required this.value, required this.groupValue, required this.onChanged})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(shape: BoxShape.circle, color: selected ? Color(0xFF00B050) : Colors.grey[200]),
        child: Icon(
          Icons.circle,
          size: 10,
          color: selected ? Colors.white : Colors.grey[200],
        ),
      ),
    );
  }
}