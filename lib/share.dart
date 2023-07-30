import 'package:shared_preferences/shared_preferences.dart';

class Share {
  // ゲーム内で何日経過カウンター
  int? date_counter = null;
  // ゲーム内ユーザ名
  String? user_name = null;
  // ゲーム内物価
  int? cost_of_living = null;
  // ゲーム内金利
  double? rate = null;
  // ゲーム内民間銀行預金額
  int? bank_saving = null;
  // ゲーム内民間銀行預金率
  double? bank_saving_rate = null;
  // ゲーム内預貯金残高
  int? saving_aumont= null;
  // ゲーム内雇用統計
  double? employment_statistics = null;

  /**
	* 設定値の取得処理
	* @param null
	* @return void
	*/
  Future<void> getSetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.date_counter = await (prefs.getInt('date_counter') ?? 0);
    this.user_name = await prefs.getString('user_name') ?? '';
    this.cost_of_living = await (prefs.getInt('cost_of_living') ?? 0);
    this.rate = await (prefs.getDouble('rate') ?? 0);
    this.bank_saving = await (prefs.getInt('bank_saving') ?? 0);
    this.bank_saving_rate = await (prefs.getDouble('bank_saving_rate') ?? 0);
    this.saving_aumont = await (prefs.getInt('saving_aumont') ?? 0);
    this.employment_statistics = await (prefs.getDouble('employment_statistics') ?? 0);

  }

  /**
	* Counterのインクリメント保存
	* @param null
	* @return void
	*/
  Future<void> setCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // カウンターの値が設定されていない時
    int _date_counter = await (prefs.getInt('date_counter') ?? 0);
    // 変数をインクリメントする
    _date_counter = _date_counter + 1;
    await prefs.setInt('date_counter', _date_counter);
  }

  /**
	* プレイヤー名設定
	* @param String name
	* @return void
	*/
  Future<void> setName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
  }

  /**
	* 通貨量変化
	* @param int plus
	* @return void
	*/
  Future<void> setCurrencyAmount(int plus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _currency_amount = await (prefs.getInt('currency_amount') ?? 0);
    // 変数をインクリメントする
    _currency_amount = _currency_amount + plus;
    await prefs.setInt('currency_amount', _currency_amount);
  }

  /**
	* 金利変化
	* @param double plus
	* @return void
	*/
  Future<void> setRate(double plus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double _rate = await (prefs.getDouble('rate') ?? 0);
    // 変数をインクリメントする
    _rate = _rate + plus;
    await prefs.setDouble('rate', _rate);
  }

  /**
	* 外貨量変化
	* @param double plus
	* @return void
	*/
  Future<void> setForeiginAmount(double plus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double _foreign_amount = await (prefs.getDouble('foreign_amount') ?? 0);
    // 変数をインクリメントする
    _foreign_amount = _foreign_amount + plus;
    await prefs.setDouble('foreign_amount', _foreign_amount);
  }

  /**
	* 預貯金残高
	* @param int plus
	* @return void
	*/
  Future<void> setSaving(int plus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int _saving_aumont = await (prefs.getInt('saving_aumont') ?? 0);
    // 変数をインクリメントする
    _saving_aumont = _saving_aumont + plus;
    await prefs.setInt('saving_aumont', _saving_aumont);
  }

// 設定値を削除
  void _deleteSetting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 型に関係なくキー名を指定するだけ
    await prefs.remove('date_counter');
    await prefs.remove('user_name');
    await prefs.remove('currency_amount');
    await prefs.remove('foreign_amount');
    await prefs.remove('rate');
    await prefs.remove('score');
  }
}
