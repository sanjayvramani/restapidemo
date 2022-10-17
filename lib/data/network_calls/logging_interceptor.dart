import 'package:http_interceptor/http_interceptor.dart';
import 'package:rest_api_demo/data/service/locator.dart';
import '../storage/shared_prefrences_helper.dart';

class LoggingInterceptor implements InterceptorContract
{
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async{
  
    data.headers['Content-Type']='application/json';
    data.headers['Accept']='application/json';

    String? token = getIt.get<SharedPreferenceHelper>().getUserToken();
    if(token!=null) {
      data.headers['Authorization']='Bearer $token';
    }
    

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async{
    // TODO: implement interceptResponse
    return data;
  }

}