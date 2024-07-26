const cds = require('@sap/cds');
const RiskValidation = require('./RiskValidation');

module.exports = cds.service.impl(async function () {
    this.after('READ', 'Risks', risksData => {
        const risks = Array.isArray(risksData) ? risksData : [risksData];
        risks.forEach(risk => {
            if (risk.impact <= 30000) {
                risk.criticality = 3;
            } else if (risk.impact > 30000 && risk.impact <= 100000) {
                risk.criticality = 2;
            } else {
                risk.criticality = 1;
            }
            const riskValidation = new RiskValidation(risk);
            riskValidation.validateRisk();
        });
    });
});