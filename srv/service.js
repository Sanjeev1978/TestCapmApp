const cds = require ('@sap/cds');
const {employees} = cds.entities('anubhav.db.master');
module.exports = function(srv){

    srv.on('hello', function(req,res){
        let name = req.data.name;
        return "Hello : " +name;
    });

    srv.on('READ','ReadEmployeeSrv', async(req,res)=>{
        let result =[];
        //Ex01 to push dummy data
        //result.push({"ID":"DUmmy ID","nameFirst":"Sanjeev", "nameLast":"Chauhan"});

        //Ex02 get top 10 records
        result = cds.tx(req).run(SELECT.from(employees).limit(10));

        //Ex03 where condition
        result = await cds.tx(req).run(SELECT.from(employees).limit(10).where({
            salaryAmount :{'>=' :90000}
        }));
        var tot =0;
        for (let index = 0; index < result.length; index++) {
            const element = result[index];
            tot = tot + parseInt(element.salaryAmount);

            
        }

        result.splice(1,0,{
            "ID":"Total","salaryAmount":tot
        })
        return result;

    });
}