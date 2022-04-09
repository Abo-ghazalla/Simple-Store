import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum_proj/config/app_router/imports.dart';
import 'package:quantum_proj/config/app_theme/app_theme.dart';
import 'package:quantum_proj/utils/constants/resources.dart' as constants;
import 'package:quantum_proj/utils/locator/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quantum_proj/view/screens/auth/cubit/auth_cubit.dart';
import 'package:quantum_proj/view/screens/cart/cubit/cart_cubit.dart';

Future<void> main() async {
  locatorSetup();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(constants.appCacheMemoryBoxName);

  runApp(EasyLocalization(
    supportedLocales: const [Locale('ar'), Locale('en')],
    path: 'assets/lang',
    fallbackLocale: const Locale('en'),
    startLocale: const Locale('en'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit()..initUser(),
          lazy: false,
        ),
        BlocProvider<CartCubit>(create: (_) => CartCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'quantum_proj',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: AppRouter.generateRoute,
        navigatorKey: AppRouter.appKey,
        theme: appTheme,
      ),
    );
  }
}
