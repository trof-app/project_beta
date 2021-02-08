import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/bottom_nav/bottomnav_controller.dart';
import 'package:flutter_starter/localizations.dart';
import 'package:flutter_starter/controllers/controllers.dart';
import 'package:flutter_starter/ui/components/components.dart';
import 'package:flutter_starter/ui/myschedule_ui.dart';
import 'package:flutter_starter/ui/ui.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:get/get.dart';

import 'drawer_ui.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    final navControl = Get.put<BottomNavControl>(BottomNavControl());

    final labels = AppLocalizations.of(context);

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => controller?.firestoreUser?.value?.uid == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: navControl.navSelected.value,
                onTap: (val) => navControl.navSelected.value = val,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.schedule), label: 'Lineup'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.line_style), label: 'My Schedule'),
                ],
              ),
              drawer: DrawerUI(),
              appBar: AppBar(
                backgroundColor: Get.theme.bottomAppBarColor,
                elevation: 0,
                title: Text('Right to Roam'),
                actions: [
                  IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Get.to(SettingsUI());
                      }),
                ],
              ),
              body: Obx(() => IndexedStack(
                    index: navControl.navSelected.value,
                    children: [DashboardUI(), LineupUI(), MySchedule()],
                  ))),
    );
  }
}

class DashboardUI extends StatelessWidget {
  const DashboardUI({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 300.0),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class LineupUI extends StatelessWidget {
  const LineupUI({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 20,
      itemBuilder: (context, index) => Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: CachedNetworkImage(
                  imageUrl:
                      "https://genreisdead.com/wp-content/uploads/2019/10/NFG-1-1280x640.jpg",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'New Found Glory',
                          style:
                              Get.textTheme.bodyText1.copyWith(fontSize: 22.0),
                        ),
                      ],
                    ),
                    Text(
                      'Florida State Pop Punk Gods Florida State Pop Punk Gods Florida State Pop Punk Gods',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Get.textTheme.bodyText2,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'Stage 1',
                          style: Get.textTheme.bodyText1,
                        ),
                        Spacer(),
                        Text(
                          '8:00pm',
                          style: Get.textTheme.bodyText1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
