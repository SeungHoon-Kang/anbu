import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/cubit/bottom_nav_cubit.dart';
import 'default_app_bar.dart';
import 'home_app_bar.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNav>(builder: (_, state) {
      switch (state) {
        case BottomNav.home:
          // 나중에 바꾸기
          return HomeAppBar();

        case BottomNav.category:
          return HomeAppBar();

        case BottomNav.meeting:
          return DefaultAppBar();
        case BottomNav.user:
          return DefaultAppBar();
        // TODO: Handle this case.
      }
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(44);
}
