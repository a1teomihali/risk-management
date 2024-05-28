using RiskService from './risk-service';

annotate RiskService.Risks with
@(UI: {
    HeaderInfo      : {
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
    SelectionFields : [
        prio,
        impact
    ],
    LineItem        : [
        {Value: title},
        {
            Value      : prio,
            Criticality: criticality
        },
        {Value: miti.ID},
        {
            Value      : impact,
            Criticality: criticality
        },
        {Value: criticality}

    ],
    Facets          : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Main',
            Target: '@UI.FieldGroup#Main'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Mitigations',
            Target: 'miti/@UI.LineItem'
        }
    ],
    FieldGroup #Main: {Data: [
        {
            Value      : prio,
            Criticality: criticality
        },
        {
            Value      : impact,
            Criticality: criticality
        }
    ]},
}) {
    ID          @title: 'Risk ID';
    title       @title: 'Title';
    prio        @title: 'Priority';
    descr       @title: 'Description';
    miti        @title: 'Mitigation';
    impact      @title: 'Impact';
    criticality @title: 'Criticality';
};

annotate RiskService.Mitigations with {
    risk @(Common: {
        //show text, not id for risk in the context of risks
        Text           : risk.descr,
        TextArrangement: #TextOnly,
        ValueList      : {
            Label         : 'Risk',
            CollectionPath: 'Risks',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: risk_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'descr'
                }
            ]
        }
    })
};


annotate RiskService.Mitigations with
@(UI: {
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Mitigation',
        TypeNamePlural: 'Mitigations',
        Description   : {
            $Type: 'UI.DataField',
            Label: description,
            Value: description
        }
    },
    SelectionFields: [owner],
    LineItem       : [
        {Value: description},
        {Value: owner},
        {Value: timeline},
        {Value: risk.ID}
    ],
}) {
    description @title: 'Description';
    owner       @title: 'Owner';
    timeline    @title: 'Timeline';
    risk        @title: 'Risk ID';
};
