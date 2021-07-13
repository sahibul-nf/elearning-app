part of 'pages.dart';

class ForumPage extends StatelessWidget {
  ForumPage({Key? key}) : super(key: key);

  var forumMessageController = TextEditingController();

  String? forumMessageInput;
  final _keyForm = GlobalKey<FormState>();

  final _random = Random();
  var data = DataDummy();

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Form(
      key: _keyForm,
      child: MaxWidthContainer(
        maxWidth: sizeScreen.width * 0.8,
        child: Container(
          // color: secondColor,
          padding: EdgeInsets.symmetric(vertical: 30),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                height: sizeScreen.height * 0.35,
                width: sizeScreen.width,
                decoration: BoxDecoration(
                  color: data.colors[_random.nextInt(data.colors.length)],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "${data.titles[_random.nextInt(data.titles.length)]}",
                  style: whiteTextFont.copyWith(fontSize: 24),
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      // color: mainColor,
                      margin: EdgeInsets.only(right: 20),
                      // height: 150,
                      width: 230,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          // color: mainColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: greyColor,
                            width: 2,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Comming",
                            style: blackTextFont.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Hore, there are no tasks that need to be completed immediately!",
                            style: blackTextFont.copyWith(fontSize: 12),
                          ),
                          SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: MouseRegion(
cursor: SystemMouseCursors.click,
                                                              child: Text(
                                  "See all >>",
                                  style: blackTextFont.copyWith(
                                    color: secondColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      // height: sizeScreen.height,
                      decoration: BoxDecoration(
                        // color: secondColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 6,
                                child: InputField(
                                  marginTop: 0,
                                  hintText: "Announce something to your class",
                                  // labelText: "Announce something to your class",
                                  prefixIcon: Icon(
                                    LineIcons.pen,
                                    color: mainColor,
                                  ),
                                  userInputController: forumMessageController,
                                  savedValue: (value) =>
                                      forumMessageInput = value!,
                                  validator: (value) => (value!.isEmpty)
                                      ? 'Please input something'
                                      : null,
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  width: 250,
                                  height: 55,
                                  child: PrimaryButton(
                                    top: 0,
                                    right: 0,
                                    text: "Posting",
                                    onPress: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // listPosting(),
                          EmptyWidget(button: false),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  listPosting() {
    return Container(
      color: mainColor,
      child: Column(
        children: [
          Flexible(
            child: Container(),
          ),
          Flexible(
            child: Container(),
          ),
          Flexible(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
