import 'package:flutter/material.dart';
import 'package:temple_on_wheel/constants/theme.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: NavigationBar(
        backgroundColor: kMainThemeColor,
        elevation: 0,
        indicatorShape: UnderlineIndicator(color: kSecondaryThemeColor),
        selectedIndex: selectedIndex,
        onDestinationSelected: onItemTapped,
        destinations: [
          Container(
            padding: EdgeInsets.only(top: 15),
            child: NavigationDestination(
              icon: Icon(Icons.home_filled, color: kSecondaryThemeColor),
              label: '',
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: NavigationDestination(
              icon: Icon(
                Icons.calendar_month_rounded,
                color: kSecondaryThemeColor,
              ),
              label: '',
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: NavigationDestination(
              icon: Icon(
                Icons.electric_bike_rounded,
                color: kSecondaryThemeColor,
              ),
              label: '',
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: NavigationDestination(
              icon: Icon(Icons.person, color: kSecondaryThemeColor),
              label: '',
            ),
          ),
        ],
      ),
    );
  }
}

class UnderlineIndicator extends ShapeBorder {
  final double thickness;
  final double lineWidth;
  final Color color;
  final BorderRadius borderRadius;

  const UnderlineIndicator({
    this.thickness = 2.0,
    this.lineWidth = 20.0,
    this.color = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double centerX = rect.left + rect.width / 2;
    final double halfWidth = lineWidth / 2;

    final Rect lineRect = Rect.fromLTWH(
      centerX - halfWidth,
      rect.bottom - thickness,
      lineWidth,
      thickness,
    );

    return Path()..addRRect(borderRadius.toRRect(lineRect));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Paint paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;
    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) => this;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      getOuterPath(rect);
}
