import 'package:flutter/material.dart';
import 'package:rto_assessment2/model/question.dart';

import '../../firebase/firebase_service.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  List<Question> _questions = [];
  FirebaseService _service = FirebaseService();

  // List<bool> _isCheckedList = [];

  Future<void> _loadQuestion() async {
    List<Question> questions = await _service.loadQuestions();
    setState(() {
      _questions = questions;
      // _isCheckedList = List.generate(_questions.length, (index) => false);
      print(' qqqq : ${_questions}');
      _filteredQuestions = _questions;
    });
  }
  bool showImage = false;

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  List<Question> _filteredQuestions = [];
  String _selectedOption = 'All Questions';

  void _filterQuestions(String option) {
    setState(() {
      _selectedOption = option;
      if (option == 'With Sign') {
        _filteredQuestions = _questions.where((question) => question.signImageUrl.isNotEmpty).toList();
      } else if (option == 'Without Sign') {
        _filteredQuestions = _questions.where((question) => question.signImageUrl.isEmpty).toList();
      } else if(option == 'All Questions') {
        _filteredQuestions = _questions;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Question Bank",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 1),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 26,
            color: Colors.white,
          ),
        ),
      ),
      body: _questions.isNotEmpty
          ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 300,
                    height: 50,
                    child: DropdownButtonFormField<String>(
                      value: _selectedOption,
                      items: ['All Questions', 'With Sign', 'Without Sign'].map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (String? option) {
                        if (option != null) {
                          _filterQuestions(option);
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredQuestions.length,
                    itemBuilder: (context, index) {
                      Question question = _filteredQuestions[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Card(
                          color: Colors.indigoAccent.shade100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                leading: Text('${index + 1}.',
                                    style: TextStyle(fontSize: 20)),
                                title: Text('${question.que}',
                                    style: TextStyle(fontSize: 20)),
                                // trailing: Checkbox(
                                //   value: _isCheckedList[index],
                                //   onChanged: (value) {
                                //     setState(() {
                                //       _isCheckedList[index] = value!;
                                //       print('${index} ${_isCheckedList[index]}');
                                //     });
                                //   },
                                // ),
                              ),
                              Visibility(
                                visible: question.signImageUrl != '',
                                child: Center(
                                  child: Container(
                                    width: size.width * 0.8,
                                    height: size.height * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.network(question.signImageUrl),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                // visible: question.ans == 1,
                                child: ListTile(
                                  leading: Radio(
                                    value: 1,
                                    groupValue: question.ans,
                                    onChanged: (value) {},
                                  ),
                                  title: Text(question.op1),
                                ),
                              ),
                              Visibility(
                                // visible: question.ans == 2,
                                child: ListTile(
                                  leading: Radio(
                                    value: 2,
                                    groupValue: question.ans,
                                    onChanged: (value) {},
                                  ),
                                  title: Text(question.op2),
                                ),
                              ),
                              Visibility(
                                // visible: question.ans == 3,
                                child: ListTile(
                                  leading: Radio(
                                    value: 3,
                                    groupValue: question.ans,
                                    onChanged: (value) {},
                                  ),
                                  title: Text(question.op3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
