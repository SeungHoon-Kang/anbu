import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../presentation/pages/views/cart/cart_page.dart';
import '../../../../presentation/pages/views/commerce_page/components/wishlist_page.dart';
import '../../../../presentation/pages/views/notification/notification_page.dart';
import '../../../bloc/cubit/mall_type_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: BlocBuilder<MallTypeCubit, MallType>(
        builder: (_, state) {
          return AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            color: HexColor("#FF6A3D"),
            child: AppBar(
              leading: Padding(
                padding: const EdgeInsets.symmetric(),
                child: Image.asset(
                  'assets/image/anbu.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leadingWidth: 86,
            ),
            duration: const Duration(microseconds: 400),
          );
        },
      ),
    );
  }
}
