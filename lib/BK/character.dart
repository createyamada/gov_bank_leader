import 'package:flame/components.dart';

class Character extends SpriteComponent with HasGameRef {
  Character() : super(
    size: Vector2.all(100.0),
    anchor: Anchor.topCenter
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('crate.png');
    position = gameRef.size / 2;
  }
}
