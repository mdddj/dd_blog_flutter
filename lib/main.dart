import 'package:dataoke_sdk/network/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/app.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:nylo_framework/nylo_framework.dart';

import 'bootstrap/boot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Nylo nylo = await Nylo.init(router: buildRouter(), setup: boot);
  DdTaokeUtil.instance
      .init('https://itbug.shop', '443', proxy: '', debug: false);
  runApp(
    AppBuild(
      navigatorKey: nylo.router!.navigatorKey,
      onGenerateRoute: nylo.router!.generator(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
