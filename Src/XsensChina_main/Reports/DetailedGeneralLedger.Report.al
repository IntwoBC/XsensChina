report 50006 "Detail General Ledger"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\DetailGeneralLedger.rdlc';

    Caption = 'Detail General Ledger';

    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            DataItemTableView = SORTING("No.")
                                WHERE("Account Type" = FILTER(Posting));
            RequestFilterFields = "No.", "Global Dimension 1 Filter";
            column(G_L_Account_No_; "No.")
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Posting Date");
                RequestFilterFields = "Posting Date", "Document No.";
                column(ComName; ComName)
                {
                }
                column(FORMAT_MinDate_0___Year4___Month_2___Day_2___; FORMAT(MinDate, 0, '<Year4>/<Month,2>/<Day,2>'))
                {
                }
                column(FORMAT_MaxDate_0___Year4___Month_2___Day_2___; FORMAT(MaxDate, 0, '<Year4>/<Month,2>/<Day,2>'))
                {
                }
                column(AccountDesc; AccountDesc)
                {
                }
                column(CurrReport_PAGENO; CurrReport.PAGENO)
                {
                }
                column(G_L_Account___No__; "G/L Account"."No.")
                {
                }
                column(FirstBalanceShow; FirstBalanceShow)
                {
                }
                column(FirstBalanceDirection; FirstBalanceDirection)
                {
                }
                column(G_L_Entry__Credit_Amount_; "Credit Amount")
                {
                }
                column(G_L_Entry__Debit_Amount_; "Debit Amount")
                {
                }
                column(G_L_Entry_Description; Description)
                {
                }
                column(G_L_Entry__G_L_Entry___Document_No__; "G/L Entry"."Document No.")
                {
                }
                column(FORMAT__Posting_Date__0___Day___; FORMAT("Posting Date", 0, '<Day>'))
                {
                }
                column(FORMAT__Posting_Date__0___Month___; FORMAT("Posting Date", 0, '<Month>'))
                {
                }
                column(Balance2Show; Balance2Show)
                {
                }
                column(Balance2Direction; Balance2Direction)
                {
                }
                column(FORMAT__Posting_Date__0___year4___; FORMAT("Posting Date", 0, '<year4>'))
                {
                }
                column(Detail_General_LedgerCaption; Detail_General_LedgerCaptionLbl)
                {
                }
                column(Account_No_Caption; Account_No_CaptionLbl)
                {
                }
                column(PageCaption; PageCaptionLbl)
                {
                }
                column(MCaption_Control1000000173; MCaption_Control1000000173Lbl)
                {
                }
                column(DCaption_Control1000000175; DCaption_Control1000000175Lbl)
                {
                }
                column(VoucherCaption_Control1000000177; VoucherCaption_Control1000000177Lbl)
                {
                }
                column(ExplanationCaption_Control1000000179; ExplanationCaption_Control1000000179Lbl)
                {
                }
                column(DebitCaption_Control1000000181; DebitCaption_Control1000000181Lbl)
                {
                }
                column(CreditCaption_Control1000000183; CreditCaption_Control1000000183Lbl)
                {
                }
                column(Remaining_AmountCaption; Remaining_AmountCaptionLbl)
                {
                }
                column(BalanceCaption; BalanceCaptionLbl)
                {
                }
                column(DirCaption_Control1000000199; DirCaption_Control1000000199Lbl)
                {
                }
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                column(Beginning_BalanceCaption; Beginning_BalanceCaptionLbl)
                {
                }
                column(G_L_Entry_Entry_No_; "Entry No.")
                {
                }
                column(G_L_Entry_G_L_Account_No_; "G/L Account No.")
                {
                }
                dataitem(Integer; Integer)
                {
                    DataItemTableView = SORTING(Number);
                    column(SumMonth_1_; SumMonth[1])
                    {
                    }
                    column(SumMonth_2_; SumMonth[2])
                    {
                    }
                    column(Balance2Show_Control1000000120; Balance2Show)
                    {
                    }
                    column(SumYear_2_; SumYear[2])
                    {
                    }
                    column(SumYear_1_; SumYear[1])
                    {
                    }
                    column(SumYear_3_; SumYear[3])
                    {
                    }
                    column(Month_To_DateCaption; Month_To_DateCaptionLbl)
                    {
                    }
                    column(Year_To_DateCaption; Year_To_DateCaptionLbl)
                    {
                    }
                    column(SumSection_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        ShowDayAmt := FALSE;
                        ShowMonthAmt := FALSE;
                        ShowYearAmt := FALSE;

                        IF ("G/L Entry".NEXT <> 0) THEN BEGIN
                            IF ("G/L Entry"."Posting Date" <> TheDate) THEN
                                ShowDayAmt := TRUE;

                            IF FORMAT("G/L Entry"."Posting Date", 0, '<Month>') <> FORMAT(TheDate, 0, '<Month>') THEN
                                ShowMonthAmt := TRUE;

                            IF FORMAT("G/L Entry"."Posting Date", 0, '<Year>') <> FORMAT(TheDate, 0, '<Year>') THEN
                                ShowYearAmt := TRUE;

                            "G/L Entry".NEXT(-1);
                        END
                        ELSE
                            IF TheDate <> 0D THEN BEGIN
                                ShowDayAmt := TRUE;
                                ShowMonthAmt := TRUE;
                                ShowYearAmt := TRUE;
                            END;
                    end;

                    trigger OnPreDataItem()
                    begin
                        //SumSection.SETRANGE(Number, 1, 1);
                        SETRANGE(Number, 1, 1);
                    end;
                }

                trigger OnAfterGetRecord()
                begin
                    IF ("Source Code" = 'Purchase') AND (STRPOS("G/L Account No.", '1201') = 1) AND
                       (("Document Type" = "G/L Entry"."Document Type"::Invoice) OR ("Document Type" = "G/L Entry"."Document Type"::"Credit Memo")) AND
                       ((STRPOS("Document No.", 'PPM') = 1) OR (STRPOS("Document No.", 'PPI') = 1) OR
                        (STRPOS("Document No.", 'NPPM') = 1) OR (STRPOS("Document No.", 'NPPI') = 1) OR
                        (STRPOS("Document No.", 'JPPI') = 1) OR (STRPOS("Document No.", 'JPPM') = 1) OR
                        (STRPOS("Document No.", 'HPPI') = 1) OR (STRPOS("Document No.", 'HPPM') = 1) OR
                        (STRPOS("Document No.", 'EPPI') = 1) OR (STRPOS("Document No.", 'EPPM') = 1)) THEN BEGIN

                        "Debit Amount" := "Credit Amount";
                        "Credit Amount" := 0;

                        SumYear[1] += "Debit Amount";
                        SumYear[2] -= "Credit Amount";
                    END;

                    Balance2 := 0;
                    Balance := Balance + "G/L Entry".Amount;
                    Balance2 := Balance + FirstBalance;
                    ShowHeader := FALSE;

                    IF ShowDayAmt OR (TheDate = 0D) THEN BEGIN
                        TheDate := "G/L Entry"."Posting Date";
                        SumDay[1] := "G/L Entry"."Debit Amount";
                        SumDay[2] := "G/L Entry"."Credit Amount";
                    END
                    ELSE BEGIN
                        SumDay[1] += "G/L Entry"."Debit Amount";
                        SumDay[2] += "G/L Entry"."Credit Amount";
                    END;

                    IF ShowMonthAmt OR (TheDate = 0D) THEN BEGIN
                        SumMonth[1] := "G/L Entry"."Debit Amount";
                        SumMonth[2] := "G/L Entry"."Credit Amount";
                    END
                    ELSE BEGIN
                        SumMonth[1] += "G/L Entry"."Debit Amount";
                        SumMonth[2] += "G/L Entry"."Credit Amount";
                    END;

                    IF ShowYearAmt OR (TheDate = 0D) THEN BEGIN
                        SumYear[1] := "G/L Entry"."Debit Amount";
                        SumYear[2] := "G/L Entry"."Credit Amount";
                    END
                    ELSE BEGIN
                        SumYear[1] += "G/L Entry"."Debit Amount";
                        SumYear[2] += "G/L Entry"."Credit Amount";
                    END;


                    IF Balance2 < 0 THEN BEGIN
                        Balance2Show := -Balance2;
                        Balance2Direction := TEXT002;
                    END
                    ELSE
                        IF Balance2 = 0 THEN BEGIN
                            Balance2Direction := TEXT003;
                            Balance2Show := 0;
                        END
                        ELSE BEGIN
                            Balance2Direction := TEXT001;
                            Balance2Show := Balance2;
                        END;
                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FIELDNO("G/L Account No.");

                    GLAccount.RESET;
                    IF "G/L Account"."No." <> '' THEN
                        GLAccount.SETFILTER(GLAccount."No.", "G/L Account"."No.");

                    GLAccount.SETRANGE(GLAccount."Date Filter", 0D, (NORMALDATE("G/L Entry".GETRANGEMIN("Posting Date")) - 1));
                    GLAccount.SETFILTER("Global Dimension 1 Filter", "G/L Account".GETFILTER("G/L Account"."Global Dimension 1 Filter"));

                    IF GLAccount.FIND('-') THEN BEGIN
                        GLAccount.CALCFIELDS(GLAccount."Balance at Date");
                        FirstBalance := FirstBalance + GLAccount."Balance at Date";
                    END;

                    GLAccount.RESET;

                    IF "G/L Account"."No." <> '' THEN
                        GLAccount.SETFILTER(GLAccount."No.", "G/L Account"."No.");
                    GLAccount.SETFILTER("Global Dimension 1 Filter", "G/L Account".GETFILTER("G/L Account"."Global Dimension 1 Filter"));

                    GLAccount.SETRANGE(GLAccount."Date Filter", MinDate, MaxDate);
                    IF GLAccount.FIND('-') THEN BEGIN
                        GLAccount.CALCFIELDS(GLAccount."Net Change", GLAccount."Debit Amount", GLAccount."Credit Amount");
                        SumMonth[3] += FirstBalance + GLAccount."Net Change";
                    END;

                    GLAccount.RESET;

                    IF "G/L Account"."No." <> '' THEN
                        GLAccount.SETFILTER(GLAccount."No.", "G/L Account"."No.");
                    GLAccount.SETFILTER("Global Dimension 1 Filter", "G/L Account".GETFILTER("G/L Account"."Global Dimension 1 Filter"));

                    GLAccount.SETRANGE("Date Filter", CALCDATE('CY-1Y+1D', "G/L Entry".GETRANGEMAX("Posting Date")),
                                       "G/L Entry".GETRANGEMAX("Posting Date"));

                    IF GLAccount.FIND('-') THEN BEGIN
                        GLAccount.CALCFIELDS(GLAccount."Balance at Date", GLAccount."Debit Amount", GLAccount."Credit Amount");
                        SumYear[3] += GLAccount."Balance at Date";
                    END;

                    CurrDocNo := '';
                    SumDay[1] := 0;
                    SumDay[2] := 0;
                    SumDay[3] := 0;
                    Balance := 0;

                    "G/L Entry".SETFILTER("Global Dimension 1 Code", "G/L Account".GETFILTER("G/L Account"."Global Dimension 1 Filter"));
                end;
            }

            trigger OnAfterGetRecord()
            begin
                FirstBalance := 0;
                Balance := 0;

                FOR i := 1 TO 3 DO BEGIN
                    SumDay[i] := 0;
                    SumMonth[i] := 0;
                    SumYear[i] := 0;
                END;

                MyEntry.RESET;
                MyEntry.SETRANGE(MyEntry."Posting Date", MinDate, MaxDate);
                MyEntry.SETFILTER(MyEntry."G/L Account No.", "G/L Account"."No.");
                IF NOT MyEntry.FIND('-') THEN
                    CurrReport.SKIP;

                AccountDesc := "G/L Account".Name;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        ShowHeader := TRUE;

        MinDate := NORMALDATE("G/L Entry".GETRANGEMIN("G/L Entry"."Posting Date"));
        MaxDate := NORMALDATE("G/L Entry".GETRANGEMAX("G/L Entry"."Posting Date"));

        CompanyInfo.FIND('-');
        ComName := CompanyInfo.Name;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for';
        Balance: Decimal;
        "Bal.AccountNo1": Code[20];
        Balance1: Decimal;
        MyEntry: Record 17;
        Balance2: Decimal;
        Document1: Code[20];
        GLAccountRec: Record 15;
        RecCount: Integer;
        CurrDocNo: Code[20];
        CurrDate: Date;
        GLAccount: Record 15;
        AccountDesc: Text[200];
        ShowHeader: Boolean;
        FirstBalance: Decimal;
        SumDay: array[3] of Decimal;
        SumMonth: array[3] of Decimal;
        SumYear: array[3] of Decimal;
        MinDate: Date;
        MaxDate: Date;
        TEXT001: Label 'Debit';
        TEXT002: Label 'Credit';
        TEXT003: Label 'Balance';
        FirstBalanceDirection: Text[10];
        Balance2Direction: Text[10];
        GroupBalance2Direction: Text[10];
        Balance2Show: Decimal;
        FirstBalanceShow: Decimal;
        SumYearDirection: Text[10];
        SumYearShow: Decimal;
        ComName: Text[50];
        CompanyInfo: Record 79;
        ShowDayAmt: Boolean;
        ShowMonthAmt: Boolean;
        ShowYearAmt: Boolean;
        i: Integer;
        TheDate: Date;
        Detail_General_LedgerCaptionLbl: Label 'Detail General Ledger';
        Account_No_CaptionLbl: Label 'Account No.';
        PageCaptionLbl: Label 'Page';
        MCaption_Control1000000173Lbl: Label 'M';
        DCaption_Control1000000175Lbl: Label 'D';
        VoucherCaption_Control1000000177Lbl: Label 'Voucher No.';
        ExplanationCaption_Control1000000179Lbl: Label 'Description';
        DebitCaption_Control1000000181Lbl: Label 'Degbit';
        CreditCaption_Control1000000183Lbl: Label 'Credit';
        Remaining_AmountCaptionLbl: Label 'Remaining Amount';
        BalanceCaptionLbl: Label 'Balance';
        DirCaption_Control1000000199Lbl: Label 'Direction';
        EmptyStringCaptionLbl: Label 'To';
        Beginning_BalanceCaptionLbl: Label 'Beginning Balance';
        Month_To_DateCaptionLbl: Label 'Month to Date';
        Year_To_DateCaptionLbl: Label 'Year to Date';
}

