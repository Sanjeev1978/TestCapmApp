using CatalogService as service from '../../srv/CatalogService';


//annotate service.POs with {
  //  @Common.FilterDefaultValue : '300000003'
   // PO_ID
//};

annotate service.POs with @(
    Common.DefaultValuesFunction : 'getOrderDefaults',
    UI.HeaderInfo:{
        TypeName : 'POs',
        TypeNamePlural : 'Purchase Order',
        Title:{Value:PO_ID},
        Description:{Value:PARTNER_GUID.COMPANY_NAME},
        ImageUrl:'data:image/png;base64,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'
    },    
    UI.SelectionFields :[
        CURRENCY_code,
        PARTNER_GUID.ADDRESS_GUID.CITY,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,        
        GROSS_AMOUNT,
        PO_ID
    ] ,
    UI.LineItem :[
        {
            $Type:'UI.DataField',
            Value:PO_ID
        },
         {
            $Type:'UI.DataField',
            Value:PARTNER_GUID.ADDRESS_GUID.COUNTRY
        },
         {
            $Type:'UI.DataField',
            Value:PARTNER_GUID_NODE_KEY
        },
         {
            $Type:'UI.DataField',
            Value:GROSS_AMOUNT
        },
        {
            $Type:'UI.DataFieldForAction',
            Action:'CatalogService.boost',
            Label:'boost',
            Inline:true,
        },
        {
            $Type:'UI.DataFieldForAction',
            Action:'CatalogService.setOrderProcessing',
            Label:'Set Oder Status',
            Inline:false
        },
        {
            $Type:'UI.DataField',
            Value:OverallStatus,
            Criticality:ColorCode
        }
    ],
    UI.Facets:[
        {
            $Type:'UI.CollectionFacet',
            Label:'PO Information',
            Facets:[
                {
                    $Type:'UI.ReferenceFacet',
                    Target:'@UI.Identification',
                    Label:'More Info'
                },
                {
                    $Type:'UI.ReferenceFacet',
                    Target:'@UI.FieldGroup#Prices',
                    Label:'Price'
                },
                {
                    $Type:'UI.ReferenceFacet',
                    Target:'@UI.FieldGroup#Status',
                    Label:'Status'
                }
                ,
                {
                    $Type:'UI.ReferenceFacet',
                    Target:'Items/@UI.LineItem',
                    Label:'Items'
                }
            ],
        },
    ],
    UI.Identification:[
        {
            $Type:'UI.DataField',
            Value:PO_ID,
        },
       
        {
            $Type:'UI.DataField',
            Value:LIFECYCLE_STATUS,
        }
        ,
        {
            $Type:'UI.DataField',
            Value:PARTNER_GUID_NODE_KEY,
        },
        {
            $Type:'UI.DataField',
            Value:PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        }
    ],
    UI.FieldGroup#Prices:{
        Label:'Prices',
        Data:[
            {
                $Type:'UI.DataField',
                Value: GROSS_AMOUNT,
            },
             {
                $Type:'UI.DataField',
                Value: NET_AMOUNT,
            },
            {
                $Type:'UI.DataField',
                Value: TAX_AMOUNT,
            }
        ]
    },
     UI.FieldGroup#Status:{
        Label:'Status',
        Data:[
            {
                $Type:'UI.DataField',
                Value: OVERALL_STATUS,
            },
             {
                $Type:'UI.DataField',
                Value: CURRENCY_code,
            }
        ]
    }        
);

annotate service.POItems with @(
    UI.LineItem:[
        {
            $Type:'UI.DataField',
            Value:PO_ITEM_POS
        },
        {
            $Type:'UI.DataField',
            Value:PRODUCT_GUID_NODE_KEY
        },
        {
            $Type:'UI.DataField',
            Value:PRODUCT_GUID.DESCRIPTION
        },
         {
            $Type:'UI.DataField',
            Value:PRODUCT_GUID_NODE_KEY
        },
        {
            $Type:'UI.DataField',
            Value:GROSS_AMOUNT
        }
        ,
        {
            $Type:'UI.DataField',
            Value:CURRENCY_code
        }

    ],
    UI.Facets:[{
        $Type:'UI.ReferenceFacet',
        Target:'@UI.Identification',
        Label:'More Details'
    },],
    UI.Identification:[
        {
            $Type:'UI.DataField',
            Value:PRODUCT_GUID_NODE_KEY
        },{
            $Type:'UI.DataField',
            Value:PO_ITEM_POS
        },{
            $Type:'UI.DataField',
            Value:TAX_AMOUNT
        },{
            $Type:'UI.DataField',
            Value:GROSS_AMOUNT
        },
        {
            $Type:'UI.DataField',
            Value:TAX_AMOUNT
        },
        {
            $Type:'UI.DataField',
            Value:NET_AMOUNT
        },
        {
            $Type:'UI.DataField',
            Value:CURRENCY_code
        }
    ]
);

annotate service.POs with{
    PARTNER_GUID @(
        Common.ValueList.entity:'CatalogService.BussinessPartnerSet',
        Common.Text:PARTNER_GUID.COMPANY_NAME
    )
};
annotate service.POItems with{
    PRODUCT_GUID @(    
        Common.ValueList.entity:'CatalogService.ProductSet',
         Common.Text:PRODUCT_GUID.DESCRIPTION
    )
};

@cds.odata.valuelist
annotate CatalogService.BussinessPartnerSet with @(
    UI.Identification:[
       {
                $Type:'UI.DataField',
                Value: COMPANY_NAME,
            },
    ]
);

@cds.odata.valuelist
annotate CatalogService.ProductSet with @(
    UI.Identification:[
       {
                $Type:'UI.DataField',
                Value: DESCRIPTION,
            },
    ]
);


