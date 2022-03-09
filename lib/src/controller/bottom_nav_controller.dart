import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/message_popup.dart';
import '../pages/upload.dart';

enum PageName{HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE}

class BottomNavController extends GetxController{
  GlobalKey<NavigatorState> searchPageNavigatorKey = GlobalKey<NavigatorState>();

  static BottomNavController get to=>Get.find();
  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];

  void changeBottomNav(int curPage, {bool hasGesture = true}){
    var page = PageName.values[curPage];
    switch(page){
      case PageName.UPLOAD:
        Get.to(()=> const Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _chagePage(curPage, hasGesture:hasGesture);
        break;

    }
  }
  void _chagePage(int value,{bool hasGesture=true}){
    pageIndex(value);
    if(hasGesture)
      bottomHistory.add(value);
    print(bottomHistory);
  }
  Future<bool>  willPopAction() async {
    if(bottomHistory.length==1){
      print('exit');
      showDialog(context: Get.context!, builder: (context)=>
        MessagePopup(
          message:'종료하시겠습니까' ,
          okCallback: (){
            exit(0);
          },
          title: '시스템',
          cancelCallback: Get.back,
        ));
      return true;
    }
    else{
      var page = PageName.values[bottomHistory.last];
      if(page == PageName.SEARCH){
        var value = await searchPageNavigatorKey.currentState!.maybePop();
        if(value) return false;
      }
      print('go to before page');
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}