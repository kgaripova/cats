import 'package:cats/core/extensions/build_context_extension.dart';
import 'package:cats/data/models/breed_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cats/data/repositories/breed_repository.dart';
import 'package:cats/presentation/blocs/breed_details/breed_details_cubit.dart';
import 'package:cats/presentation/blocs/breed_details/breed_details_state.dart';
import 'package:cats/presentation/blocs/favorites/favorites_cubit.dart';
import 'package:cats/presentation/blocs/favorites/favorites_state.dart';
import 'package:cats/presentation/screens/breed_details/widgets/info_row.dart';
import 'package:cats/presentation/screens/breed_details/widgets/weight_row.dart';
import 'package:cats/presentation/screens/breed_details/widgets/trait_row.dart';

class BreedDetailsScreen extends StatelessWidget {
  const BreedDetailsScreen({super.key, required this.breedId});

  final String breedId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => BreedDetailsCubit(ctx.read<BreedRepository>())..load(breedId),
      child: Scaffold(
        body: BlocBuilder<BreedDetailsCubit, BreedDetailsState>(
          builder: (ctx, state) {
            return switch (state.status) {
              BreedDetailStatus.initial ||
              BreedDetailStatus.loading => const Center(child: CircularProgressIndicator()),
              BreedDetailStatus.failure => Center(child: Text(context.l10n.errorGeneric)),
              BreedDetailStatus.success => _buildContent(context, state.breed!),
            };
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, BreedModel breed) {
    final l10n = context.l10n;
    final imageId = breed.referenceImageId ?? '';

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 280,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(breed.name),
            background: breed.imageUrl != null
                ? CachedNetworkImage(imageUrl: breed.imageUrl!, fit: BoxFit.cover)
                : Container(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    child: const Icon(Icons.pets, size: 64),
                  ),
          ),
          actions: [
            if (imageId.isNotEmpty)
              BlocBuilder<FavoritesCubit, FavoritesState>(
                builder: (ctx, favoritesState) {
                  final isFavorite = favoritesState.isFavorite(imageId);
                  return IconButton(
                    icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                    color: isFavorite ? Theme.of(ctx).colorScheme.error : null,
                    tooltip: isFavorite ? l10n.removeFromFavorites : l10n.addToFavorites,
                    onPressed: () {
                      if (favoritesState.isOffline) {
                        ctx.showThrottledSnackBar(
                          l10n.offlineFavoritesUnavailable,
                          key: 'offline_favorites_unavailable',
                        );
                        return;
                      }
                      if (isFavorite) {
                        final favoriteId = favoritesState.favoriteId(imageId);
                        if (favoriteId != null) {
                          ctx.read<FavoritesCubit>().remove(favoriteId);
                        }
                      } else {
                        ctx.read<FavoritesCubit>().add(imageId, breed: breed);
                      }
                    },
                  );
                },
              ),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  children: [
                    if (breed.hypoallergenic == 1) Chip(label: Text(l10n.hypoallergenic)),
                    if (breed.rare == 1) Chip(label: Text(l10n.rare)),
                  ],
                ),
                const SizedBox(height: 12),
                InfoRow(label: l10n.breedOrigin, value: breed.origin),
                InfoRow(label: l10n.breedLifeSpan, value: l10n.lifeSpanYears(breed.lifeSpan)),
                if (breed.weight != null) ...[WeightRow(breed: breed), const SizedBox(height: 8)],
                if (breed.description.isNotEmpty) ...[
                  const Divider(height: 24),
                  Text(breed.description, style: Theme.of(context).textTheme.bodyMedium),
                ],
                if (breed.temperament.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(l10n.breedTemperament, style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(breed.temperament),
                ],
                const Divider(height: 24),
                TraitRow(label: l10n.breedAdaptability, value: breed.adaptability),
                TraitRow(label: l10n.breedAffectionLevel, value: breed.affectionLevel),
                TraitRow(label: l10n.breedEnergyLevel, value: breed.energyLevel),
                TraitRow(label: l10n.breedIntelligence, value: breed.intelligence),
                TraitRow(label: l10n.breedSocialNeeds, value: breed.socialNeeds),
                TraitRow(label: l10n.breedChildFriendly, value: breed.childFriendly),
                TraitRow(label: l10n.breedDogFriendly, value: breed.dogFriendly),
                TraitRow(label: l10n.breedStrangerFriendly, value: breed.strangerFriendly),
                if (breed.wikipediaUrl.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  TextButton.icon(
                    icon: const Icon(Icons.open_in_new, size: 16),
                    label: Text(l10n.learnMore),
                    onPressed: () => launchUrl(Uri.parse(breed.wikipediaUrl)),
                  ),
                ],
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
