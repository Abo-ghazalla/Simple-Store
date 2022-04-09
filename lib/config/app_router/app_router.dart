part of 'imports.dart';

class AppRouter {
  static final appKey = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => _determineFirstView());
      case routes_name.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case routes_name.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routes_name.productScreen:
        return MaterialPageRoute(builder: (_) => ProductScreen(product: args!));
      case routes_name.catsScreen:
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      case routes_name.cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case routes_name.userScreen:
        return MaterialPageRoute(builder: (_) => const UserScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("no Views for that root")),
          );
        });
    }
  }

  static void pop(dynamic result) {
    Navigator.of(appKey.currentState!.context).pop(result);
  }

  static Future push(String routeName,
      {arguments, bool replace = false, bool clean = false}) async {
    if (clean) {
      return appKey.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    } else if (replace) {
      return appKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return appKey.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }

  static Widget _determineFirstView() =>
      readToken == null ? const LoginScreen() : const HomeScreen();
}
