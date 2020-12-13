import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/tab_model.dart';
import '../../data/repositories/my_tab_repositories.dart';

@injectable
class GetDataTabProvider extends ChangeNotifier {
  final MyTabRepositories repository;

  GetDataTabProvider({
    @required this.repository,
  });

  List<TabModel> _tabList = [];
  List<TabModel> get tabList => _tabList;

  void handleDataTabs() async {
    final myDataTabs = await repository();
    myDataTabs.fold((failure) => print(failure.message), (list) {
      _tabList = list;
      print(_tabList);
      notifyListeners();
    });
  }
}
