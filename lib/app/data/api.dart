class Api {
  /// base url
  static const baseUrl = 'https://api.github.com/search/repositories';

  ///Repository List
  static const getRepoList = "$baseUrl?q=Flutter&sort=stars&order=desc&per_page=50"; //done

}
