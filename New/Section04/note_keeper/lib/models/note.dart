class Note{
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Note(this._title,this._date,this._priority,[this._description]);
  Note.withId(this._id,this._title,this._date,this._priority,[this._description]);

  int get id=>_id;
  String get title=>_title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  set title(String newTitle){
    if(newTitle.length<=255){
      this._title=newTitle;
    }
  }

  set description(String newDescription){
    if(newDescription.length<=255){
      this._description=newDescription;
    }
  }

  set (String newDate){
      this._date=newDate;
  }


  set priority(int newPriority){
    if(newPriority>=1 && newPriority<=2){
      this._priority=newPriority;
    }
  }

  Map<String,dynamic> toMap(){
    var map=Map<String,dynamic>();
    if(_id!=null){
      map['id']=_id;
    }
    map['title']=_title;
    map['description']=_description;
    map['date']=_date;
    map['priority']=_priority;

    return map;
  }
}