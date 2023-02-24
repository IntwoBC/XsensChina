table 50003 "Synchronized Invoice VAT No"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------


    fields
    {
        field(1; "Posted Invoice No."; Code[20])
        {
            Caption = 'Posted Invoice No.';
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
        field(6; "Invoice Amount"; Decimal)
        {
            Caption = 'Invoice Amount';
        }
        field(7; "VAT Invoice No."; Text[50])
        {
            Caption = 'VAT Invoice No.';
        }
        field(8; "VAT Documnet No."; Code[20])
        {
            Caption = 'VAT Documnet No.';
        }
        field(9; "VAT Line No."; Integer)
        {
            Caption = 'VAT Line No.';
        }
    }

    keys
    {
        key(Key1; "Posted Invoice No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        VATImportedHeader.GET("Posted Invoice No.");
        VATImportedHeader.TESTFIELD(Status, VATImportedHeader.Status::Open);
    end;

    var
        VATImportedHeader: Record "VAT Imported Header";
}

