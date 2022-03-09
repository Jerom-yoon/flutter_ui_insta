

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uistudy/src/components/image_data.dart';
import 'package:uistudy/src/controller/bottom_nav_controller.dart';
import 'package:uistudy/src/pages/search.dart';
import 'pages/home.dart';

class App extends GetView<BottomNavController> { //GetX 영상참조
  const App({Key? key}) : super(key: key);

  //bottom navigation
  // willpopscope
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(() => Scaffold(
          //appBar: AppBar(),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children:  [
              //Container(child: Center(child: Text('HOME')),),
              const Home(),
              Navigator(
                key: controller.searchPageNavigatorKey,
                onGenerateRoute: (routeSetting){
                  return MaterialPageRoute(builder: (context)=>const Search(),
                  );
                },
              ),
              //Container(child: Center(child: Text('SEARCH')),),
              Container(child: Center(child: Text('UPLOAD')),),
              Container(child: Center(child: Text('ACTIVITY')),),
              Container(child: Center(child: Text('MYPAGE')),),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                icon: ImageData(IconPath.homeOff),
                activeIcon: ImageData(IconPath.homeOn),
                label:'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconPath.searchOff),
                activeIcon: ImageData(IconPath.searchOn),
                label:'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconPath.uploadIcon),
                label:'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconPath.activeOff),
                activeIcon: ImageData(IconPath.activeOn),
                label:'home',
              ),
              BottomNavigationBarItem(
                icon: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey),),
                label:'mypage',
              ),
            ],
          ),
      ),
      ),
      onWillPop: controller.willPopAction,
    );
  }
}
