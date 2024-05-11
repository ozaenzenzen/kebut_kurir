// class GetFAQResponseModel {
//   int? status;
//   ResultFAQ? result;

//   GetFAQResponseModel({
//     this.status,
//     this.result,
//   });

//   factory GetFAQResponseModel.fromJson(Map<String, dynamic> json) => GetFAQResponseModel(
//         status: json['status'],
//         result: json['result'] == null ? null : ResultFAQ.fromJson(json['result']),
//       );

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'status': status,
//         'result': result?.toJson(),
//       };
// }

// class ResultFAQ {
//   int? total;
//   int? perPage;
//   int? page;
//   int? lastPage;
//   List<DatumFAQ>? data;

//   ResultFAQ({
//     this.total,
//     this.perPage,
//     this.page,
//     this.lastPage,
//     this.data,
//   });

//   factory ResultFAQ.fromJson(Map<String, dynamic> json) => ResultFAQ(
//         total: json['total'],
//         perPage: json['perPage'],
//         page: json['page'],
//         lastPage: json['lastPage'],
//         data: json['data'] == null
//             ? null
//             : List<DatumFAQ>.from(
//                 json['data'].map(
//                   // ignore: always_specify_types
//                   (x) => DatumFAQ.fromJson(x),
//                 ),
//               ),
//       );

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'total': total,
//         'perPage': perPage,
//         'page': page,
//         'lastPage': lastPage,
//         'data': List<dynamic>.from(
//           data!.map(
//             (DatumFAQ x) => x.toJson(),
//           ),
//         ),
//       };
// }

// class DatumFAQ {
//   String? uuid;
//   String? question;
//   String? answer;
//   dynamic updatedAt;
//   DateTime? createdAt;
//   dynamic createdBy;
//   dynamic updatedBy;

//   DatumFAQ({
//     this.uuid,
//     this.question,
//     this.answer,
//     this.updatedAt,
//     this.createdAt,
//     this.createdBy,
//     this.updatedBy,
//   });

//   factory DatumFAQ.fromJson(Map<String, dynamic> json) => DatumFAQ(
//         uuid: json['uuid'],
//         question: json['question'],
//         answer: json['answer'],
//         updatedAt: json['updated_at'],
//         createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
//         createdBy: json['created_by'],
//         updatedBy: json['updated_by'],
//       );

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'uuid': uuid,
//         'question': question,
//         'answer': answer,
//         'updated_at': updatedAt,
//         'created_at': createdAt?.toIso8601String(),
//         'created_by': createdBy,
//         'updated_by': updatedBy,
//       };
// }

class GetFAQResponseModel {
  int? status;
  ResultGetFAQ? result;

  GetFAQResponseModel({
    this.status,
    this.result,
  });

  factory GetFAQResponseModel.fromJson(Map<String, dynamic> json) => GetFAQResponseModel(
        status: json['status'],
        result: json['result'] == null ? null : ResultGetFAQ.fromJson(json['result']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'result': result?.toJson(),
      };
}

class ResultGetFAQ {
  int? total;
  int? perPage;
  int? page;
  int? lastPage;
  List<ResultDatumGetFAQ>? data;

  ResultGetFAQ({
    this.total,
    this.perPage,
    this.page,
    this.lastPage,
    this.data,
  });

  factory ResultGetFAQ.fromJson(Map<String, dynamic> json) => ResultGetFAQ(
        total: json['total'],
        perPage: json['perPage'],
        page: json['page'],
        lastPage: json['lastPage'],
        data: json['data'] == null
            ? null
            : List<ResultDatumGetFAQ>.from(
                json['data'].map(
                  // ignore: always_specify_types
                  (x) => ResultDatumGetFAQ.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'total': total,
        'perPage': perPage,
        'page': page,
        'lastPage': lastPage,
        'data': List<dynamic>.from(
          data!.map(
            (ResultDatumGetFAQ x) => x.toJson(),
          ),
        ),
      };
}

class ResultDatumGetFAQ {
  String? uuid;
  String? topic;
  dynamic updatedAt;
  DateTime? createdAt;
  dynamic createdBy;
  dynamic updatedBy;
  Faq? faq;

  ResultDatumGetFAQ({
    this.uuid,
    this.topic,
    this.updatedAt,
    this.createdAt,
    this.createdBy,
    this.updatedBy,
    this.faq,
  });

  factory ResultDatumGetFAQ.fromJson(Map<String, dynamic> json) => ResultDatumGetFAQ(
        uuid: json['uuid'],
        topic: json['topic'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        createdBy: json['created_by'],
        updatedBy: json['updated_by'],
        faq: json['faq'] == null ? null : Faq.fromJson(json['faq']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uuid': uuid,
        'topic': topic,
        'updated_at': updatedAt,
        'created_at': createdAt?.toIso8601String(),
        'created_by': createdBy,
        'updated_by': updatedBy,
        'faq': faq?.toJson(),
      };
}

class Faq {
  int total;
  int perPage;
  int page;
  int lastPage;
  List<FaqDatum> data;

  Faq({
    required this.total,
    required this.perPage,
    required this.page,
    required this.lastPage,
    required this.data,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        total: json['total'],
        perPage: json['perPage'],
        page: json['page'],
        lastPage: json['lastPage'],
        data: List<FaqDatum>.from(
          json['data'].map(
            // ignore: always_specify_types
            (x) => FaqDatum.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'total': total,
        'perPage': perPage,
        'page': page,
        'lastPage': lastPage,
        'data': List<dynamic>.from(
          data.map(
            (FaqDatum x) => x.toJson(),
          ),
        ),
      };
}

class FaqDatum {
  String? uuid;
  String? question;
  String? answer;
  dynamic updatedAt;
  DateTime? createdAt;
  dynamic createdBy;
  dynamic updatedBy;

  FaqDatum({
    this.uuid,
    this.question,
    this.answer,
    this.updatedAt,
    this.createdAt,
    this.createdBy,
    this.updatedBy,
  });

  factory FaqDatum.fromJson(Map<String, dynamic> json) => FaqDatum(
        uuid: json['uuid'],
        question: json['question'],
        answer: json['answer'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at']),
        createdBy: json['created_by'],
        updatedBy: json['updated_by'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uuid': uuid,
        'question': question,
        'answer': answer,
        'updated_at': updatedAt,
        'created_at': createdAt?.toIso8601String(),
        'created_by': createdBy,
        'updated_by': updatedBy,
      };
}
