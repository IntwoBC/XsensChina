page 50016 "Customer Aging by Detail"
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
    SourceTable = "Cust. Ledger Entry";
    SourceTableTemporary = false;
    SourceTableView = SORTING("Customer No.", "Posting Date", "Currency Code");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Caption = 'Customer No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field(Name; Customer.Name)
                {
                    Caption = 'Customer Name';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    Caption = 'Invoice No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the entry''s document number.';
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
                    ToolTip = 'Specifies a description of the customer entry.';
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
                        ShowCustEntries(100);
                    end;
                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                    Caption = 'Invoice Amounts LCY';
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total net amount of sales to the customer in LCY.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntries(100);
                    end;
                }
                field(Tmp_RemainingAmount; Rec.Tmp_RemainingAmount)
                {
                    Caption = 'Remaining Amounts';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remaining Amounts field.';
                    trigger OnDrillDown()
                    begin
                        ShowCustEntries(200);
                    end;
                }
                field("Profit (LCY)"; Rec."Profit (LCY)")
                {
                    Caption = 'Remaining Amounts(LCY)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remaining Amounts(LCY) field.';
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
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrCustNo := Rec."Customer No.";
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.SETRANGE("Date Filter", 0D, 99991231D);
        //NEW <--
        IF ExcludedCreditAmountG THEN BEGIN
            Rec.SETRANGE(CreditAmtFilter, 0)
        END ELSE BEGIN
            Rec.SETRANGE(CreditAmtFilter);
        END;
        //NEW -->
        Rec.CALCFIELDS("Amount (LCY)", Amount, "Remaining Amt. (LCY)", "Remaining Amount");
        /*
        DetailCustLedEntry.RESET;
        DetailCustLedEntry.SETCURRENTKEY("Cust. Ledger Entry No.","Entry Type","Posting Date");
        DetailCustLedEntry.SETRANGE("Cust. Ledger Entry No.","Entry No.");
        //DetailCustLedEntry.SETRANGE("Currency Code",?);
        DetailCustLedEntry.SETRANGE("Posting Date",CALCDATE('-30D',WORKDATE),WORKDATE);
        DetailCustLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day0_LCY :=DetailCustLedEntry."Amount (LCY)";
        Day0 :=DetailCustLedEntry.Amount;
        DetailCustLedEntry.SETRANGE("Posting Date",CALCDATE('-60D',WORKDATE),CALCDATE('-31D',WORKDATE));
        DetailCustLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day30_LCY :=DetailCustLedEntry."Amount (LCY)";
        Day30 :=DetailCustLedEntry.Amount;
        DetailCustLedEntry.SETRANGE("Posting Date",CALCDATE('-90D',WORKDATE),CALCDATE('-61D',WORKDATE));
        DetailCustLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day60_LCY :=DetailCustLedEntry."Amount (LCY)";
        Day60 :=DetailCustLedEntry.Amount;
        DetailCustLedEntry.SETRANGE("Posting Date",CALCDATE('-120D',WORKDATE),CALCDATE('-91D',WORKDATE));
        DetailCustLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day90_LCY :=DetailCustLedEntry."Amount (LCY)";
        Day90 :=DetailCustLedEntry.Amount;
        DetailCustLedEntry.SETRANGE("Posting Date",0D,CALCDATE('-121D',WORKDATE));
        DetailCustLedEntry.CALCSUMS("Amount (LCY)",Amount);
        Day120_LCY :=DetailCustLedEntry."Amount (LCY)";
        Day120 :=DetailCustLedEntry.Amount;
        */
        Rec.SETRANGE("Date Filter");
        Rec.CALCFIELDS(BalanceLCY, BalanceRMB, BalanceUSD, BalanceEUR);//NEW
        IF NOT Customer.GET(Rec."Customer No.") THEN CLEAR(Customer);

        //calc total <--
        IF TmpRec."Entry No." <> 999999999 THEN BEGIN
            IF TmpRec_Total.GET(Rec."Entry No.") THEN BEGIN
                Total_0_LCY += Day0_LCY;
                Total_30_LCY += Day30_LCY;
                Total_60_LCY += Day60_LCY;
                Total_90_LCY += Day90_LCY;
                Total_120_LCY += Day120_LCY;
                InvAmt_Total_LCY += Rec."Amount (LCY)";
                RemAmt_Total_LCY += Rec."Remaining Amt. (LCY)";

                Total_0 += Day0;
                Total_30 += Day30;
                Total_60 += Day60;
                Total_90 += Day90;
                Total_120 += Day120;
                InvAmt_Total += Rec.Amount;
                RemAmt_Total += Rec."Remaining Amount";

                //NEW <--
                SumBalanceLCY += Rec.BalanceLCY;
                SumBalanceRMB += Rec.BalanceRMB;
                SumBalanceUSD += Rec.BalanceUSD;
                SumBalanceEUR += Rec.BalanceEUR;
                //NEW -->

                TmpRec_Total.DELETE;
            END;
            Rec."Sales (LCY)" := Rec."Amount (LCY)";
            Rec."Profit (LCY)" := Rec."Remaining Amt. (LCY)";
            Rec.Tmp_InvAmt := Rec.Amount;
            Rec.Tmp_RemainingAmount := Rec."Remaining Amount";

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
            Rec."Sales (LCY)" := InvAmt_Total_LCY;
            Rec."Profit (LCY)" := RemAmt_Total_LCY;
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


        OverdueAmtLCY := 0;
        OverdueAmtRMB := 0;
        OverdueAmtUSD := 0;
        OverdueAmtEUR := 0;
        Rec.CALCFIELDS("Remaining Amount", "Remaining Amt. (LCY)");
        OverdueAmtLCY += Rec."Remaining Amt. (LCY)";
        IF Rec."Currency Code" = '' THEN
            OverdueAmtRMB += Rec."Remaining Amount";
        IF Rec."Currency Code" = 'USD' THEN
            OverdueAmtUSD += Rec."Remaining Amount";
        IF Rec."Currency Code" = 'EUR' THEN
            OverdueAmtEUR += Rec."Remaining Amount";

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
        TmpRec: Record "Cust. Ledger Entry" temporary;
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
        InvAmt_Total: Decimal;
        RemAmt_Total: Decimal;
        Total_0: Decimal;
        Total_30: Decimal;
        Total_60: Decimal;
        Total_90: Decimal;
        Total_120: Decimal;
        TmpRec_Total: Record "Cust. Ledger Entry" temporary;
        LastCustNo: Label 'ZZZZZZZZZZZZZZZZZZZZ';
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
        ExcludedCreditAmountG: Boolean;
        CalculateDate: Date;
        OverdueAmtLCY: Decimal;
        OverdueAmtRMB: Decimal;
        OverdueAmtUSD: Decimal;
        OverdueAmtEUR: Integer;

    //[Scope('Internal')]
    procedure FilterData(CustomerNoFilter: Code[20]; CustomerGroupFilter: Code[20]; ExcludedCreditAmountP: Boolean)
    var
        SalesHdrL: Record "Sales Header";
        ToInsert: Boolean;
    begin
        InvAmt_Total := 0;
        RemAmt_Total := 0;
        InvAmt_Total_LCY := 0;
        RemAmt_Total_LCY := 0;
        Total_0 := 0;
        Total_30 := 0;
        Total_60 := 0;
        Total_90 := 0;
        Total_120 := 0;
        Total_0_LCY := 0;
        Total_30_LCY := 0;
        Total_60_LCY := 0;
        Total_90_LCY := 0;
        Total_120_LCY := 0;

        //NEW <--
        ExcludedCreditAmountG := ExcludedCreditAmountP;
        SumBalanceLCY := 0;
        SumBalanceRMB := 0;
        SumBalanceUSD := 0;
        SumBalanceEUR := 0;
        //NEW -->

        TmpRec.DELETEALL;
        TmpRec_Total.DELETEALL;
        CustLedEntry.RESET;
        CustLedEntry.SETRANGE(Open, TRUE);//NEW
        IF CustomerNoFilter <> '' THEN
            CustLedEntry.SETRANGE("Customer No.", CustomerNoFilter);
        //IF CustomerGroupFilter <> '' THEN
        //  CustLedEntry.SETFILTER("Customer No.",CustomerGroupFilter);
        IF CustLedEntry.FINDSET THEN BEGIN
            REPEAT
                ToInsert := TRUE;
                IF CustomerGroupFilter <> '' THEN
                    IF ToInsert AND (CustomerGroupFilter <> '') THEN BEGIN
                        IF Customer.GET(CustLedEntry."Customer No.") THEN BEGIN
                            IF Customer."Customer Price Group" <> CustomerGroupFilter THEN ToInsert := FALSE;
                        END;
                    END;
                IF ToInsert THEN BEGIN
                    TmpRec.INIT;
                    TmpRec.TRANSFERFIELDS(CustLedEntry);
                    TmpRec."Sell-to Customer No." := TmpRec."Customer No.";
                    TmpRec.INSERT;
                    TmpRec_Total := TmpRec;
                    TmpRec_Total.INSERT;

                END;
            UNTIL CustLedEntry.NEXT = 0;
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
        IF Rec."Entry No." = 999999999 THEN EXIT;
        DetailCustLedEntry.RESET;
        DetailCustLedEntry.SETCURRENTKEY("Cust. Ledger Entry No.", "Entry Type", "Posting Date");
        DetailCustLedEntry.SETRANGE("Cust. Ledger Entry No.", Rec."Entry No.");
        //DetailCustLedEntry.SETRANGE("Currency Code",?);
        CASE IntP OF
            0:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Posting Date", CALCDATE('-30D', CalculateDate), CalculateDate);
                END;
            30:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Posting Date", CALCDATE('-60D', CalculateDate), CALCDATE('-31D', CalculateDate));
                END;
            60:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Posting Date", CALCDATE('-90D', CalculateDate), CALCDATE('-61D', CalculateDate));
                END;
            90:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Posting Date", CALCDATE('-120D', CalculateDate), CALCDATE('-91D', CalculateDate));
                END;
            120:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Posting Date", 0D, CALCDATE('-121D', CalculateDate));
                END;
            100:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Posting Date", 0D, 99991231D);
                END;
            200:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Posting Date", 0D, 99991231D);
                END;
        END;
        PAGE.RUN(0, DetailCustLedEntry)
    end;

    local procedure AddTotal()
    begin
        CLEAR(CustLedEntry);
        TmpRec.INIT;
        TmpRec.TRANSFERFIELDS(CustLedEntry);
        TmpRec."Entry No." := 999999999;
        TmpRec."Customer No." := LastCustNo;
        TmpRec."Document No." := 'TOTAL:';
        TmpRec.INSERT;

        TmpRec_Total := TmpRec;
        TmpRec_Total.INSERT;
    end;

    local procedure ShowCustEntriesByCurrency(IntP: Integer; CurrencyCodeP: Code[10])
    begin
        //NEW
        IF Rec."Entry No." = 999999999 THEN EXIT;
        DetailCustLedEntry.RESET;
        DetailCustLedEntry.SETCURRENTKEY("Cust. Ledger Entry No.", "Entry Type", "Posting Date");
        DetailCustLedEntry.SETRANGE("Cust. Ledger Entry No.", Rec."Entry No.");
        IF CurrencyCodeP <> 'ALL' THEN
            DetailCustLedEntry.SETRANGE("Currency Code", CurrencyCodeP)
        ELSE
            DetailCustLedEntry.SETRANGE("Currency Code");
        //NEW <--
        IF ExcludedCreditAmountG THEN BEGIN
            DetailCustLedEntry.SETRANGE("Credit Amount", 0)
        END ELSE BEGIN
            DetailCustLedEntry.SETRANGE("Credit Amount");
        END;
        //NEW -->

        //DetailCustLedEntry.SETRANGE("Cust. Ledg. Entry Is Open",TRUE);可省略，当前关联的customer ledger entry应该已经是OPEN
        CASE IntP OF
            0:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Cust. Ledg. Entry Doc. Date", CALCDATE('-30D', CalculateDate), CalculateDate);
                END;
            30:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Cust. Ledg. Entry Doc. Date", CALCDATE('-60D', CalculateDate), CALCDATE('-31D', CalculateDate));
                END;
            60:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Cust. Ledg. Entry Doc. Date", CALCDATE('-90D', CalculateDate), CALCDATE('-61D', CalculateDate));
                END;
            90:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Cust. Ledg. Entry Doc. Date", CALCDATE('-120D', CalculateDate), CALCDATE('-91D', CalculateDate));
                END;
            120:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Cust. Ledg. Entry Doc. Date", 0D, CALCDATE('-121D', CalculateDate));
                END;
            1000:
                BEGIN
                    DetailCustLedEntry.SETRANGE("Cust. Ledg. Entry Doc. Date");
                END;
        END;

        PAGE.RUN(0, DetailCustLedEntry)
    end;

    //[Scope('Internal')]
    procedure SetValue(pCalculateDate: Date)
    begin
        CalculateDate := pCalculateDate;
        CalculateDate := CALCDATE('-1D', CalculateDate);
    end;
}

