class DateFormater {
  static getDate(String date) {
    return date.substring(11).split('.')[0];
  }
}
