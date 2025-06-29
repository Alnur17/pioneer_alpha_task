class Api {
  /// base url
  static const baseUrl = 'https://api.github.com';

  ///Repository List
  static const getRepoList = "$baseUrl/search/repositories?q=Flutter&sort=stars&order=desc&per_page=50"; //done

}
