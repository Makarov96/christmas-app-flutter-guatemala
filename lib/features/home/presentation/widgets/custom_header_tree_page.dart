import 'package:flutter/material.dart';
import 'package:flutter_christmas_app/features/home/data/model/tab_model.dart';
import 'package:flutter_christmas_app/features/home/presentation/bloc/handle_curren_index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_christmas_app/features/home/presentation/bloc/get_data_tab_provider.dart';

class CustomHeaderTreePage extends StatefulWidget {
  const CustomHeaderTreePage({Key key}) : super(key: key);

  @override
  _CustomHeaderTreePageState createState() => _CustomHeaderTreePageState();
}

class _CustomHeaderTreePageState extends State<CustomHeaderTreePage>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  var myTabList = <TabModel>[];
  @override
  void initState() {
    myTabList.addAll(context.read<GetDataTabProvider>().tabList);
    _tabcontroller = TabController(
      length: myTabList.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.dehaze_outlined,
                      color: Colors.black,
                    ),
                    onPressed: null,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.01,
                  vertical: screenHeight * 0.03,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                ),
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF9EB8AD),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 15,
                      bottom: 11,
                      top: 11,
                      right: 15,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.01,
                ),
                child: TabBar(
                  controller: _tabcontroller,
                  isScrollable: true,
                  indicatorColor: Colors.greenAccent,
                  onTap: (newIndex) {
                    context.read<HandleCurrentIndex>().updateIndexTab(newIndex);
                  },
                  tabs: myTabList.isEmpty
                      ? Container()
                      : List.generate(
                          myTabList.length,
                          (index) => _TreeTabWidget(
                            tabModel: myTabList[index],
                            totalTabs: index,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class _TreeTabWidget extends StatelessWidget {
  const _TreeTabWidget({
    Key key,
    @required this.tabModel,
    @required this.totalTabs,
  }) : super(key: key);
  final TabModel tabModel;
  final int totalTabs;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        tabModel.filter,
        style: TextStyle(
          color: context.watch<HandleCurrentIndex>().indexTab == totalTabs
              ? Colors.greenAccent
              : Colors.grey[400],
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
