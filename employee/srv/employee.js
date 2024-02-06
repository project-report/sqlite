const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {
    const { Employee , Gender} = this.entities();
this.before(['CREATE', 'UPDATE'], Employee, async (req) => {
    let query1 = SELECT.from(Employee).where({ ref: ["email_id"] }, "=", { val: req.data.email_id }).and('empid', '!=', req.data.empid);
        const result = await cds.run(query1);
        if (result.length > 0) {
            req.error({ 'code': 'STEMAILEXISTS', message: 'Employee with such email already exists', target: 'email_id' });
        }
    });

this.on('READ',Gender,async(req)=> {
    genders=[

        {"code":"M",description:"Male"},
        {"code":"F",description:"Female"},
    ]
    genders.$count=genders.length;
    return genders;
})

});