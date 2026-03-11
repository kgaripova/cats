abstract final class ApiEndpoints {
  static const String catApiBaseUrl = 'https://api.thecatapi.com/v1';
  static const String catApiKey = String.fromEnvironment(
    'CAT_API_KEY',
    defaultValue: '',
  );

  static const String breeds = '/breeds';
  static String breedById(String id) => '/breeds/$id';
  static const String imagesSearch = '/images/search';
  static String imageById(String id) => '/images/$id';
  static const String votes = '/votes';
  static const String favorites = '/favourites';
  static String favoriteById(String id) => '/favourites/$id';
}
