class RiskValidation {
    constructor(Risk) {
        this.risk = Risk;
    }

    validateRisk() {
        if(this.risk.impact >= 50000) {
            let riskTitle = this.risk.title;
            console.log(`Problem with risk ${riskTitle}`);
        }
    }
}

module.exports = RiskValidation;