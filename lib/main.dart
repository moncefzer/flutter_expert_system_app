import 'package:expert_system_app/controller/submit_cubit.dart';
import 'package:expert_system_app/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => SubmitCubit(),
          child: MaterialApp(
            title: 'Your choice',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            themeMode: ThemeMode.light,
            home: const HomePage(),
          ),
        );
      },
    );
  }
}
