import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class BarItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final String iconData;
  final double size;
  final String text;
  final Color selected;

  const BarItem({
    Key? key,
    required this.index,
    required this.onTap,
    required this.iconData,
    required this.size,
    required this.selected,
    required this.currentIndex,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap(index);
      },
      child: Column(
        children: [
          SvgPicture.asset(
            iconData,
            width: size,
            height: size,
            color: selected,
          ),
          Text(
            text,
            style: AppTheme.textStyle.whiteTextStyle.copyWith(
              fontSize: AppTheme.textConfig.size.m,
              fontWeight: AppTheme.textConfig.weight.bold,
              color: selected,
            ),
          ),
        ],
      ),
    );
  }
}

class SpecialBarItem extends StatefulWidget {
  final int index;

  final Duration duration;
  final String iconData;
  final double size;
  final Color color;
  final AnimationController animationController;

  const SpecialBarItem({
    Key? key,
    required this.color,
    required this.duration,
    required this.index,
    required this.animationController,
    required this.iconData,
    required this.size,
  }) : super(key: key);

  @override
  _SpecialBarItemState createState() => _SpecialBarItemState();
}

class _SpecialBarItemState extends State<SpecialBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = widget.animationController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.colors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          'assets/lainnya.svg',
          height: 30.w,
          width: 30.w,
          color: widget.color,
        ),
      ),
    );
  }
}

class ActionBarItem extends StatelessWidget {
  final int index;
  final int mainIndex;
  final ValueChanged<int> onTap;
  final String iconData;
  final double size;

  const ActionBarItem({
    Key? key,
    required this.index,
    required this.onTap,
    required this.mainIndex,
    required this.iconData,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          String str = mainIndex.toString() + '.' + index.toString();
          onTap(int.parse(str));
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            iconData,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}
