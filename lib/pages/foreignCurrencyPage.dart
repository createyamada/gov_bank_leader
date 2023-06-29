import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../BK/character.dart';
// import '../world.dart';
import '../BK/actionBtn.dart';
import '../common/myButton.dart';

/// ゲームメイン
class ForeignCurrencyPage extends StatefulWidget {
  ForeignCurrencyPage(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<ForeignCurrencyPage> createState() => _ForeignCurrencyPageState();
}

Size viewSize = new Size(0, 0);

class _ForeignCurrencyPageState extends State<ForeignCurrencyPage> {
  @override
  Widget build(BuildContext context) {
    final MyForeignCurrency myForeignCurrency = MyForeignCurrency(context);
    viewSize = MediaQuery.of(context).size;
    return GameWidget(
      game: myForeignCurrency,
      loadingBuilder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class MyForeignCurrency extends FlameGame {

  // ***********************************************
  // *                                             
  // *	定数宣言                                      
  // *                                             
  // ***********************************************
  // 外貨購入ボタン
  MyButton? foreignCurrencyUpButton = null;

  // 外貨売却ボタン
  MyButton? foreignCurrencyDownButton = null;
  
  // ビルドコンテキスト
  final BuildContext _buildContext;

  // ***********************************************
  // *                                             
  // *	コンストラクタ                                      
  // *                                             
  // ***********************************************
  MyForeignCurrency(this._buildContext) :super();

  // ***********************************************
  // *                                             
  // *	ロード処理                                      
  // *                                             
  // ***********************************************
  @override
  Future<void> onLoad() async {
    super.onLoad();


    // 外貨購入ボタンを追加する
    foreignCurrencyUpButton = MyButton(
        "shiba.png",
        "mushi.png",
        "\n外貨購入",
        Vector2.all(100.0),
        onPressed
      );
    foreignCurrencyUpButton!.GetPos(new Vector2(270, 680));
    await add(foreignCurrencyUpButton!);

    // 外貨売却ボタンを追加する
    foreignCurrencyDownButton = MyButton(
        "shiba.png",
        "mushi.png",
        "\n外貨売却",
        Vector2.all(100.0),
        onPressed
      );
    foreignCurrencyDownButton!.GetPos(new Vector2(370, 680));
    await add(foreignCurrencyDownButton!);
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
      case "\n外貨購入":
        print("外貨購入");

        break;
      
      case "\n外貨売却":
        print("外貨売却");

        break;
      default:
    }
    
  }
}
