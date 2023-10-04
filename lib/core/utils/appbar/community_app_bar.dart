// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_modney/config/theme/constant/app_icons.dart';
// // import 'package:flutter_modney/config/theme/custom/custom_theme.dart';
// // import 'package:flutter_modney/presentation/bloc/cubit/mall_type_cubit.dart';
// // import 'package:flutter_svg/svg.dart';
// // import 'package:hexcolor/hexcolor.dart';

// // class HomeAppBar extends StatelessWidget {
// //   const HomeAppBar({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return PreferredSize(
// //       preferredSize: const Size.fromHeight(56),
// //       child: BlocBuilder<MallTypeCubit, MallType>(
// //         builder: (_, state) {
// //           return AnimatedContainer(
// //             padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
// //             color: HexColor("#FF6A3D"),
// //             child: AppBar(
// //               leading: Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Image.asset(
// //                   'assets/svg/main_logo.svg',
// //                   height: 100,
// //                   // width: ,
// //                   fit: BoxFit.contain,
// //                   // 앱바 크기 ?
// //                   // scale: ,
// //                 ),
// //               ),
// //               // actions: [
// //               //   Padding(
// //               //     padding: const EdgeInsets.all(4.0),
// //               //     child: SvgPicture.asset(
// //               //       AppIcons.cart,
// //               //       colorFilter: ColorFilter.mode(
// //               //         state.isMarket
// //               //             ? Theme.of(context).colorScheme.background
// //               //             : Theme.of(context).colorScheme.contentPrimary,
// //               //         BlendMode.srcIn,
// //               //       ),
// //               //     ),
// //               //   ),
// //               //   Padding(
// //               //     padding: const EdgeInsets.all(4.0),
// //               //     child: SvgPicture.asset(
// //               //       AppIcons.notification,
// //               //       colorFilter: ColorFilter.mode(
// //               //         state.isMarket
// //               //             ? Theme.of(context).colorScheme.background
// //               //             : Theme.of(context).colorScheme.contentPrimary,
// //               //         BlendMode.srcIn,
// //               //       ),
// //               //     ),
// //               //   ),
// //               // ],
// //               backgroundColor: Colors.transparent,
// //               centerTitle: true,
// //               leadingWidth: 86,
// //             ),
// //             duration: const Duration(microseconds: 400),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_modney/config/theme/constant/app_icons.dart';
// import 'package:flutter_modney/config/theme/custom/custom_theme.dart';
// import 'package:flutter_modney/presentation/bloc/cubit/mall_type_cubit.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hexcolor/hexcolor.dart';

// import '../../../../presentation/pages/views/cart/cart_page.dart';

// class HomeAppBar extends StatelessWidget {
//   const HomeAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(56),
//       child: BlocBuilder<MallTypeCubit, MallType>(
//         builder: (_, state) {
//           return AnimatedContainer(
//             padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//             color: HexColor("#FF6A3D"),
//             child: AppBar(
//               leading: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SvgPicture.asset(
//                   'assets/svg/logo.svg',
//                   height: 100,
//                   // width: ,
//                   fit: BoxFit.contain,
//                   // 앱바 크기 ?
//                   // scale: ,
//                 ),
//               ),
//               actions: [
//                 Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: IconButton(
//                       onPressed: Navigator.push(context, => CartPage()) ,
//                       icon: SvgPicture.asset(
//                         AppIcons.cart,
//                         colorFilter: ColorFilter.mode(
//                           state.isMarket
//                               ? Theme.of(context).colorScheme.background
//                               : Theme.of(context).colorScheme.contentPrimary,
//                           BlendMode.srcIn,
//                         ),
//                       ),
//                     )),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: SvgPicture.asset(
//                     AppIcons.notification,
//                     colorFilter: ColorFilter.mode(
//                       state.isMarket
//                           ? Theme.of(context).colorScheme.background
//                           : Theme.of(context).colorScheme.contentPrimary,
//                       BlendMode.srcIn,
//                     ),
//                   ),
//                 ),
//               ],
//               backgroundColor: Colors.transparent,
//               centerTitle: true,
//               leadingWidth: 86,
//             ),
//             duration: const Duration(microseconds: 400),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../bloc/cubit/mall_type_cubit.dart';
import '../../../presentation/pages/views/commerce_page/components/wishlist_page.dart';
import '../../../presentation/pages/views/notification/notification_page.dart';
import '../../../presentation/pages/views/commerce_page/cart_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

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
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  'assets/svg/logo.svg',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WishlistPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.white, // 카트 아이콘 색상을 흰색으로 지정
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white, // 카트 아이콘 색상을 흰색으로 지정
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white, // 카트 아이콘 색상을 흰색으로 지정
                    ),
                  ),
                ),
              ],
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
