class CreateNote {
   CreateNote({
        this.status,
        this.message,
        this.data,
    });

    String? status;
    String? message;
    Data? data;

    factory CreateNote.fromJson(Map<String, dynamic> json) => CreateNote(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
    };
}


class Data {
    Data({
        this.newNote,
    });

    NewNote? newNote;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        newNote: json["newNote"] == null ? null : NewNote.fromJson(json["newNote"]),
    );

    Map<String, dynamic> toJson() => {
        "newNote": newNote == null ? null : newNote!.toJson(),
    };
}

class NewNote {
    NewNote({
        this.title,
        this.description,
        this.id,
        this.date,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    String? title;
    String? description;
    String? id;
    DateTime? date;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    factory NewNote.fromJson(Map<String, dynamic> json) => NewNote(
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        id: json["_id"] == null ? null : json["_id"],
        date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "_id": id == null ? null : id,
        "Date": date == null ? null : date!.toIso8601String(),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
    };
}