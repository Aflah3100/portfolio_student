import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_student/provider/screens_provider.dart';
import 'package:portfolio_student/screens/main_screen/main_screen.dart';
import 'package:portfolio_student/utils/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (ctx) => ScreensProvider())
            ],
            child: MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
                  useMaterial3: true,
                ),
                home: const MainScreen()),
          );
        });
  }
}
