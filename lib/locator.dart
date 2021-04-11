import 'package:get_it/get_it.dart';
import 'services/game_engine.dart';
import 'services/randomizer.dart';

var locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Randomizer>(RandomizerImpl());
  locator.registerSingleton<GameEngine>(GameEngineImpl());
}
