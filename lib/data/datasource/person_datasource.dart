import 'package:clean_arc_login/data/dto/person.dart';

abstract class PersonDatasourceBluePrint {
  PersonDTO getPerson({String? email});
}

class PersonDatasource extends PersonDatasourceBluePrint {
  PersonDatasource();

  @override
  PersonDTO getPerson({String? email}) {
    return PersonDTO.fromJson({'email': email ?? ''});
  }
}
