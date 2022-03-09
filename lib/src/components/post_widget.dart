import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uistudy/src/components/avatar_widget.dart';
import 'package:uistudy/src/components/image_data.dart';
import 'package:expandable_text/expandable_text.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(),
          const SizedBox(height: 15,),
          _image(),
          const SizedBox(height: 15,),
          _infoCount(),
          const SizedBox(height: 15,),
          _infoDescription(),
          const SizedBox(height: 15,),
          _replyTextBtn(),
          const SizedBox(height: 15,),
          _dateAgo(),
        ],
      ),
    );
  }
  Widget _header(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(type: AvatarType.TYPE3,
              size: 40,
              nickName: "개발남",
              hasStory: false,
              thumbPath: 'https://d2v80xjmx68n4w.cloudfront.net/gigs/Z35Um1609732385.jpg',
          ),
          GestureDetector(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconPath.postMoreIcon,
                width: 30,
              ),
            )
          )
        ],
      ),
    );
  }
  Widget _image(){
    return CachedNetworkImage(
        imageUrl: 'https://d2v80xjmx68n4w.cloudfront.net/gigs/JzjH91639636552.jpg',
    );
  }
  Widget _infoCount(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(IconPath.likeOffIcon,
                width: 65,
              ),
              const SizedBox(width:15 ,),
              ImageData(IconPath.replyIcon,
                width: 60,
              ),
              const SizedBox(width:15 ,),
              ImageData(IconPath.directMessage,
                width: 55,
              ),
            ],
          ),
          ImageData(IconPath.bookMarkOffIcon,
            width: 50,
          ),
        ],
      ),
    );
  }
  Widget _infoDescription(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '좋아요 10개',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ExpandableText(
            '콘텐츠1입니다\n콘텐츠1입니다\n콘텐츠1입니다\n콘텐츠1입니다', expandText: '더보기',
            collapseText: '접기',
            prefixText: '개발남',
            onPrefixTap: (){ if (kDebugMode) {
              print(' 페이지 이동');
            }},
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
            ),
        ],
      ),
    );
  }

  Widget _replyTextBtn(){
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          '댓글 199개 모두보기',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _dateAgo(){
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text('1일전',
        style: TextStyle(
          color: Colors.grey, fontSize: 11
        ),),
    );
  }
}
