namespace sap.ui.riskmanagement;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity Risks : cuid, managed {
    @title: 'Title'
    title       : String(100)              @mandatory;

    @title: 'Priority'
    prio        : Integer                  @mandatory;

    @title: 'Description'
    descr       : String;

    @title: 'Mitigation ID'
    miti        : Composition of many Mitigations
                      on miti.risk = $self @mandatory;

    @title: 'Impact'
    impact      : Integer                  @mandatory;

    @title: 'Criticality'
    @UI.HiddenFilter
    criticality : Integer;
}

entity Mitigations : cuid, managed {
    @title: 'Description'
    description : String @mandatory;

    @title: 'Owner'
    owner       : String @mandatory;

    @title: 'Timeline'
    timeline    : String;

    @title: 'Risk Assoc'
    @UI.HiddenFilter
    risk        : Association to Risks;
}
