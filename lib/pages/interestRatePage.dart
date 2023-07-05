import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../common/myButton.dart';
import '../common/myWord.dart';

/// ゲームメイン
class InterestRatePage extends StatefulWidget {
  InterestRatePage(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<InterestRatePage> createState() => _InterestRatePageState();
}

Size viewSize = new Size(0, 0);

class _InterestRatePageState extends State<InterestRatePage> {
  @override
  Widget build(BuildContext context) {
    final MyInterestRate myInterestRate = MyInterestRate(context);
    viewSize = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("金利調整画面"),
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
          game: myInterestRate,
        ),
      ),
    ));
  }
}

class MyInterestRate extends FlameGame {
  // ***********************************************
  // *
  // *	定数宣言
  // *
  // ***********************************************

  // 背景
  MyWorld? world = null; 

  // 利上げボタン
  MyButton? interestRateUpButton = null;

  // 利下げボタン
  MyButton? interestRateDownButton = null;

  // ビルドコンテキスト
  final BuildContext _buildContext;

  // ***********************************************
  // *
  // *	コンストラクタ
  // *
  // ***********************************************
  MyInterestRate(this._buildContext) : super();

  // ***********************************************
  // *
  // *	ロード処理
  // *
  // ***********************************************
  @override
  Future<void> onLoad() async {
    super.onLoad();

    // 背景を追加
    world = MyWorld('back.png' , viewSize);
    await add(world!);

    // 金利上昇ボタンを追加する
    interestRateUpButton = MyButton(
        "crate.png", "mushi.png", "\n金利を上げる", Vector2.all(100.0), onPressed);
    interestRateUpButton!.GetPos(Vector2(viewSize.width / 2, 680));
    interestRateUpButton!.GetAnchor(Anchor.bottomCenter);
    // await add(interestRateUpButton!);

    // 金利下降ボタンを追加する
    interestRateDownButton = MyButton(
        "crate.png", "mushi.png", "\n金利を下げる", Vector2.all(100.0), onPressed);
    interestRateDownButton!.GetPos(Vector2(viewSize.width / 2, 680));
    interestRateDownButton!.GetAnchor(Anchor.bottomCenter);
    // await add(interestRateDownButton!);


    await add(
      PositionComponent(
        children: [
            interestRateUpButton!,
            interestRateDownButton!,
        ],
      ),
    );
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
      case "\n金利を上げる":
        print("金利上昇");

        break;

      case "\n金利を下げる":
        print("金利下降");

        break;
      default:
    }
  }
}
