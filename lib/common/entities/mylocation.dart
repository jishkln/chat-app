// class MyLocation {
//   MyLocation({this.result, this.status});
//   final List<Result>? result;
//   final String? status;

//   factory MyLocation.fronJson(Map<String, dynamic> json) => MyLocation(
//         //  result: json["results"]==null?null:List<Result>.from(json["result"].map((e)=>e),

//         status: json["status"] == null ? null : json["status"],
//       );

//   Map<String, dynamic> toJson() => {

//     "status":status==null?null:status,
//   };
// }

// class Result {
//   Result({this.addressComponent, this.formattedaddress, this.geometry, this.placeId, this.type, });
//   final List<AddressComponent>? addressComponent;
//   final String formattedaddress;
//   final Geometry?geometry;
//   final String ? placeId;
//   final List<String>?type;


//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     addressComponent: json["address_components"]==null?null:List<AddressComponent>.from(elements)
//   );
  
// }