import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_student/screens/student_portfolio_screen/widgets/filter_button.dart';
import 'package:portfolio_student/screens/student_portfolio_screen/widgets/project_display_card.dart';
import 'package:portfolio_student/utils/app_colors.dart';
import 'package:portfolio_student/utils/assets.dart';

class PortfolioScreen extends StatefulWidget {
  PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final List<String> sampleImages = [
    Assets.sampleImage1,
    Assets.sampleImage2,
    Assets.sampleImage3,
    Assets.sampleImage4,
    Assets.sampleImage5
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: SizedBox(
              width: double.infinity,
              child: TabBar(
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                dividerColor: AppColors.greyColor,
                tabAlignment: TabAlignment.center,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    child: Text(
                      'Project',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Saved',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Shared',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Achievement',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            //Project-Section
            Container(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        //Search-feield
                        Container(
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
                                    // Handle search action
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return ProjectDisplayCard(
                                      title1: 'Kemampuan Merangkum Tulisan',
                                      title2: 'BAHASA SUNDA',
                                      title3: 'Oleh Al-Baiqi Samaan',
                                      image: sampleImages[
                                          index % sampleImages.length]);
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemCount: 15))
                      ],
                    ),
                    //Filter-button
                    const Align(
                        alignment: Alignment.bottomCenter,
                        child: FilterButton())
                  ],
                )),

            const Center(
                child: Text('Saved',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17))),
            const Center(
                child: Text('Shared',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17))),
            const Center(
                child: Text('Achievement',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17))),
          ],
        ),
      ),
    );
  }
}
