import 'package:fusion_app/data/network/api_service.dart';
import 'package:fusion_app/models/home/comment_response_model.dart';
import 'package:fusion_app/res/constants/app_urls.dart';

class HomeRepository {
  final _apiService = ApiService();

  Future<CommentsResponseModel> getComments() async {
    try {
      final response = await _apiService.get(AppUrls.comments);
      print(response);
      response;
      return CommentsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
