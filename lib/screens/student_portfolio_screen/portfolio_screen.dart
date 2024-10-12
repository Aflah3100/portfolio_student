import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_student/screens/student_portfolio_screen/models/project_model.dart';
import 'package:portfolio_student/screens/student_portfolio_screen/widgets/filter_button.dart';
import 'package:portfolio_student/screens/student_portfolio_screen/widgets/project_display_card.dart';
import 'package:portfolio_student/screens/student_portfolio_screen/widgets/search_field.dart';
import 'package:portfolio_student/utils/app_colors.dart';
import 'package:portfolio_student/utils/assets.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final TextEditingController searchFieldController = TextEditingController();
  final List<String> sampleImages = [
    Assets.sampleImage1,
    Assets.sampleImage2,
    Assets.sampleImage3,
    Assets.sampleImage4,
    Assets.sampleImage5
  ];

  //Projects-List (Static-Data)
  final List<ProjectModel> projectList = [
    ProjectModel(
        title1: "Kemampuan Merangkum Tulisan",
        title2: "BAHASA SUNDA 1",
        title3: "Oleh Al-Baiqi Samaan",
        image: Assets.sampleImage1),
    ProjectModel(
        title1: "Kemampuan Merangkum Tulisan",
        title2: "BAHASA SUNDA 2",
        title3: "Oleh Al-Baiqi Samaan",
        image: Assets.sampleImage2),
    ProjectModel(
        title1: "Kemampuan Merangkum Tulisan",
        title2: "BAHASA SUNDA 3",
        title3: "Oleh Al-Baiqi Samaan",
        image: Assets.sampleImage3),
    ProjectModel(
        title1: "Kemampuan Merangkum Tulisan",
        title2: "BAHASA SUNDA 4",
        title3: "Oleh Al-Baiqi Samaan",
        image: Assets.sampleImage4),
    ProjectModel(
        title1: "Kemampuan Merangkum Tulisan",
        title2: "BAHASA SUNDA 5",
        title3: "Oleh Al-Baiqi Samaan",
        image: Assets.sampleImage5),
    ProjectModel(
        title1: "Kemampuan Merangkum Tulisan",
        title2: "BAHASA SUNDA 6",
        title3: "Oleh Al-Baiqi Samaan",
        image: Assets.sampleImage3),
    ProjectModel(
        title1: "Kemampuan Merangkum Tulisan",
        title2: "BAHASA SUNDA 7",
        title3: "Oleh Al-Baiqi Samaan",
        image: Assets.sampleImage2)
  ];

  bool searchMode = false;
  List<ProjectModel> filteredProjects = [];

  //Filter-Projects-Function
  void _filterProjects(String query) {
    if (query.isEmpty) {
      setState(() {
        searchMode = false;
        filteredProjects = [];
      });
      return;
    }

    final List<ProjectModel> results = projectList.where((project) {
      return project.title1.toLowerCase().contains(query.toLowerCase()) ||
          project.title2.toLowerCase().contains(query.toLowerCase()) ||
          project.title3.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchMode = true;
      filteredProjects = results;
    });
  }

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
                        //Search-feild
                        SearchField(
                            searchController: searchFieldController,
                            searchFunction: _filterProjects),
                        SizedBox(
                          height: 15.h,
                        ),
                        Expanded(
                            child: ((searchMode && filteredProjects.isEmpty))
                                ? const Center(
                                    child: Text(
                                      'No Projects Found',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 17),
                                    ),
                                  )
                                : ListView.separated(
                                    itemBuilder: (context, index) {
                                      final project = (!searchMode)
                                          ? projectList[index]
                                          : filteredProjects[index];

                                      return ProjectDisplayCard(
                                          title1: project.title1,
                                          title2: project.title2,
                                          title3: project.title3,
                                          image: project.image);
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 10,
                                      );
                                    },
                                    itemCount: (!searchMode)
                                        ? projectList.length
                                        : filteredProjects.length))
                      ],
                    ),
                    //Filter-button
                    const Align(
                        alignment: Alignment.bottomCenter,
                        child: FilterButton())
                  ],
                )),
            //Others
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
