import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_student/utils/app_colors.dart';
import 'package:portfolio_student/utils/assets.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Portfolio',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp),
            ),
            Row(
              children: [
                ImageIcon(
                  const AssetImage(Assets.bagIconImage),
                  color: AppColors.primaryColor,
                  size: 24.sp,
                ),
                SizedBox(
                  width: 10.w,
                ),
                ImageIcon(
                  const AssetImage(Assets.bellIconImage),
                  color: AppColors.primaryColor,
                  size: 24.sp,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Text('Portfolio Screen'),
      )),
    );
  }
}
