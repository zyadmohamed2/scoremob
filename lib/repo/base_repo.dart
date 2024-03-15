import 'package:scoremob/data/api/api_client.dart';
import 'package:scoremob/data/model/base_response.dart';

abstract mixin class BaseRepo {
  ApiClient apiClient = ApiClient();

  void checkError(BaseResponse? response, String errorMsg) {
    if ((response?.errors.toString() != "[]") &&
        (response?.errors?.toString().isEmpty == false) &&
        (response?.errors != null)) {
      throw errorMsg;
    }
  }
}
