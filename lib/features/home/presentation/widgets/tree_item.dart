import 'dart:ui';

import 'package:flutter/material.dart';

import '../../data/model/tree.dart';
import '../page/tree_page_detail.dart';

class TreeItem extends StatelessWidget {
  const TreeItem({
    Key key,
    this.treeItem,
  }) : super(key: key);
  final TreeModel treeItem;

  @override
  Widget build(BuildContext context) {
    final screeHeight = MediaQuery.of(context).size.height;
    final screeWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => TreePageDetail(
              treeItem: treeItem,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: screeHeight * 0.1,
                    width: screeWidth * 0.2,
                    child: Text(
                      '\$${treeItem.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: screeHeight * 0.03,
                right: screeWidth * 0.03,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: screeWidth * 0.05,
              ),
              child: Text(
                '${treeItem.treename}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    5.0,
                  ),
                  bottomRight: Radius.circular(5.0),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              treeItem.imagelistpath[0],
            ),
          ),
        ),
      ),
    );
  }
}
