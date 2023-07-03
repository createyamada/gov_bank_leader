// import 'dart:math' as math;
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

import 'package:flame/components.dart';

import 'myUiImage.dart';
import 'myText.dart';

/// 背景を用意する
class MyWorld extends PositionComponent with HasGameRef {
  // 適応させる座標系
  PositionType posType = PositionType.viewport;
  // 背景の画像パス
  String ImagePath = "";
  // 画像のサイズ
  Size? viewSize = null;

  MyUIImage? background = null;


  

  // コンストラクタ
  MyWorld(this.ImagePath,this.viewSize,
      {this.posType = PositionType.viewport});

  /// 読み込み処理
  ///
  @override
  Future<void>? onLoad() async {
    // sprite = await gameRef.loadSprite(ImagePath);
    size = Vector2(viewSize!.width , viewSize!.height);
    background = MyUIImage(ImagePath, size);

    add(background!);
    await super.onLoad();
  }

  /// 更新処理
  @override
  void update(double dt) {
    super.update(dt);
  }


  /// サイズを設定する
  void GetSize(Vector2 newSize) {
    size = newSize;
  }

  /// anchor設定する
  void GetAnchor(Anchor newAnchor) {
    anchor = newAnchor;
  }
}