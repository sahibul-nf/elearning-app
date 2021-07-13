part of 'pages.dart';

class ClassPage extends StatelessWidget {
  ClassPage({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final userC = Get.find<UserController>();

  openSlideDrawer() => scaffoldKey.currentState!.openDrawer();

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: "Forum",
      // child: Text("Forum", style: blackTextFont),
    ),
    Tab(
      text: "Assigment",
      // child: Text("Class Assigment", style: blackTextFont),
    ),
    Tab(
      text: "Member",
      // child: Text("Member", style: blackTextFont)
    ),
    Tab(
      text: "Score",
      // child: Text("Score", style: blackTextFont)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: bgColor,
          centerTitle: true,
          title: Container(
            width: 450,
            child: TabBar(
              tabs: myTabs,
              indicatorWeight: 0.1,
              indicatorColor: secondColor,
              labelColor: secondColor,
              unselectedLabelColor: blackColor.withOpacity(0.5),
            ),
          ),
          leadingWidth: 300,
          leading: Row(
            children: [
              SizedBox(width: 20),
              GestureDetector(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: LineIcon(
                LineIcons.bars,
                color: blackColor,
              ),
            ),
            onTap: () {
              openSlideDrawer();
            },
          ),
              SizedBox(width: 20),
              Obx(
                () => Text(
                  "${userC.id.toString()}",
                  style: blackTextFont.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: LineIcon(LineIcons.cog, color: blackColor),
              ),
              onTap: () {
                // Get.defaultDialog(
                //   title: '',
                //   content: ChoiseClassOption(),
                // );
                Get.to(EmptyWidget());
              },
            ),
            SizedBox(width: 30),
            Container(
              child: Center(
                child: Obx(
                  () => Text(
                    "Hi, ${userC.username.toString()} 👋",
                    style: blackTextFont.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            CircleAvatar(
              backgroundColor: greyColor,
            ),
            SizedBox(width: 24),
          ],
        ),
        body: TabBarView(
          children: [
            ForumPage(),
            TaskPage(),
            MemberPage(),
            ScorePage(),
          ],
        ),
        drawer: SlideDrawer(),
      ),
    );
  }
}
