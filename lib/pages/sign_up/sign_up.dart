import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_app/common/utils/utils.dart';
import 'package:my_flutter_app/common/values/values.dart';
import 'package:my_flutter_app/common/widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();


  // sign up logo
  Widget _signUpLogo() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(
        'Sign up',
        style: TextStyle(
            fontSize: duSetFontSize(24),
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat'),
      ),
    );
  }

  // 注册表单
  Widget _signUpForm() {
    return Container(
      width: duSetWidth(295),
      child: Column(
        children: [
          inputTextEdit(
            controller: _nameController,
            hintText: 'Full name',
            keyboardType: TextInputType.text,
          ),
          inputTextEdit(
            controller: _emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          inputTextEdit(
            controller: _passController,
            hintText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(20)),
            width: duSetWidth(295),
            child: btnFlatButtonWidget(
              onPressed: () {
                if (!duCheckStringLength(
                    _nameController.value.text, 5)) {
                  toastInfo(msg: '用户名不能少于5位');
                  return;
                }
                if (!duIsEmail(_emailController.value.text)) {
                  toastInfo(msg: '请输入正确的邮箱');
                  return;
                }
                if (!duCheckStringLength(
                    _passController.value.text, 6)) {
                  toastInfo(msg: '密码不能小于6位');
                  return;
                }
                toastInfo(msg: '创建成功', backgroundColor: Colors.green);
                Navigator.pop(context);
              },
              title: 'Create an ccount',
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(20)),
            // height: duSetHeight(22),
            child: TextButton(
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

  // 有账号
  Widget _haveCount() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(30)),
      width: duSetWidth(295),
      child: btnFlatButtonWidget(
        onPressed: () {
          Navigator.pop(context);
        },
        bgColor: AppColors.secondaryElement,
        title: 'I have an count',
        fontColor: AppColors.primaryText,
        fontSize: duSetFontSize(16),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        context: context,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          highlightColor: Colors.transparent, // 实现点击按钮时去掉阴影效果
          splashColor: Colors.transparent, //实现点击按钮时去掉阴影效果
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            highlightColor: Colors.transparent, // 实现点击按钮时去掉阴影效果
            splashColor: Colors.transparent, // 实现点击按钮时去掉阴影效果
            onPressed: () {
              toastInfo(msg: '这是注册界面');
            },
          ),
        ],
      ),
      body: GestureDetector(
        child: Center(
          child: Column(
            children: [
              _signUpLogo(),
              _signUpForm(),
              Spacer(),
              _buildThirdPartyLogin(),
              _haveCount(),
            ],
          ),
        ),
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // 触摸收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
}
