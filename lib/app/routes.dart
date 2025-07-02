import 'package:go_router/go_router.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/screen/homeScreen.dart';
import 'package:redoq_assignment/features/searchScreen/presentation/screens/searchScreen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/search',
      name: 'search',
      builder: (context, state) => SearchScreen(),
    )
  ]);
}
