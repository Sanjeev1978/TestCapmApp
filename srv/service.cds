using { anubhav.db.master } from '../db/datamodel';

service myService @(path:'myService1'){

    function hello(name: String) returns String;

    // to aviod crud opration and only view purpose
    //@readonly
    @Capabilities : { Updatable:false, Deletable:false, Insertable:false, }
    entity ReadEmployeeSrv as projection on master.employees;
}