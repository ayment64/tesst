class Data {
  int date;
  int states;
  int positive;
  int negative;
  int pending;
  int hospitalizedCurrently;
  int hospitalizedCumulative;
  int inIcuCurrently;
  int inIcuCumulative;
  int onVentilatorCurrently;
  int onVentilatorCumulative;
  String dateChecked;
  int death;
  int hospitalized;
  int totalTestResults;
  String lastModified;
  Null recovered;
  int total;
  int posNeg;
  int deathIncrease;
  int hospitalizedIncrease;
  int negativeIncrease;
  int positiveIncrease;
  int totalTestResultsIncrease;
  String hash;

  Data(
      {this.date,
      this.states,
      this.positive,
      this.negative,
      this.pending,
      this.hospitalizedCurrently,
      this.hospitalizedCumulative,
      this.inIcuCurrently,
      this.inIcuCumulative,
      this.onVentilatorCurrently,
      this.onVentilatorCumulative,
      this.dateChecked,
      this.death,
      this.hospitalized,
      this.totalTestResults,
      this.lastModified,
      this.recovered,
      this.total,
      this.posNeg,
      this.deathIncrease,
      this.hospitalizedIncrease,
      this.negativeIncrease,
      this.positiveIncrease,
      this.totalTestResultsIncrease,
      this.hash});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    states = json['states'];
    positive = json['positive'];
    negative = json['negative'];
    pending = json['pending'];
    hospitalizedCurrently = json['hospitalizedCurrently'];
    hospitalizedCumulative = json['hospitalizedCumulative'];
    inIcuCurrently = json['inIcuCurrently'];
    inIcuCumulative = json['inIcuCumulative'];
    onVentilatorCurrently = json['onVentilatorCurrently'];
    onVentilatorCumulative = json['onVentilatorCumulative'];
    dateChecked = json['dateChecked'];
    death = json['death'];
    hospitalized = json['hospitalized'];
    totalTestResults = json['totalTestResults'];
    lastModified = json['lastModified'];
    recovered = json['recovered'];
    total = json['total'];
    posNeg = json['posNeg'];
    deathIncrease = json['deathIncrease'];
    hospitalizedIncrease = json['hospitalizedIncrease'];
    negativeIncrease = json['negativeIncrease'];
    positiveIncrease = json['positiveIncrease'];
    totalTestResultsIncrease = json['totalTestResultsIncrease'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['states'] = this.states;
    data['positive'] = this.positive;
    data['negative'] = this.negative;
    data['pending'] = this.pending;
    data['hospitalizedCurrently'] = this.hospitalizedCurrently;
    data['hospitalizedCumulative'] = this.hospitalizedCumulative;
    data['inIcuCurrently'] = this.inIcuCurrently;
    data['inIcuCumulative'] = this.inIcuCumulative;
    data['onVentilatorCurrently'] = this.onVentilatorCurrently;
    data['onVentilatorCumulative'] = this.onVentilatorCumulative;
    data['dateChecked'] = this.dateChecked;
    data['death'] = this.death;
    data['hospitalized'] = this.hospitalized;
    data['totalTestResults'] = this.totalTestResults;
    data['lastModified'] = this.lastModified;
    data['recovered'] = this.recovered;
    data['total'] = this.total;
    data['posNeg'] = this.posNeg;
    data['deathIncrease'] = this.deathIncrease;
    data['hospitalizedIncrease'] = this.hospitalizedIncrease;
    data['negativeIncrease'] = this.negativeIncrease;
    data['positiveIncrease'] = this.positiveIncrease;
    data['totalTestResultsIncrease'] = this.totalTestResultsIncrease;
    data['hash'] = this.hash;
    return data;
  }
}
