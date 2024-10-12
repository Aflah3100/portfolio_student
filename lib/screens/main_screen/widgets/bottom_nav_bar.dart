import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_student/provider/screens_provider.dart';
import 'package:portfolio_student/screens/main_screen/widgets/nav_bar_icon_button.dart';
import 'package:portfolio_student/utils/app_colors.dart';
import 'package:portfolio_student/utils/assets.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ScreensProvider>(context, listen: true);
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3030301A),
              offset: Offset(0, -3),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          )),
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Home-button
          NavBarIconButton(
              label: 'Home',
              labelColor: (provider.getScreenIndex() == 0
                  ? AppColors.primaryColor
                  : AppColors.greyColor),
              onTap: () {
                provider.setScreenIndex(0);
              },
              icon: ImageIcon(
                const AssetImage(Assets.homeIconSvg),
                size: (provider.getScreenIndex() == 0) ? 24.sp : 20.sp,
                color: (provider.getScreenIndex() == 0
                    ? AppColors.primaryColor
                    : AppColors.greyColor),
              )),

          //Portfolio-button
          NavBarIconButton(
              label: 'Portfolio',
              labelColor: (provider.getScreenIndex() == 1
                  ? AppColors.primaryColor
                  : AppColors.greyColor),
              onTap: () {
                provider.setScreenIndex(1);
              },
              icon: ImageIcon(
                const AssetImage(Assets.portfolioIconSvg),
                size: (provider.getScreenIndex() == 1) ? 24.sp : 20.sp,
                color: (provider.getScreenIndex() == 1
                    ? AppColors.primaryColor
                    : AppColors.greyColor),
              )),

          //Input-button
          NavBarIconButton(
              label: 'Input',
              labelColor: (provider.getScreenIndex() == 2
                  ? AppColors.primaryColor
                  : AppColors.greyColor),
              onTap: () {
                provider.setScreenIndex(2);
              },
              icon: ImageIcon(
                const AssetImage(Assets.inputIconSvg),
                size: (provider.getScreenIndex() == 2) ? 24.sp : 20.sp,
                color: (provider.getScreenIndex() == 2
                    ? AppColors.primaryColor
                    : AppColors.greyColor),
              )),

          //Profile-button
          NavBarIconButton(
              label: 'Profile',
              labelColor: (provider.getScreenIndex() == 3
                  ? AppColors.primaryColor
                  : AppColors.greyColor),
              onTap: () {
                provider.setScreenIndex(3);
              },
              icon: ImageIcon(
                const AssetImage(Assets.profileIconSvg),
                size: (provider.getScreenIndex() == 3) ? 24.sp : 20.sp,
                color: (provider.getScreenIndex() == 3
                    ? AppColors.primaryColor
                    : AppColors.greyColor),
              ))
        ],
      ),
    );
  }
}
