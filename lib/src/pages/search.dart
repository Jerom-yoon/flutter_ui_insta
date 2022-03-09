import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

import 'Search/search_focus.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[],[],[]];
  List<int> groupIndex = [0,0,0];


  @override
  void initState() {
    super.initState();
    for(var i=0;i<100;i++){
      var gI = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if(gI !=1){
        size =Random().nextInt(100)%2 == 0 ? 1 : 2;
      }
      groupBox[gI].add(size);
      groupIndex[gI] += size;
    }
  }

  Widget _appbar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child : GestureDetector(
            onTap:(){
              // 키를 사용한 내비게이ㅓ에서는 사용 못함
              //Get.to(SearchFocus());
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchFocus()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              child: Row(
                children: [
                  Icon(Icons.search),
                  Text(
                    '검색',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff838383),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(15.0),
        child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body(){
    return Expanded(
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          List.generate(groupBox.length, (index) =>
           Expanded(
            child: Column(
              children:
                List.generate(groupBox[index].length,(jindex) =>
                  Container(
                    height: Get.width*0.33*groupBox[index][jindex],
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.primaries[
                        Random().nextInt(Colors.primaries.length)]),
                    child: CachedNetworkImage(
                      imageUrl:
                        'https://d2v80xjmx68n4w.cloudfront.net/gigs/dQXgX1645766640.png',),
                  ),
                ).toList(),
               ),
           ),
          ).toList(),
          /*
          [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 140,
                    color: Colors.red,
                  ),
                  Container(
                    height: 140,
                    color: Colors.green,
                  ),
                  Container(
                    height: 140,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 140,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 140,
                    color: Colors.green,
                  ),
                  Container(
                    height: 140,
                    color: Colors.red,
                  ),
                ],
              ),
            ),Expanded(
              child: Column(
                children: [
                  Container(
                    height: 140,
                    color: Colors.green,
                  ),
                  Container(
                    height: 140,
                    color: Colors.red,
                  ),
                  Container(
                    height: 140,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
              ],
*/
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
            _body(),
          ],
        ),
      ),
    );
  }
}
