import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../firebase/firebase_service.dart';
import '../../model/question.dart';

class StartTest extends StatefulWidget {
  const StartTest({super.key});

  @override
  State<StartTest> createState() => _StartTestState();
}

class _StartTestState extends State<StartTest> {
  int currentQuestionIndex = 0;
  bool showResult = false;
  int selectedAnswers = 0;
  List<int> correctAnswers = [];
  int correctAnswerCount = 0;
  int wrongAns = 0;

  Timer? _questionTimer;
  int _timeLeft = 48;

  void startTimer() {
    _questionTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          timer.cancel();
          // moveToNextQuestion();
        }
      });
    });
  }

  final List<Question> questions = [];
  FirebaseService _service = FirebaseService();

// List<bool> _isCheckedList = [];

  Future<void> _loadQuestion() async {
    List<Question> loadedQuestions = await _service.loadQuestions();

    // Shuffle the loaded questions list
    loadedQuestions.shuffle();

    // Select the first 15 questions from the shuffled list
    List<Question> selectedQuestions = loadedQuestions.take(15).toList();

    setState(() {
      questions.clear();
      questions.addAll(selectedQuestions);
      print('Loaded questions: $questions');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadQuestion();
    startTimer();
  }

  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: RichText(
          text: TextSpan(
            text: 'Test\n',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 1),
            // style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: '${FirebaseAuth.instance.currentUser!.email}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.yellow,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
            ],
          ),
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: showResult
            ? showQuizResult() // Display quiz result if showResult is true
            : questions.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : buildTestScreen(), // Display quiz screen otherwise
      ),
    );
  }

  Widget buildTestScreen() {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 80,
                    color: Colors.green,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.check),
                        Text('$correctAnswerCount',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 80,
                    color: Colors.red,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.close),
                          Text('$wrongAns',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.timer_outlined),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    '$_timeLeft Sec',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 130,
            decoration: BoxDecoration(
                color: Colors.indigoAccent.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${currentQuestionIndex}/${questions.length}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Questions",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Text(
                  "Question ${currentQuestionIndex + 1}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '${questions[currentQuestionIndex].que}',
                  style: TextStyle(fontSize: 18),
                ),
                Visibility(
                  visible:
                      '${questions[currentQuestionIndex].signImageUrl}' != '',
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
                        child: Image.network(
                            questions[currentQuestionIndex].signImageUrl),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Radio(
                    value: 1,
                    groupValue: selectedAnswers,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswers = value!;
                      });
                    },
                  ),
                  title: Text(questions[currentQuestionIndex].op1),
                ),
                ListTile(
                  leading: Radio(
                    value: 2,
                    groupValue: selectedAnswers,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswers = value!;
                      });
                    },
                  ),
                  title: Text(questions[currentQuestionIndex].op2),
                ),
                ListTile(
                  leading: Radio(
                    value: 3,
                    groupValue: selectedAnswers,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswers = value!;
                      });
                    },
                  ),
                  title: Text(questions[currentQuestionIndex].op3),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFF124DAC))),
            onPressed: () {
              if (selectedAnswers == 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please select an answer!')),
                );
                return;
              }
              if (selectedAnswers == questions[currentQuestionIndex].ans) {
                correctAnswerCount++;
                print("Current");
              }
              if (selectedAnswers != questions[currentQuestionIndex].ans) {
                wrongAns++;
                print("Current");
              }
              if (currentQuestionIndex < questions.length - 1) {
                setState(() {
                  currentQuestionIndex++;
                  selectedAnswers = 0;
                  _timeLeft = 48;
                });
              } else {
                setState(() {
                  showResult = true;
                });
              }
            },
            child: Text(
                currentQuestionIndex == questions.length - 1
                    ? 'Finish Test'
                    : 'Next',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget showQuizResult() {
    // int wrongAns = questions.length - correctAnswerCount;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Test Completed!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result - ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.green,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.check),
                  Text('$correctAnswerCount',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              )),
            ),
            Container(
              height: 50,
              width: 100,
              color: Colors.red,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.close),
                    Text('$wrongAns',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
        // Text(
        //   'Your Correct Answers: $correctAnswerCount/${questions.length}',
        //   style: TextStyle(fontSize: 18),
        // ),
      ],
    );
  }
}
