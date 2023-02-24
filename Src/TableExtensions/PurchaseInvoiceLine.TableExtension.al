tableextension 50012 "PurchInvLine Ext" extends "Purch. Inv. Line"
{
    fields
    {
        field(50200; "Purch. Order No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50201; "Purch. Order Line No."; Integer)
        {
            Caption = 'Order Line No.';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50202; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
            OptionCaption = 'Invoice,Credit Memo';
            OptionMembers = Invoice,"Credit Memo";
        }
        field(50203; "Currency Code"; Code[10])
        {
            CalcFormula = Lookup("Purch. Inv. Header"."Currency Code" WHERE("No." = FIELD("Document No.")));
            Description = 'CHCL21.5';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}