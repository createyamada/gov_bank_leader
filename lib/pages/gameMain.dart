import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../character.dart';
import '../world.dart';
import '../actionBtn.dart';

/// ゲームメイン
class GameMainPage extends StatefulWidget {
  GameMainPage({Key? key}) : super(key: key);

  @override
  State<GameMainPage> createState() => _GameMainPageState();
}

Size viewSize = new Size(0, 0);

class _GameMainPageState extends State<GameMainPage> {
  @override
  Widget build(BuildContext context) {
    final MyGameMain myGameMain = MyGameMain(context);
    viewSize = MediaQuery.of(context).size;
    return GameWidget(
      game: myGameMain,
      loadingBuilder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class MyGameMain extends FlameGame {
  Character _character = Character();
  World _world = World();
  ActionBtn _actionBtn1 = ActionBtn();
  ActionBtn _actionBtn2 = ActionBtn();
  ActionBtn _actionBtn3 = ActionBtn();

  MyGameMain(BuildContext context);
  @override
  Future<void> onLoad() async {
    super.onLoad();
    // await add(_world);
    await add(_character);
    await add(_actionBtn1);
    await add(_actionBtn2);
    await add(_actionBtn3);
    // _character.position = _world.size / 1.5;
    // _actionBtn1.position = _world.size / 2.5;
    // _actionBtn2.position = _world.size / 2.0;
    // _actionBtn3.position = _world.size / 3.0;
    _character.position = Vector2(200, 100);
    _actionBtn1.position = Vector2(100, 600);
    _actionBtn2.position = Vector2(200, 600);
    _actionBtn3.position = Vector2(300, 600);
  }
}
