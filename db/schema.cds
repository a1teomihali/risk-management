namespace sap.ui.riskmanagement;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Risks : cuid, managed {
    title       : String(100);
    prio        : String(5);
    descr       : String;
    miti        : Association to Mitigations;
    impact      : Integer;
    criticality : Integer;
}

entity Mitigations : cuid, managed {
    description : String;
    owner       : String;
    timeline    : String;
    risks       : Association to many Risks
                      on risks.miti = $self;
}
