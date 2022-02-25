import 'package:dating_app/presentation/Forms/login.dart';
import 'package:dating_app/presentation/Forms/my_form_field.dart';
import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../utils/mixins.dart';

class SignUp extends StatefulWidget with InputValidationMixin {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with InputValidationMixin {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController signUPpasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  double borderRadius = 8;
  double textformgap = 20;
  double dropdowngap = 20;
  double dropdownfontSize = 12;
  double horizontalPAdding = 40;
  bool isHidden = true;
  IconData icon = Icons.visibility_off_outlined;

  bool buttonPressed = false;

  String? gradeError;
  String? provinceError;
  String? districtError;

  _validateForm() {
    bool _isValid = formkey.currentState!.validate();

    if (selectedGrade == null) {
      setState(() {
        gradeError = 'Please Select Gender';
      });
      _isValid = false;
    }

    if (selectedProvince == null) {
      setState(() {
        provinceError = 'Please Select Province';
      });
      _isValid = false;
    }

    if (selectedDistrict == null) {
      setState(() {
        districtError = 'Please Select District';
      });
      _isValid = false;
    }

    if (_isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => const Login()),
        ),
      );
    }
  }

  String? selectedGrade;
  String? selectedProvince;
  String? selectedDistrict;

  List<String> districts = [];

  // List<String> grade = ['Male', 'Female', 'Others'];

  @override
  void initState() {
    buttonPressed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              '         Sign Up',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPAdding,
              ),
              child: CustomFormField(
                formkey: formkey,
                controller: firstNameController,
                validator: (value) {
                  return isFirstName(value!) ? null : 'First Name Required';
                },
                inputType: TextInputType.name,
                lableText:
                    // buttonPressed == true
                    //     ? firstNameController.text == ''
                    //         ? 'Please Enter First Name'
                    //         : 'First Name'
                    //     :
                    'First Name',
                obscureText: false,
                prefixIcon: Icons.person,
                iconssuffix: null,
                suffixicon: null,
              ),
            ),
            SizedBox(
              height: textformgap,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPAdding,
              ),
              child: CustomFormField(
                formkey: formkey,
                controller: lastNameController,
                validator: (value) {
                  return isLastName(value!) ? null : 'Last Name Required';
                },
                inputType: TextInputType.name,
                lableText: 'Last Name',
                obscureText: false,
                prefixIcon: Icons.person,
                iconssuffix: null,
                suffixicon: null,
              ),
            ),
            SizedBox(
              height: textformgap,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPAdding,
              ),
              child: CustomFormField(
                length: 10,
                formkey: formkey,
                controller: phoneController,
                validator: (value) {
                  return isPhone(value!) ? null : 'Invalid Phone Number';
                },
                lableText: 'Phone Number',
                iconssuffix: null,
                prefixIcon: Icons.phone_android,
                obscureText: false,
                inputType: TextInputType.phone,
                prefixtext: '+977 ',
                maxlength: 10,
              ),
            ),
            SizedBox(
              height: textformgap,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPAdding,
              ),
              child: CustomFormField(
                textCap: TextCapitalization.none,
                formkey: formkey,
                controller: emailController,
                validator: (value) {
                  return isEmailValid(value!)
                      ? null
                      : 'Enter a valid email address';
                },
                lableText: 'Email',
                iconssuffix: null,
                prefixIcon: Icons.email_outlined,
                obscureText: false,
                inputType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: textformgap,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPAdding,
              ),
              child: CustomFormField(
                textCap: TextCapitalization.none,
                formkey: formkey,
                controller: signUPpasswordController,
                validator: (value) {
                  return isSignUpPasswordValid(value!)
                      ? null
                      : 'Atleast 8 character required';
                },
                lableText: 'Password',
                suffixicon: InkWell(
                  onTap: () {
                    if (isHidden == true) {
                      isHidden = false;
                      icon = Icons.visibility;
                    } else {
                      isHidden = true;
                      icon = Icons.visibility_off_outlined;
                    }
                    setState(() {});
                  },
                  child: Icon(
                    icon,
                    color: Colors.grey[400],
                    size: 18,
                  ),
                ),
                prefixIcon: Icons.lock,
                obscureText: isHidden,
                inputType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: textformgap,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Province Drop Down
                Container(
                  margin: EdgeInsets.symmetric(horizontal: horizontalPAdding),
                  padding: const EdgeInsets.all(10),
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: buttonPressed == true
                        ? selectedProvince == null
                            ? Border.all(width: 1, color: Colors.red[700]!)
                            : Border.all(width: 0.5, color: Colors.grey[200]!)
                        : Border.all(width: 0.5, color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        hint: provinceError == null
                            ? Text(
                                '  Select Province',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: dropdownfontSize,
                                ),
                              )
                            : Text(
                                '  Please Select Province',
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontSize: 9,
                                ),
                              ),
                        value: selectedProvince,
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey[400],
                        ),
                        items: Constant.provinces
                            .map<DropdownMenuItem<String>>((String values) {
                          return DropdownMenuItem<String>(
                            value: values,
                            child: Text(
                              values,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (province) {
                          if (province == 'Province No. 1') {
                            districts = Constant.provinceOneDistrict;
                          } else if (province == 'Province No. 2') {
                            districts = Constant.provinceTwoDistrict;
                          } else if (province == 'Province No. 3') {
                            districts = Constant.provinceThreeDistrict;
                          } else if (province == 'Province No. 4') {
                            districts = Constant.provinceFourDistrict;
                          } else if (province == 'Province No. 5') {
                            districts = Constant.provinceFiveDistrict;
                          } else {
                            districts = [];
                          }
                          setState(() {
                            selectedDistrict = null;
                            selectedProvince = province;
                            provinceError = null;
                          });
                        }),
                  ),
                ),

                SizedBox(
                  height: dropdowngap,
                ),
                //District Drop Down
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: horizontalPAdding,
                    // vertical: 10,
                  ),
                  padding: const EdgeInsets.all(10),
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: buttonPressed == true
                        ? selectedDistrict == null
                            ? Border.all(width: 1, color: Colors.red[700]!)
                            : Border.all(width: 0.5, color: Colors.grey[200]!)
                        : Border.all(width: 0.5, color: Colors.grey[200]!),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        hint: districtError == null
                            ? Text(
                                '  Select District',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: dropdownfontSize,
                                ),
                              )
                            : Text(
                                '  Please Select District',
                                style: TextStyle(
                                  color: Colors.red[700],
                                  fontSize: 9,
                                ),
                              ),
                        value: selectedDistrict,
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey[400],
                        ),
                        items: districts.map((String values) {
                          return DropdownMenuItem<String>(
                            value: values,
                            child: Text(
                              values,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (district) {
                          setState(() {
                            selectedDistrict = district;
                            districtError = null;
                          });
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: dropdowngap,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPAdding,
              ),
              child: CustomFormField(
                formkey: formkey,
                controller: schoolController,
                validator: (value) {
                  return isSchoolName(value!) ? null : 'Invalid School Name';
                },
                lableText: 'School Name',
                iconssuffix: null,
                prefixIcon: Icons.school_outlined,
                obscureText: false,
                inputType: TextInputType.name,
              ),
            ),
            SizedBox(
              height: textformgap,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: horizontalPAdding),
              padding: const EdgeInsets.all(10),
              height: 47,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: buttonPressed == true
                    ? selectedGrade == null
                        ? Border.all(width: 1, color: Colors.red[700]!)
                        : Border.all(width: 0.5, color: Colors.grey[200]!)
                    : Border.all(width: 0.5, color: Colors.grey[200]!),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: gradeError == null
                      ? Text(
                          '  Select Grade',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: dropdownfontSize,
                          ),
                        )
                      : Text(
                          '  Please Select Grade',
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 9,
                          ),
                        ),
                  isExpanded: true,
                  value: selectedGrade,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey[400],
                  ),
                  items: Constant.grade.map((String values) {
                    return DropdownMenuItem<String>(
                      value: values,
                      child: Text(
                        values,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (grade) {
                    setState(() {
                      selectedGrade = grade;
                      gradeError = null;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: textformgap,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  buttonPressed = true;
                });

                _validateForm();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: horizontalPAdding),
                padding: const EdgeInsets.all(10),
                height: 47,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.green],
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
