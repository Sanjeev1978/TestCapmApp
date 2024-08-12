namespace mycapapp.db;

using { com.resue } from './reuse';
using { cuid,temporal,managed } from '@sap/cds/common';



context master {
    entity student: resue.address{
        key id : resue.Guid not null;
        name: String(80);
        class:Association to semester;
        backlog:Boolean;
        age:Int16;

    }
    entity semester{
        key id:resue.Guid;
        semester : String(40);
        specilization:String(40);
        hod:String(80);
    }

    entity book{
        key id :resue.Guid;
        name:String(50);
        author:String(80);
    }
}
context trans{
    entity subs: cuid,temporal,managed{
        student:Association to one master.student;
        book:Association to one master.book;
        
    }

}

