page 50015 "Customer Aging by Customer"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Customer Aging by Customer';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    ShowFilter = false;
    SourceTable = Customer;
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
                    ToolTip = 'Specifies an alternate name that you can use to search for a customer.';
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer price group code, which you can use to set up special sales prices in the Sales Prices window.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an additional part of the name.';
                }
                field("Reminder Terms Code"; Rec."Reminder Terms Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies how reminders about late payments are handled for this customer.';
                }
                field("Reminder Level"; ReminderLevelNo)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ReminderLevelNo field.';
                }
                field(Contact; Rec.Contact)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the person you regularly contact when you do business with this customer.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer''s email address.';
                }
                field(Advance; Advance)
                {
                    Caption = 'Advance(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Advance(LCY) field.';
                }
                field(gdc_Rec; gdc_Rec)
                {
                    Caption = 'Rec. (LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rec. (LCY) field.';
                }
                field(Tmp_Balance; Rec.Tmp_Balance)
                {
                    Caption = 'Balance';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_Balance field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntries(100);
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
                        ShowCustEntries(100);
                    end;
                }
                field(Tmp_OverDue; Rec.Tmp_OverDue)
                {
                    Caption = 'Over Due';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_OverDue field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntries(200);
                    end;
                }
                field(Tmp_BalanceLCY; Rec.Tmp_BalanceLCY)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance (LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(1000, 'ALL');
                    end;
                }
                field(Tmp_BalanceRMB; Rec.Tmp_BalanceRMB)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance RMB field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(1000, '');
                    end;
                }
                field(Tmp_BalanceUSD; Rec.Tmp_BalanceUSD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance USD field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(1000, 'USD');
                    end;
                }
                field(Tmp_BalanceEUR; Rec.Tmp_BalanceEUR)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance EUR field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(1000, 'EUR');
                    end;
                }
                field(gdc_Undue; gdc_Undue)
                {
                    Caption = 'Undue (LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Undue (LCY) field.';
                }
                field(OverdueAmtLCY; OverdueAmtLCY)
                {
                    Caption = 'Overdue (LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Overdue (LCY) field.';
                }
                field(OverdueAmtRMB; OverdueAmtRMB)
                {
                    Caption = 'Overdue (RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Overdue (RMB) field.';
                }
                field(OverdueAmtUSD; OverdueAmtUSD)
                {
                    Caption = 'Overdue (USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Overdue (USD) field.';
                }
                field(OverdueAmtEUR; OverdueAmtEUR)
                {
                    Caption = 'Overdue (EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Overdue (EUR) field.';
                }
                field(D0_LCY; D0[1])
                {
                    Caption = '0~30D(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0~30D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(0, 'ALL');
                    end;
                }
                field(D0_RMB; D0[2])
                {
                    Caption = '0~30D(RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0~30D(RMB) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(0, '');
                    end;
                }
                field(D0_USD; D0[3])
                {
                    Caption = '0~30D(USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0~30D(USD) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(0, 'USD');
                    end;
                }
                field(D0_EUR; D0[4])
                {
                    Caption = '0~30D(EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 0~30D(EUR) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(0, 'EUR');
                    end;
                }
                field(D30_LCY; D30[1])
                {
                    Caption = '31~60D(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31~60D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(30, 'ALL');
                    end;
                }
                field(D30_RMB; D30[2])
                {
                    Caption = '31~60D(RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31~60D(RMB) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(30, '');
                    end;
                }
                field(D30_USD; D30[3])
                {
                    Caption = '31~60D(USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31~60D(USD) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(30, 'USD');
                    end;
                }
                field(D30_EUR; D30[4])
                {
                    Caption = '31~60D(EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 31~60D(EUR) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(30, 'EUR');
                    end;
                }
                field(D60_LCY; D60[1])
                {
                    Caption = '61~90D(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61~90D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(60, 'ALL');
                    end;
                }
                field(D60_RMB; D60[2])
                {
                    Caption = '61~90D(RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61~90D(RMB) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(60, '');
                    end;
                }
                field(D60_USD; D60[3])
                {
                    Caption = '61~90D(USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61~90D(USD) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(60, 'USD');
                    end;
                }
                field(D60_EUR; D60[4])
                {
                    Caption = '61~90D(EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 61~90D(EUR) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(60, 'EUR');
                    end;
                }
                field(D90_LCY; D90[1])
                {
                    Caption = '91~120D(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91~120D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(90, 'ALL');
                    end;
                }
                field(D90_RMB; D90[2])
                {
                    Caption = '91~120D(RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91~120D(RMB) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(90, '');
                    end;
                }
                field(D90_USD; D90[3])
                {
                    Caption = '91~120D(USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91~120D(USD) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(90, 'USD');
                    end;
                }
                field(D90_EUR; D90[4])
                {
                    Caption = '91~120D(EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 91~120D(EUR) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(90, 'EUR');
                    end;
                }
                field(D120_LCY; D120[1])
                {
                    Caption = '>120D(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the >120D(LCY) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(120, 'ALL');
                    end;
                }
                field(D120_RMB; D120[2])
                {
                    Caption = '>120D(RMB)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the >120D(RMB) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(120, '');
                    end;
                }
                field(D120_USD; D120[3])
                {
                    Caption = '>120D(USD)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the >120D(USD) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(120, 'USD');
                    end;
                }
                field(D120_EUR; D120[4])
                {
                    Caption = '>120D(EUR)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the >120D(EUR) field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntriesByCurrency(120, 'EUR');
                    end;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a code for the salesperson who normally handles this customer''s account.';
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit (LCY)';
                    Visible = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the maximum amount you allow the customer to exceed the payment balance before warnings are issued.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntries(200);
                    end;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a code that indicates the payment terms that you require of the customer.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrCustNo := Rec."No.";
    end;

    trigger OnAfterGetRecord()
    var
        lCustLedgEntry: Record "Cust. Ledger Entry";
        lReminderLevel: Record "Reminder Level";
        lLevelNo: Integer;
    begin
        CLEAR(D0);
        CLEAR(D30);
        CLEAR(D60);
        CLEAR(D90);
        CLEAR(D120);
        CLEAR(Advance);
        CLEAR(gdc_Rec);
        lCustLedgEntry.RESET;

        IF Rec."No." <> LastNo THEN
            lCustLedgEntry.SETRANGE("Customer No.", Rec."No.");

        lCustLedgEntry.SETRANGE(Open, TRUE);
        lCustLedgEntry.SETFILTER("Due Date", '>%1', CalculateDate);
        IF lCustLedgEntry.FINDSET THEN
            REPEAT
                lCustLedgEntry.CALCFIELDS("Remaining Amount", "Remaining Amt. (LCY)");
                IF lCustLedgEntry."Remaining Amt. (LCY)" <= 0 THEN
                    Advance += lCustLedgEntry."Remaining Amt. (LCY)"
                ELSE BEGIN
                    gdc_Rec += lCustLedgEntry."Remaining Amt. (LCY)";
                END;
            UNTIL lCustLedgEntry.NEXT = 0;

        gdc_Undue := gdc_Rec;

        lCustLedgEntry.SETRANGE("Due Date", CALCDATE('-30D', CalculateDate), CalculateDate);
        IF lCustLedgEntry.FINDSET THEN
            REPEAT
                lCustLedgEntry.CALCFIELDS("Remaining Amount", "Remaining Amt. (LCY)");
                IF lCustLedgEntry."Remaining Amt. (LCY)" <= 0 THEN
                    Advance += lCustLedgEntry."Remaining Amt. (LCY)"
                ELSE BEGIN
                    gdc_Rec += lCustLedgEntry."Remaining Amt. (LCY)";
                    CASE lCustLedgEntry."Currency Code" OF
                        '':
                            D0[2] += lCustLedgEntry."Remaining Amount";
                        'USD':
                            D0[3] += lCustLedgEntry."Remaining Amount";
                        'EUR':
                            D0[4] += lCustLedgEntry."Remaining Amount";
                    END;

                    D0[1] += lCustLedgEntry."Remaining Amt. (LCY)";
                END;
            UNTIL lCustLedgEntry.NEXT = 0;

        lCustLedgEntry.SETRANGE("Due Date", CALCDATE('-60D', CalculateDate), CALCDATE('-31D', CalculateDate));
        IF lCustLedgEntry.FINDSET THEN
            REPEAT
                lCustLedgEntry.CALCFIELDS("Remaining Amount", "Remaining Amt. (LCY)");
                IF lCustLedgEntry."Remaining Amt. (LCY)" <= 0 THEN
                    Advance += lCustLedgEntry."Remaining Amt. (LCY)"
                ELSE BEGIN
                    gdc_Rec += lCustLedgEntry."Remaining Amt. (LCY)";
                    CASE lCustLedgEntry."Currency Code" OF
                        '':
                            D30[2] += lCustLedgEntry."Remaining Amount";
                        'USD':
                            D30[3] += lCustLedgEntry."Remaining Amount";
                        'EUR':
                            D30[4] += lCustLedgEntry."Remaining Amount";
                    END;

                    D30[1] += lCustLedgEntry."Remaining Amt. (LCY)";
                END;
            UNTIL lCustLedgEntry.NEXT = 0;

        lCustLedgEntry.SETRANGE("Due Date", CALCDATE('-90D', CalculateDate), CALCDATE('-61D', CalculateDate));
        IF lCustLedgEntry.FINDSET THEN
            REPEAT
                lCustLedgEntry.CALCFIELDS("Remaining Amount", "Remaining Amt. (LCY)");
                IF lCustLedgEntry."Remaining Amt. (LCY)" <= 0 THEN
                    Advance += lCustLedgEntry."Remaining Amt. (LCY)"
                ELSE BEGIN
                    gdc_Rec += lCustLedgEntry."Remaining Amt. (LCY)";
                    CASE lCustLedgEntry."Currency Code" OF
                        '':
                            D60[2] += lCustLedgEntry."Remaining Amount";
                        'USD':
                            D60[3] += lCustLedgEntry."Remaining Amount";
                        'EUR':
                            D60[4] += lCustLedgEntry."Remaining Amount";
                    END;

                    D60[1] += lCustLedgEntry."Remaining Amt. (LCY)";
                END;
            UNTIL lCustLedgEntry.NEXT = 0;

        lCustLedgEntry.SETRANGE("Due Date", CALCDATE('-120D', CalculateDate), CALCDATE('-91D', CalculateDate));
        IF lCustLedgEntry.FINDSET THEN
            REPEAT
                lCustLedgEntry.CALCFIELDS("Remaining Amount", "Remaining Amt. (LCY)");
                IF lCustLedgEntry."Remaining Amt. (LCY)" <= 0 THEN
                    Advance += lCustLedgEntry."Remaining Amt. (LCY)"
                ELSE BEGIN
                    gdc_Rec += lCustLedgEntry."Remaining Amt. (LCY)";
                    CASE lCustLedgEntry."Currency Code" OF
                        '':
                            D90[2] += lCustLedgEntry."Remaining Amount";
                        'USD':
                            D90[3] += lCustLedgEntry."Remaining Amount";
                        'EUR':
                            D90[4] += lCustLedgEntry."Remaining Amount";
                    END;

                    D90[1] += lCustLedgEntry."Remaining Amt. (LCY)";
                END;
            UNTIL lCustLedgEntry.NEXT = 0;

        lCustLedgEntry.SETRANGE("Due Date", 0D, CALCDATE('-121D', CalculateDate));
        IF lCustLedgEntry.FINDSET THEN
            REPEAT
                lCustLedgEntry.CALCFIELDS("Remaining Amount", "Remaining Amt. (LCY)");
                IF lCustLedgEntry."Remaining Amt. (LCY)" <= 0 THEN
                    Advance += lCustLedgEntry."Remaining Amt. (LCY)"
                ELSE BEGIN
                    gdc_Rec += lCustLedgEntry."Remaining Amt. (LCY)";
                    CASE lCustLedgEntry."Currency Code" OF
                        '':
                            D120[2] += lCustLedgEntry."Remaining Amount";
                        'USD':
                            D120[3] += lCustLedgEntry."Remaining Amount";
                        'EUR':
                            D120[4] += lCustLedgEntry."Remaining Amount";
                    END;

                    D120[1] += lCustLedgEntry."Remaining Amt. (LCY)";
                END;
            UNTIL lCustLedgEntry.NEXT = 0;


        Rec.SETRANGE("Date Filter", 0D, CALCDATE('1D', CalculateDate));
        Rec.CALCFIELDS(BalanceRMB, BalanceUSD, BalanceEUR, BalanceLCY);
        Rec.Tmp_BalanceLCY := Rec.BalanceLCY;
        Rec.Tmp_BalanceRMB := Rec.BalanceRMB;
        Rec.Tmp_BalanceUSD := Rec.BalanceUSD;
        Rec.Tmp_BalanceEUR := Rec.BalanceEUR;

        //SumBalanceLCY += Tmp_BalanceLCY;
        //SumBalanceRMB += Tmp_BalanceRMB;
        //SumBalanceUSD += Tmp_BalanceUSD;
        //SumBalanceEUR += Tmp_BalanceEUR;

        OverdueAmtLCY := 0;
        OverdueAmtRMB := 0;
        OverdueAmtUSD := 0;
        OverdueAmtEUR := 0;
        lCustLedgEntry.SETFILTER("Due Date", '<=%1', CalculateDate);
        IF lCustLedgEntry.FINDSET THEN
            REPEAT
                lCustLedgEntry.CALCFIELDS("Remaining Amount", "Remaining Amt. (LCY)");
                IF lCustLedgEntry."Remaining Amt. (LCY)" > 0 THEN BEGIN

                    OverdueAmtLCY += lCustLedgEntry."Remaining Amt. (LCY)";
                    IF lCustLedgEntry."Currency Code" = '' THEN
                        OverdueAmtRMB += lCustLedgEntry."Remaining Amount";
                    IF lCustLedgEntry."Currency Code" = 'USD' THEN
                        OverdueAmtUSD += lCustLedgEntry."Remaining Amount";
                    IF lCustLedgEntry."Currency Code" = 'EUR' THEN
                        OverdueAmtEUR += lCustLedgEntry."Remaining Amount";
                END;
            UNTIL lCustLedgEntry.NEXT = 0;

        ReminderLevelNo := 0;
        IF Rec."Reminder Terms Code" <> '' THEN BEGIN
            lReminderLevel.SETRANGE("Reminder Terms Code", Rec."Reminder Terms Code");
            IF lReminderLevel.FINDSET THEN
                REPEAT
                    IF (D0[1] <> 0) AND (FORMAT(lReminderLevel."Grace Period") = '30D') THEN
                        lLevelNo := lReminderLevel."No.";
                    IF (D30[1] <> 0) AND (FORMAT(lReminderLevel."Grace Period") = '60D') THEN
                        lLevelNo := lReminderLevel."No.";
                    IF (D60[1] <> 0) AND (FORMAT(lReminderLevel."Grace Period") = '90D') THEN
                        lLevelNo := lReminderLevel."No.";
                    IF ((D90[1] <> 0) OR (D120[1] <> 0)) AND (FORMAT(lReminderLevel."Grace Period") IN ['120D', '240D', '720D']) THEN
                        lLevelNo := lReminderLevel."No.";
                UNTIL lReminderLevel.NEXT = 0;

            ReminderLevelNo := lLevelNo;
        END;
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

    trigger OnOpenPage()
    begin
        IF CalculateDate = 0D THEN
            CalculateDate := WORKDATE;

        CalculateDate := CALCDATE('-1D', CalculateDate);
    end;

    var
        TmpRec: Record Customer temporary;
        CurrentSteps: Integer;
        CustLedEntry: Record "Cust. Ledger Entry";
        DetailCustLedEntry: Record "Detailed Cust. Ledg. Entry";
        Customer: Record Customer;
        CurrCustNo: Code[20];
        Day0: Decimal;
        Day30: Decimal;
        Day60: Decimal;
        Day90: Decimal;
        Day120: Decimal;
        BalanceLCY_Total: Decimal;
        BalanceDueLCY_Total: Decimal;
        Total_0: Decimal;
        Total_30: Decimal;
        Total_60: Decimal;
        Total_90: Decimal;
        LastNo: Label 'ZZZZZZZZZZZZZZZZZZZZ';
        Total_120: Decimal;
        TmpRec_Total: Record Customer temporary;
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
        Balance_Total: Decimal;
        BalanceDue_Total: Decimal;
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
        ExcludedCreditAmountG: Boolean;
        CalculateDate: Date;
        OverdueAmtLCY: Decimal;
        OverdueAmtRMB: Decimal;
        OverdueAmtUSD: Decimal;
        OverdueAmtEUR: Integer;
        ReminderLevelNo: Integer;
        Advance: Decimal;
        gdc_Rec: Decimal;
        gdc_Undue: Decimal;

    //[Scope('Internal')]
    procedure FilterData(CustomerNoFilter: Code[20]; CustomerGroupFilter: Code[20]; ExcludedCreditAmountP: Boolean)
    var
        SalesHdrL: Record "Sales Header";
        ToInsert: Boolean;
    begin
        /*
        Balance_Total :=0;
        BalanceDue_Total :=0;
        Total_0 :=0;
        Total_30 :=0;
        Total_60 :=0;
        Total_90 :=0;
        Total_120 :=0;
        BalanceLCY_Total :=0;
        BalanceDueLCY_Total :=0;
        Total_0_LCY :=0;
        Total_30_LCY :=0;
        Total_60_LCY :=0;
        Total_90_LCY :=0;
        Total_120_LCY :=0; */

        //NEW <--
        ExcludedCreditAmountG := ExcludedCreditAmountP;
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
        Customer.RESET;
        IF CustomerNoFilter <> '' THEN
            Customer.SETRANGE("No.", CustomerNoFilter);
        IF CustomerGroupFilter <> '' THEN
            Customer.SETFILTER("Customer Price Group", CustomerGroupFilter);
        IF Customer.FINDSET THEN BEGIN
            REPEAT
                ToInsert := TRUE;
                IF ToInsert THEN BEGIN
                    TmpRec.INIT;
                    TmpRec.TRANSFERFIELDS(Customer);
                    TmpRec."Search Name" := TmpRec."No.";
                    TmpRec.INSERT;

                    TmpRec_Total := TmpRec;
                    TmpRec_Total.INSERT;

                END;
            UNTIL Customer.NEXT = 0;
            AddTotal;
        END;

    end;

    //[Scope('Internal')]
    procedure OpenCustomerCard()
    var
        CustomerL: Record Customer;
    begin
        CustomerL.RESET;
        CustomerL.SETRANGE("No.", CurrCustNo);
        IF CustomerL.FINDSET THEN
            PAGE.RUNMODAL(21, CustomerL);
    end;

    local procedure ShowCustEntries(IntP: Integer)
    begin
        IF Rec."No." = LastNo THEN EXIT;
        CustLedEntry.RESET;
        //CustLedEntry.SETCURRENTKEY("Customer No.","Currency Code","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2","Initial Entry Due Date","Posting Date");
        CustLedEntry.SETRANGE("Customer No.", Rec."No.");
        //DetailCustLedgEntry.SETRANGE("Currency Code",?);
        CASE IntP OF
            0:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", CALCDATE('-30D', CalculateDate), CalculateDate);
                END;
            30:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", CALCDATE('-60D', CalculateDate), CALCDATE('-31D', CalculateDate));
                END;
            60:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", CALCDATE('-90D', CalculateDate), CALCDATE('-61D', CalculateDate));
                END;
            90:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", CALCDATE('-120D', CalculateDate), CALCDATE('-91D', CalculateDate));
                END;
            100:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date");
                END;
            120:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", 0D, CALCDATE('-121D', CalculateDate));
                END;
            200:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", 0D, CalculateDate);
                END;
        END;

        PAGE.RUN(0, CustLedEntry)
    end;

    local procedure AddTotal()
    begin
        CLEAR(Customer);
        TmpRec.INIT;
        TmpRec.TRANSFERFIELDS(Customer);
        TmpRec."No." := LastNo;
        TmpRec."Search Name" := '';
        TmpRec.Name := 'TOTAL:';
        TmpRec.INSERT;

        TmpRec_Total := TmpRec;
        TmpRec_Total.INSERT;
    end;

    local procedure ShowCustEntriesByCurrency(IntP: Integer; CurrencyCodeP: Code[10])
    begin
        //NEW
        IF Rec."No." = LastNo THEN EXIT;
        CustLedEntry.RESET;
        //CustLedEntry.SETCURRENTKEY("Customer No.","Currency Code","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2","Initial Entry Due Date","Posting Date");
        CustLedEntry.SETRANGE("Customer No.", Rec."No.");
        //IF ExcludedCreditAmountG THEN BEGIN
        //  DetailCustLedgEntry.SETRANGE("Credit Amount",0)
        //END ELSE BEGIN
        //  DetailCustLedgEntry.SETRANGE("Credit Amount");
        //END;
        CustLedEntry.SETRANGE(Open, TRUE);
        CASE IntP OF
            0:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", CALCDATE('-30D', CalculateDate), CalculateDate);
                END;
            30:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", CALCDATE('-60D', CalculateDate), CALCDATE('-31D', CalculateDate));
                END;
            60:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", CALCDATE('-90D', CalculateDate), CALCDATE('-61D', CalculateDate));
                END;
            90:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", CALCDATE('-120D', CalculateDate), CALCDATE('-91D', CalculateDate));
                END;
            120:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date", 0D, CALCDATE('-121D', CalculateDate));
                END;
            1000:
                BEGIN
                    CustLedEntry.SETRANGE("Due Date");
                END;
        END;

        PAGE.RUN(0, CustLedEntry)
    end;

    //[Scope('Internal')]
    procedure UpdateForm(pUpdate: Boolean)
    begin
        CurrPage.UPDATE(pUpdate);
    end;

    //[Scope('Internal')]
    procedure SetValue(pCalculateDate: Date)
    begin
        CalculateDate := pCalculateDate;
        CalculateDate := CALCDATE('-1D', CalculateDate);
    end;

    //[Scope('Internal')]
    procedure gf_ShowCusLedgerEntry()
    begin
        PAGE.RUN(PAGE::"Customer Ledger Entries", Rec);
    end;
}

