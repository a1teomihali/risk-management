using RiskService from './risk-service';

annotate RiskService.Risks with {
    ID          @title: 'Risk ID';
    title       @title: 'Title';
    prio        @title: 'Priority';
    descr       @title: 'Description';
    miti        @title: 'Mitigation';
    impact      @title: 'Impact';
    criticality @title: 'Criticality';
}

annotate RiskService.Mitigations with {
    description @title: 'Description';
    owner       @title: 'Owner';
    timeline    @title: 'Timeline';
    risks       @title: 'Risks';
}

annotate RiskService.Risks with
@(UI: {
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Risk',
        TypeNamePlural: 'Risks',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: descr
        }
    },
    SelectionFields: [
        prio,
        impact
    ],
    LineItem       : [
        {Value: title},
        {
            Value      : prio,
            Criticality: criticality
        },
        {Value: miti_ID},
        {
            Value      : impact,
            Criticality: criticality
        },
        {Value: criticality}

    ],
}) {

};

annotate RiskService.Risks with {
    miti @(Common: {
        //show text, not id for mitigation in the context of risks
        Text           : miti.description,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'Mitigations',
            CollectionPath: 'Mitigations',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: miti_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                }
            ]
        }
    });
}


annotate RiskService.Mitigations with
@(UI: {
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Mitigation',
        TypeNamePlural: 'Mitigations',
        Description   : {
            $Type: 'UI.DataField',
            Value: description
        }
    },
    SelectionFields: [owner],
    LineItem       : [
        {Value: owner},
        {Value: timeline},
        {Value: risks.ID},
        {Value: risks.miti_ID}
    ],
}) {

};
