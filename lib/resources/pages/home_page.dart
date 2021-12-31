import 'package:dataoke_sdk/blog/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/bootstrap/widget/blog/list.dart';
import 'package:flutter_app/bootstrap/widget/user/avatar.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

// 首页
class MyHomePage extends NyStatefulWidget {
  final HomeController controller = HomeController();
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends NyState<MyHomePage> {
  List<Blog> _blogs = [];
  int _page = 1;

  @override
  widgetDidLoad() => _fetchBlog();

  // 加载博客
  Future<void> _fetchBlog({bool nexPage = false}) async {
    if (nexPage) _page++;
    _blogs.addAll(await widget.controller.fetchBlogList(_page));
    setState(() {});
  }

  // 打开菜单
  void _openMenu(context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
                onTap: () => _openMenu(context), child: Icon(Icons.menu));
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [UserAvatar(), Text('梁典典的博客')],
            ))
          ],
        ),
      ),
      body: SafeAreaWidget(
        child: ListView.builder(
          itemBuilder: _blogListItemBuilder,
          itemCount: _blogs.length,
        ),
      ),
    );
  }

  Widget _blogListItemBuilder(context, int index) {
    return BlogListItemWidget(
      blog: _blogs[index],
    );
  }
}
