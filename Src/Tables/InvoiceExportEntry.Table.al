table 50004 "Invoice Export Entry"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    //DrillDownPageID = 50006;
    //LookupPageID = 50006;
    Permissions = TableData 113 = rm;

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "Handled No."; Code[20])
        {
            Caption = 'Handled No.';
        }
        field(3; "Handled by"; Code[30])
        {
            Caption = 'Handled by';
            TableRelation = User;
        }
        field(4; "Handled Date"; Date)
        {
            Caption = 'Handled Date';
        }
        field(5; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(6; Handled; Boolean)
        {
            Caption = 'Handled';
        }
        field(11; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Invoice';
            OptionMembers = Invoice;
        }
        field(12; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(13; "Document Line No."; Integer)
        {
            BlankZero = true;
            Caption = 'Document Line No.';
        }
        field(14; "Ref. Line No."; Integer)
        {
            BlankZero = true;
            Caption = 'Ref. Line No.';
        }
        field(15; "Line Type"; Option)
        {
            Caption = 'Line Type';
            OptionCaption = 'Header,Line';
            OptionMembers = Header,Line;
        }
        field(21; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
        }
        field(22; "Code"; Code[20])
        {
            Caption = 'Code';
            TableRelation = IF (Type = CONST(Item)) Item
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account";
        }
        field(23; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(24; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(25; "Currency Factor"; Decimal)
        {
        }
        field(26; "Invoiced Quantity"; Decimal)
        {
            BlankZero = true;
            Caption = 'Invoiced Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(27; "VAT %"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 0 : 5;
        }
        field(28; "Unit Price"; Decimal)
        {
            BlankZero = true;
            Caption = 'Unit Price';
            DecimalPlaces = 0 : 5;
        }
        field(29; Amount; Decimal)
        {
            BlankZero = true;
            Caption = 'Amount';
            DecimalPlaces = 0 : 5;
        }
        field(30; "Amount Including VAT"; Decimal)
        {
            BlankZero = true;
            Caption = 'Amount Including VAT';
            DecimalPlaces = 0 : 5;
        }
        field(31; "Amount (LCY)"; Decimal)
        {
            BlankZero = true;
            Caption = 'Amount (LCY)';
            DecimalPlaces = 0 : 5;
        }
        field(32; "VAT Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'VAT Amount';
            DecimalPlaces = 0 : 5;
        }
        field(33; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(34; "Line Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Line Amount';
            DecimalPlaces = 0 : 5;
            Description = 'Handled Amount = Line Amount';
        }
        field(41; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD(Code));
        }
        field(42; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        field(43; "Unit of Measure"; Text[30])
        {
            Caption = 'Unit of Measure';
        }
        field(44; "External Document No."; Text[50])
        {
            Caption = 'External Document No.';
        }
        field(45; "Order No."; Code[20])
        {
            Caption = 'Order No.';
        }
        field(46; DescriptionCHN; Text[100])
        {
            Caption = 'DescriptionCHN';
        }
        field(50; Splited; Boolean)
        {
            Caption = 'Splited';
        }
        field(60; Exported; Boolean)
        {
            Caption = 'Exported';
        }
        field(61; "Exported by"; Code[20])
        {
            Caption = 'Exported by';
            TableRelation = User;
        }
        field(62; "Exported Date"; Date)
        {
            Caption = 'Exported Date';
        }
        field(63; "Exported Number"; Integer)
        {
            Caption = 'Exported Number';
        }
        field(81; "Credit Memo Applied"; Boolean)
        {
            Caption = 'Credit Memo Applied';
        }
        field(82; "Applied Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Applied Amount';
            DecimalPlaces = 0 : 5;
        }
        field(100; "Expansion Status"; Option)
        {
            OptionCaption = 'Has Children,Expanded,No Children';
            OptionMembers = "Has Children",Expanded,"No Children";
        }
        field(101; "Parent Entry No."; Integer)
        {
            BlankZero = true;
        }
        field(102; Level; Integer)
        {
        }
        field(103; "Hide Line"; Boolean)
        {
        }
        field(105; "Actual Entry No."; Integer)
        {
        }
        field(106; "Sorting Level"; Integer)
        {
            Description = '10: Exported; 20: Handled; 30: free';
            InitValue = 30;
        }
        field(200; "Invoice Type"; Option)
        {
            Caption = 'Invoice Type';
            OptionCaption = '增票,普票,无需开票';
            OptionMembers = VAT,Normal,"None";
        }
        field(201; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }
        field(202; "Customer Name"; Text[50])
        {
            Caption = 'Customer Name';
        }
        field(203; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';

            trigger OnValidate()
            var
                VATRegNoFormat: Record "VAT Registration No. Format";
            begin
            end;
        }
        field(204; "VAT Address & Telephone"; Text[100])
        {
            Caption = 'VAT Address && Telephone';
        }
        field(205; "Bank Name & Account"; Text[100])
        {
            Caption = 'Bank Name & Account';
        }
        field(206; Remark; Text[250])
        {
            Caption = 'Remark';
        }
        field(210; "Invoice User"; Text[20])
        {
            Caption = 'Invoice User';
            Description = 'CH13.1';
        }
        field(211; "Check User"; Text[20])
        {
            Caption = 'Check User';
            Description = 'CH13.1';
        }
        field(212; Receipt; Text[20])
        {
            Caption = 'Receipt';
            Description = 'CH13.1';
        }
        field(213; "Bank Account"; Text[50])
        {
            Caption = 'Bank Account';
            Description = 'CH13.1';
        }
        field(214; "Address&Telephone"; Text[50])
        {
            Caption = 'Address&&Telephone';
            Description = 'CH13.1';
        }
        field(215; "Invoice Mail Address"; Text[100])
        {
            Caption = 'Invoice Mail Address';
            Description = 'CH13.1';
        }
        field(216; "Contact Information"; Text[50])
        {
            Caption = 'Contact Information';
            Description = 'CH13.3';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Document Type", "Document No.", "Document Line No.", "Ref. Line No.")
        {
        }
        key(Key3; "Sorting Level", "Document Type", "Document No.", "Document Line No.", "Ref. Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        UpdateSalesInvLine;
    end;

    trigger OnRename()
    begin
        IF NOT CONFIRM('Do you want to rename?', FALSE) THEN
            ERROR('Error - rename %1', Code);
    end;

    //[Scope('Internal')]
    procedure UpdateSalesInvLine()
    var
        lSalesInvLine: Record "Sales Invoice Line";
    begin
        lSalesInvLine.GET("Document No.", "Document Line No.");
        lSalesInvLine."Quantity Handled" -= "Invoiced Quantity";
        lSalesInvLine."Amount Handled" -= "Line Amount";
        lSalesInvLine.MODIFY;
    end;

    //[Scope('Internal')]
    procedure GetCrMemoApplied(var pInvoiceEntry: Record "Invoice Export Entry"; pShow: Boolean; var pAppliedAmt: Decimal): Decimal
    var
        lCustLedgEntry: Record "Cust. Ledger Entry";
        lCustLedgEntry2: Record "Cust. Ledger Entry";
        DtldCustLedgEntry1: Record "Detailed Cust. Ledg. Entry";
        DtldCustLedgEntry2: Record "Detailed Cust. Ledg. Entry";
        lAppliedEntryTemp: Record "Cust. Ledger Entry" temporary;
        lDetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        lClosedAmt: Decimal;
    begin
        lCustLedgEntry.SETRANGE("Document Type", lCustLedgEntry."Document Type"::Invoice);
        lCustLedgEntry.SETRANGE("Document No.", pInvoiceEntry."Document No.");
        lCustLedgEntry.SETRANGE("Posting Date", pInvoiceEntry."Posting Date");
        IF lCustLedgEntry.FINDFIRST THEN BEGIN
            IF lCustLedgEntry."Closed by Entry No." > 0 THEN BEGIN
                lCustLedgEntry2.GET(lCustLedgEntry."Closed by Entry No.");
                IF lCustLedgEntry2."Document Type" = lCustLedgEntry2."Document Type"::"Credit Memo" THEN BEGIN
                    IF NOT lAppliedEntryTemp.GET(lCustLedgEntry2."Entry No.") THEN BEGIN
                        lAppliedEntryTemp.INIT;
                        lAppliedEntryTemp := lCustLedgEntry2;

                        //CH-20150909-01 -->
                        IF lAppliedEntryTemp."Closed by Amount" = 0 THEN
                            lAppliedEntryTemp."Closed by Amount" := -lCustLedgEntry."Closed by Amount";
                        //CH-20150909-01 <--

                        lAppliedEntryTemp.INSERT;
                    END;
                END;
            END;

            lCustLedgEntry2.RESET;
            lCustLedgEntry2.SETCURRENTKEY("Closed by Entry No.");
            lCustLedgEntry2.SETRANGE("Closed by Entry No.", lCustLedgEntry."Entry No.");
            lCustLedgEntry2.SETRANGE("Document Type", lCustLedgEntry2."Document Type"::"Credit Memo");
            IF lCustLedgEntry2.FINDFIRST THEN
                REPEAT
                    IF NOT lAppliedEntryTemp.GET(lCustLedgEntry2."Entry No.") THEN BEGIN
                        lAppliedEntryTemp.INIT;
                        lAppliedEntryTemp := lCustLedgEntry2;
                        lAppliedEntryTemp.INSERT;
                    END;
                UNTIL lCustLedgEntry2.NEXT = 0;

            lCustLedgEntry2.RESET;
            DtldCustLedgEntry1.SETCURRENTKEY("Cust. Ledger Entry No.");
            DtldCustLedgEntry1.SETRANGE("Cust. Ledger Entry No.", lCustLedgEntry."Entry No.");
            DtldCustLedgEntry1.SETRANGE(Unapplied, FALSE);
            IF DtldCustLedgEntry1.FIND('-') THEN
                REPEAT
                    IF DtldCustLedgEntry1."Cust. Ledger Entry No." = DtldCustLedgEntry1."Applied Cust. Ledger Entry No." THEN BEGIN
                        DtldCustLedgEntry2.INIT;
                        DtldCustLedgEntry2.SETCURRENTKEY("Applied Cust. Ledger Entry No.", "Entry Type");
                        DtldCustLedgEntry2.SETRANGE(
                          "Applied Cust. Ledger Entry No.", DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                        DtldCustLedgEntry2.SETRANGE("Entry Type", DtldCustLedgEntry2."Entry Type"::Application);
                        DtldCustLedgEntry2.SETRANGE(Unapplied, FALSE);
                        IF DtldCustLedgEntry2.FIND('-') THEN
                            REPEAT
                                IF DtldCustLedgEntry2."Cust. Ledger Entry No." <> DtldCustLedgEntry2."Applied Cust. Ledger Entry No." THEN BEGIN
                                    lCustLedgEntry2.SETCURRENTKEY("Entry No.");
                                    lCustLedgEntry2.SETRANGE("Entry No.", DtldCustLedgEntry2."Cust. Ledger Entry No.");
                                    IF lCustLedgEntry2.FIND('-') THEN
                                        IF lCustLedgEntry2."Document Type" = lCustLedgEntry2."Document Type"::"Credit Memo" THEN BEGIN
                                            IF NOT lAppliedEntryTemp.GET(lCustLedgEntry2."Entry No.") THEN BEGIN
                                                lAppliedEntryTemp.INIT;
                                                lAppliedEntryTemp := lCustLedgEntry2;
                                                lAppliedEntryTemp.INSERT;

                                                IF lCustLedgEntry2."Closed by Amount" = 0 THEN BEGIN
                                                    lClosedAmt := 0;
                                                    lDetailedCustLedgEntry.SETRANGE("Customer No.", lCustLedgEntry2."Customer No.");
                                                    lDetailedCustLedgEntry.SETRANGE("Cust. Ledger Entry No.", lCustLedgEntry2."Entry No.");
                                                    lDetailedCustLedgEntry.SETRANGE("Entry Type", lDetailedCustLedgEntry."Entry Type"::Application);
                                                    IF lDetailedCustLedgEntry.FINDFIRST THEN
                                                        REPEAT
                                                            lClosedAmt += lDetailedCustLedgEntry.Amount;
                                                        UNTIL lDetailedCustLedgEntry.NEXT = 0;

                                                    IF lClosedAmt <> 0 THEN BEGIN
                                                        lAppliedEntryTemp."Closed by Amount" := -lClosedAmt;
                                                        lAppliedEntryTemp.MODIFY;
                                                    END;
                                                END;
                                            END;
                                        END;
                                END;
                            UNTIL DtldCustLedgEntry2.NEXT = 0;
                    END ELSE BEGIN
                        lCustLedgEntry2.SETCURRENTKEY("Entry No.");
                        lCustLedgEntry2.SETRANGE("Entry No.", DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                        IF lCustLedgEntry2.FIND('-') THEN
                            IF lCustLedgEntry2."Document Type" = lCustLedgEntry2."Document Type"::"Credit Memo" THEN BEGIN
                                IF NOT lAppliedEntryTemp.GET(lCustLedgEntry2."Entry No.") THEN BEGIN
                                    lAppliedEntryTemp.INIT;
                                    lAppliedEntryTemp := lCustLedgEntry2;
                                    lAppliedEntryTemp.INSERT;

                                    IF lCustLedgEntry2."Closed by Amount" = 0 THEN BEGIN
                                        lClosedAmt := 0;
                                        lDetailedCustLedgEntry.SETRANGE("Customer No.", lCustLedgEntry2."Customer No.");
                                        lDetailedCustLedgEntry.SETRANGE("Cust. Ledger Entry No.", lCustLedgEntry2."Entry No.");
                                        lDetailedCustLedgEntry.SETRANGE("Entry Type", lDetailedCustLedgEntry."Entry Type"::Application);
                                        IF lDetailedCustLedgEntry.FINDFIRST THEN
                                            REPEAT
                                                lClosedAmt += lDetailedCustLedgEntry.Amount;
                                            UNTIL lDetailedCustLedgEntry.NEXT = 0;

                                        IF lClosedAmt <> 0 THEN BEGIN
                                            lAppliedEntryTemp."Closed by Amount" := -lClosedAmt;
                                            lAppliedEntryTemp.MODIFY;
                                        END;
                                    END;
                                END;
                            END;
                    END;
                UNTIL DtldCustLedgEntry1.NEXT = 0;
        END;


        pAppliedAmt := 0;

        IF pShow THEN
            PAGE.RUNMODAL(0, lAppliedEntryTemp)
        ELSE BEGIN
            lClosedAmt := 0;
            lAppliedEntryTemp.RESET;
            IF lAppliedEntryTemp.FINDFIRST THEN
                REPEAT
                    lClosedAmt += lAppliedEntryTemp."Closed by Amount";
                UNTIL lAppliedEntryTemp.NEXT = 0;

            pAppliedAmt := lClosedAmt;
        END;
    end;
}

