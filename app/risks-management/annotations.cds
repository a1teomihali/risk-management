using RiskService as service from '../../srv/risk-service';

annotate service.Risks with
@UI          : {
    SelectionFields        : [
        prio,
        impact
    ],

    HeaderInfo             : {
        TypeName      : 'Risk',
        TypeNamePlural: 'Risks',
        Title         : {Value: ID},
        Description   : {Value: title}
    },

    LineItem               : [
        {Value: ID},
        {Value: title},
        {
            Value      : prio,
            Criticality: criticality
        },
        {Value: descr},
        {
            Value            : miti.ID,
            Label            : '{i18n>Mitigation Assoc}',
            ![@UI.Importance]: #High
        },
        {
            Value      : impact,
            Criticality: criticality
        },
        {Value: criticality},
        {
            Value: createdAt,
            Label: 'Created At',
            ![@UI.Hidden]
        },
        {
            Value: modifiedAt,
            Label: 'Modified At',
            ![@UI.Hidden]
        },
        {
            Value: createdBy,
            Label: 'Created By',
            ![@UI.Hidden]
        },
        {
            Value: modifiedBy,
            Label: 'Modified By',
            ![@UI.Hidden]
        }
    ],

    Facets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Risk Details',
            Target: '@UI.FieldGroup#RiskDetails'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Mitigation Details',
            Target: 'miti/@UI.LineItem#MitigationDetails'
        }
    ],

    FieldGroup #RiskDetails: {Data: [
        {Value: ID},
        {Value: title},
        {
            Value      : prio,
            Criticality: criticality
        },
        {Value: descr},
        {
            Value      : impact,
            Criticality: criticality
        },
        {Value: criticality}
    ]},
} {
    ID @title: 'Risk ID'
       @UI.HiddenFilter;
};

// annotate service.Mitigations with {
//     risk @(Common: {ValueList: {
//         Label         : 'Risk',
//         CollectionPath: 'Risks',
//         Parameters    : [
//             {
//                 $Type            : 'Common.ValueListParameterInOut',
//                 LocalDataProperty: risk_ID,
//                 ValueListProperty: 'ID'
//             },
//             {
//                 $Type            : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty: 'descr'
//             }
//         ]
//     }})
// };


annotate service.Mitigations with
@(UI: {LineItem #MitigationDetails: [
    {
        Value            : ID,
        Label            : 'Mitigation ID',
        ![@UI.Importance]: #High
    },
    {
        Value            : description,
        ![@UI.Importance]: #Medium
    },
    {
        Value            : owner,
        ![@UI.Importance]: #High
    },
    {
        Value            : timeline,
        ![@UI.Importance]: #Medium
    },
    {
        $Type            : 'UI.DataField',
        Value            : risk_ID,
        Label            : '{i18n>Risk ID}',
        ![@UI.Importance]: #High,
    },
    {
        Value: createdAt,
        ![@UI.Hidden]
    },
    {
        Value: createdBy,
        ![@UI.Hidden]
    },
    {
        Value: modifiedAt,
        ![@UI.Hidden]
    },
    {
        Value: modifiedBy,
        ![@UI.Hidden]
    },
    {
        Value: risk.ID,
        ![@UI.Hidden]
    }
]});
