import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class dashboardUI extends StatefulWidget {
  const dashboardUI({Key? key}) : super(key: key);

  @override
  State<dashboardUI> createState() => _dashboardUIState();
}

class _dashboardUIState extends State<dashboardUI> {
  @override
  Widget build(BuildContext context) {
        return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
          itemCount: 4,
          mainAxisSpacing: 15,
    padding: EdgeInsets.only(left: 15, right: 15),
    crossAxisSpacing: 15,
          itemBuilder: (c,i){
          return Container(
            height: i%2==0? 300:200,
            color:i % 2 == 0 ? Colors.black: Colors.deepOrange,
            child: Center(
              child: Text(i.toString()),
            ),
          );
          },
          staggeredTileBuilder: (index){
          return StaggeredTile.fit(1);
          },
        );
    //     ],
    //   ),
    // );
  }
}
