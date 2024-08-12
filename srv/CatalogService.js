module.exports = cds.service.impl(async function(){
    const { POs, EmployeeSet} = this.entities;
    
    this.before('UPDATE',EmployeeSet,(req)=>{
        console.log("Its Here ", req.data.salaryAmount)
        if (parseFloat(req.data.salaryAmount >= 1000000)){
            req.error(500,"Req Salary not Allowed");
        }
    });

    
    this.on('boost', async function(req, res){
        try {
            const ID = req.params[0];
            console.log("Passed ID " + JSON.stringify(ID));
            const tx = cds.tx(req);
            await tx.update(POs).with({
                GROSS_AMOUNT : {'+=' :20000}
            }).where(ID);
        } catch (error) {
            return "error "+ error.toString();
        }
    });

    this.on('getOrderDefaults', (req,res)=>{
        return{
            'OVERALL_STATUS':"N"
        };
    });
    this.on('setOrderProcessing', POs, async req =>{
        const tx = cds.tx(req);
        await tx.update(POs, req.params[0].ID).set({'OVERALL_STATUS' :'A'});
    });

    this.on('getLargestOrder',async function(req, res){
        try {
            const tx = cds.tx(req);
           const reply = await tx.read(POs).orderBy({
                GROSS_AMOUNT : 'desc'
            }).limit(1);

            return reply;
        } catch (error) {
            return "error "+ error.toString();
        }
    });
})