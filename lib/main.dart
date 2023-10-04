import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'bloc/cart_bloc/cart_bloc.dart';
import 'config/theme/theme_data.dart';
import 'config/routes/routes.dart';
import 'presentation/pages/views/commerce_page/bloc/wishlist_bloc.dart';
import 'presentation/pages/views/notification/notification.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '818196cd3eee0d5e5cfe22754d79cc96');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => WishlistBloc()),
      ],
      child: const MainApp(),
    ),
  );
}

@override
void initState() {
  // 초기화
  FlutterLocalNotification.init();

  // 3초 후 권한 요청
  Future.delayed(const Duration(seconds: 3),
      FlutterLocalNotification.requestNotificationPermission());
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: TextButton(
        onPressed: () => FlutterLocalNotification.showNotification(),
        child: const Text("알림 보내기"),
      ),
    ),
  );
}

// Future<void> _initHive() async {
//   await Hive.initFlutter();
//   await Hive.openBox("login");
//   await Hive.openBox("accounts");
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: CustomThemeData.themeData,
    );
  }
}
