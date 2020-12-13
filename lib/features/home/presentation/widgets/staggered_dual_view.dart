import 'package:flutter/material.dart';

import 'package:flutter_christmas_app/features/home/data/model/tree.dart';
import 'package:flutter_christmas_app/features/home/presentation/widgets/tree_item.dart';

class StaggeredDualView extends StatelessWidget {
  final double screeHeight;
  final List<TreeModel> myTreeList;
  const StaggeredDualView({
    Key key,
    this.screeHeight,
    this.myTreeList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        bottom: screeHeight * 0.35,
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            return Transform.translate(
              offset: Offset(
                0.0,
                index.isOdd ? screeHeight * 0.2 : 0.0,
              ),
              child: TreeItem(
                treeItem: myTreeList[index],
              ),
            );
          },
          childCount: myTreeList.length,
        ),
      ),
    );
  }
}
