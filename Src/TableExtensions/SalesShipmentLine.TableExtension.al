tableextension 50006 "SalesShipmentLine Ext" extends "Sales Shipment Line"
{
    fields
    {
        field(50100; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
            OptionCaption = 'Shipment,Return Receipt';
            OptionMembers = Shipment,"Return Receipt";
        }
        field(50450; Sorting; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Added on 20JAN2022 for sorting Lines on report';
        }
    }

    var
        myInt: Integer;
}