import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gov_bank_leader/pages/interestRatePage.dart';


class ActionBtn extends SpriteComponent with TapCallbacks , HasGameRef  {
  ActionBtn() : super(
    size: Vector2.all(100.0),
    anchor: Anchor.center
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('crate.png');
    position = gameRef.size / 2;
  }

  @override
  void onTapUp(TapUpEvent event) {

  }
}