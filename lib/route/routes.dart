import 'package:auto_route/auto_route.dart';
import 'package:melisa_store/route/router_path.dart';
import 'package:melisa_store/route/routes.gr.dart';
import 'package:melisa_store/screens/login_screen.dart';
import 'package:melisa_store/screens/shoopping_cart.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: RouterPath.splash,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: RouterPath.home,
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: RouterPath.login,
        ),
        AutoRoute(
          page: ProductDetailRoute.page,
          path: RouterPath.productDetail,
        ),
        AutoRoute(
          page: CartRoute.page,
          path: RouterPath.cart,
        ),
      ];
}
