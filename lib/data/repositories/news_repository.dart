import '../datasources/news_api_service.dart';
import '../models/news_item.dart';

class NewsRepository {
  final NewsApiService _apiService;

  NewsRepository(this._apiService);

  Future<SourceResponse> getSource(String sourceId, {bool latest = false}) async {
    return _apiService.getSource(sourceId, latest: latest);
  }

  Future<List<SourceResponse>> getEntireSources(List<String> sourceIds) async {
    return _apiService.getEntireSources({'sources': sourceIds});
  }
}
