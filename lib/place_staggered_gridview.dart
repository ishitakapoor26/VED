// import 'dart:js';
import 'package:imagine_cup_software/concepts/concepts.dart';
import 'package:imagine_cup_software/place.dart';
import 'package:imagine_cup_software/place_item.dart';
// import 'package:imagine_cup_software/read/read.dart';
import 'package:imagine_cup_software/test_yourself/start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PlaceStaggeredGridView extends StatelessWidget {
  final placeList = Place.generatePlaces();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 4,
        itemCount: placeList.length,
        itemBuilder: (context, index) => PlaceItem(place: placeList[index]),
        staggeredTileBuilder: (_) => StaggeredTile.fit(2),
      ),
    );
  }
}
