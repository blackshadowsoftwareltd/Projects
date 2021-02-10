class Question {
  final int id, answer;
  final String question;
  final List<String> option;

  Question({this.id, this.answer, this.option, this.question});
}

const List sample_data = [
  {
    'id': 1,
    'question': 'Flutter created by _______ ',
    'options': ['Apple', 'Google', 'Facebook', 'Microsoft'],
    'answer_index': 1,
  },
  {
    'id': 2,
    'question': 'When Google release Flutter _______ ',
    'options': ['Jan 2017', 'Jun 2018', 'May 2017', 'May 2018'],
    'answer_index': 2,
  },
  {
    'id': 3,
    'question': 'Flutter depend on _______ ',
    'options': ['Java', 'Python', 'Dart', 'React JS'],
    'answer_index': 2,
  },
  {
    'id': 4,
    'question': 'What is the correct _______ ',
    'options': ['printf()', 'print()', 'echo', 'Sout()'],
    'answer_index': 1,
  },
];
