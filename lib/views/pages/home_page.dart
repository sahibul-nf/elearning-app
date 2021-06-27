part of 'pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  User user = Get.put(User());

  // List<PopupMenuEntry<dynamic>> items = [

  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Elec Learning",
          style: blackTextFont,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: LineIcon(
            LineIcons.bars,
            color: blackColor,
          ),
        ),
        actions: [
          GestureDetector(
            child: LineIcon(LineIcons.plus, color: blackColor),
            onTap: () {
              // showMenu(context: context, position: RelativeRect.fill, items: ChoiseClassOption());
            },
          ),
          Menu
          SizedBox(width: 30),
          Container(
            child: Center(
              child: Obx(
                () => Text(
                  "Hi, ${user.username.toString()} 👋",
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
      body: Container(
          // child: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder),
          ),
    );
  }
}

class ChoiseClassOption extends StatelessWidget {
  const ChoiseClassOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Text("Join class"),
          Text("Create class"),
        ],
      ),
    );
  }
}
