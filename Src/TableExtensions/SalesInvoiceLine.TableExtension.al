tableextension 50008 "Sales Invoice Line Ext" extends "Sales Invoice Line"
{
    fields
    {
        field(50100; "VAT Invoice No."; Text[50])
        {
            CalcFormula = Lookup("VAT Imported Line"."VAT Invoice No." WHERE("Document No." = FIELD("Document No.")));
            Caption = 'VAT Invoice No.';
            Description = 'CHCL21.5';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50101; "Quantity Handled"; Decimal)
        {
            Caption = 'Quantity Handled';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50102; "Amount Handled"; Decimal)
        {
            Caption = 'Amount Handled';
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50103; "Sales Order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50104; "Sales Order Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
        field(50105; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
            OptionCaption = 'Invoice,Credit Memo';
            OptionMembers = Invoice,"Credit Memo";
        }
        field(50450; Sorting; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Added on 20JAN2022 for sorting Lines on report';
        }
        field(50451; ExternalID; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}