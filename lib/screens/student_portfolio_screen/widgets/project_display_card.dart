
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_student/utils/app_colors.dart';

class ProjectDisplayCard extends StatelessWidget {
  const ProjectDisplayCard({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.image,
  });

  final String title1;
  final String title2;
  final String title3;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          //Image
          SizedBox(
            width: 110.w,
            height: 110.h,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),

          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title-1
                Text(
                  title1,
                  textAlign: TextAlign.start,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),

                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title-2
                          Text(
                            title2,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: const Color(0xff303030),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          //Title-3
                          Text(
                            title3,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: const Color(0xff9E95A2),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Container(
                        height: 26.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xffF39519),
                                  Color(0xffFFCD67)
                                ])),
                        child: Center(
                          child: Text(
                            'A',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
