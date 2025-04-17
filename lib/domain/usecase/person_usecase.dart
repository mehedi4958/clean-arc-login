import 'package:clean_arc_login/data/mapper/person_mapper.dart';
import 'package:clean_arc_login/domain/entity/person_entity.dart';

abstract class PersonUseCase {
  PersonEntity getPerson({String? email});
  final PersonMapper _personMapper = PersonMapper();
}

class PersonUserCaseImpl extends PersonUseCase {
  @override
  PersonEntity getPerson({String? email}) {
    PersonEntity personEntity = _personMapper.getPerson(email: email);
    return PersonEntity(email: '');
  }
}
