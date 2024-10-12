import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_student/utils/app_colors.dart';

class NavBarIconButton extends StatelessWidget {
  const NavBarIconButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.icon,
    required this.labelColor,
  });
  final String label;
  final void Function() onTap;
  final Widget icon;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(color: AppColors.greyColor, onPressed: onTap, icon: icon),
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 12.sp, color: labelColor),
        )
      ],
    );
  }
}
