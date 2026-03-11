import 'dart:async';

import 'package:cats/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:cats/l10n/generated/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cats/data/repositories/breed_repository.dart';
import 'package:cats/presentation/blocs/breed_list/breed_list_cubit.dart';
import 'package:cats/presentation/blocs/breed_list/breed_list_state.dart';
import 'package:cats/presentation/widgets/breed_card.dart';

class BreedListScreen extends StatefulWidget {
  const BreedListScreen({super.key});

  @override
  State<BreedListScreen> createState() => _BreedListScreenState();
}

class _BreedListScreenState extends State<BreedListScreen> {
  late final BreedListCubit _cubit;
  final _scrollController = ScrollController();
  late final StreamSubscription<List<ConnectivityResult>>
      _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _cubit = BreedListCubit(context.read<BreedRepository>())..loadInitial();
    _scrollController.addListener(_onScroll);
    final connectivity = Connectivity();
    connectivity.checkConnectivity().then(_onConnectivityChanged);
    _connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _scrollController.dispose();
    _cubit.close();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      _cubit.loadMore();
    }
  }

  void _onConnectivityChanged(List<ConnectivityResult> results) {
    if (!mounted) return;
    final hasConnection =
        results.any((result) => result != ConnectivityResult.none);
    _cubit.setOfflineMode(!hasConnection);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.appTitle),
        ),
        body: BlocBuilder<BreedListCubit, BreedListState>(
          builder: (_, state) => _Body(
            scrollController: _scrollController,
            state: state,
            l10n: context.l10n,
            onRetry: _cubit.loadInitial,
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.scrollController,
    required this.state,
    required this.l10n,
    required this.onRetry,
  });

  final ScrollController scrollController;
  final BreedListState state;
  final AppLocalizations l10n;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading && state.breeds.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null && state.breeds.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.errorLoadingBreeds),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: Text(l10n.retry)),
          ],
        ),
      );
    }

    return Column(
      children: [
        if (state.isOffline)
          MaterialBanner(
            content: Text(l10n.offlineBanner),
            actions: [const SizedBox.shrink()],
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          ),
        Expanded(
          child: ListView.separated(
            controller: scrollController,
            padding: const EdgeInsets.all(12),
            itemCount: state.breeds.length +
                (state.isLoading && state.breeds.isNotEmpty ? 1 : 0),
            itemBuilder: (_, index) {
              if (index >= state.breeds.length) {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 24),
                  child: SizedBox(
                    height: 40,
                    child: Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2.5),
                      ),
                    ),
                  ),
                );
              }
              final breed = state.breeds[index];
              return BreedCard(
                key: ValueKey(breed.id),
                breed: breed,
              );
            },
            separatorBuilder: (_, index) {
              return SizedBox(height: 12);
            },
          ),
        ),
      ],
    );
  }
}
