import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/bottom_nav/bottomnav_controller.dart';
import 'package:flutter_starter/localizations.dart';
import 'package:flutter_starter/controllers/controllers.dart';
import 'package:flutter_starter/ui/artists/artists_ui.dart';
import 'package:flutter_starter/ui/components/components.dart';
import 'package:flutter_starter/ui/myschedule_ui.dart';
import 'package:flutter_starter/ui/ui.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:get/get.dart';
import 'artists/artists_dummy.dart';

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
                      backgroundColor: Get.theme.appBarTheme.iconTheme.color,
                      icon: Icon(
                        Icons.home,
                        color: Get.theme.appBarTheme.iconTheme.color,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.schedule,
                          color: Get.theme.appBarTheme.iconTheme.color),
                      label: 'Lineup'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.line_style,
                          color: Get.theme.appBarTheme.iconTheme.color),
                      label: 'My Schedule'),
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
            items: artistDummy.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CachedNetworkImage(
                    imageUrl: i.photoUrls.first,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
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
      itemCount: artistDummy.length,
      itemBuilder: (context, index) => Hero(
        tag: index,
        child: GestureDetector(
          onTap: () => Get.to(ArtistViewUI(index, artistDummy[index].name,
              artistDummy[index].photoUrls.first)),
          child: Card(
            child: ClipRRect(
              child: Banner(
                message: 'Scheduled',
                location: BannerLocation.topStart,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 125,
                      child: CachedNetworkImage(
                        imageUrl: artistDummy[index].photoUrls.first,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  artistDummy[index].name,
                                  style: Get.textTheme.bodyText1
                                      .copyWith(fontSize: 22.0),
                                ),
                              ],
                            ),
                            Text(
                              artistDummy[index].description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Get.textTheme.bodyText2,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  artistDummy[index].stage,
                                  style: Get.textTheme.bodyText1,
                                ),
                                Spacer(),
                                Text(
                                  artistDummy[index].setStartTime,
                                  style: Get.textTheme.bodyText1,
                                ),
                                SizedBox(
                                  width: 5,
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
            ),
          ),
        ),
      ),
    );
  }
}
