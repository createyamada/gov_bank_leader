import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'bankGame.dart';

main() {
  final game = BankGame();
  runApp(
    GameWidget(
      game: game,
    ),
  );
}