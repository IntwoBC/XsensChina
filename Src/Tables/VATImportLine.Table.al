table 50002 "VAT Imported Line"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------


    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Documnet No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(4; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(5; "Posted Invoice No."; Code[20])
        {
            Caption = 'Posted Invoice No.';
        }
        field(6; "Invoice Amount"; Decimal)
        {
            Caption = 'Invoice Amount';
        }
        field(7; "VAT Invoice No."; Text[50])
        {
            Caption = 'VAT Invoice No.';
        }
        field(8; "Validated Posted Invoice No."; Code[20])
        {
            CalcFormula = Lookup("Sales Invoice Header"."No." WHERE("No." = FIELD("Posted Invoice No.")));
            Caption = 'Validated Posted Invoice No.';
            FieldClass = FlowField;
        }
        field(9; "Validated Customer No."; Code[20])
        {
            CalcFormula = Lookup("Sales Invoice Header"."Bill-to Customer No." WHERE("No." = FIELD("Posted Invoice No.")));
            Caption = 'Validated Customer No.';
            FieldClass = FlowField;
            TableRelation = Customer;
        }
        field(10; "Validated VAT Invoice No."; Text[50])
        {
            CalcFormula = Lookup("Synchronized Invoice VAT No"."VAT Invoice No." WHERE("Posted Invoice No." = FIELD("Posted Invoice No.")));
            Caption = 'Validated VAT Invoice No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Posted Invoice Amount"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line".Amount WHERE("Document No." = FIELD("Posted Invoice No.")));
            Caption = 'Posted Invoice Amount';
            FieldClass = FlowField;
        }
        field(12; "Posted Invoice VAT Amount"; Decimal)
        {
            Caption = 'Posted Invoice VAT Amount';
            Enabled = false;
        }
        field(13; "Posted Invoice Amount Incl VAT"; Decimal)
        {
            CalcFormula = Sum("Sales Invoice Line"."Amount Including VAT" WHERE("Document No." = FIELD("Posted Invoice No.")));
            Caption = 'Posted Invoice Amount Incl VAT';
            FieldClass = FlowField;
        }
        field(14; "Line Status"; Option)
        {
            Caption = 'Line Status';
            OptionCaption = 'Imported,Posted No. Not Existed,Customer Not Matched,Amounts Not Matched,Validate Passed,Synchronized';
            OptionMembers = Imported,"Posted No. Not Existed","Customer Not Matched","Amounts Not Matched","Validate Passed",Synchronized;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        VATImportedHeader.GET("Document No.");
        VATImportedHeader.TESTFIELD(Status, VATImportedHeader.Status::Open);
    end;

    var
        VATImportedHeader: Record "VAT Imported Header";
}

