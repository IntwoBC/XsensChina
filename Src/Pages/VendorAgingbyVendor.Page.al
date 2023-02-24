page 50010 "Vendor Aging by Vendor"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Vendor Aging by Customer';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    ShowFilter = false;
    SourceTable = Vendor;
    SourceTableTemporary = false;
    SourceTableView = SORTING("No.");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                FreezeColumn = "Search Name";
                field("Search Name"; Rec."Search Name")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the vendor''s name. You can enter a maximum of 30 characters, both numbers and letters.';
                }
                field(Tmp_Balance; Rec.Tmp_Balance)
                {
                    Caption = 'Balance';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntries(100);
                    end;
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    Caption = 'Balance (LCY)';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance (LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntries(100);
                    end;
                }
                field(Tmp_OverDue; Rec.Tmp_OverDue)
                {
                    Caption = 'Over Due';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Over Due field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntries(200);
                    end;
                }
                field("Tmp_OverDue(LCY)"; Rec."Tmp_OverDue(LCY)")
                {
                    Caption = 'Over Due (LCY)';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Over Due (LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntries(200);
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
                        ShowVendEntries(0);
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
                        ShowVendEntries(0);
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
                        ShowVendEntries(30);
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
                        ShowVendEntries(30);
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
                        ShowVendEntries(60);
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
                        ShowVendEntries(60);
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
                        ShowVendEntries(90);
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
                        ShowVendEntries(90);
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
                        ShowVendEntries(120);
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
                        ShowVendEntries(120);
                    end;
                }
                field(Tmp_BalanceLCY; Rec.Tmp_BalanceLCY)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_BalanceLCY field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(1000, 'ALL');
                    end;
                }
                field(Tmp_BalanceRMB; Rec.Tmp_BalanceRMB)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_BalanceRMB field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(1000, '');
                    end;
                }
                field(Tmp_BalanceUSD; Rec.Tmp_BalanceUSD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_BalanceUSD field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(1000, 'USD');
                    end;
                }
                field(Tmp_BalanceEUR; Rec.Tmp_BalanceEUR)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_BalanceEUR field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(1000, 'EUR');
                    end;
                }
                field(D0_LCY; D0[1])
                {
                    Caption = '0~30D(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0~30D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(0, 'ALL');
                    end;
                }
                field(D0_RMB; D0[2])
                {
                    Caption = '0~30D(RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0~30D(RMB) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(0, '');
                    end;
                }
                field(D0_USD; D0[3])
                {
                    Caption = '0~30D(USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0~30D(USD) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(0, 'USD');
                    end;
                }
                field(D0_EUR; D0[4])
                {
                    Caption = '0~30D(EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0~30D(EUR) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(0, 'EUR');
                    end;
                }
                field(D30_LCY; D30[1])
                {
                    Caption = '31~60D(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31~60D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(30, 'ALL');
                    end;
                }
                field(D30_RMB; D30[2])
                {
                    Caption = '31~60D(RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31~60D(RMB) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(30, '');
                    end;
                }
                field(D30_USD; D30[3])
                {
                    Caption = '31~60D(USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31~60D(USD) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(30, 'USD');
                    end;
                }
                field(D30_EUR; D30[4])
                {
                    Caption = '31~60D(EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31~60D(EUR) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(30, 'EUR');
                    end;
                }
                field(D60_LCY; D60[1])
                {
                    Caption = '61~90D(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61~90D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(60, 'ALL');
                    end;
                }
                field(D60_RMB; D60[2])
                {
                    Caption = '61~90D(RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61~90D(RMB) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(60, '');
                    end;
                }
                field(D60_USD; D60[3])
                {
                    Caption = '61~90D(USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61~90D(USD) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(60, 'USD');
                    end;
                }
                field(D60_EUR; D60[4])
                {
                    Caption = '61~90D(EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61~90D(EUR) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(60, 'EUR');
                    end;
                }
                field(D90_LCY; D90[1])
                {
                    Caption = '91~120D(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91~120D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(90, 'ALL');
                    end;
                }
                field(D90_RMB; D90[2])
                {
                    Caption = '91~120D(RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91~120D(RMB) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(90, '');
                    end;
                }
                field(D90_USD; D90[3])
                {
                    Caption = '91~120D(USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91~120D(USD) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(90, 'USD');
                    end;
                }
                field(D90_EUR; D90[4])
                {
                    Caption = '91~120D(EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91~120D(EUR) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(90, 'EUR');
                    end;
                }
                field(D120_LCY; D120[1])
                {
                    Caption = '>120D(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the >120D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(120, 'ALL');
                    end;
                }
                field(D120_RMB; D120[2])
                {
                    Caption = '>120D(RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the >120D(RMB) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(120, '');
                    end;
                }
                field(D120_USD; D120[3])
                {
                    Caption = '>120D(USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the >120D(USD) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(120, 'USD');
                    end;
                }
                field(D120_EUR; D120[4])
                {
                    Caption = '>120D(EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the >120D(EUR) field.';
                    trigger OnDrillDown()
                    begin
                        ShowVendEntriesByCurrency(120, 'EUR');
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
        CurrVendNo := Rec."No.";
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.SETRANGE("Date Filter", 0D, WORKDATE);
        /*
        CALCFIELDS("Balance (LCY)","Balance Due (LCY)",Balance,"Balance Due");
        DetailVendLedEntry.RESET;
        DetailVendLedEntry.SETCURRENTKEY("Vendor No.","Currency Code","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2","Initial Entry Due Date","Posting Date");
        DetailVendLedEntry.SETRANGE("Vendor No.","No.");
        //DetailVendLedEntry.SETRANGE("Currency Code",?);
        DetailVendLedEntry.SETRANGE("Posting Date",CALCDATE('-30D',WORKDATE),WORKDATE);
        DetailVendLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day0 :=-DetailVendLedEntry.Amount;
        Day0_LCY :=-DetailVendLedEntry."Amount (LCY)";
        DetailVendLedEntry.SETRANGE("Posting Date",CALCDATE('-60D',WORKDATE),CALCDATE('-31D',WORKDATE));
        DetailVendLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day30_LCY :=-DetailVendLedEntry."Amount (LCY)";
        Day30 :=-DetailVendLedEntry.Amount;
        DetailVendLedEntry.SETRANGE("Posting Date",CALCDATE('-90D',WORKDATE),CALCDATE('-61D',WORKDATE));
        DetailVendLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day60_LCY :=-DetailVendLedEntry."Amount (LCY)";
        Day60 :=-DetailVendLedEntry.Amount;
        DetailVendLedEntry.SETRANGE("Posting Date",CALCDATE('-120D',WORKDATE),CALCDATE('-91D',WORKDATE));
        DetailVendLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day90_LCY :=-DetailVendLedEntry."Amount (LCY)";
        Day90 :=-DetailVendLedEntry.Amount;
        DetailVendLedEntry.SETRANGE("Posting Date",0D,CALCDATE('-121D',WORKDATE));
        DetailVendLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day120_LCY :=-DetailVendLedEntry."Amount (LCY)";
        Day120 :=-DetailVendLedEntry.Amount;
        */

        //NEW <--
        Rec.CALCFIELDS(BalanceLCY, BalanceRMB, BalanceUSD, BalanceEUR);
        Vendor.RESET;
        Vendor.SETRANGE("No.", Rec."No.");
        IF Vendor.FINDSET THEN BEGIN
            Vendor.SETRANGE("Date Filter", CALCDATE('-30D', WORKDATE), WORKDATE);
            Vendor.CALCFIELDS(BalanceLCY, BalanceRMB, BalanceUSD, BalanceEUR);
            D0[1] := -Vendor.BalanceLCY;
            D0[2] := -Vendor.BalanceRMB;
            D0[3] := -Vendor.BalanceUSD;
            D0[4] := -Vendor.BalanceEUR;
            Vendor.SETRANGE("Date Filter", CALCDATE('-60D', WORKDATE), CALCDATE('-31D', WORKDATE));
            Vendor.CALCFIELDS(BalanceLCY, BalanceRMB, BalanceUSD, BalanceEUR);
            D30[1] := -Vendor.BalanceLCY;
            D30[2] := -Vendor.BalanceRMB;
            D30[3] := -Vendor.BalanceUSD;
            D30[4] := -Vendor.BalanceEUR;
            Vendor.SETRANGE("Date Filter", CALCDATE('-90D', WORKDATE), CALCDATE('-61D', WORKDATE));
            Vendor.CALCFIELDS(BalanceLCY, BalanceRMB, BalanceUSD, BalanceEUR);
            D60[1] := -Vendor.BalanceLCY;
            D60[2] := -Vendor.BalanceRMB;
            D60[3] := -Vendor.BalanceUSD;
            D60[4] := -Vendor.BalanceEUR;
            Vendor.SETRANGE("Date Filter", CALCDATE('-120D', WORKDATE), CALCDATE('-91D', WORKDATE));
            Vendor.CALCFIELDS(BalanceLCY, BalanceRMB, BalanceUSD, BalanceEUR);
            D90[1] := -Vendor.BalanceLCY;
            D90[2] := -Vendor.BalanceRMB;
            D90[3] := -Vendor.BalanceUSD;
            D90[4] := -Vendor.BalanceEUR;
            Vendor.SETRANGE("Date Filter", 0D, CALCDATE('-121D', WORKDATE));
            Vendor.CALCFIELDS(BalanceLCY, BalanceRMB, BalanceUSD, BalanceEUR);
            D120[1] := -Vendor.BalanceLCY;
            D120[2] := -Vendor.BalanceRMB;
            D120[3] := -Vendor.BalanceUSD;
            D120[4] := -Vendor.BalanceEUR;
        END ELSE BEGIN
            CLEAR(D0);
            CLEAR(D30);
            CLEAR(D60);
            CLEAR(D90);
            CLEAR(D120);
        END;
        //NEW -->

        //calc total <--
        IF TmpRec."No." <> LastNo THEN BEGIN
            IF TmpRec_Total.GET(TmpRec."No.") THEN BEGIN
                /*
                Total_0_LCY +=Day0_LCY;
                Total_30_LCY +=Day30_LCY;
                Total_60_LCY +=Day60_LCY;
                Total_90_LCY +=Day90_LCY;
                Total_120_LCY +=Day120_LCY;
                BalanceLCY_Total += "Balance (LCY)";
                BalanceDueLCY_Total +="Balance Due (LCY)";

                Total_0 +=Day0;
                Total_30 +=Day30;
                Total_60 +=Day60;
                Total_90 +=Day90;
                Total_120 +=Day120;
                Balance_Total += Balance;
                BalanceDue_Total +="Balance Due";
                */
                //NEW <--
                FOR i := 1 TO 4 DO BEGIN
                    Sum0[i] += D0[i];
                    Sum30[i] += D30[i];
                    Sum60[i] += D60[i];
                    Sum90[i] += D90[i];
                    Sum120[i] += D120[i];
                END;
                SumBalanceLCY -= Rec.BalanceLCY;
                SumBalanceRMB -= Rec.BalanceRMB;
                SumBalanceUSD -= Rec.BalanceUSD;
                SumBalanceEUR -= Rec.BalanceEUR;
                //NEW -->

                TmpRec_Total.DELETE;
            END;
            /*
            "Budgeted Amount" := "Balance (LCY)";
            "Tmp_OverDue(LCY)" :="Balance Due (LCY)";
            Tmp_Balance := Balance;
            Tmp_OverDue :="Balance Due";
            */
            //NEW <--
            Rec.Tmp_BalanceLCY := -Rec.BalanceLCY;
            Rec.Tmp_BalanceRMB := -Rec.BalanceRMB;
            Rec.Tmp_BalanceUSD := -Rec.BalanceUSD;
            Rec.Tmp_BalanceEUR := -Rec.BalanceEUR;
            //NEW -->
        END ELSE BEGIN
            /*Day0_LCY :=Total_0_LCY;
            Day30_LCY :=Total_30_LCY;
            Day60_LCY :=Total_60_LCY;
            Day90_LCY :=Total_90_LCY;
            Day120_LCY :=Total_120_LCY;
            "Budgeted Amount" := BalanceLCY_Total;
            "Tmp_OverDue(LCY)" :=BalanceDueLCY_Total;

            Day0 :=Total_0;
            Day30 :=Total_30;
            Day60 :=Total_60;
            Day90 :=Total_90;
            Day120 :=Total_120;
            Tmp_Balance := Balance_Total;
            Tmp_OverDue :=BalanceDue_Total;
            */
            //NEW <--
            FOR i := 1 TO 4 DO BEGIN
                D0[i] := Sum0[i];
                D30[i] := Sum30[i];
                D60[i] := Sum60[i];
                D90[i] := Sum90[i];
                D120[i] := Sum120[i];
            END;
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
        TmpRec: Record Vendor temporary;
        CurrentSteps: Integer;
        VendLedEntry: Record "Vendor Ledger Entry";
        DetailVendLedEntry: Record "Detailed Vendor Ledg. Entry";
        Vendor: Record Vendor;
        CurrVendNo: Code[20];
        Day0: Decimal;
        Day30: Decimal;
        Day60: Decimal;
        Day90: Decimal;
        Day120: Decimal;
        Balance_Total: Decimal;
        BalanceDue_Total: Decimal;
        Total_0: Decimal;
        Total_30: Decimal;
        Total_60: Decimal;
        Total_90: Decimal;
        LastNo: Label 'ZZZZZZZZZZZZZZZZZZZZ';
        Total_120: Decimal;
        TmpRec_Total: Record Vendor temporary;
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
        BalanceLCY_Total: Decimal;
        BalanceDueLCY_Total: Decimal;
        __: Integer;
        D0: array[4] of Decimal;
        D30: array[4] of Decimal;
        D60: array[4] of Decimal;
        D90: array[4] of Decimal;
        D120: array[4] of Decimal;
        Sum0: array[4] of Decimal;
        Sum30: array[4] of Decimal;
        Sum60: array[4] of Decimal;
        Sum90: array[4] of Decimal;
        Sum120: array[4] of Decimal;
        SumBalanceLCY: Decimal;
        SumBalanceRMB: Decimal;
        SumBalanceUSD: Decimal;
        SumBalanceEUR: Decimal;
        i: Integer;

    //[Scope('Internal')]
    procedure FilterData(VendorNoFilter: Code[20]; VendorGroupFilter: Code[20])
    var
        SalesHdrL: Record "Sales Header";
        ToInsert: Boolean;
    begin
        /*
        BalanceLCY_Total :=0;
        BalanceDueLCY_Total :=0;
        Total_0_LCY :=0;
        Total_30_LCY :=0;
        Total_60_LCY :=0;
        Total_90_LCY :=0;
        Total_120_LCY :=0;
        Balance_Total :=0;
        BalanceDue_Total :=0;
        Total_0 :=0;
        Total_30 :=0;
        Total_60 :=0;
        Total_90 :=0;
        Total_120 :=0;
        */
        //NEW <--
        CLEAR(D0);
        CLEAR(D30);
        CLEAR(D60);
        CLEAR(D90);
        CLEAR(D120);
        CLEAR(Sum0);
        CLEAR(Sum30);
        CLEAR(Sum60);
        CLEAR(Sum90);
        CLEAR(Sum120);
        SumBalanceLCY := 0;
        SumBalanceRMB := 0;
        SumBalanceUSD := 0;
        SumBalanceEUR := 0;
        //NEW -->

        TmpRec.DELETEALL;
        TmpRec_Total.DELETEALL;
        Vendor.RESET;
        IF VendorNoFilter <> '' THEN
            Vendor.SETRANGE("No.", VendorNoFilter);
        //IF VendorGroupFilter <> '' THEN
        //  Vendor.SETFILTER("Vendor Price Group",VendorGroupFilter);
        IF Vendor.FINDSET THEN BEGIN
            REPEAT
                ToInsert := TRUE;
                IF ToInsert THEN BEGIN
                    TmpRec.INIT;
                    TmpRec.TRANSFERFIELDS(Vendor);
                    TmpRec."Search Name" := TmpRec."No.";
                    TmpRec.INSERT;

                    TmpRec_Total := TmpRec;
                    TmpRec_Total.INSERT;

                END;
            UNTIL Vendor.NEXT = 0;
            AddTotal;
        END;

    end;

    //[Scope('Internal')]
    procedure OpenVendorCard()
    var
        VendorL: Record Vendor;
    begin
        VendorL.RESET;
        VendorL.SETRANGE("No.", CurrVendNo);
        IF VendorL.FINDSET THEN
            PAGE.RUNMODAL(PAGE::"Vendor Card", VendorL);
    end;

    local procedure ShowVendEntries(IntP: Integer)
    begin
        IF Rec."No." = LastNo THEN EXIT;
        DetailVendLedEntry.RESET;
        DetailVendLedEntry.SETCURRENTKEY("Vendor No.", "Currency Code", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2", "Initial Entry Due Date", "Posting Date");
        DetailVendLedEntry.SETRANGE("Vendor No.", Rec."No.");
        //DetailVendLedEntry.SETRANGE("Currency Code",?);
        CASE IntP OF
            0:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Posting Date", CALCDATE('-30D', WORKDATE), WORKDATE);
                END;
            30:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Posting Date", CALCDATE('-60D', WORKDATE), CALCDATE('-31D', WORKDATE));
                END;
            60:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Posting Date", CALCDATE('-90D', WORKDATE), CALCDATE('-61D', WORKDATE));
                END;
            90:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Posting Date", CALCDATE('-120D', WORKDATE), CALCDATE('-91D', WORKDATE));
                END;
            120:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Posting Date", 0D, CALCDATE('-121D', WORKDATE));
                END;
            100:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Posting Date");
                END;
            200:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Posting Date", 0D, WORKDATE);
                END;

        END;
        PAGE.RUN(0, DetailVendLedEntry)
    end;

    local procedure AddTotal()
    begin
        CLEAR(Vendor);
        TmpRec.INIT;
        TmpRec.TRANSFERFIELDS(Vendor);
        TmpRec."No." := LastNo;
        TmpRec."Search Name" := '';
        TmpRec.Name := 'TOTAL:';
        TmpRec.INSERT;

        TmpRec_Total := TmpRec;
        TmpRec_Total.INSERT;
    end;

    local procedure ShowVendEntriesByCurrency(IntP: Integer; CurrencyCodeP: Code[10])
    begin
        //NEW
        IF Rec."No." = LastNo THEN EXIT;
        DetailVendLedEntry.RESET;
        DetailVendLedEntry.SETCURRENTKEY("Vendor No.", "Currency Code", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2", "Initial Entry Due Date", "Posting Date");
        DetailVendLedEntry.SETRANGE("Vendor No.", Rec."No.");
        IF CurrencyCodeP <> 'ALL' THEN
            DetailVendLedEntry.SETRANGE("Currency Code", CurrencyCodeP)
        ELSE
            DetailVendLedEntry.SETRANGE("Currency Code");
        DetailVendLedEntry.SETRANGE("Vend. Ledg. Entry Is Open", TRUE);
        CASE IntP OF
            0:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date", CALCDATE('-30D', WORKDATE), WORKDATE);
                END;
            30:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date", CALCDATE('-60D', WORKDATE), CALCDATE('-31D', WORKDATE));
                END;
            60:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date", CALCDATE('-90D', WORKDATE), CALCDATE('-61D', WORKDATE));
                END;
            90:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date", CALCDATE('-120D', WORKDATE), CALCDATE('-91D', WORKDATE));
                END;
            120:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date", 0D, CALCDATE('-121D', WORKDATE));
                END;
            1000:
                BEGIN
                    DetailVendLedEntry.SETRANGE("Vend. Ledg. Entry Doc. Date");
                END;
        END;

        PAGE.RUN(0, DetailVendLedEntry)
    end;
}

