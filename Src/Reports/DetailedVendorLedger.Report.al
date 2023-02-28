report 50007 "Detail Vendor Ledger"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\DetailVendorLedger.rdlc';

    Caption = 'Detail Vendor Ledger';

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(Vendor_Vendor_Name; Vendor.Name)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(FORMAT_MaxDate_0___Day___; FORMAT(MaxDate, 0, '<Day>'))
            {
            }
            column(FORMAT_MaxDate_0___Month_2___; FORMAT(MaxDate, 0, '<Month,2>'))
            {
            }
            column(FORMAT_MaxDate_0___Year4___; FORMAT(MaxDate, 0, '<Year4>'))
            {
            }
            column(FORMAT_MinDate_0___Day___; FORMAT(MinDate, 0, '<Day>'))
            {
            }
            column(FORMAT_MinDate_0___Month_2___; FORMAT(MinDate, 0, '<Month,2>'))
            {
            }
            column(FORMAT_MinDate_0___Year4___; FORMAT(MinDate, 0, '<Year4>'))
            {
            }
            column(Company_Name; Company_Name)
            {
            }
            column(DeptName; DeptName)
            {
            }
            column(GLAccountNo; GLAccountNo)
            {
            }
            column(GLAccountName; GLAccountName)
            {
            }
            column(SumYear_2_; SumYear[2])
            {
            }
            column(SumYear_1_; SumYear[1])
            {
            }
            column(Balance1; Balance1)
            {
            }
            column(BalanceCaption; BalanceCaptionLbl)
            {
            }
            column(For__Curr_Caption; For__Curr_CaptionLbl)
            {
            }
            column(ExplanationCaption; ExplanationCaptionLbl)
            {
            }
            column(VoucherCaption; VoucherCaptionLbl)
            {
            }
            column(DCaption; DCaptionLbl)
            {
            }
            column(MCaption; MCaptionLbl)
            {
            }
            column(BalanceCaption_Control1000000079; BalanceCaption_Control1000000079Lbl)
            {
            }
            column(CreditCaption; CreditCaptionLbl)
            {
            }
            column(DebitCaption; DebitCaptionLbl)
            {
            }
            column(ExplanationCaption_Control1000000097; ExplanationCaption_Control1000000097Lbl)
            {
            }
            column(VoucherCaption_Control1000000098; VoucherCaption_Control1000000098Lbl)
            {
            }
            column(DCaption_Control1000000102; DCaption_Control1000000102Lbl)
            {
            }
            column(MCaption_Control1000000103; MCaption_Control1000000103Lbl)
            {
            }
            column(Vendor_Caption; Vendor_CaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(DCaption_Control1000000112; DCaption_Control1000000112Lbl)
            {
            }
            column(MCaption_Control1000000114; MCaption_Control1000000114Lbl)
            {
            }
            column(YearCaption; YearCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(DCaption_Control1000000142; DCaption_Control1000000142Lbl)
            {
            }
            column(MCaption_Control1000000144; MCaption_Control1000000144Lbl)
            {
            }
            column(YearCaption_Control1000000146; YearCaption_Control1000000146Lbl)
            {
            }
            column(Vendor_Ledger_EntryCaption; Vendor_Ledger_EntryCaptionLbl)
            {
            }
            column(DirCaption; DirCaptionLbl)
            {
            }
            column(G_L_AccountCaption; G_L_AccountCaptionLbl)
            {
            }
            column(Exc__Rt_Caption; Exc__Rt_CaptionLbl)
            {
            }
            column(Exc__Rt_Caption_Control1000000023; Exc__Rt_Caption_Control1000000023Lbl)
            {
            }
            column(AmtCaption; AmtCaptionLbl)
            {
            }
            column(For__Curr_Caption_Control1000000038; For__Curr_Caption_Control1000000038Lbl)
            {
            }
            column(AmtCaption_Control1000000039; AmtCaption_Control1000000039Lbl)
            {
            }
            column(Curr_Caption; Curr_CaptionLbl)
            {
            }
            column(Curr_Caption_Control1000000051; Curr_Caption_Control1000000051Lbl)
            {
            }
            column(Year_to_dateCaption; Year_to_dateCaptionLbl)
            {
            }
            column(Vendor_No_; "No.")
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = FIELD("No.");
                DataItemTableView = SORTING("Vendor No.", "Posting Date", "Currency Code");
                RequestFilterFields = "Posting Date";
                column(FirstBalance; FirstBalance)
                {
                }
                column(FirstStatus; FirstStatus)
                {
                }
                column(Vendor_Ledger_Entry__Credit_Amount__LCY__; "Credit Amount (LCY)")
                {
                }
                column(Vendor_Ledger_Entry__Debit_Amount__LCY__; "Debit Amount (LCY)")
                {
                }
                column(Desc; Desc)
                {
                }
                column(VoucherNo; VoucherNo)
                {
                }
                column(FORMAT__Posting_Date__0___Day___; FORMAT("Posting Date", 0, '<Day>'))
                {
                }
                column(FORMAT__Posting_Date__0___Month___; FORMAT("Posting Date", 0, '<Month>'))
                {
                }
                column(Balance1_Control1000000133; Balance1)
                {
                }
                column(BalanceStatus; BalanceStatus)
                {
                }
                column(DAmt; DAmt)
                {
                }
                column(CAmt; CAmt)
                {
                }
                column(ExRate; ExRate)
                {
                    DecimalPlaces = 0 : 4;
                }
                column(Vendor_Ledger_Entry__Vendor_Ledger_Entry___Currency_Code_; "Vendor Ledger Entry"."Currency Code")
                {
                    //DecimalPlaces = 0 : 4;
                }
                column(FORMAT__Posting_Date__0___year4___; FORMAT("Posting Date", 0, '<year4>'))
                {
                }
                column(Vendor_Ledger_Entry__Debit_Amount__LCY___Control1000000008; "Debit Amount (LCY)")
                {
                }
                column(Vendor_Ledger_Entry__Credit_Amount__LCY___Control1000000009; "Credit Amount (LCY)")
                {
                }
                column(Balance1_Control1000000010; Balance1)
                {
                }
                column(Begining_BalanceCaption; Begining_BalanceCaptionLbl)
                {
                }
                column(Month_to_dateCaption; Month_to_dateCaptionLbl)
                {
                }
                column(Vendor_Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Vendor_Ledger_Entry_Vendor_No_; "Vendor No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //Balance2:=0;
                    //Balance:=Balance+"Vendor Ledger Entry".Amount;

                    "Vendor Ledger Entry".CALCFIELDS("Amount (LCY)", "Debit Amount", "Credit Amount");

                    IF "Vendor Ledger Entry"."Currency Code" <> '' THEN BEGIN
                        DAmt := "Vendor Ledger Entry"."Debit Amount";
                        CAmt := "Vendor Ledger Entry"."Credit Amount";

                        IF DAmt <> 0 THEN
                            ExRate := "Vendor Ledger Entry"."Debit Amount (LCY)" / DAmt
                        ELSE
                            IF CAmt <> 0 THEN
                                ExRate := "Vendor Ledger Entry"."Credit Amount (LCY)" / CAmt;
                    END
                    ELSE BEGIN
                        DAmt := 0;
                        CAmt := 0;
                        ExRate := 0;
                    END;


                    IF GLAccountNo <> '' THEN BEGIN
                        GLEntry.RESET;
                        GLEntry.SETRANGE("Entry No.", "Vendor Ledger Entry"."Entry No.");
                        GLEntry.SETFILTER("G/L Account No.", GLAccountNo + '*');
                        IF GLEntry.FIND('-') THEN
                            Balance2 := Balance2 + "Vendor Ledger Entry"."Amount (LCY)"
                        ELSE
                            CurrReport.SKIP;
                    END
                    ELSE
                        Balance2 := Balance2 + "Vendor Ledger Entry"."Amount (LCY)";

                    /*
                    MyEntry.RESET;
                    IF "Vendor Ledger Entry"."Entry No."<>0 THEN
                    MyEntry.SETFILTER(MyEntry."Entry No.",'%1',"Vendor Ledger Entry"."Entry No.");
                    MyEntry.SETRANGE("Date Filter",MinDate,"Vendor Ledger Entry"."Posting Date");
                    IF MyEntry.FIND('-') THEN
                    //REPEAT
                    MyEntry.Amount:=0;
                    MyEntry.CALCFIELDS(MyEntry.Amount,MyEntry."Debit Amount",MyEntry."Credit Amount");
                    "Vendor Ledger Entry".CALCFIELDS("Vendor Ledger Entry".Amount);
                    Balance2:=Balance2+ "Vendor Ledger Entry".Amount;
                    //UNTIL MyEntry.NEXT=0;
                    */

                    IF Balance2 > 0 THEN
                        BalanceStatus := TextDR;
                    IF Balance2 < 0 THEN
                        BalanceStatus := TextCR;
                    IF Balance2 = 0 THEN
                        BalanceStatus := ' ';

                    Balance1 := ABS(Balance2);

                    //ShowHeader:=FALSE;

                    Desc := Description;
                    IF "External Document No." <> '' THEN
                        Desc := Desc + '(' + "External Document No." + ')';

                    //get voucher no.
                    GLEntry.RESET;
                    IF GLEntry.GET("Entry No.") THEN
                        VoucherNo := GLEntry."Document No.";

                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FIELDNO("Vendor No.");



                    IF SelectDept <> '' THEN
                        "Vendor Ledger Entry".SETFILTER("Vendor Ledger Entry"."Global Dimension 1 Code", SelectDept);

                    MyEntry.RESET;
                    IF Vendor."No." <> '' THEN
                        MyEntry.SETFILTER(MyEntry."Vendor No.", Vendor."No.");
                    IF SelectDept <> '' THEN
                        MyEntry.SETFILTER(MyEntry."Global Dimension 1 Code", SelectDept);
                    MyEntry.SETRANGE(MyEntry."Date Filter", 0D, (NORMALDATE("Vendor Ledger Entry".GETRANGEMIN("Posting Date")) - 1));

                    IF MyEntry.FIND('-') THEN
                        REPEAT
                            MyEntry.CALCFIELDS(MyEntry."Amount (LCY)", MyEntry."Debit Amount (LCY)", MyEntry."Credit Amount (LCY)");

                            //choose account no.
                            IF GLAccountNo <> '' THEN BEGIN
                                GLEntry.RESET;
                                GLEntry.SETRANGE("Entry No.", MyEntry."Entry No.");
                                GLEntry.SETFILTER("G/L Account No.", GLAccountNo + '*');
                                IF GLEntry.FIND('-') THEN
                                    FirstBalance := FirstBalance + MyEntry."Debit Amount (LCY)" - MyEntry."Credit Amount (LCY)"
                            END
                            ELSE
                                FirstBalance := FirstBalance + MyEntry."Debit Amount (LCY)" - MyEntry."Credit Amount (LCY)";
                        UNTIL MyEntry.NEXT = 0;


                    MyEntry.RESET;
                    IF Vendor."No." <> '' THEN
                        MyEntry.SETFILTER(MyEntry."Vendor No.", Vendor."No.");
                    IF SelectDept <> '' THEN
                        MyEntry.SETFILTER(MyEntry."Global Dimension 1 Code", SelectDept);
                    MyEntry.SETRANGE("Date Filter", CALCDATE('CY-1Y+1D', "Vendor Ledger Entry".GETRANGEMAX("Posting Date")),
                                       "Vendor Ledger Entry".GETRANGEMAX("Posting Date"));
                    IF MyEntry.FIND('-') THEN
                        REPEAT
                            MyEntry.CALCFIELDS(MyEntry."Amount (LCY)", MyEntry."Debit Amount (LCY)", MyEntry."Credit Amount (LCY)");

                            IF GLAccountNo <> '' THEN BEGIN
                                GLEntry.RESET;
                                GLEntry.SETRANGE("Entry No.", MyEntry."Entry No.");
                                GLEntry.SETFILTER("G/L Account No.", GLAccountNo + '*');
                                IF GLEntry.FIND('-') THEN BEGIN
                                    SumYear[3] += MyEntry."Debit Amount (LCY)" - MyEntry."Credit Amount (LCY)";
                                    SumYear[2] += MyEntry."Credit Amount (LCY)";
                                    SumYear[1] += MyEntry."Debit Amount (LCY)";
                                END
                            END
                            ELSE BEGIN
                                SumYear[3] += MyEntry."Debit Amount (LCY)" - MyEntry."Credit Amount (LCY)";
                                SumYear[2] += MyEntry."Credit Amount (LCY)";
                                SumYear[1] += MyEntry."Debit Amount (LCY)";
                            END;
                        UNTIL MyEntry.NEXT = 0;


                    /*
                    //comment start
                    MyVendor.RESET;
                    IF Vendor."No."<>'' THEN
                    MyVendor.SETFILTER(MyVendor."No.",Vendor."No.");
                    IF SelectDept<>'' THEN
                      MyVendor.SETFILTER(MyVendor."Global Dimension 1 Filter", SelectDept);
                    MyVendor.SETRANGE(MyVendor."Date Filter",0D,(NORMALDATE("Vendor Ledger Entry".GETRANGEMIN("Posting Date"))-1));
                    IF MyVendor.FIND('-') THEN
                    REPEAT
                    MyVendor.CALCFIELDS(MyVendor.Balance,MyVendor."Debit Amount",MyVendor."Credit Amount");
                    FirstBalance:=FirstBalance+MyVendor."Debit Amount" - MyVendor."Credit Amount";
                    UNTIL MyVendor.NEXT=0;
                    
                    MyVendor.RESET;
                    IF Vendor."No."<>'' THEN
                    MyVendor.SETFILTER(MyVendor."No.",Vendor."No.");
                    MyVendor.SETRANGE(MyVendor."Date Filter",MinDate,MaxDate);
                    //MESSAGE(FORMAT(CALCDATE('CM-1M+1D',MaxDate)));
                    IF MyVendor.FIND('-') THEN
                    REPEAT
                    MyVendor.CALCFIELDS(MyVendor."Net Change",MyVendor."Debit Amount",MyVendor."Credit Amount");
                    SumMonth[3]+=FirstBalance+MyVendor."Net Change";
                    SumMonth[2]+=MyVendor."Credit Amount";
                    SumMonth[1]+=MyVendor."Debit Amount";
                    UNTIL MyVendor.NEXT=0  ;
                    
                    MyVendor.RESET;
                    IF Vendor."No."<>'' THEN
                    MyVendor.SETFILTER(MyVendor."No.",Vendor."No.");
                    IF SelectDept<>'' THEN
                      MyVendor.SETFILTER(MyVendor."Global Dimension 1 Filter", SelectDept);
                    MyVendor.SETRANGE("Date Filter",CALCDATE('CY-1Y+1D',"Vendor Ledger Entry".GETRANGEMAX("Posting Date")),
                                       "Vendor Ledger Entry".GETRANGEMAX("Posting Date"));
                    IF MyVendor.FIND('-') THEN
                    REPEAT
                    MyVendor.CALCFIELDS(MyVendor.Balance,MyVendor."Debit Amount",MyVendor."Credit Amount");
                    SumYear[3]+=MyVendor."Debit Amount" - MyVendor."Credit Amount";
                    SumYear[2]+= MyVendor."Credit Amount";
                    SumYear[1]+=MyVendor."Debit Amount";
                    UNTIL MyVendor.NEXT=0;
                    
                    //MyEntry.SETCURRENTKEY(MyEntry."Document No.",MyEntry."Posting Date");
                    CurrDocNo:='';
                    SumDay[1]:=0;
                    SumDay[2]:=0;
                    SumDay[3]:=0;
                    //IF GLAccount.GET("G/L Account"."No.") THEN
                    //AccountDesc:="G/L Entry".GetDescChinese("G/L Account"."No.");
                    //"G/L Entry".SETRANGE("G/L Entry"."Posting Date",MinDate,MaxDate);
                    //"G/L Entry".Amount:=0;
                    //Balance:=0;
                    //comment end
                    */

                    Balance2 := Balance2 + FirstBalance;
                    //MESSAGE('%1',Balance2);

                    IF FirstBalance > 0 THEN
                        FirstStatus := TextDR;
                    IF FirstBalance < 0 THEN
                        FirstStatus := TextCR;
                    IF FirstBalance = 0 THEN
                        FirstStatus := ' ';

                end;
            }

            trigger OnAfterGetRecord()
            begin
                FirstBalance := 0;
                SumMonth[3] := 0;
                SumMonth[2] := 0;
                SumMonth[1] := 0;
                Balance := 0;
                Balance1 := 0;
                Balance2 := 0;
                SumYear[3] := 0;
                SumYear[2] := 0;
                SumYear[1] := 0;
                MyBalance := 0;

                MyEntry.RESET;
                MyEntry.SETRANGE(MyEntry."Posting Date", MinDate, MaxDate);
                IF SelectDept <> '' THEN
                    MyEntry.SETRANGE(MyEntry."Global Dimension 1 Code", SelectDept);
                MyEntry.SETFILTER(MyEntry."Vendor No.", Vendor."No.");
                IF NOT MyEntry.FIND('-') THEN
                    CurrReport.SKIP;
                // Find GLAccountNo by  Posting Groups of Vendor   from  Vendor No        JIM #2
                CLEAR(GLAccountNo);
                IF PostingGroup.GET(Vendor."Vendor Posting Group") THEN BEGIN
                    IF GLAccount.GET(PostingGroup."Payables Account") THEN
                        GLAccountNo := GLAccount."No.";
                    GLAccountName := GLAccount.Name;
                END;
                //#2
                IF GLAccountNo <> '' THEN BEGIN
                    IF MyEntry.FIND('-') THEN
                        REPEAT
                            MyEntry.CALCFIELDS(MyEntry."Amount (LCY)", MyEntry."Debit Amount (LCY)", MyEntry."Credit Amount (LCY)");

                            GLEntry.RESET;
                            GLEntry.SETRANGE("Entry No.", MyEntry."Entry No.");
                            GLEntry.SETFILTER("G/L Account No.", GLAccountNo + '*');
                            IF GLEntry.FIND('-') THEN
                                MyBalance := MyBalance + MyEntry."Debit Amount (LCY)" - MyEntry."Credit Amount (LCY)"
                        UNTIL MyEntry.NEXT = 0;

                    //#1 -->

                    IF MyBalance = 0 THEN
                        CurrReport.SKIP;

                    //#1 <--
                END;

                CompanyInformation.RESET;
                IF CompanyInformation.FIND('-') THEN
                    Company_Name := CompanyInformation.Name;

                IF SelectDept <> '' THEN BEGIN
                    DimensionValue.SETRANGE(Code, SelectDept);
                    IF DimensionValue.FIND('-') THEN
                        DeptName := DimensionValue.Name;
                END;
                /*               //JIM   #2
                IF GLAccountNo<>'' THEN
                BEGIN
                  GLAccount.SETRANGE("No.", GLAccountNo);
                  IF GLAccount.FIND('-') THEN
                    GLAccountName:=GLAccount.Name;
                END; #2 */

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("选项")
                {
                    Caption = '选项';
                    Visible = false;
                    field(GLAccountNo; GLAccountNo)
                    {
                        Caption = '会计科目';
                        TableRelation = "G/L Account";
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the 会计科目 field.';
                    }
                }
            }
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
        /*IF GLAccountNo = '' THEN
          ERROR('Please select Account Payable at option tab.');
        */
        ShowHeader := TRUE;

        MinDate := NORMALDATE("Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Posting Date"));
        MaxDate := NORMALDATE("Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Posting Date"));
        //DeptCode:="Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Global Dimension 1 Code");
        //DeptCode1:="Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Global Dimension 1 Code");
        //MESSAGE('%1,%2',DeptCode,DeptCode1);


        //IF DeptCode=DeptCode1 THEN
        //  SelectDept:=TRUE;

    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Balance: Decimal;
        "Bal.AccountNo1": Code[20];
        Balance1: Decimal;
        MyEntry: Record 25;
        Balance2: Decimal;
        Document1: Code[20];
        GLAccountRec: Record 23;
        RecCount: Integer;
        CurrDocNo: Code[20];
        CurrDate: Date;
        MyVendor: Record 23;
        AccountDesc: Text[200];
        ShowHeader: Boolean;
        FirstBalance: Decimal;
        SumDay: array[3] of Decimal;
        SumMonth: array[3] of Decimal;
        SumYear: array[3] of Decimal;
        MinDate: Date;
        MaxDate: Date;
        Desc: Text[100];
        DeptCode: Text[30];
        DeptCode1: Text[30];
        SelectDept: Text[30];
        CompanyInformation: Record 79;
        Company_Name: Text[30];
        DeptName: Text[30];
        DimensionValue: Record 349;
        BalanceStatus: Text[30];
        FirstStatus: Text[30];
        GLEntry: Record 17;
        VoucherNo: Text[30];
        GLAccountNo: Text[30];
        GLAccount: Record 15;
        GLAccountName: Text[60];
        MyBalance: Decimal;
        DAmt: Decimal;
        CAmt: Decimal;
        ExRate: Decimal;
        TotalFor: Label 'Total for';
        BalanceCaptionLbl: Label 'Balance';
        For__Curr_CaptionLbl: Label 'For. Curr.';
        ExplanationCaptionLbl: Label 'Explanation';
        VoucherCaptionLbl: Label 'Voucher';
        DCaptionLbl: Label 'D';
        MCaptionLbl: Label 'M';
        BalanceCaption_Control1000000079Lbl: Label 'Balance';
        CreditCaptionLbl: Label 'Credit';
        DebitCaptionLbl: Label 'Debit';
        ExplanationCaption_Control1000000097Lbl: Label 'Description';
        VoucherCaption_Control1000000098Lbl: Label 'Voucher No.';
        DCaption_Control1000000102Lbl: Label 'D';
        MCaption_Control1000000103Lbl: Label 'M';
        Vendor_CaptionLbl: Label 'Vendor';
        PageCaptionLbl: Label 'Page';
        DCaption_Control1000000112Lbl: Label 'D';
        MCaption_Control1000000114Lbl: Label 'M';
        YearCaptionLbl: Label 'Y';
        EmptyStringCaptionLbl: Label 'To';
        DCaption_Control1000000142Lbl: Label 'D';
        MCaption_Control1000000144Lbl: Label 'M';
        YearCaption_Control1000000146Lbl: Label 'Y';
        Vendor_Ledger_EntryCaptionLbl: Label 'Detail Vendor Ledger';
        DirCaptionLbl: Label '借/贷';
        G_L_AccountCaptionLbl: Label 'G/L Account';
        Exc__Rt_CaptionLbl: Label 'Exc. Rt.';
        Exc__Rt_Caption_Control1000000023Lbl: Label 'Exc. Rt.';
        AmtCaptionLbl: Label 'Amt';
        For__Curr_Caption_Control1000000038Lbl: Label 'For. Curr.';
        AmtCaption_Control1000000039Lbl: Label 'Amt';
        Curr_CaptionLbl: Label 'For. Curr.';
        Curr_Caption_Control1000000051Lbl: Label 'Curr.';
        Year_to_dateCaptionLbl: Label 'Year to Date';
        Begining_BalanceCaptionLbl: Label 'Opening Balance';
        Month_to_dateCaptionLbl: Label 'Month to Date';
        TextCR: Label 'CR';
        TextDR: Label 'DR';
        PostingGroup: Record 93;
}

