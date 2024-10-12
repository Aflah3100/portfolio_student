
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_student/utils/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key,
      required this.searchController,
      required this.searchFunction});
  final TextEditingController searchController;
  final void Function(String query) searchFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.sp, right: 10.sp),
      height: 44.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              onChanged: (query) {
                searchFunction(query);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a project',
                hintMaxLines: 1,
                hintStyle: TextStyle(
                  color: const Color(0xff9E95A2),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          Container(
            height: 28.h,
            width: 28.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 16.sp,
              ),
              onPressed: () {
                if (searchController.text.isNotEmpty) {
                  searchFunction(searchController.text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
