import 'package:ziggle/app/data/enums/article_type.dart';
import 'package:ziggle/app/data/enums/notice_my.dart';
import 'package:ziggle/app/data/model/article_summary_response.dart';
import 'package:ziggle/app/data/provider/api.dart';

class ProfileArticleData {
  ArticleSummaryResponse? article;
  int count;

  ProfileArticleData({
    required this.article,
    required this.count,
  });
}

class ProfileRepository {
  final ApiProvider _provider;

  ProfileRepository(this._provider);

  Future<Map<ArticleType, ProfileArticleData>> getArticles() async {
    return Map.fromEntries(
      await (NoticeMy.values.map((e) async {
        final result = await _provider.getNotices(limit: 1, my: e);
        return MapEntry(
          e.type,
          ProfileArticleData(
            article: result.list.elementAtOrNull(0),
            count: result.total,
          ),
        );
      }).wait),
    );
  }
}
