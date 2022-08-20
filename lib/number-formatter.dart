class NumberFormatter {
  static String format(String text) {
    try {
      double parsedNumber = double.parse(text);
      if((parsedNumber != double.infinity) && (parsedNumber == parsedNumber.floor())) {
        return parsedNumber.truncate().toString();
      }
    }
        catch(err) {return text;}
    return text;
  }
}