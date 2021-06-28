part of 'pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _keyForm = GlobalKey<FormState>();
  User user = Get.put(User());

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
              Get.defaultDialog(
                title: '',
                content: formCreateClass(),
              );
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
    ClassService classService = Get.put(ClassService());
    final form = _keyForm.currentState;

    if (form!.validate()) {
      form.save();

      // ClassService.classes();
      classService.createNewClass(
        className: titleInput,
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
                setState(() {
                  validateForm();
                });
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
            validator: (value) =>
                (value!.isEmpty)
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
