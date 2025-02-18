/// [IRTimeModel] use for working with time.
/// in fact in IRTimePicker when you choose your time you will take a IRTimeModel? object.

class IRTimeModel {
  int hour;
  int minute;

  IRTimeModel({required this.hour, required this.minute});

  @override
  String toString() {
    return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
  }
}
