part of 'pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  UserController userController = Get.put(UserController());

  openSlideDrawer() => _scaffoldKey.currentState!.openDrawer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 1,
        title: Text(
          "Elec Learning",
          style: blackTextFont,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            child: LineIcon(
              LineIcons.bars,
              color: blackColor,
            ),
            onTap: () {
              openSlideDrawer();
            },
          ),
        ),
        actions: [
          GestureDetector(
            child: LineIcon(LineIcons.plus, color: blackColor),
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
                  "Hi, ${userController.username.toString()} 👋",
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
        child: ListView(
          children: [
            Row(
              children: [
                SecondaryButton(
                  title: "Assignment Class",
                  icon: LineIcons.clipboardList,
                  focus: true,
                  color: secondColor,
                  // backgroundColor: secondColor.withOpacity(0.03),
                  onPress: () {},
                  radius: BorderRadius.circular(20),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: SlideDrawer(),
    );
  }
}

class SlideDrawer extends StatelessWidget {
  const SlideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Container(
      color: bgColor,
      width: sizeScreen.width * 0.22,
      padding: const EdgeInsets.only(right: 20),
      child: ListView(
        children: [
          SizedBox(height: 10),
          SecondaryButton(
            title: "Class",
            icon: LineIcons.home,
            focus: true,
            color: secondColor,
            backgroundColor: secondColor.withOpacity(0.03),
            radius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            onPress: () {},
          ),
          SecondaryButton(
            title: "Calendar",
            icon: LineIcons.calendar,
            focus: false,
            color: secondColor,
            // backgroundColor: greyColor.withOpacity(0.3),
            radius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            onPress: () {},
          ),
          // class mengajar
          teachClass(),

          // class terdaftar
          registeredClass(),

          SecondaryButton(
            title: "Archived Class",
            icon: LineIcons.archive,
            focus: false,
            color: secondColor,
            radius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            onPress: () {},
          ),
          SecondaryButton(
            title: "Setting",
            icon: LineIcons.americanSignLanguageInterpreting,
            focus: false,
            color: secondColor,
            radius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            onPress: () {},
          ),
        ],
      ),
    );
  }

  Widget teachClass() {
    return Column(
      children: [],
    );
  }

  Widget registeredClass() {
    return Column(
      children: [],
    );
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
              ).timeout(Duration(seconds: 2));
            },
            child: Text(
              "Invite user",
              style: blackTextFont.copyWith(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Get.close(0);
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
        userC.token,
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
