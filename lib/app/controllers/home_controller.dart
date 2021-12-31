import 'package:dataoke_sdk/blog/blog_model.dart';
import 'package:dataoke_sdk/blog/blog_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'controller.dart';

class HomeController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  /// 加载博客列表
  Future<List<Blog>> fetchBlogList(int page) async {
    final blogList =
        await BlogService().getBlogList(page, AppHelper.defaultBlogPageSize);
    return blogList != null ? blogList.list : [];
  }
}
