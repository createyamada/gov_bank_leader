
import 'package:shared_preferences/shared_preferences.dart';

class Share {
  // ゲーム内で何日経過カウンター
  int? date_counter = null;
  // ゲーム内ユーザ名
  String? user_name = null;
  // ゲーム内スコア
  int? score = null;

  // 設定値を取得
Future<int?> getSetting() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  this.date_counter = await (prefs.getInt('date_counter') ?? 0);
  this.user_name = await prefs.getString('user_name') ?? '';
  this.score = await (prefs.getInt('score') ?? 0);
}

// 設定値を保存
Future<int?> setCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // カウンターの値が設定されていない時
  int _date_counter = await (prefs.getInt('date_counter') ?? 0);
  // 変数をインクリメントする
  _date_counter = _date_counter + 1;
  await prefs.setInt('date_counter', _date_counter);
}

Future<int?> setName(String name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_name', name);
}

Future<int?> setScore(String test) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int _score = await (prefs.getInt('score') ?? 0);
  // 変数をインクリメントする
  _score = _score + 1;
  await prefs.setInt('score', _score);
}




// 設定値を削除
void _deleteSetting() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // 型に関係なくキー名を指定するだけ
  await prefs.remove('date_counter');
  await prefs.remove('user_name');
  await prefs.remove('score');
}
}