namespace com.satinfotech.employee;
using {managed, cuid} from '@sap/cds/common';
@assert.unique:{
  empid:[empid]
}
entity Employee:cuid,managed{
  
    @title:'employee ID'
     empid: String(10);
    @title:'First name'
    first_name:String(10) @mandatory;
    @title:'Last name'
    last_name:String(10) @mandatory;
    @title:'Gender'
    virtual gen : String(10) @Core.Computed;
     @title:'Email'
    email_id:String(20) @mandatory;
    @title:'phone no'
    phone_no:String(20) @mandatory;
    @title:'salary'
    salary: String(20)@mandatory;
    @title:'Hire_date'
    hire_date:Date @mandatory;
    @title:'Role'
    role: Association to Roles;
    @title:'Age'
    age: String(5);
    gender:String(1);
    
}
@cds.persistence.skip
entity Gender {
    @title: 'code'
   key code: String(1);
    @title: 'Description'
    description: String(10);
}
entity Roles : cuid,managed {
    @title: 'Role'
     code: String(7);
    @title: 'Description'
    description: String(10);
    @title:'Projects'
   Projects:Composition of many{
        key ID: UUID;
         projects:Association to Projects;
      };
}
entity Projects : cuid,managed {
    @title: 'code'
     code: String(7);
    @title: 'Projects'
    description: String(40);

}



