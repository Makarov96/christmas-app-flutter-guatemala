import 'package:meta/meta.dart';

class TreeModel {
  final List<String> imagelistpath;
  final String treename;
  final double price;
  final String treedetail;

  TreeModel({
    @required this.imagelistpath,
    @required this.treename,
    @required this.price,
    @required this.treedetail,
  })  : assert(imagelistpath != null),
        assert(treename != null),
        assert(price != null),
        assert(treedetail != null);
}
