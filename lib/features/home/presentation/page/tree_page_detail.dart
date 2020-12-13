import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_christmas_app/features/home/presentation/bloc/count_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_christmas_app/features/home/data/model/tree.dart';
import 'package:flutter_christmas_app/features/home/presentation/bloc/handle_curren_index.dart';

class TreePageDetail extends StatelessWidget {
  TreePageDetail({
    Key key,
    @required this.treeItem,
  }) : super(key: key);
  final TreeModel treeItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTreeDetail(
        treeItem: treeItem,
      ),
    );
  }
}

class PageTreeDetail extends StatelessWidget {
  const PageTreeDetail({
    Key key,
    @required this.treeItem,
  }) : super(key: key);
  final TreeModel treeItem;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final myCounter = context.watch<CountProvider>().value;
    return Stack(
      children: [
        PageView.builder(
          itemCount: treeItem.imagelistpath.length,
          onPageChanged: (newIndex) {
            context.read<HandleCurrentIndex>().currentIndexPageview(newIndex);
          },
          itemBuilder: (_, i) {
            final images = treeItem.imagelistpath[i];

            return Container(
              margin: EdgeInsets.only(
                bottom: screenHeight * 0.4,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(images),
                ),
              ),
            );
          },
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            bottom: screenHeight * 0.12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              treeItem.imagelistpath.length,
              (index) => Container(
                margin: EdgeInsets.only(
                  right: screenWidth * 0.02,
                ),
                width: screenWidth * 0.03,
                height: screenHeight * 0.03,
                decoration: BoxDecoration(
                  color:
                      context.watch<HandleCurrentIndex>().indexPageview == index
                          ? Colors.white
                          : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeight * 0.5,
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08,
              ).copyWith(
                top: screenHeight * 0.02,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        treeItem.treename,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '\$${treeItem.price.truncateToDouble() * myCounter}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.02,
                    ),
                    child: Text(
                      treeItem.treedetail,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.02,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delivery_dining,
                          size: 35.0,
                          color: Colors.grey[600],
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Text(
                          'Standar Delivery: 2 days',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.08,
                        ),
                        CustomButton(
                          onTap: () => context.read<CountProvider>().rest(),
                          icon: Icons.remove,
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Text(
                          '$myCounter',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        CustomButton(
                          onTap: () => context.read<CountProvider>().sum(),
                          icon: Icons.add,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.9,
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.1,
                    ),
                    child: Center(
                      child: Text(
                        'BUY NOW',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF27AE60),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                topLeft: Radius.circular(50.0),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(
            top: screenHeight * 0.03,
            left: screenWidth * 0.02,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.onTap,
    @required this.icon,
  }) : super(key: key);
  final Function onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.08,
        height: screenHeight * 0.035,
        child: Center(
          child: Icon(icon),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 2.0,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
