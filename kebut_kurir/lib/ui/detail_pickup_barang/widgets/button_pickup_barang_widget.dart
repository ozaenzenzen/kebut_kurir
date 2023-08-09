import 'package:flutter/material.dart';

class ButtonPickupBarangWidget extends StatelessWidget {
  final Function() onCancelledTap;
  final Function() onTakeTap;
  const ButtonPickupBarangWidget({
    super.key,
    required this.onCancelledTap,
    required this.onTakeTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: Color(0xFFEDEDED)),
          top: BorderSide(width: 0.50, color: Color(0xFFEDEDED)),
          right: BorderSide(color: Color(0xFFEDEDED)),
          bottom: BorderSide(color: Color(0xFFEDEDED)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              decoration: ShapeDecoration(
                color: Color(0xFFFFF2F3),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Tolak',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFF7A83),
                      fontSize: 16,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w600,
                      height: 1.50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              decoration: ShapeDecoration(
                color: Color(0xFF00B050),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ambil',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w600,
                      height: 1.50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
