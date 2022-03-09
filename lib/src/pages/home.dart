import 'package:flutter/material.dart';
import 'package:uistudy/src/components/avatar_widget.dart';
import 'package:uistudy/src/components/image_data.dart';
import 'package:uistudy/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: ImageData(
          IconPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ImageData(IconPath.directMessage, width: 50),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
  }

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
            hasStory: false,
            type: AvatarType.TYPE2,
            thumbPath:
                'https://d2v80xjmx68n4w.cloudfront.net/gigs/Z35Um1609732385.jpg',
            size:70,),
        Positioned(
            right: 5,
            bottom: 0,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(color: Colors.white,width: 2),
              ),
              child: const Center(child: Text('+',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.1,
                ),),

              ),
            ))
      ],
    );
  }
  Widget _postList(){
    return Column(
      children: List.generate(
          50,
              (index) => PostWidget(
            //thumbPath:
            //  'https://d2v80xjmx68n4w.cloudfront.net/gigs/Z35Um1609732385.jpg',
          )),
    );
  }
  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        SizedBox(
          width: 20,
        ),
        _myStory(),
        SizedBox(
          width: 5,
        ),
        ...List.generate(
            100,
            (index) => AvatarWidget(
                  type: AvatarType.TYPE1,
                  thumbPath:
                      'https://d2v80xjmx68n4w.cloudfront.net/gigs/Z35Um1609732385.jpg',
                  hasStory: false,
                )),
      ]),
    );
  }
}
