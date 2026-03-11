import 'package:cats/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/dio_client.dart';
import 'core/constants/app_constants.dart';
import 'data/repositories/breed_repository.dart';
import 'data/repositories/favorite_repository.dart';
import 'data/sources/local/app_settings_service.dart';
import 'data/sources/local/local_cache.dart';
import 'data/sources/remote/cat_api_source.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  await Hive.initFlutter();
  await Future.wait([
    Hive.openBox<String>(AppConstants.hiveBreedBox),
    Hive.openBox<String>(AppConstants.hiveFavoriteBox),
  ]);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(create: (_) => DioClient.create()),
        RepositoryProvider<CatApiSource>(
          create: (ctx) => CatApiSource(ctx.read<Dio>()),
        ),
        RepositoryProvider<AppSettingsService>(
          create: (_) => AppSettingsService(prefs),
        ),
        RepositoryProvider<LocalCache>(create: (_) => LocalCache()),
        RepositoryProvider<BreedRepository>(
          create: (ctx) => BreedRepository(
            remoteSource: ctx.read<CatApiSource>(),
            localCache: ctx.read<LocalCache>(),
          ),
        ),
        RepositoryProvider<FavoriteRepository>(
          create: (ctx) => FavoriteRepository(
            remoteSource: ctx.read<CatApiSource>(),
            localCache: ctx.read<LocalCache>(),
          ),
        ),
      ],
      child: const CatsApp(),
    ),
  );
}