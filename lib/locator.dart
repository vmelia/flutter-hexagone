import 'package:get_it/get_it.dart';
import 'package:hexagone/contracts/i_colour_helper.dart';
import 'package:hexagone/contracts/i_colour_merger.dart';
import 'package:hexagone/contracts/i_coordinate_helper.dart';
import 'package:hexagone/contracts/i_grid_helper.dart';
import 'package:hexagone/contracts/i_randomizer.dart';
import 'package:hexagone/services/colour_helper.dart';
import 'package:hexagone/services/colour_merger.dart';
import 'package:hexagone/services/coordinate_helper.dart';
import 'package:hexagone/services/grid_helper.dart';
import 'package:hexagone/services/randomizer.dart';

var locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<IColourHelper>(ColourHelper());
  locator.registerSingleton<IColourMerger>(ColourMerger());
  locator.registerSingleton<ICoordinateHelper>(CoordinateHelper());  
  locator.registerSingleton<IGridHelper>(GridHelper());
  locator.registerSingleton<IRandomizer>(Randomizer());
}