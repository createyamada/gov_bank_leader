    import 'dart:ui';
    
    import 'package:flame/game.dart';
    import 'character.dart';
    import 'world.dart';
    import 'actionBtn.dart';
    
    class BankGame extends FlameGame {
      Character _character = Character();
      World _world = World();
      ActionBtn _actionBtn = ActionBtn();
      @override
      Future<void> onLoad() async {
        super.onLoad();
        await add(_world);
        await add(_character);
        await add(_actionBtn);
        _character.position = _world.size / 1.5;
        _actionBtn.position = _world.size / 3.0;
        // camera.followComponent(_character,
        //     worldBounds: Rect.fromLTRB(0, 0, _world.size.x, _world.size.y));
      }
    }