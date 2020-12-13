import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/presentation/bloc/handle_curren_index.dart';
import 'home/presentation/page/home_page.dart';
import 'home/presentation/page/tree_page.dart';

class RootPages extends StatelessWidget {
  const RootPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myScreens = <Widget>[
      HomePage(),
      TreePage(),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: IndexedStack(
          index: context.watch<HandleCurrentIndex>().index,
          children: myScreens,
        ),
      ),
    );
  }
}
