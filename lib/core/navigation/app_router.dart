import 'package:go_router/go_router.dart';
import 'package:cats/presentation/screens/breed_list/breed_list_screen.dart';
import 'package:cats/presentation/screens/breed_details/breed_details_screen.dart';
import 'package:cats/presentation/screens/favorites/favorites_screen.dart';
import 'package:cats/presentation/widgets/scaffold_with_nav.dart';

abstract final class AppRoutes {
  static const breeds = '/breeds';
  static const breedDetail = '/breeds/:id';
  static const favorites = '/favorites';

  static String breedDetailPath(String id) => '/breeds/$id';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.breeds,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => ScaffoldWithNav(shell: shell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.breeds,
              builder: (context, state) => const BreedListScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) =>
                      BreedDetailsScreen(breedId: state.pathParameters['id']!),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (context, state) => const FavoritesScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
