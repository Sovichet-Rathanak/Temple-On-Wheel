import 'package:flutter/material.dart';

class AccountSettingBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const AccountSettingBtn({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Icon(icon),
            ),
            SizedBox(width: 12),
            Text(label),
          ],
        ),
      ),
    );
  }
}
