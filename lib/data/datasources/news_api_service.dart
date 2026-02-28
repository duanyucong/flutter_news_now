import 'package:dio/dio.dart';
import '../models/news_item.dart';
import 'api_client.dart';

class NewsApiService {
  final Dio _dio;
  
  NewsApiService(this._dio);
  
  @GET('/api/s')
  Future<SourceResponse> getSource(
    @Query('id') String id, {
    @Query('latest') bool? latest,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/s',
      queryParameters: {
        'id': id,
        if (latest != null) 'latest': latest.toString(),
      },
    );
    return SourceResponse.fromJson(response.data!);
  }
  
  @POST('/api/s/entire')
  Future<List<SourceResponse>> getEntireSources(
    @Body() Map<String, dynamic> body,
  ) async {
    final response = await _dio.post<List<dynamic>>(
      '/api/s/entire',
      data: body,
    );
    return response.data
        ?.map((e) => SourceResponse.fromJson(e as Map<String, dynamic>))
        .toList() ?? [];
  }
  
  @GET('/api/latest')
  Future<Map<String, dynamic>> getLatest() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/latest');
    return response.data ?? {};
  }
}

// Annotation definitions (for documentation)
class GET {
  final String path;
  const GET(this.path);
}

class POST {
  final String path;
  const POST(this.path);
}

class Query {
  final String? name;
  const Query([this.name]);
}

class Body {
  const Body();
}
