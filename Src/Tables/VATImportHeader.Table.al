table 50001 "VAT Imported Header"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    CHSSetup.GET;
                    NoSeriesMgt.TestManual(GetNoSeriesCode);
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Created By"; Code[50])
        {
            Caption = 'Created By';
            TableRelation = "User Setup";
        }
        field(3; "Created Date"; Date)
        {
            Caption = 'Created Date';
        }
        field(4; "Created Time"; Time)
        {
            Caption = 'Created Time';
        }
        field(5; "Validated By"; Code[50])
        {
            Caption = 'Validated By';
            TableRelation = "User Setup";
        }
        field(6; "Validated Date"; Date)
        {
            Caption = 'Validated Date';
        }
        field(7; "Validated Time"; Time)
        {
            Caption = 'Validated Time';
        }
        field(8; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Validated,Synchronized,Closed';
            OptionMembers = Open,Validated,Synchronized,Closed;
        }
        field(9; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TESTFIELD(Status, Status::Open);

        VATImportedLine.RESET;
        VATImportedLine.SETRANGE("Document No.", "No.");
        VATImportedLine.DELETEALL;
    end;

    trigger OnInsert()
    begin
        CHSSetup.GET;

        IF "No." = '' THEN BEGIN
            TestNoSeries;
            NoSeriesMgt.InitSeries(GetNoSeriesCode, xRec."No. Series", WORKDATE, "No.", "No. Series");
        END;

        "Created By" := USERID;
        "Created Date" := WORKDATE;
        "Created Time" := TIME;
    end;

    var
        CHSSetup: Record "Chinese Localization Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        VATImportedHeader: Record "VAT Imported Header";
        Text001: Label 'The VAT Imported Document %1 already exists.';
        VATImportedLine: Record "VAT Imported Line";

    local procedure TestNoSeries(): Boolean
    begin
        CHSSetup.TESTFIELD("VAT Imported Nos.");
    end;

    local procedure GetNoSeriesCode(): Code[10]
    begin
        EXIT(CHSSetup."VAT Imported Nos.");
    end;

    [Scope('Internal')]
    procedure AssistEdit(OldVATImportedHeader: Record "VAT Imported Header"): Boolean
    var
        VATImportedHeader2: Record "VAT Imported Header";
    begin
        VATImportedHeader.COPY(Rec);
        CHSSetup.GET;
        TestNoSeries;
        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode, OldVATImportedHeader."No. Series", VATImportedHeader."No. Series") THEN BEGIN
            NoSeriesMgt.SetSeries(VATImportedHeader."No.");
            IF VATImportedHeader2.GET(VATImportedHeader."No.") THEN
                ERROR(Text001, VATImportedHeader."No.");
            Rec := VATImportedHeader;
            EXIT(TRUE);
        END;
    end;
}

