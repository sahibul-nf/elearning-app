part of 'pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserController userC = Get.put(UserController());

  openSlideDrawer() => _scaffoldKey.currentState!.openDrawer();

  int? id;

  String? username;

  String? aToken = '';

  getDataPref() async {
    final _sharePref = await SharedPreferences.getInstance();

    userC.id = _sharePref.getInt('id').toString().obs;
    userC.username = _sharePref.getString('username').toString().obs;

    id = _sharePref.getInt('id');
    username = _sharePref.getString('username');

    aToken = _sharePref.getString('token');
  }

  @override
  void initState() {
    getDataPref();
    print(userC.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 1,
        title: Text(
          "e-Learning",
          style: blackTextFont,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
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
        ),
        actions: [
          GestureDetector(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: LineIcon(LineIcons.plus, color: blackColor),
            ),
            onTap: () {
              Get.defaultDialog(
                title: '',
                content: ChoiseClassOption(),
              );
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
      body: Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  SecondaryButton(
                    title: "Assignment Class",
                    icon: Icon(LineIcons.clipboardList),
                    focus: false,
                    color: secondColor,
                    // backgroundColor: secondColor.withOpacity(0.03),
                    radius: BorderRadius.circular(20),
                    size: 16,
                    onPress: () {
                      Get.to(EmptyWidget());
                    },
                  ),
                  SizedBox(width: 20),
                  SecondaryButton(
                    title: "To be Checked",
                    icon: Icon(LineIcons.checkSquareAlt),
                    focus: false,
                    color: secondColor,
                    // backgroundColor: secondColor.withOpacity(0.03),
                    radius: BorderRadius.circular(20),
                    size: 16,
                    onPress: () {
                      Get.to(EmptyWidget());
                    },
                  ),
                  SizedBox(width: 20),
                  SecondaryButton(
                    title: "Calendar",
                    icon: Icon(LineIcons.calendarCheck),
                    focus: false,
                    color: secondColor,
                    // backgroundColor: secondColor.withOpacity(0.03),
                    radius: BorderRadius.circular(20),
                    size: 16,
                    onPress: () {
                      Get.to(EmptyWidget());
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.start,
                children: listClassCard(),
              ),
            ],
          ),
        ),
      ),
      drawer: SlideDrawer(),
    );
  }

  List<Widget> listClassCard() {
    List<Widget> list = [];

    final _random = Random();

    var data = DataDummy();

    var card;
    String title;
    var color;

    for (var i = 0; i < 8; i++) {
      title = data.titles[_random.nextInt(data.titles.length)];
      color = data.colors[_random.nextInt(data.colors.length)];

      card = CardClass(title: title, colorTheme: color, username: "");
      list.add(card);
    }

    return list;
  }
}

class ChoiseClassOption extends StatefulWidget {
  ChoiseClassOption({Key? key}) : super(key: key);

  @override
  _ChoiseClassOptionState createState() => _ChoiseClassOptionState();
}

class _ChoiseClassOptionState extends State<ChoiseClassOption> {
  final _keyForm = GlobalKey<FormState>();

  var titleController = TextEditingController();

  var emailController = TextEditingController();

  String? titleInput;

  String? emailInput;

  String? aToken = '';

  int? id;

  String? username;

  UserController userC = Get.put(UserController());

  getDataPref() async {
    final _sharePref = await SharedPreferences.getInstance();

    userC.id = _sharePref.getInt('id').toString().obs;
    userC.username = _sharePref.getString('username').toString().obs;

    id = _sharePref.getInt('id');
    username = _sharePref.getString('username');

    aToken = _sharePref.getString('token');
  }

  @override
  void initState() {
    getDataPref();
    print(userC.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              Get.close(0);
              Get.defaultDialog(
                title: '',
                content: formInviteUser(),
              );
            },
            child: Text(
              "Invite user",
              style: blackTextFont.copyWith(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Get.close(0);
              Get.defaultDialog(
                title: '',
                content: formCreateClass(),
              ).timeout(Duration(seconds: 2));
            },
            child: Text(
              "Create class",
              style: blackTextFont.copyWith(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void validateForm() {
    final classC = Get.put(ClassController());
    final userC = Get.find<UserController>();
    final form = _keyForm.currentState;

    if (form!.validate()) {
      form.save();

      // ClassService.classes();
      // ClassService().createNewClass(
      //   className: titleInput,
      // ).then((value) {
      //   print(value.headers);
      // });

      classC.createClass(
        titleInput,
        aToken.toString(),
      );
    }
  }

  Widget formCreateClass() {
    return Form(
      key: _keyForm,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(
              "Create class",
              style: blackTextFont.copyWith(fontSize: 18),
            ),
            InputField(
              hintText: 'New class name',
              labelText: 'Title',
              prefixIcon: Icon(LineIcons.edit, color: mainColor),
              userInputController: titleController,
              savedValue: (value) => titleInput = value!,
              validator: (value) =>
                  (value!.isEmpty) ? 'Please input title' : null,
            ),
            PrimaryButton(
              text: "Done",
              onPress: () {
                // setState(() {
                validateForm();
                // });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget formInviteUser() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            "Invite User",
            style: blackTextFont.copyWith(fontSize: 18),
          ),
          InputField(
            hintText: 'User email',
            labelText: 'Email',
            prefixIcon: Icon(LineIcons.edit, color: mainColor),
            userInputController: emailController,
            savedValue: (value) => emailInput = value!,
            validator: (value) => (value!.isEmpty)
                ? 'Please input your email'
                : (!GetUtils.isEmail(value))
                    ? 'Email invalid'
                    : null,
          ),
          PrimaryButton(
            text: "Done",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
