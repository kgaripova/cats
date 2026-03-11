import 'package:cats/data/models/favorite_breed_item.dart';
import 'package:cats/presentation/blocs/favorites/favorites_cubit.dart';
import 'package:cats/presentation/blocs/favorites/favorites_state.dart';
import 'package:cats/presentation/widgets/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats/l10n/generated/app_localizations.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navFavorites)),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (ctx, state) {
          if (state.status == FavoritesStatus.success && state.isOffline) {
            return Column(
              children: [
                MaterialBanner(
                  content: Text(l10n.offlineBanner),
                  actions: [const SizedBox.shrink()],
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                ),
                Expanded(
                  child: state.favorites.isEmpty
                      ? _EmptyState(l10n: l10n)
                      : _FavoriteList(favorites: state.favorites),
                ),
              ],
            );
          }

          return switch (state.status) {
            FavoritesStatus.initial || FavoritesStatus.loading =>
              const Center(child: CircularProgressIndicator()),
            FavoritesStatus.failure => Center(child: Text(l10n.errorGeneric)),
            FavoritesStatus.success => state.favorites.isEmpty
                ? _EmptyState(l10n: l10n)
                : _FavoriteList(favorites: state.favorites),
          };
        },
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.favorite_border, size: 64),
          const SizedBox(height: 16),
          Text(
            l10n.favoritesEmpty,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.favoritesEmptyHint,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _FavoriteList extends StatelessWidget {
  const _FavoriteList({required this.favorites});

  final List<FavoriteBreedItem> favorites;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: favorites.length,
      itemBuilder: (_, index) {
        final item = favorites[index];
        return BreedCard(
          key: ValueKey(item.breed.id),
          breed: item.breed,
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 12),
    );
  }
}
