import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modney/presentation/pages/views/community/community_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/cubit/bottom_nav_cubit.dart';
import '../../bloc/cubit/mall_type_cubit.dart';
import '../../core/utils/appbar/top_app_bar.dart';
import '../pages/views/commerce_page/commerce_page.dart';
import '../pages/views/meeting/meeting_main_page.dart';
import '../pages/views/post/meeting_board_page.dart';
import '../pages/views/user/mypage.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => MallTypeCubit()),
      ],
      child: const MainScreenView(),
    );
  }
}

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (_, state) {
          switch (state) {
            case BottomNav.home:
              return CommercePage();
            case BottomNav.category:
              return const CommunityPage();

            //수정 필요
            case BottomNav.meeting:
              return MeetingPage();

            case BottomNav.user:
              return const MyInfoMainPage();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNav>(
        builder: (_, state) {
          return BottomNavigationBar(
            items: List.generate(
              BottomNav.values.length,
              (index) => BottomNavigationBarItem(
                icon: SvgPicture.asset(BottomNav.values[index].icon),
                label: BottomNav.values[index].toName,
                activeIcon: SvgPicture.asset(
                  BottomNav.values[index].activeIcon,
                ),
              ),
            ),
            onTap: (index) => context.read<BottomNavCubit>().changeIndex(index),
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          );
        },
      ),
    );
  }
}
