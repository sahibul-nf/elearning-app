part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();

  String? emailInput;
  String? passwordInput;

  bool securer = true;
  Icon iconSecure = Icon(LineIcons.eye, color: greyColor);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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

  void validateForm() {
    // AuthUserService authService = Get.put(AuthUserService());
    // User user = Get.put(User());
    UserController userC = Get.put(UserController());
    var cookieJar = CookieJar();

    final form = _keyForm.currentState;

    if (form!.validate()) {
      form.save();
      // authService.login(
      //   email: emailInput,
      //   password: passwordInput,
      // );

      // dio.interceptors.add(CookieManager(cookieJar));

      userC.userLogin(emailInput, passwordInput);
      
    }
  }

  void submitDataLogin() async {
    // String urlAPI = 'https://40c17614ccd1.ngrok.io/my-dictionary-server/login.php';
    // final apiResult = await http.post(
    //   urlAPI,
    //   body: {'username': usernameN, 'password': passwordN},
    // );

    // final data = jsonDecode(apiResult.body);

    // int value = data['value'];
    // String msg = data['msg'];

    // print(data);

    // // get data respon
    // String dataUsername = data['username'];
    // String dataEmail = data['email'];
    // String dataAddress = data['address'];
    // String dataGender = data['gender'];
    // String dataFullName = data['full_name'];
    // String dataCreatedAt = data['createdAt'];
    // String dataIdUser = data['id_user'];
    // String dataProfession = data['profession'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Responsive(
        desktop: desktop(),
        mobile: mobile(),
      ),
    );
  }

  Widget desktop() {
    var sizeScreen = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: form(screenWidth: sizeScreen.width * 0.3),
        ),
        Flexible(
          child: Container(
            height: sizeScreen.height,
            width: sizeScreen.width,
            child: Center(
              child: Image.asset(
                "assets/illus/Education-Illustration-Kit-09.png",
                height: sizeScreen.height * 0.8,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // TODO : mobile()
  Widget mobile() {
    return form();
  }

  form({double? screenWidth}) {
    return Form(
      key: _keyForm,
      child: Container(
        width: screenWidth,
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              "Welcome Back,\nLet's learn and improve your knowledge",
              style: blackTextFont.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 54,
            ),
            InputField(
              hintText: 'Your email',
              labelText: 'Email',
              prefixIcon: Icon(LineIcons.mailBulk, color: mainColor),
              userInputController: emailController,
              savedValue: (value) => emailInput = value!,
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
              savedValue: (value) => passwordInput = value!,
              validator: (value) => (value!.isEmpty)
                  ? 'Please input your password'
                  : (value.length < 6)
                      ? 'Password length min 6 character'
                      : null,
              // onTapped: () => onTappedIcon(),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 8),
              child: Text(
                'Forgot password?',
                style: blackTextFont.copyWith(),
              ),
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
                setState(() {
                  validateForm();
                });
              },
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have a account yet? ',
                  style: blackTextFont.copyWith(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/register");
                  },
                  child: Text(
                    'Sign Up',
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
