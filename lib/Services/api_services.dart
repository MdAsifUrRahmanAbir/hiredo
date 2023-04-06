import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/Screens/HomeScreen/Model/lead_category_model.dart';

import 'package:myapp/Screens/ResistrationScreen/Model/registration_model.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Screens/SignInScreen/Model/login_model.dart';
import 'package:myapp/Screens/UpdateLeadSetting/Model/add_services_model.dart';
import 'package:myapp/Screens/UpdateLeadSetting/Model/location_model.dart';
import 'package:myapp/Services/api_component.dart';
import 'package:myapp/local/my_local.dart';

import '../Screens/QuestionScreen/Model/job_post_model.dart';

class ApiServices {
  static var client = http.Client();

  // handel Registration
  static Future<bool> handelRegistration({required SignUpModel model}) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse(signupApi));

    request.body = jsonEncode(model.toJson());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(await response.stream.bytesToString());
      }
      return true;
    } else {
      Map d = json.decode(await response.stream.bytesToString());
    
        Fluttertoast.showToast(msg: d['email'][0]);
      if (kDebugMode) {
        print(d['message']);
      }
      return false;
    }
  }


// handle login

  static Future<dynamic> handelLogin(
      {required String email, required String password}) async {

    try {
  var request = http.Request('POST', Uri.parse(signInApi));
  
  request.bodyFields = {'email': email, 'password': password};
  
  http.StreamedResponse response = await request.send();
  
  if (response.statusCode == 200) {
    var data = await response.stream.bytesToString();
    return loginModelFromJson(data);
  } else {
    Map d = json.decode(await response.stream.bytesToString());
    debugPrint("$d");
    
    if (kDebugMode) {
      debugPrint(response.reasonPhrase);
    }
    return 1;
  }
} on Exception catch (e) {
  if(kDebugMode){
    debugPrint('Login Error ${e.toString()}');
  }
 return 1;
}
  }

  // fetch lead our categories
  static dynamic fetchLeadOurCategories() async {
    try {
      var response = await client.get(Uri.parse(leadcategory));

      if (response.statusCode == 200) {
        print("data : ${jsonDecode(response.body)}");

        return leadCategoriesModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print("Data fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

// add service
  static Future<bool> addServicePost(
      {required String design, required String description}) async {
    var accessToken = await MyPreference.getToken();
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var accessToken = preferences.getString('token');
    try {
      var headers = {
        'Authorization': "Bearer $accessToken",
        'Cookie':
            'csrftoken=pwnIa5wXWizyqYO2ybhtX0GLZ0NxqhtU; sessionid=gg5ikg2sfd8r50skh2zkn4d9uahf6lue'
      };
      var request = http.MultipartRequest('POST', Uri.parse(addService));
      request.fields
          .addAll({'service_name': design, 'service_description': description});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        return true;
      } else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("User Add Servies Error. Reason ${e.toString()}");
      }
      return false;
    }
  }

// fetch service data
  static dynamic fetchServices() async {
    var accessToken = await MyPreference.getToken();
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var accessToken = preferences.getString('token');
    try {
      var headers = {
        'Authorization': "Bearer $accessToken",
        'Cookie':
            'csrftoken=pwnIa5wXWizyqYO2ybhtX0GLZ0NxqhtU; sessionid=gg5ikg2sfd8r50skh2zkn4d9uahf6lue'
      };
      var request = http.Request('GET', Uri.parse(fetchService));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return addServicesModelFromMap(data);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print("Data fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

// add location
  static Future<bool> addLocationPost(
      {required String city, required String distance}) async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Cookie':
            'csrftoken=JTmUdH4YgUsvhRKiYHXELavXWYkDj2Jy; sessionid=zgackrotla65p88t23gjkrpw7qfig439'
      };
      var request = http.MultipartRequest('POST', Uri.parse(addLocation));

      request.fields.addAll({'city': city, 'distance': distance});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("User Add Location Error. Reason ${e.toString()}");
      }
      return false;
    }
  }

// fetch location data
  static dynamic fetchLocationData() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Cookie':
            'csrftoken=Mhh6ZEtVRRjjThE4WYMWICRo8M54bfbV; sessionid=zgackrotla65p88t23gjkrpw7qfig439'
      };
      var request = http.Request('GET', Uri.parse(fetchLocation));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return locationModelFromMap(data);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(" Location fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static Future<dynamic> fetchSlider() async {
    try {
      var response = await client.get(Uri.parse(sliderApi));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        if (kDebugMode) {
          print("Fetch Slider error : ${response.statusCode}");
          return 1;
        }
      }
    } on Exception catch (e) {
      return 1;
    }
  }

  // Job Post
    static Future<dynamic> jobPostCreate(
      {required List<JobPostModel> data}) async {
    try {
  var accessToken = await MyPreference.getToken();
  
  var headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
    'Cookie': 'csrftoken=YqvXb0jbZKzIkJLJhy1KgrFX5K0aDJ3I; sessionid=s56mcfr0yahwh0jk9nuikt10ie6d8cau'
  };
  var request = http.Request('POST', Uri.parse(jobPostApi));
  request.body =jobPostModelToJson(data);
  request.headers.addAll(headers);
  
  http.StreamedResponse response = await request.send();
  
  if (response.statusCode == 200) {
    debugPrint(await response.stream.bytesToString());
    return "success";
  }
  else {
    debugPrint( "error:  ${response.reasonPhrase}");
    return 1;
  }
} on Exception catch (e) {
  debugPrint("Job post  Error. Reason ${e.toString()}");
  return 1;
  
}








    
    // try {
    //   var headers = {
    //     'Authorization': "Bearer $accessToken",
    //     'Content-Type': 'application/json',
    //     'Cookie':
    //         'csrftoken=pwnIa5wXWizyqYO2ybhtX0GLZ0NxqhtU; sessionid=gg5ikg2sfd8r50skh2zkn4d9uahf6lue'
//       };
//  var _data= json.encode([
//   {
//     "category": 4,
//     "question": 2,
//     "location": 1,
//     "p_answer": 2
//   },
//   {
//     "category": 4,
//     "question": 2,
//     "location": 1,
//     "p_answer": 2
//   }
// ]);

//       var response = await client.post( Uri.parse("http://ringknock.pythonanywhere.com/lead/JobPostCreate/"),headers:headers,body:jsonEncode(_data));
     
//       if (response.statusCode == 200) {
        
//         return "success";

//       } else {
//         if (kDebugMode) {
//           print(response.statusCode);
//         }
//         return response.statusCode;
//       }
//     } on Exception catch (e) {
//       if (kDebugMode) {
//         print("Job post  Error. Reason ${e.toString()}");
//       }
//       return 1;
//     }
  }







}
