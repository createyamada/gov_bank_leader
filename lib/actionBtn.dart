import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';


class ActionBtn extends SpriteComponent with TapCallbacks , HasGameRef  {
  ActionBtn() : super(size: Vector2.all(1000.0));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('crate.png');
    position = gameRef.size / 2;
  }

  @override
  void onTapUp(TapUpEvent event) {
    print("クリック処理完了");
  }
}