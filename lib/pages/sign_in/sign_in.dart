import 'package:flutter/material.dart';
import 'package:my_flutter_app/common/utils/utils.dart';
import 'package:my_flutter_app/common/values/values.dart';
import 'package:my_flutter_app/common/widgets/widgets.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  /// 跳转 注册界面
  _handleNavSignUp() {
    Navigator.pushNamed(context, '/sign_up');
  }

  // 执行登录操作
  _handleSignIn() {
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请正确输入邮件');
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }
  }

  /// logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(40 + 44.0)), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // 子项占满整个交叉轴
        children: [
          Container(
            height: duSetWidth(76),
            width: duSetWidth(76),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(17)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: duSetWidth(76),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                      boxShadow: [
                        Shadows.primaryShadow,
                      ],
                      borderRadius: BorderRadius.all(
                          Radius.circular(duSetWidth(76 * 0.5))), // 父容器的50%
                    ),
                    // child: Container(),
                  ),
                ),
                Positioned(
                  top: duSetWidth(13),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  /// 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(50)),
      child: Column(
        children: [
          // email输入框
          inputTextEdit(
            controller: _emailController,
            marginTop: 0,
            hintText: 'Email',
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
          ),
          // password输入框
          inputTextEdit(
            controller: _passController,
            marginTop: 15,
            hintText: 'Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(20)),
            height: duSetHeight(44),
            child: Row(
              children: [
                btnFlatButtonWidget(
                  onPressed: _handleNavSignUp,
                  bgColor: AppColors.thirdElement,
                  title: 'Sign up',
                ),
                Spacer(),
                btnFlatButtonWidget(
                  onPressed: _handleSignIn,
                  bgColor: AppColors.primaryElement,
                  title: 'Sign in',
                ),
              ],
            ),
          ),

          /// forgot password
          Container(
            margin: EdgeInsets.only(top: duSetHeight(20)),
            height: duSetHeight(22),
            child: FlatButton(
              onPressed: () => {},
              child: Text(
                'Forgot password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      width: duSetWidth(295),
      child: Column(
        children: [
          Text(
            'Or sign in with social networks',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconName: 'twitter',
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconName: 'google',
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  iconName: 'facebook',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 注册按钮
  // Widget _buildSignUpButton() {
  //   return Container();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: <Widget>[
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            // _buildSignUpButton(),
          ],
        ),
      ),
    );
  }
}
