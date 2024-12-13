import 'package:accomodation_module/services/firebase_services.dart';
import 'package:accomodation_module/view/large_screens/dashboard_large_screen.dart';
import 'package:accomodation_module/view/large_screens/forgot_password_large_screen.dart';
import 'package:accomodation_module/view/large_screens/login_large_screen.dart';
import 'package:accomodation_module/view/small_screens/dashboard_small_screen.dart';
import 'package:accomodation_module/view/small_screens/forgot_password_small_screen.dart';
import 'package:accomodation_module/view/small_screens/login_small_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static GoRouter routeMaker(WidgetRef ref) {
    return GoRouter(
      initialLocation: '/login',
      redirect: (context, state) {
        final authState = ref.watch(authChanges).value;
        if (authState == null) {
          return '/login';
        } else {
          return '/home';
        }
      },
      routes: [
        GoRoute(
            path: '/login',
          builder: (context,state) => LayoutBuilder(builder: (context,constraints){
            if(constraints.maxWidth > 800){
              return const LoginLargeScreen();
            }else{
              return const LoginSmallScreen();
            }
          })
        ),
        GoRoute(
            path: '/dashboard',
            builder: (context,state) => LayoutBuilder(builder: (context,constraints){
              if(constraints.maxWidth > 800){
                return const DashboardLargeScreens();
              }else{
                return const DashboardSmallScreen();
              }
            })
        ),
        GoRoute(
            path: '/forgot-password',
            builder: (context,state) => LayoutBuilder(builder: (context,constraints){
              if(constraints.maxWidth > 800){
                return const ForgotPasswordLargeScreen();
              }else{
                return const ForgotPasswordSmallScreen();
              }
            })
        ),
      ],
    );
  }
}
