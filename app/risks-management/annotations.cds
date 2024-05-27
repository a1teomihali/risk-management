using RiskService as service from '../../srv/risk-service';
using from '../../srv/risk-service-ui';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : prio,
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Value : criticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ]
);

annotate service.Risks with {
    prio @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Risks',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : prio,
                    ValueListProperty : 'prio',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Risks with {
    impact @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Risks',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : impact,
                    ValueListProperty : 'impact',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Risks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Value : prio,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : miti_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : criticality,
        },
    ]
);
annotate service.Risks with @(
    UI.FieldGroup #i18nDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    }
);