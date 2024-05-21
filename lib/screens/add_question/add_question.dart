import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../firebase/firebase_service.dart';
import '../../model/question.dart';
import '../../utils/app_utils.dart';

class AddQuestion extends StatefulWidget {
  Question? question;

  AddQuestion({this.question});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  XFile? _newImage;
  String? existingImageUrl;

  // DbHelper _dbHelper = DbHelper();

  int selectedOption = 1;

  // int categoryId = -1;
  // List<Category> categoryList = [];
  bool _isChecked = false;

  String _question = '', _op1 = '', _op2 = '', _op3 = '';
  int answer = 1;

  final FirebaseService _service = FirebaseService();

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_isChecked) {
        if (_newImage == null && existingImageUrl == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please select an Image'),
              duration: Duration(seconds: 5),
            ),
          );
        } else {
          _formKey.currentState!.save();

          _service
              .addQuestion(
              que: _question,
              op1: _op1,
              op2: _op2,
              op3: _op3,
              newImage: _newImage,
              context: context,
              qId: widget.question?.id,
              createdAt: widget.question?.createdAt,
              existingImageUrl: existingImageUrl,
              isImage: true,
              ans: answer)
              .then(
                (value) {
              if (value) {
                print('Question added successfully with image');
                Navigator.pop(context);
              } else {}
            },
          );
        }
      } else {
        _formKey.currentState!.save();

        _service
            .addQuestion(
            que: _question,
            op1: _op1,
            op2: _op2,
            op3: _op3,
            newImage: null,
            context: context,
            qId: widget.question?.id,
            createdAt: widget.question?.createdAt,
            existingImageUrl: existingImageUrl,
            isImage: false,
            ans: answer)
            .then(
              (value) {
            if (value) {
              print('Question added successfully without image');
              Navigator.pop(context);
            } else {}
          },
        );
      }
    }
  }

  Future<void> _pickImage() async {
    var image = await AppUtil.pickImageFromGallery();
    if (image != null) {
      setState(() {
        _newImage = image;
        print('image path : ${_newImage!.path}');
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a Question"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                buildQuestionForm(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Add Image'),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                      print('Checked value : ${_isChecked}');
                    });
                  },
                ),
                Visibility(
                  visible: _isChecked,
                  child: GestureDetector(
                    onTap: () {
                      print('Select Image');
                      _pickImage();
                    },
                    child: _newImage == null && existingImageUrl != null
                        ? Container(
                            width: size.width * 0.8,
                            height: size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                existingImageUrl!,
                              ),
                            ),
                          )
                        : _newImage != null
                            ? Container(
                                width: size.width * 0.8,
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Image.file(
                                    File(_newImage!.path),
                                  ),
                                ),
                              )
                            : Container(
                                width: size.width * 0.8,
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: CircleAvatar(
                                        radius: 30,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.add,
                                        size: 50,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ListTile(
                  title: buildOptionForm(1),
                  leading: Radio(
                    value: 1,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                        answer = selectedOption;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ListTile(
                  title: buildOptionForm(2),
                  leading: Radio(
                    value: 2,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                        answer = selectedOption;

                      });
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                ListTile(
                  title: buildOptionForm(3),
                  leading: Radio(
                    value: 3,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                        answer = selectedOption;

                      });
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                // buildAnsform(),

                MaterialButton(
                  color: Colors.purpleAccent.shade200,
                  minWidth: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_isChecked == true) {
                        if (_newImage == null && existingImageUrl == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select an Image'),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }
                      }
                    });
                    _submitForm(context);
                  },
                  child: const Text(
                    "Submit the Question",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildQuestionForm() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      // maxLines: 3,
      onSaved: (newValue) {
        _question = newValue.toString();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter the Question';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: "Question",
        hintText: 'Question',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  Widget buildOptionForm(int optionNumber) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      onSaved: (newValue) {
        switch (optionNumber) {
          case 1:
            _op1 = newValue.toString();
            break;
          case 2:
            _op2 = newValue.toString();
            break;
          case 3:
            _op3 = newValue.toString();
            break;
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Option $optionNumber';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: "Option $optionNumber",
        hintText: 'Option $optionNumber',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }
}
