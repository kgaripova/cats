import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats/core/extensions/build_context_extension.dart';
import 'package:cats/core/navigation/app_router.dart';
import 'package:cats/data/models/breed_model.dart';
import 'package:cats/presentation/blocs/favorites/favorites_cubit.dart';
import 'package:cats/presentation/blocs/favorites/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BreedCard extends StatefulWidget {
  const BreedCard({super.key, required this.breed});

  final BreedModel breed;

  @override
  State<BreedCard> createState() => _BreedCardState();
}

class _BreedCardState extends State<BreedCard> {
  @override
  Widget build(BuildContext context) {
    final imageId = widget.breed.referenceImageId ?? '';

    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (ctx, favoritesState) {
        final isFavorite = favoritesState.isFavorite(imageId);

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.withOpacity(0.1),
          ),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () =>
                context.push(AppRoutes.breedDetailPath(widget.breed.id)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.breed.imageUrl != null
                    ? CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 140,
                        width: 140,
                        imageUrl: widget.breed.imageUrl!,
                      )
                    : Container(
                        height: 140,
                        width: 140,
                        child: const Icon(
                          Icons.pets,
                          size: 48,
                          color: Colors.grey,
                        ),
                      ),
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                widget.breed.name,
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (widget.breed.origin.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  widget.breed.origin,
                                  style: context.textTheme.titleSmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                widget.breed.description,
                                style: context.theme.textTheme.bodySmall
                                    ?.copyWith(
                                      color:
                                          context.colorScheme.onSurfaceVariant,
                                    ),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -3,
                        right: -4,
                        child: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? context.colorScheme.error : null,
                          ),
                          onPressed: () {
                            if (favoritesState.isOffline) {
                              context.showThrottledSnackBar(
                                context.l10n.offlineFavoritesUnavailable,
                                key: 'offline_favorites_unavailable',
                              );
                              return;
                            }
                            if (isFavorite) {
                              final favId = favoritesState.favoriteId(imageId);
                              if (favId != null) {
                                ctx.read<FavoritesCubit>().remove(favId);
                              }
                            } else {
                              ctx.read<FavoritesCubit>().add(
                                imageId,
                                breed: widget.breed,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
