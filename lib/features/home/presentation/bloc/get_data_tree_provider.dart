import 'package:flutter/material.dart';
import 'package:flutter_christmas_app/features/home/data/model/tree.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/my_tree_repositories.dart';

@injectable
class GetDataTreeProvider extends ChangeNotifier {
  final MyTreeRepositories repository;

  GetDataTreeProvider({
    @required this.repository,
  });

  List<TreeModel> _treeList = [];
  List<TreeModel> get treeList => _treeList;

  void handleData() async {
    final myData = await repository();
    myData.fold((failure) => print(failure.message), (list) {
      _treeList = list;
      notifyListeners();
    });
  }
}
