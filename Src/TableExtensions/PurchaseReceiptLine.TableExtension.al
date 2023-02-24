tableextension 50011 "PurchaseRecptLine Ext" extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50202; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
            OptionCaption = 'Receipt,Return Shipment';
            OptionMembers = Receipt,"Return Shipment";
        }
    }

    var
        myInt: Integer;
}