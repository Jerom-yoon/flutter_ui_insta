import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:uistudy/src/components/image_data.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {

  var albums = <AssetPathEntity>[];
  var headerTitle;
  var imageList=<AssetEntity>[];
  AssetEntity? selectedImage;
  @override
  void initState() {
    super.initState();
    _loadPhots();
  }
  void _loadPhots() async{
    var result = await PhotoManager.requestPermissionExtend();
    if(result.isAuth){
      albums = PhotoManager.getAssetPathList(type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(
            sizeConstraint: SizeConstraint(
                minHeight: 100,
                minWidth: 100
            ),
          ),
          orders: [
            const OrderOption(
              type: OrderOptionType.createDate,
              asc: false
            )
          ]
        ),
      ) as List<AssetPathEntity>;
      _loadData();
    }
  }
  void _loadData() async {
    headerTitle=albums.first.name;
    await _pagingPhotos();
    update();
  }
  Future<void> _pagingPhotos() async{
    var photos = await albums.first.getAssetListPaged(page: 0, size: 30);
    imageList.addAll(photos);
  }
  void update()=>setState(() {
  });

  Widget _imagePreview() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: width,
      color: Colors.grey,
      child: selectedImage==null ? Container():
            _photoWidget(
                selectedImage!,
                width.toInt(),
                builder: (data){
                  return Image.memory(
                    data,
                    fit: BoxFit.cover,
                  );
                }
            ));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text(
                  '갤러리',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff808080),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    ImageData(IconPath.imageSelectIcon),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      '여러항목 선택',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff808080),
                ),
                child: ImageData(IconPath.cameraIcon),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _imageSelectList(){
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemCount: imageList.length,
      itemBuilder: (BuildContext context, int index) {
        return _photoWidget(imageList[index], 200, builder:(data){
          return Opacity(
            opacity: imageList[index] == selectedImage ? 0.3:1,
            child: Image.memory(
              data,
              fit: BoxFit.cover,
            ),
          );
        },);
      });
  }

  Widget _photoWidget(AssetEntity asset, int size, {required Widget Function(Uint8List) builder}){
    return FutureBuilder(
        future: asset.thumbnailDataWithSize(ThumbnailSize(size,size)),
        builder: (_,AsyncSnapshot<Uint8List?> snapshot){
          if(snapshot.hasData){
            return builder(snapshot.data!);
          }
          else{
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ImageData(IconPath.closeImage),
        ),
        title: Text(
          'New Post',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(15),
              child: ImageData(
                IconPath.nextImage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imagePreview(),
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }
}
