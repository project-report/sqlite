namespace com.satinfotech.studentdb;
using {managed, cuid} from '@sap/cds/common';
@assert.unique:{
  stid:[stid]
}
entity Student:cuid,managed{
  
    @title:'student ID'
     stid: String(10);
    @title:'Gender'
    virtual gen : String(10) @Core.Computed;
     @title:'First name'
    first_name:String(10) @mandatory;
     @title:'Last name'
    last_name:String(10) @mandatory;
     @title:'Email'
    email_id:String(20) @mandatory;
    @title:'pan no'
      pan_no:String(20) @mandatory;
    @title:'Date Of Birth'
      dob:Date @mandatory;
      @title:'Courses'
      course: Association to Courses;
      @title:'Languages Known'
      Languages:Composition of many{
        key ID: UUID;
         lang:Association to Languages;
      }
    @Calculated : true
    @title:'Age'
    age: Integer @readonly : true;
    gender:String(1);
    @title:'Is Alumni'
    is_alumni:Boolean default false;
}
@cds.persistence.skip
entity Gender {
    @title: 'code'
    key code: String(1);
    @title: 'Description'
    description: String(10);
}
entity Courses : cuid,managed {
    @title: 'course'
     code: String(7);
    @title: 'Description'
    description: String(10);
    @title:'Books'
   Books:Composition of many{
        key ID: UUID;
         books:Association to Books;
      };

}
entity Languages : cuid,managed{
    @title: 'code'
     code: String(7);
    @title: 'Description'
    description: String(10);

}
entity Books : cuid,managed {
    @title: 'code'
     code: String(7);
    @title: 'Books'
    description: String(20);

}

