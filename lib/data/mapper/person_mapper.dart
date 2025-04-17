import 'package:clean_arc_login/data/datasource/person_datasource.dart';
import 'package:clean_arc_login/data/dto/person.dart';
import 'package:clean_arc_login/domain/entity/person_entity.dart';

class PersonMapper {
  final PersonDatasource _personDatasource = PersonDatasource();
  PersonEntity getPerson({String? email}) {
    PersonDTO personDTO = _personDatasource.getPerson(email: email);
    PersonEntity personEntity = PersonEntity.fromJson(personDTO.toJson());
    return personEntity;
  }
}
