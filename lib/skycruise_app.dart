import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/di/dependency_injection.dart';
import '../../core/routing/app_router.dart';
import '../../core/theming/theme.dart';
import '../../features/authentication/presentation/controllers/auth_cubit.dart';

class SkyCruiseApp extends StatelessWidget {
  final AppRouter appRouter;
  final Widget initialRoute;

  const SkyCruiseApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (_) => getIt<AuthCubit>(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SkyCruise',
          theme: ThemeManager.getAppLightTheme(),
          onGenerateRoute: appRouter.generateRoute,
          home: initialRoute,
        ),
      ),
    );
  }
}