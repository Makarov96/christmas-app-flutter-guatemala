import 'package:injectable/injectable.dart';

import '../model/tab_model.dart';
import '../model/tree.dart';

@injectable
class LocalDataSource {
  final myTabList = <TabModel>[
    TabModel(filter: 'Trees'),
    TabModel(filter: 'Decoration'),
    TabModel(filter: 'Stans'),
    TabModel(filter: 'Garlands'),
    TabModel(filter: 'Sample'),
  ];

  final myCustomList = <TreeModel>[
    TreeModel(
      imagelistpath: [
        'assets/artificial_christmas_tree.jpg',
        'assets/artificial_christmas_tree.jpg',
        'assets/artificial_christmas_tree.jpg',
      ],
      treename: 'Artificial Christmas Tree',
      price: 30.90,
      treedetail:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    ),
    TreeModel(
      imagelistpath: [
        'assets/christmas_tree_decorated_xl.jpg',
        'assets/christmas_tree_decorated_xl.jpg',
        'assets/christmas_tree_decorated_xl.jpg',
      ],
      treename: 'Christmas Tree Decorated',
      price: 99.99,
      treedetail:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    ),
    TreeModel(
      imagelistpath: [
        'assets/christmas_tree_decorated.jpg',
        'assets/christmas_tree_decorated.jpg',
        'assets/christmas_tree_decorated.jpg',
      ],
      treename: 'Tree Decorated',
      price: 19.90,
      treedetail:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    ),
    TreeModel(
      imagelistpath: [
        'assets/decoration_tree.jpg',
        'assets/decoration_tree.jpg',
        'assets/decoration_tree.jpg',
      ],
      treename: 'Artificial Christmas Tree',
      price: 30.90,
      treedetail:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    ),
    TreeModel(
      imagelistpath: [
        'assets/mini_christmas_tree_decorated.jpg',
        'assets/mini_christmas_tree_decorated.jpg',
        'assets/mini_christmas_tree_decorated.jpg',
      ],
      treename: 'Mini Christmas Tree',
      price: 20.90,
      treedetail:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    ),
    TreeModel(
      imagelistpath: [
        'assets/natural_christmas_tree.jpg',
        'assets/natural_christmas_tree.jpg',
        'assets/natural_christmas_tree.jpg',
      ],
      treename: 'Natural Christmas Tree',
      price: 149.99,
      treedetail:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    )
  ];

  Future<List<TreeModel>> myCustomData() => Future.value(myCustomList);
  Future<List<TabModel>> myTabData() => Future.value(myTabList);
}
