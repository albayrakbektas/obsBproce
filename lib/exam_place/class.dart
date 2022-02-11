class CurrentExam {
  String floorPlan = '40';
  // CurrentExam(this.floorPlan);
}

isCurrentExamPlan() {
  if (CurrentExam().floorPlan == '') {
    return false;
  }
  return true;
}
