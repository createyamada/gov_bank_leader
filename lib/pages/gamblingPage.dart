import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../BK/character.dart';
// import '../world.dart';
import '../BK/actionBtn.dart';
import '../common/myButton.dart';

/// ゲームメイン
class GamblingPage extends StatefulWidget {
  GamblingPage(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<GamblingPage> createState() => _GamblingPageState();
}

Size viewSize = new Size(0, 0);

class _GamblingPageState extends State<GamblingPage> {
  @override
  Widget build(BuildContext context) {
    final MyGambling myGambling = MyGambling(context);
    viewSize = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("ギャンブル画面"),
        leadingWidth: 85,  //leadingWidthを設定する
        leading: TextButton(
            child: Text(
              'キャンセル',
              style: TextStyle(
                color: Colors.white,  //文字の色を白にする
                fontWeight: FontWeight.bold,  //文字を太字する
                fontSize: 12.0,  //文字のサイズを調整する
                ),
            ),
            onPressed: () => Navigator.of(context).pop(),
      ),
      ),
      body: Container(
        color: Colors.white,
        child: GameWidget(
          game: myGambling,
        ),
      ),
    ));
  }
}

class MyGambling extends FlameGame {
  // ***********************************************
  // *
  // *	定数宣言
  // *
  // ***********************************************
  // 競馬ボタン
  MyButton? horseRacingButton = null;

  // 外貨売却ボタン
  MyButton? pachinkoButton = null;

  // ビルドコンテキスト
  final BuildContext _buildContext;

  // ***********************************************
  // *
  // *	コンストラクタ
  // *
  // ***********************************************
  MyGambling(this._buildContext) : super();

  // ***********************************************
  // *
  // *	ロード処理
  // *
  // ***********************************************
  @override
  Future<void> onLoad() async {
    super.onLoad();

    // 競馬ボタンを追加する
    horseRacingButton = MyButton(
        "mushi.png", "mushi.png", "\n競馬", Vector2(108, 96), onPressed);
    horseRacingButton!.GetPos(new Vector2(viewSize.width / 2, 680));
    horseRacingButton!.GetAnchor(Anchor.bottomCenter);
    await add(horseRacingButton!);
    

    // パチンコボタンを追加する
    pachinkoButton = MyButton(
        "mushi.png", "mushi.png", "\nパチンコ", Vector2(108, 96), onPressed);
    pachinkoButton!.GetPos(new Vector2(viewSize.width / 2, 680));
    pachinkoButton!.GetAnchor(Anchor.bottomCenter);
    await add(pachinkoButton!);
  }

  // ***********************************************
  // *
  // *	メソッド
  // *
  // ***********************************************
  void onPressed(String type) {
    print("ボタンクリック内容");
    print(type);

    switch (type) {
      case "\n競馬":
        print("競馬");

        break;

      case "\nパチンコ":
        print("パチンコ");

        break;
      default:
    }
  }
}
