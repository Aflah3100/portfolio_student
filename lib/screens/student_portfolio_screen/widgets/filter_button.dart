import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_student/utils/app_colors.dart';
import 'package:portfolio_student/utils/assets.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 104.w,
        height: 37.h,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0x40DF5532),
                offset: Offset(0, 0),
                blurRadius: 15,
              )
            ],
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              const AssetImage(Assets.filterIcon),
              size: 24.sp,
              color: Colors.white,
            ),
            SizedBox(
              width: 7.w,
            ),
            Text(
              'Filter',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
