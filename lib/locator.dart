import 'package:get_it/get_it.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/contracts/i_colour_merger.dart';
import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/services/colour_helper.dart';
import 'package:hexagone/services/colour_merger.dart';
import 'package:hexagone/services/grid_helper.dart';

var locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<IColourHelper>(ColourHelper());
  locator.registerSingleton<IColourMerger>(ColourMerger());
  locator.registerSingleton<IGridHelper>(GridHelper());
}
