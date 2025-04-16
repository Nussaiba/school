import 'package:school/api_link.dart';
import 'package:school/core/class/crud.dart';

class EventsData {
  Crud crud;
  EventsData(this.crud);

  getAllEventsData(int studentid) async {
    var response = await crud.getData("${AppLink.events}/$studentid");
    return response.fold((l) => l, (r) => r);
  }
}
