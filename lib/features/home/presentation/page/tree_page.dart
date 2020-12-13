import 'package:flutter/material.dart';
import 'package:flutter_christmas_app/features/home/presentation/bloc/get_data_tab_provider.dart';

import 'package:flutter_christmas_app/features/home/presentation/widgets/staggered_dual_view.dart';
import '../widgets/custom_header_tree_page.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_navbar.dart';
import '../bloc/get_data_tree_provider.dart';

class TreePage extends StatefulWidget {
  const TreePage({Key key}) : super(key: key);
  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  @override
  void initState() {
    context.read<GetDataTreeProvider>().handleData();
    context.read<GetDataTabProvider>().handleDataTabs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myTreeList = context.watch<GetDataTreeProvider>().treeList;
    final screeHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              flexibleSpace: CustomHeaderTreePage(),
              expandedHeight: 240,
              backgroundColor: Color(0xFFFAFAFA),
              shadowColor: Colors.transparent,
            ),
            StaggeredDualView(
              screeHeight: screeHeight,
              myTreeList: myTreeList,
            ),
          ],
        ),
        const CustomNavBar(),
      ],
    );
  }
}
