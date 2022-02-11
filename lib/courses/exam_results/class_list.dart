// class Exam2 {
//   String score;
//   String highScore;
//   String lowScore;
//   String classAverage;
//   String standardDeviation;
//   String answerKeyLink;
//
//   Exam2(this.score, this.highScore, this.lowScore, this.classAverage,
//       this.standardDeviation, this.answerKeyLink);
// }
//
// final examList = <Exam2>{
//   Exam2('100', '100', '30', '40', '25', ''),
//   Exam2('100', '100', '25', '35', '40', 'https://github.com/albayrakbektas'),
//   Exam2('100', '100', '30', '40', '25', ''),
// };
//
// gradeAverage() {
//   int sum = 0;
//   double res = 0;
//   var newList = examList.map((e) => e.score);
//   for (var values in newList) {
//     sum += int.parse(values);
//   }
//   res = sum / newList.length;
//   return res.toStringAsFixed(2);
// }
//
// percentOfGradeAverage() {
//   double res = double.parse(gradeAverage());
//   return (res * 30 / 100).toStringAsFixed(2);
// }
//
// class ExamEvaluation {
//   String type;
//   String percent;
//   String evaluationFormula;
//   List<Exam2> exams;
//   String total;
//
//   ExamEvaluation(
//       this.type, this.percent, this.evaluationFormula, this.exams, this.total);
// }
//
// var quizList = <ExamEvaluation>[
//   ExamEvaluation('Quiz', '30', 'evaluationFormula', examList.toList(), 'total')
// ];
//
// var vizeList = <ExamEvaluation>[
//   ExamEvaluation('Vize', '30', 'evaluationFormula', examList.toList(), 'total')
// ];
//
// var finalList = <ExamEvaluation>[
//   ExamEvaluation('Final', '40', 'evaluationFormula', examList.toList(), 'total')
// ];
//
// somethign() {
//   print('objects');
//   print(vizeList[0].exams);
// }
//
// final examTypes = ['Quiz', 'Vize', 'Final'];
