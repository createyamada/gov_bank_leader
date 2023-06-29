import 'dart:ui';

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
    return GameWidget(
      game: myGambling,
      loadingBuilder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
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
  MyGambling(this._buildContext) :super();

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
        "mushi.png",
        "mushi.png",
        "\n競馬",
        Vector2.all(100.0),
        onPressed
      );
    horseRacingButton!.GetPos(new Vector2(270, 680));
    await add(horseRacingButton!);

    // パチンコボタンを追加する
    pachinkoButton = MyButton(
        "mushi.png",
        "mushi.png",
        "\nパチンコ",
        Vector2.all(100.0),
        onPressed
      );
    pachinkoButton!.GetPos(new Vector2(370, 680));
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
