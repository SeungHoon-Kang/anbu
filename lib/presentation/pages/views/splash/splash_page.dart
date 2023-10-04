import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modney/config/routes/route_path.dart';
import 'package:flutter_modney/config/theme/constant/app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => context.push(RoutePath.login));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/image/anbu.png',
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 133, 96),
    );
  }
}
