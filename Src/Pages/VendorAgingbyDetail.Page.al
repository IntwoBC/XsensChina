page 50011 "Vendor Aging by Detail"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Customer Aging by Detail';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    ShowFilter = false;
    SourceTable = "Vendor Ledger Entry";
    SourceTableTemporary = false;
    SourceTableView = SORTING("Vendor No.", "Posting Date", "Currency Code");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field(VendorName;
                Vendor.Name)
                {
                    Caption = 'Vendor Name';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    Caption = 'Invoice No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vendor entry''s document number.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the vendor entry.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currency code for the amount on the line.';
                }
                field(Tmp_InvAmt; Rec.Tmp_InvAmt)
                {
                    Caption = 'Invoice Amounts';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Amounts field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(100);
                    end;
                }
                field("Purchase (LCY)"; Rec."Purchase (LCY)")
                {
                    Caption = 'Invoice Amounts LCY';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Amounts LCY field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(100);
                    end;
                }
                field(Tmp_RemainingAmount; Rec.Tmp_RemainingAmount)
                {
                    Caption = 'Remaining Amounts';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remaining Amounts field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(200);
                    end;
                }
                field("Pmt. Tolerance (LCY)"; Rec."Pmt. Tolerance (LCY)")
                {
                    Caption = 'Remaining Amounts(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remaining Amounts(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(200);
                    end;
                }
                field(Day0; Day0)
                {
                    Caption = '0~30D';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0~30D field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(0);
                    end;
                }
                field(Day0_LCY; Day0_LCY)
                {
                    Caption = '0~30D(LCY)';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0~30D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(0);
                    end;
                }
                field(Day30; Day30)
                {
                    Caption = '31~60D';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31~60D field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(30);
                    end;
                }
                field(Day30_LCY; Day30_LCY)
                {
                    Caption = '31~60D(LCY)';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31~60D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(30);
                    end;
                }
                field(Day60; Day60)
                {
                    Caption = '61~90D';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61~90D field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(60);
                    end;
                }
                field(Day60_LCY; Day60_LCY)
                {
                    Caption = '61~90D(LCY)';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61~90D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(60);
                    end;
                }
                field(Day90; Day90)
                {
                    Caption = '91~120D';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91~120D field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(90);
                    end;
                }
                field(Day90_LCY; Day90_LCY)
                {
                    Caption = '91~120D(LCY)';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91~120D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(90);
                    end;
                }
                field(Day120; Day120)
                {
                    Caption = '>120D';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the >120D field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(120);
                    end;
                }
                field(Day120_LCY; Day120_LCY)
                {
                    Caption = '>120D(LCY)';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the >120D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntries(120);
                    end;
                }
                field(Tmp_BalanceLCY; Rec.Tmp_BalanceLCY)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance (LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntriesByCurrency(1000, 'ALL');
                    end;
                }
                field(Tmp_BalanceRMB; Rec.Tmp_BalanceRMB)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance RMB field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntriesByCurrency(1000, '');
                    end;
                }
                field(Tmp_BalanceUSD; Rec.Tmp_BalanceUSD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance USD field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntriesByCurrency(1000, 'USD');
                    end;
                }
                field(Tmp_BalanceEUR; Rec.Tmp_BalanceEUR)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance EUR field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendorEntriesByCurrency(1000, 'EUR');
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrVendorNo := Rec."Vendor No.";
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.SETRANGE("Date Filter", 0D, 99991231D);
        Rec.CALCFIELDS("Amount (LCY)", "Remaining Amt. (LCY)", Amount, "Remaining Amount");
        /*
        DetailVendorLedEntry.RESET;
        DetailVendorLedEntry.SETCURRENTKEY("Vendor Ledger Entry No.","Entry Type","Posting Date");
        DetailVendorLedEntry.SETRANGE("Vendor Ledger Entry No.","Entry No.");
        //DetailVendorLedEntry.SETRANGE("Currency Code",?);
        DetailVendorLedEntry.SETRANGE("Posting Date",CALCDATE('-30D',WORKDATE),WORKDATE);
        DetailVendorLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day0 :=-DetailVendorLedEntry."Amount (LCY)";
        DetailVendorLedEntry.SETRANGE("Posting Date",CALCDATE('-60D',WORKDATE),CALCDATE('-31D',WORKDATE));
        DetailVendorLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day30 :=-DetailVendorLedEntry."Amount (LCY)";
        DetailVendorLedEntry.SETRANGE("Posting Date",CALCDATE('-90D',WORKDATE),CALCDATE('-61D',WORKDATE));
        DetailVendorLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day60 :=-DetailVendorLedEntry."Amount (LCY)";
        DetailVendorLedEntry.SETRANGE("Posting Date",CALCDATE('-120D',WORKDATE),CALCDATE('-91D',WORKDATE));
        DetailVendorLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day90 :=-DetailVendorLedEntry."Amount (LCY)";
        DetailVendorLedEntry.SETRANGE("Posting Date",0D,CALCDATE('-121D',WORKDATE));
        DetailVendorLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day120 :=-DetailVendorLedEntry."Amount (LCY)";
        */

        Rec.CALCFIELDS(BalanceLCY, BalanceRMB, BalanceUSD, BalanceEUR);  //NEW

        IF NOT Vendor.GET(Rec."Vendor No.") THEN CLEAR(Vendor);

        //calc total <--
        IF TmpRec."Entry No." <> 999999999 THEN BEGIN
            IF TmpRec_Total.GET(Rec."Entry No.") THEN BEGIN
                Total_0_LCY += Day0_LCY;
                Total_30_LCY += Day30_LCY;
                Total_60_LCY += Day60_LCY;
                Total_90_LCY += Day90_LCY;
                Total_120_LCY += Day120_LCY;
                InvAmt_Total_LCY += -Rec."Amount (LCY)";
                RemAmt_Total_LCY += -Rec."Remaining Amt. (LCY)";

                Total_0 += Day0;
                Total_30 += Day30;
                Total_60 += Day60;
                Total_90 += Day90;
                Total_120 += Day120;
                InvAmt_Total += -Rec.Amount;
                RemAmt_Total += -Rec."Remaining Amount";

                //NEW <--
                SumBalanceLCY += Rec.BalanceLCY;
                SumBalanceRMB += Rec.BalanceRMB;
                SumBalanceUSD += Rec.BalanceUSD;
                SumBalanceEUR += Rec.BalanceEUR;
                //NEW -->

                TmpRec_Total.DELETE;
            END;
            Rec."Purchase (LCY)" := -Rec."Amount (LCY)";
            Rec."Pmt. Tolerance (LCY)" := -Rec."Remaining Amt. (LCY)";

            Rec.Tmp_InvAmt := -Rec.Amount;
            Rec.Tmp_RemainingAmount := -Rec."Remaining Amount";

            //NEW <--
            Rec.Tmp_BalanceLCY := Rec.BalanceLCY;
            Rec.Tmp_BalanceRMB := Rec.BalanceRMB;
            Rec.Tmp_BalanceUSD := Rec.BalanceUSD;
            Rec.Tmp_BalanceEUR := Rec.BalanceEUR;
            //NEW -->

        END ELSE BEGIN
            Day0_LCY := Total_0_LCY;
            Day30_LCY := Total_30_LCY;
            Day60_LCY := Total_60_LCY;
            Day90_LCY := Total_90_LCY;
            Day120_LCY := Total_120_LCY;
            Rec."Purchase (LCY)" := InvAmt_Total_LCY;
            Rec."Pmt. Tolerance (LCY)" := RemAmt_Total_LCY;

            Day0 := Total_0;
            Day30 := Total_30;
            Day60 := Total_60;
            Day90 := Total_90;
            Day120 := Total_120;
            Rec.Tmp_InvAmt := InvAmt_Total;
            Rec.Tmp_RemainingAmount := RemAmt_Total;

            //NEW <--
            Rec.Tmp_BalanceLCY := SumBalanceLCY;
            Rec.Tmp_BalanceRMB := SumBalanceRMB;
            Rec.Tmp_BalanceUSD := SumBalanceUSD;
            Rec.Tmp_BalanceEUR := SumBalanceEUR;
            //NEW -->

        END;
        //calc total -->

    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        TmpRec.COPY(Rec);
        IF NOT TmpRec.FIND(Which) THEN
            EXIT(FALSE);
        Rec := TmpRec;
        EXIT(TRUE);
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        TmpRec.COPY(Rec);
        CurrentSteps := TmpRec.NEXT(Steps);
        IF CurrentSteps <> 0 THEN
            Rec := TmpRec;
        EXIT(CurrentSteps);
    end;

    var
        TmpRec: Record "Vendor Ledger Entry" temporary;
        CurrentSteps: Integer;
        VendorLedEntry: Record "Vendor Ledger Entry";
        DetailVendorLedEntry: Record "Detailed Vendor Ledg. Entry";
        Vendor: Record Vendor;
        CurrVendorNo: Code[20];
        Day0: Decimal;
        Day30: Decimal;
        Day60: Decimal;
        Day90: Decimal;
        Day120: Decimal;
        InvAmt_Total: Decimal;
        RemAmt_Total: Decimal;
        Total_0: Decimal;
        Total_30: Decimal;
        Total_60: Decimal;
        Total_90: Decimal;
        Total_120: Decimal;
        TmpRec_Total: Record "Vendor Ledger Entry" temporary;
        LastVendorNo: Label 'ZZZZZZZZZZZZZZZZZZZZ';
        LastNo: Integer;
        Day0_LCY: Decimal;
        Day30_LCY: Decimal;
        Day60_LCY: Decimal;
        Day90_LCY: Decimal;
        Day120_LCY: Decimal;
        Total_0_LCY: Decimal;
        Total_30_LCY: Decimal;
        Total_60_LCY: Decimal;
        Total_90_LCY: Decimal;
        Total_120_LCY: Decimal;
        InvAmt_Total_LCY: Decimal;
        RemAmt_Total_LCY: Decimal;
        __: Integer;
        SumBalanceLCY: Decimal;
        SumBalanceRMB: Decimal;
        SumBalanceUSD: Decimal;
        SumBalanceEUR: Decimal;

    //[Scope('Internal')]
    procedure FilterData(VendorNoFilter: Code[20]; VendorGroupFilter: Code[20])
    var
        SalesHdrL: Record "Sales Header";
        ToInsert: Boolean;
    begin
        InvAmt_Total_LCY := 0;
        RemAmt_Total_LCY := 0;
        Total_0_LCY := 0;
        Total_30_LCY := 0;
        Total_60_LCY := 0;
        Total_90_LCY := 0;
        Total_120_LCY := 0;
        InvAmt_Total := 0;
        RemAmt_Total := 0;
        Total_0 := 0;
        Total_30 := 0;
        Total_60 := 0;
        Total_90 := 0;
        Total_120 := 0;

        //NEW <--
        SumBalanceLCY := 0;
        SumBalanceRMB := 0;
        SumBalanceUSD := 0;
        SumBalanceEUR := 0;
        //NEW -->

        TmpRec.DELETEALL;
        TmpRec_Total.DELETEALL;
        VendorLedEntry.RESET;
        VendorLedEntry.SETRANGE(Open, TRUE);//NEW
        IF VendorNoFilter <> '' THEN
            VendorLedEntry.SETRANGE("Vendor No.", VendorNoFilter);
        //IF VendorGroupFilter <> '' THEN
        //  VendorLedEntry.SETFILTER("Vendor No.",VendorGroupFilter);
        IF VendorLedEntry.FINDSET THEN BEGIN
            REPEAT
                ToInsert := TRUE;
                IF VendorGroupFilter <> '' THEN
                    IF ToInsert AND (VendorGroupFilter <> '') THEN BEGIN
                        IF Vendor.GET(VendorLedEntry."Vendor No.") THEN BEGIN
                            ////IF Vendor."Vendor Price Group" <> VendorGroupFilter THEN ToInsert :=FALSE;
                        END;
                    END;
                IF ToInsert THEN BEGIN
                    TmpRec.INIT;
                    TmpRec.TRANSFERFIELDS(VendorLedEntry);
                    TmpRec."Buy-from Vendor No." := TmpRec."Vendor No.";
                    TmpRec.INSERT;
                    TmpRec_Total := TmpRec;
                    TmpRec_Total.INSERT;

                END;
            UNTIL VendorLedEntry.NEXT = 0;
            AddTotal;
        END;
    end;

    //[Scope('Internal')]
    procedure OpenVendorCard()
    var
        VendorL: Record Vendor;
    begin
        VendorL.RESET;
        VendorL.SETRANGE("No.", CurrVendorNo);
        IF VendorL.FINDSET THEN
            PAGE.RUNMODAL(21, VendorL);
    end;

    local procedure ShowVendorEntries(IntP: Integer)
    begin
        IF Rec."Entry No." = 999999999 THEN EXIT;
        DetailVendorLedEntry.RESET;
        DetailVendorLedEntry.SETCURRENTKEY("Vendor Ledger Entry No.", "Entry Type", "Posting Date");
        DetailVendorLedEntry.SETRANGE("Vendor Ledger Entry No.", Rec."Entry No.");
        //DetailVendorLedEntry.SETRANGE("Currency Code",?);
        CASE IntP OF
            0:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Posting Date", CALCDATE('-30D', WORKDATE), WORKDATE);
                END;
            30:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Posting Date", CALCDATE('-60D', WORKDATE), CALCDATE('-31D', WORKDATE));
                END;
            60:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Posting Date", CALCDATE('-90D', WORKDATE), CALCDATE('-61D', WORKDATE));
                END;
            90:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Posting Date", CALCDATE('-120D', WORKDATE), CALCDATE('-91D', WORKDATE));
                END;
            120:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Posting Date", 0D, CALCDATE('-121D', WORKDATE));
                END;
            100:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Posting Date", 0D, 99991231D);
                END;
            200:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Posting Date", 0D, 99991231D);
                END;
        END;
        PAGE.RUN(0, DetailVendorLedEntry)
    end;

    local procedure AddTotal()
    begin
        CLEAR(VendorLedEntry);
        TmpRec.INIT;
        TmpRec.TRANSFERFIELDS(VendorLedEntry);
        TmpRec."Entry No." := 999999999;
        TmpRec."Vendor No." := LastVendorNo;
        TmpRec."Document No." := 'TOTAL:';
        TmpRec.INSERT;

        TmpRec_Total := TmpRec;
        TmpRec_Total.INSERT;
    end;

    local procedure ShowVendorEntriesByCurrency(IntP: Integer; CurrencyCodeP: Code[10])
    begin
        //NEW
        IF Rec."Entry No." = 999999999 THEN EXIT;
        DetailVendorLedEntry.RESET;
        DetailVendorLedEntry.SETCURRENTKEY("Vendor Ledger Entry No.", "Entry Type", "Posting Date");
        DetailVendorLedEntry.SETRANGE("Vendor Ledger Entry No.", Rec."Entry No.");
        IF CurrencyCodeP <> 'ALL' THEN
            DetailVendorLedEntry.SETRANGE("Currency Code", CurrencyCodeP)
        ELSE
            DetailVendorLedEntry.SETRANGE("Currency Code");
        //DetailVendorLedEntry.SETRANGE("Vendor Ledg. Entry Is Open",TRUE);可省略，当前关联的Vendor ledger entry应该已经是OPEN
        CASE IntP OF
            0:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date", CALCDATE('-30D', WORKDATE), WORKDATE);
                END;
            30:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date", CALCDATE('-60D', WORKDATE), CALCDATE('-31D', WORKDATE));
                END;
            60:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date", CALCDATE('-90D', WORKDATE), CALCDATE('-61D', WORKDATE));
                END;
            90:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date", CALCDATE('-120D', WORKDATE), CALCDATE('-91D', WORKDATE));
                END;
            120:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date", 0D, CALCDATE('-121D', WORKDATE));
                END;
            1000:
                BEGIN
                    DetailVendorLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date");
                END;
        END;

        PAGE.RUN(0, DetailVendorLedEntry)
    end;
}

