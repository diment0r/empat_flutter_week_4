import 'package:empat_flutter_week_4/pages/catalog_page.dart';
import 'package:empat_flutter_week_4/pages/interests_page.dart';
import 'package:empat_flutter_week_4/pages/favourites_page.dart';
import 'package:empat_flutter_week_4/utils/colors.dart';
import 'package:empat_flutter_week_4/widgets/drawer.dart';
import 'package:flutter/material.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int currentIndex = 0;
  late PageController pageController;
  late ScrollController scrollController = ScrollController();

  final List<Widget> pages = const [
    HomePageWidget(),
    InterestsPageWidget(),
    SkillsPageWidget(),
  ];
  final List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Catalog'),
    BottomNavigationBarItem(icon: Icon(Icons.interests), label: 'Interests'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourites'),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onNavBarItemTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onPageChanged(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 40), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(223, 223, 223, 1),
      drawer: const DrawerWidget(),
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              snap: true,
              floating: true,
              surfaceTintColor: Colors.transparent,
              backgroundColor: CColors.dark,
              foregroundColor: CColors.light,
              title: const Text('DIMENTOR'),
              forceElevated: innerBoxIsScrolled,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(64),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: CColors.light,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Text('Search...'),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: PageView(
          controller: pageController,
          onPageChanged: _onNavBarItemTap,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: onPageChanged,
        selectedItemColor: CColors.red,
        unselectedItemColor: CColors.light,
        backgroundColor: CColors.dark,
        items: navBarItems,
      ),
    );
  }
}
