import 'package:dio/dio.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/network/dio_provider.dart';
import '../../../../data/end_points.dart';
import '../../repository/auth/model/token_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl extends BaseRemoteSource
    implements AuthRemoteDataSource {
  @override
  Future<TokenModel> login(Map<String, dynamic> map) {
    var dioCall = dioClient.post(Endpoints.loginUrl, data: map);
    try {
      logger.d("message");

      return callApiWithErrorParser(dioCall)
          .then((response) => TokenModel.fromJson(response.data));
    } catch (e) {
      logger.d("message");
      rethrow;
      //return Future(() => ApiResponse.withError(ApiErrorHandler.getMessage(e)));
    }
  }

  @override
  Future<GithubProjectSearchResponse> searchGithubProject(
      GithubSearchQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/search/repositories";
    var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseGithubProjectSearchResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Item> getGithubProjectDetails(String userName, String repositoryName) {
    var endpoint = "${DioProvider.baseUrl}/repos/$userName/$repositoryName";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseGithubProjectResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  GithubProjectSearchResponse _parseGithubProjectSearchResponse(
      Response<dynamic> response) {
    return GithubProjectSearchResponse.fromJson(response.data);
  }

  Item _parseGithubProjectResponse(Response<dynamic> response) {
    return Item.fromJson(response.data);
  }

  @override
  void updateHeader(String token) {
    dioClient.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    };
  }
}
