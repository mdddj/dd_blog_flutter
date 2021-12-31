import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// 头像
class UserAvatar extends StatelessWidget {
  final double? size;
  final double? radius;
  const UserAvatar({Key? key, this.size, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 15),
      child: Image.asset(
        getImageAsset('avatar.jpeg'),
        width: size ?? 88,
        height: size ?? 88,
      ),
    );
  }
}
