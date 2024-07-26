using RiskService as service from '../../srv/risk-service';

annotate service.Mitigations with @(
    UI.SelectionFields            : [
        owner,
        timeline,
        ID,
        risk_ID
    ],

    UI.LineItem                   : [
        {
            $Type: 'UI.DataField',
            Label: 'Mitigation ID',
            Value: ID
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description
        },
        {
            $Type: 'UI.DataField',
            Label: 'Owner',
            Value: owner
        },
        {
            $Type: 'UI.DataField',
            Label: 'Timeline',
            Value: timeline
        },
        {
            $Type: 'UI.DataField',
            Label: 'Risk Assoc',
            Value: risk_ID
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: createdBy,
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: modifiedAt,
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: modifiedBy,
            ![@UI.Hidden]
        }
    ],

    HeaderInfo                    : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Mitigation',
        TypeNamePlural: 'Mitigations',
        Description   : {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description
        }
    },

    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet',
        Label : 'Mitigation Information',
        Target: '@UI.FieldGroup#MitigationGroup',
    }],

    UI.FieldGroup #MitigationGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID
            },
            {
                $Type: 'UI.DataField',
                Value: description
            },
            {
                $Type: 'UI.DataField',
                Value: owner
            },
            {
                $Type: 'UI.DataField',
                Value: timeline
            },
            {
                $Type: 'UI.DataField',
                Value: risk_ID
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt,
                ![@UI.Hidden]
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy,
                ![@UI.Hidden]
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedAt,
                ![@UI.Hidden]
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedBy,
                ![@UI.Hidden]
            }
        ],
    }
);

annotate service.Mitigations with {
    owner @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Mitigations',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: owner,
                ValueListProperty: 'owner',
            }, ],
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate service.Mitigations with @(UI.HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : 'Mitigation',
    TypeNamePlural: 'Mitigations',
    Description   : {
        $Type: 'UI.DataField',
        Value: description,
    },
    Title         : {
        $Type: 'UI.DataField',
        Value: ID,
    },
});

annotate service.Mitigations with {
    ID @Common.FieldControl: #ReadOnly
};

annotate service.Mitigations with {
    owner @Common.FieldControl: #Mandatory
};

annotate service.Mitigations with {
    timeline @Common.FieldControl: #Mandatory
};

annotate service.Mitigations with {
    ID @Common.Label: '{i18n>Mitigation ID}'
       @UI.HiddenFilter
};
