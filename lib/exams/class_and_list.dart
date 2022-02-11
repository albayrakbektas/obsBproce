class ExamInformation {
  String name;
  String type;
  String date;
  String classroom;

  ExamInformation(this.name, this.type, this.date, this.classroom);
}

var examInformationList = <ExamInformation>[
  ExamInformation('Project', 'Vize', '01.10.2021', 'B-256'),
  ExamInformation('Analysis', 'Final', '02.10.2021', 'B-254'),
  ExamInformation('Analysis', 'Quiz', '02.10.2021', 'B-254'),
];
