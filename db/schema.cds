namespace sap.ui.riskmanagement;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Risks : cuid, managed {
    title       : String(100);
    prio        : Integer;
    descr       : String;
    miti        : Composition of many Mitigations
                      on miti.risk = $self;
    impact      : Integer;
    criticality : Integer;
}

entity Mitigations : cuid, managed {
    description : String;
    owner       : String;
    timeline    : String;
    risk        : Association to Risks;
}
