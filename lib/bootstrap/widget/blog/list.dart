import 'package:dataoke_sdk/blog/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/widget/user/avatar.dart';

/// 博客列表的卡片试布局
class BlogListItemWidget extends StatelessWidget {
  final Blog blog;
  const BlogListItemWidget({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              blog.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                UserAvatar(
                  size: 28,
                  radius: 225,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  '${blog.author}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.folder,
                      color: Colors.grey,
                    ),
                    label: Text(blog.category.name)),
                ..._buildTags()
              ],
            )
          ],
        ),
      ),
    );
  }

  /// 标签列表
  List<Widget> _buildTags() {
    return blog.tags
        .map((e) => TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.sell_outlined,
              color: Colors.grey,
            ),
            label: Text(e.name)))
        .toList();
  }
}
