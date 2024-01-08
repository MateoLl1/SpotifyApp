
import 'package:go_router/go_router.dart';
import 'package:spotify/presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/single/:id',
      builder: (context, state) {
        final singleId = state.pathParameters['id'] ?? '60d24wfXkVzDSfLS6hyCjZ';
        return SingleScreen(id: singleId);
      },
    ),


  ]
);