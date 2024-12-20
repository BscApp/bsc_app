sealed class HebergeEvent {}
class HebergesEventFetch extends HebergeEvent {}
class HebergesEventFetchAvailable extends HebergeEvent {
  final DateTime date;
  HebergesEventFetchAvailable(this.date);
}

