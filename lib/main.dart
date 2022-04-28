import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() => runApp(MyMain());

class MyMain extends StatelessWidget {
  const MyMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
      child: GetMaterialApp(
        title: '커스텀 스크롤뷰 만들꺼얌',
        home: MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 7,
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                backgroundColor: Colors.white,
                title: MyAppBar(),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: TabBarDelegate(),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Text('1'),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text(''),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text('3'),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text('4'),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text('5'),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text('6'),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text('7'),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: TabBar(
        isScrollable: true,
        tabs: [
          Tab(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Text(
                "인기",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Text(
                "팔로잉",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Text(
                "사진",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Text(
                "집들이",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Text(
                "노하우",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Text(
                "전문가집들이",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: const Text(
                "질문과답변",
              ),
            ),
          ),
        ],
        indicatorWeight: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        unselectedLabelColor: Colors.black,
        labelColor: Colors.lightBlueAccent,
        indicatorColor: Colors.lightBlueAccent,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 7,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 5, bottom: 10),
                child: TextField(
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined),
                    hintText: '오늘의집 통합검색',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    fillColor: Colors.grey[300],
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onTap: () {
                    print('TextField onTap');
                  },
                  onChanged: (val) {
                    print('onChanged $val');
                    // myAppBarController.changeSearchText(val);
                  },
                ),
              )),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextButton(
                        onPressed: () {
                          print('bookmark TextButton onPress');
                          FocusScope.of(context).unfocus();
                        },
                        child: Icon(
                          Icons.bookmark_outline,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: TextButton(
                      onPressed: () {
                        print('shopping_cart_outlined TextButton onPress');
                      },
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  )),
                ],
              )),
        ],
      ),
    );
  }
}
