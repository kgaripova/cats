import 'package:cats/data/models/breed_model.dart';
import 'package:cats/data/repositories/favorite_repository.dart';
import 'package:cats/presentation/blocs/favorites/favorites_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoriteRepository extends Mock implements FavoriteRepository {}

void main() {
  late MockFavoriteRepository mockRepository;
  late FavoritesCubit cubit;

  final testBreed = BreedModel(id: 'abys', name: 'Abyssinian');

  setUp(() {
    mockRepository = MockFavoriteRepository();
    cubit = FavoritesCubit(mockRepository);
  });

  tearDown(() async {
    await cubit.close();
  });

  group('FavoritesCubit offline guards', () {
    test('does not call addFavorite when state is offline', () async {
      when(() => mockRepository.getFavorites()).thenAnswer((_) async => []);
      when(() => mockRepository.lastLoadFromCache).thenReturn(true);

      await cubit.load();
      await cubit.add('img1', breed: testBreed);

      verifyNever(() => mockRepository.addFavorite(any()));
      expect(cubit.state.isOffline, isTrue);
      expect(cubit.state.favorites, isEmpty);
    });
  });
}
