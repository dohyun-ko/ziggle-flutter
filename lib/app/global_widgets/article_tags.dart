import 'package:flutter/material.dart';
import 'package:ziggle/app/core/theme/text.dart';
import 'package:ziggle/app/core/values/colors.dart';
import 'package:ziggle/app/data/enums/article_type.dart';
import 'package:ziggle/app/data/model/tag_response.dart';

class ArticleTags extends StatelessWidget {
  final List<TagResponse> tags;
  const ArticleTags({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: tags
          .map(
            (e) => _ArticleTag(
              text: '#${e.name}',
              color: e.isType ? Colors.purple : Palette.primaryColor,
            ),
          )
          .toList(),
    );
  }
}

class _ArticleTag extends StatelessWidget {
  final String text;
  final Color color;
  const _ArticleTag({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: TextStyles.articleCardBodyStyle.copyWith(color: color),
      ),
    );
  }
}
