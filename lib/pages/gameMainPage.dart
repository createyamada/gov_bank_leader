import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gov_bank_leader/pages/foreignCurrencyPage.dart';
import 'package:gov_bank_leader/pages/gamblingPage.dart';
import '../common/myButton.dart';
import '../common/myWord.dart';
import 'interestRatePage.dart';

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

  // ***********************************************
  // *                                             
  // *	定数宣言                                      
  // *                                             
  // ***********************************************

  // 背景
  MyWorld? world = null; 
  
  // 利金利調整ボタン
  MyButton? interestRateButton = null;

  // 外貨調整ボタン
  MyButton? foreignCurrencyButton = null;

  // ETFボタン
  // MyButton? foreignCurrencyButton = null;

  // ギャンブルボタン
  MyButton? gamblingButton = null;

  // ビルドコンテキスト
  final BuildContext _buildContext;

  // ***********************************************
  // *                                             
  // *	コンストラクタ                                      
  // *                                             
  // ***********************************************
  MyGameMain(this._buildContext) :super();


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

    // 金利調整ボタンを追加する
    interestRateButton = MyButton(
        "crate.png",
        "mushi.png",
        "\n金利調整",
        Vector2.all(100.0),
        onPushMenuPressed
      );
    interestRateButton!.GetPos(new Vector2(viewSize.width / 2 - 150, 680));
    interestRateButton!.GetAnchor(Anchor.bottomCenter);
    await add(interestRateButton!);

    // 外貨ボタンを追加する
    foreignCurrencyButton = MyButton(
        "shiba.png",
        "crate.png",
        "\n外貨調整",
        Vector2.all(100.0),
        onPushMenuPressed
      );
    foreignCurrencyButton!.GetPos(new Vector2(viewSize.width / 2, 680));
    foreignCurrencyButton!.GetAnchor(Anchor.bottomCenter);
    await add(foreignCurrencyButton!);

    // ギャンブルボタンを追加する
    gamblingButton = MyButton(
        "mushi.png",
        "crate.png",
        "\nギャンブル",
        Vector2.all(100.0),
        onPushMenuPressed
      );
    gamblingButton!.GetPos(new Vector2(viewSize.width / 2 + 150, 680));
    gamblingButton!.GetAnchor(Anchor.bottomCenter);
    await add(gamblingButton!);

  }
  // ***********************************************
  // *                                             
  // *	メソッド                                      
  // *                                             
  // ***********************************************
  void onPushMenuPressed(String type) {
    print("ボタンクリック内容");
    print(type);

    switch (type) {
      case "\n金利調整":
        print("金利調整ボタンクリック");
          // 画面遷移
          Navigator.push(this._buildContext,
            MaterialPageRoute(builder: (context) => InterestRatePage(context)));
        break;
      
      case "\n外貨調整":
        print("外貨調整ボタンクリック");
          // 画面遷移
          Navigator.push(this._buildContext,
            MaterialPageRoute(builder: (context) => ForeignCurrencyPage(context)));
        break;

      case "\nギャンブル":
        print("ギャンブルボタンクリック");
          // 画面遷移
          Navigator.push(this._buildContext,
            MaterialPageRoute(builder: (context) => GamblingPage(context)));
        break;

      default:
    }
    
  }
}
