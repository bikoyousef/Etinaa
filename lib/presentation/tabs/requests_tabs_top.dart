import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/presentation/drawer/main_drawer.dart';

import '/presentation/screens/my_requests/my_requests_screen.dart';

class RequestsTabsTop extends StatefulWidget {
  const RequestsTabsTop({Key? key}) : super(key: key);
  static const routeName = '/my_requests_tabs';

  @override
  State<RequestsTabsTop> createState() => _RequestsTabsTopState();
}

class _RequestsTabsTopState extends State<RequestsTabsTop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(
            'tit14'.tr,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: (Colors.white),
                  fontWeight: FontWeight.bold,
                ),
          ),
          centerTitle: true,
          elevation: 0.0,
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelColor: Colors.white,
            unselectedLabelStyle: Theme.of(context).textTheme.headline5,
            labelColor: Theme.of(context).colorScheme.secondary,
            labelStyle: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
            tabs: <Widget>[
              Tab(
                text: 'tab1'.tr,
              ),
              Tab(
                text: 'tab2'.tr,
              ),
              Tab(
                text: 'tab3'.tr,
              ),
            ],
          ),
        ),
        drawer: const MainDrawer(),
        body: const TabBarView(
          children: <Widget>[
            MyRequestsScreen(),
            MyRequestsScreen(),
            MyRequestsScreen(),
          ],
        ),
      ),
    );
  }
}
