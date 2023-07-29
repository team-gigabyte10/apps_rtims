import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '../../repository/auth/model/token_model.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> login(Map<String, dynamic> map);

  void updateHeader(String token);

  Future<GithubProjectSearchResponse> searchGithubProject(
      GithubSearchQueryParam queryParam);

  Future<Item> getGithubProjectDetails(String userName, String repositoryName);
}
