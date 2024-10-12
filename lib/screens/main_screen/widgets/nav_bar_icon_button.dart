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
    required this.isSelected,
  });
  final String label;
  final void Function() onTap;
  final Widget icon;
  final Color labelColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          (isSelected)
              ? Container(width: 24, height: 2.h, color: AppColors.primaryColor)
              : const SizedBox(),
          icon,
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: labelColor),
          )
        ],
      ),
    );
  }
}
