import 'package:sei_services/src/modules/private/processing/domain/entities/processing_entity.dart';
import 'package:sei_services/src/shared/util/from_api_util/from_api_type_util.dart';

class ProcessingModel extends ProcessingEntity {
  ProcessingModel({required code, required date})
      : super(code: code, date: date);

  factory ProcessingModel.fromMap(Map map) {
    return ProcessingModel(
      code: FromApiTypeUtil.toMyString(map['code'], defaultValue: '---'),
      date: FromApiTypeUtil.toDateTime(map['date'], defaultValue: DateTime.now()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'date': date.toString(),
    };
  }
}
