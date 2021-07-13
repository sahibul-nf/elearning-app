part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  // const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _keyForm = GlobalKey<FormState>();

  String? firstnameInput;

  String? lastnameInput;

  String? emailInput;

  String? passwordInput;

  String? confirmPasswordInput;

  bool securer = true;

  Icon iconSecure = Icon(LineIcons.eye, color: greyColor);

  var firstnameController = TextEditingController();

  var lastnameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  void onTappedSuffixIcon() {
    if (securer == true) {
      setState(() {
        securer = false;
        iconSecure = Icon(
          LineIcons.eyeSlash,
          color: greyColor,
        );
      });
    } else {
      setState(() {
        securer = true;
        iconSecure = Icon(
          LineIcons.eye,
          color: greyColor,
        );
      });
    }
  }

  validateForm() {
    AuthUserService authService = Get.put(AuthUserService());
    final form = _keyForm.currentState;

    if (form!.validate()) {
      form.save();
      authService.register(
        firstname: firstnameInput,
        lastname: lastnameInput,
        email: emailInput,
        password: passwordInput,
        confirmPassword: confirmPasswordInput,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        desktop: desktop(),
        mobile: mobile(),
      ),
    );
  }

  Widget mobile() {
    return form();
  }

  Widget desktop({var screenWidth}) {
    var sizeScreen = MediaQuery.of(context).size;
    return Row(
      children: [
        Flexible(
          child: Container(
            height: sizeScreen.height,
            width: sizeScreen.width,
            child: Center(
              child: Image.asset(
                "assets/illus/Education-Illustration-Kit-01.png",
                height: sizeScreen.height * 0.8,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 40),
          child: form(screenWidth: sizeScreen.width * 0.3),
        ),
      ],
    );
  }

  form({double? screenWidth}) {
    return Form(
      key: _keyForm,
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Let's Begin!",
              style: blackTextFont.copyWith(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InputField(
              hintText: 'Your firstname',
              labelText: 'Firstname',
              prefixIcon: Icon(LineIcons.user, color: mainColor),
              userInputController: firstnameController,
              savedValue: (value) => firstnameInput = firstnameController.text,
              validator: (value) =>
                  (value!.isEmpty) ? 'Please input your firstname' : null,
            ),
            InputField(
              hintText: 'Your lastname',
              labelText: 'Lastname',
              prefixIcon: Icon(LineIcons.user, color: mainColor),
              userInputController: lastnameController,
              savedValue: (value) => lastnameInput = lastnameController.text,
              // validator: (value) =>
              //     (value!.isEmpty) ? 'Please input your lastname' : null,
            ),
            InputField(
              hintText: 'Your email',
              labelText: 'Email',
              prefixIcon: Icon(LineIcons.mailBulk, color: mainColor),
              userInputController: emailController,
              savedValue: (value) => emailInput = emailController.text,
              validator: (value) => (value!.isEmpty)
                  ? 'Please input your email'
                  : (!GetUtils.isEmail(value))
                      ? 'Email invalid'
                      : null,
            ),
            InputField(
              hintText: 'Your password',
              labelText: 'Password',
              prefixIcon: Icon(LineIcons.lock, color: mainColor),
              suffixIcon: GestureDetector(
                child: iconSecure,
                onTap: () => onTappedSuffixIcon(),
              ),
              secure: securer,
              userInputController: passwordController,
              savedValue: (value) => passwordInput = passwordController.text,
              validator: (value) => (value!.isEmpty)
                  ? 'Please input your password'
                  : (value.length < 6)
                      ? 'Password length min 6 character'
                      : null,
              // onTapped: () => onTappedIcon(),
            ),
            InputField(
              hintText: 'Confirm your password',
              labelText: 'Confirm password',
              prefixIcon: Icon(LineIcons.lock, color: mainColor),
              suffixIcon: GestureDetector(
                child: iconSecure,
                onTap: () => onTappedSuffixIcon(),
              ),
              secure: securer,
              userInputController: confirmPasswordController,
              savedValue: (value) =>
                  confirmPasswordInput = confirmPasswordController.text,
              validator: (value) => (value!.isEmpty)
                  ? 'Please input confirm your password'
                  : (value.length < 6)
                      ? 'Password length min 6 character'
                      : null,
            ),
            SizedBox(
              height: 40,
            ),
            FloatingActionButton(
              elevation: 0,
              backgroundColor: secondColor,
              splashColor: greyColor,
              child: Icon(Icons.arrow_forward),
              onPressed: () {
                validateForm();
              },
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have acoount? ",
                  style: blackTextFont.copyWith(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/login");
                  },
                  child: Text(
                    "Sign In",
                    style: mainTextFont.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
