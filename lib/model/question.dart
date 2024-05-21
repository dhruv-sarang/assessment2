class Question {
  String? id;
  String que;
  String op1;
  String op2;
  String op3;
  bool isImage;
  String signImageUrl;
  int ans;
  int createdAt;

  Question(
      {this.id,
        required this.que,
        required this.op1,
        required this.op2,
        required this.op3,
        required this.isImage,
        required this.signImageUrl,
        required this.ans,
        required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'que': this.que,
      'op1': this.op1,
      'op2': this.op2,
      'op3': this.op3,
      'isImage': this.isImage,
      'signImageUrl': this.signImageUrl,
      'ans': this.ans,
      'createdAt': this.createdAt,
    };
  }

  factory Question.fromMap(Map<dynamic, dynamic> map) {
    return Question(
      id: map['id'] as String,
      que: map['que'] as String,
      op1: map['op1'] as String,
      op2: map['op2'] as String,
      op3: map['op3'] as String,
      isImage: map['isImage'] as bool,
      signImageUrl: map['signImageUrl'] as String,
      ans: map['ans'] as int,
      createdAt: map['createdAt'] as int,
    );
  }
}
