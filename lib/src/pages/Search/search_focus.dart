import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uistudy/src/components/image_data.dart';
import 'package:uistudy/src/controller/bottom_nav_controller.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus> with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenueOne(String menu){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(menu,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }
  Widget _body(){
    return Container(
      child: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('인기페이지'),),
          Center(child: Text('인기페이지'),),
          Center(child: Text('인기페이지'),),
          Center(child: Text('인기페이지'),),
          Center(child: Text('인기페이지'),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            BottomNavController.to.willPopAction();
            //Get.find<BottomNavController>().willPopAction();
          },
              //
          //Get.back,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconPath.backBtnIcon),
          )),
        titleSpacing: 0,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffefefef),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '검색',
              contentPadding: EdgeInsets.only(left: 15, top: 7,bottom: 7),
              isDense: true,
            ),
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            height: AppBar().preferredSize.height,
            //color: Colors.red,
            width: Size.infinite.width,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xffe4e4e4))),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.black,
              tabs: [
                _tabMenueOne('인기'),
                _tabMenueOne('계정'),
                _tabMenueOne('오디오'),
                _tabMenueOne('태그'),
                _tabMenueOne('장소'),
                /*Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text('인기',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                Text('계정',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text('오디오',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text('태그',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                Text('장소',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),*/
              ],
            ),
          ),
          preferredSize: Size.fromHeight(50) ,),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //_body(),
            //_tabmenu(),
            //_tabView(),
          ],
        ),
      ),
    );
  }
}
