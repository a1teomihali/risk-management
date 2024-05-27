using RiskService as service from '../../srv/risk-service';
using from '../../srv/risk-service-ui';
annotate service.Mitigations with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Value : timeline,
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

annotate service.Mitigations with {
    owner @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Mitigations',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : owner,
                    ValueListProperty : 'owner',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Mitigations with @(
    UI.HeaderInfo : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Mitigation',
        TypeNamePlural : 'Mitigations',
        Description : {
            $Type : 'UI.DataField',
            Value : description,
        },
        Title : {
            $Type : 'UI.DataField',
            Value : ID,
        },
    }
);
