report 50008 "Detail Customer Ledger"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\DetailCustomerLedger.rdlc';

    Caption = 'Detail Customer Ledger';

    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(CurrReport_PAGENO_Control1000000097; CurrReport.PAGENO)
            {
            }
            column(DeptName_Control1000000098; DeptName)
            {
            }
            column(GLAccountName_Control1000000109; GLAccountName)
            {
            }
            column(FORMAT_MaxDate_0___Day____Control1000000117; FORMAT(MaxDate, 0, '<Day>'))
            {
            }
            column(FORMAT_MaxDate_0___Month_2____Control1000000138; FORMAT(MaxDate, 0, '<Month,2>'))
            {
            }
            column(FORMAT_MaxDate_0___Year4____Control1000000140; FORMAT(MaxDate, 0, '<Year4>'))
            {
            }
            column(FORMAT_MinDate_0___Day____Control1000000147; FORMAT(MinDate, 0, '<Day>'))
            {
            }
            column(Customer_Customer__No___Control1000000148; Customer."No.")
            {
            }
            column(FORMAT_MinDate_0___Month_2____Control1000000150; FORMAT(MinDate, 0, '<Month,2>'))
            {
            }
            column(Customer_Customer_Name_Control1000000151; Customer.Name)
            {
            }
            column(FORMAT_MinDate_0___Year4____Control1000000153; FORMAT(MinDate, 0, '<Year4>'))
            {
            }
            column(Company_Name_Control1000000155; Company_Name)
            {
            }
            column(GLAccountNo1; GLAccountNo)
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
            column(PageCaption_Control1000000104; PageCaption_Control1000000104Lbl)
            {
            }
            column(BalanceCaption_Control1000000105; BalanceCaption_Control1000000105Lbl)
            {
            }
            column(BalanceCaption_Control1000000106; BalanceCaption_Control1000000106Lbl)
            {
            }
            column(BalanceCaption_Control1000000107; BalanceCaption_Control1000000107Lbl)
            {
            }
            column(G_L_AccountCaption_Control1000000141; G_L_AccountCaption_Control1000000141Lbl)
            {
            }
            column(LCYCaption_Control1000000111; LCYCaption_Control1000000111Lbl)
            {
            }
            column(CreditCaption_Control1000000112; CreditCaption_Control1000000112Lbl)
            {
            }
            column(DCaption_Control1000000113; DCaption_Control1000000113Lbl)
            {
            }
            column(Detail_Customer_LedgerCaption_Control1000000116; Detail_Customer_LedgerCaption_Control1000000116Lbl)
            {
            }
            column(MCaption_Control1000000119; MCaption_Control1000000119Lbl)
            {
            }
            column(LCYCaption_Control1000000136; LCYCaption_Control1000000136Lbl)
            {
            }
            column(DebitCaption_Control1000000137; DebitCaption_Control1000000137Lbl)
            {
            }
            column(YCaption_Control1000000139; YCaption_Control1000000139Lbl)
            {
            }
            column(ExplanationCaption_Control1000000143; ExplanationCaption_Control1000000143Lbl)
            {
            }
            column(ExplanationCaption_Control1000000144; ExplanationCaption_Control1000000144Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000145; EmptyStringCaption_Control1000000145Lbl)
            {
            }
            column(DCaption_Control1000000146; DCaption_Control1000000146Lbl)
            {
            }
            column(No_Caption_Control1000000154; No_Caption_Control1000000154Lbl)
            {
            }
            column(MCaption_Control1000000149; MCaption_Control1000000149Lbl)
            {
            }
            column(CustomerCaption; CustomerCaptionLbl)
            {
            }
            column(YCaption_Control1000000152; YCaption_Control1000000152Lbl)
            {
            }
            column(VoucherCaption_Control1000000157; VoucherCaption_Control1000000157Lbl)
            {
            }
            column(VoucherCaption_Control1000000158; VoucherCaption_Control1000000158Lbl)
            {
            }
            column(DCaption_Control1000000160; DCaption_Control1000000160Lbl)
            {
            }
            column(DCaption_Control1000000161; DCaption_Control1000000161Lbl)
            {
            }
            column(MCaption_Control1000000164; MCaption_Control1000000164Lbl)
            {
            }
            column(MCaption_Control1000000165; MCaption_Control1000000165Lbl)
            {
            }
            column(For__Curr_Caption_Control1000000174; For__Curr_Caption_Control1000000174Lbl)
            {
            }
            column(For__Curr_Caption_Control1000000175; For__Curr_Caption_Control1000000175Lbl)
            {
            }
            column(Curr_Caption_Control1000000176; Curr_Caption_Control1000000176Lbl)
            {
            }
            column(Ex__Rt_Caption_Control1000000177; Ex__Rt_Caption_Control1000000177Lbl)
            {
            }
            column(Ex__Rt_Caption_Control1000000178; Ex__Rt_Caption_Control1000000178Lbl)
            {
            }
            column(Curr_Caption_Control1000000179; Curr_Caption_Control1000000179Lbl)
            {
            }
            column(Year_to_dateCaption; Year_to_dateCaptionLbl)
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = FIELD("No.");
                DataItemTableView = SORTING("Customer No.", "Posting Date", "Currency Code");
                RequestFilterFields = "Posting Date";
                column(FirstBalance; FirstBalance)
                {
                    DecimalPlaces = 0 : 4;
                }
                column(FirstStatus; FirstStatus)
                {
                }
                column(Cust__Ledger_Entry__Credit_Amount__LCY__; "Credit Amount (LCY)")
                {
                }
                column(Cust__Ledger_Entry__Debit_Amount__LCY__; "Debit Amount (LCY)")
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
                column(Cust__Ledger_Entry__Cust__Ledger_Entry___Currency_Code_; "Cust. Ledger Entry"."Currency Code")
                {
                    //DecimalPlaces = 0 : 4;
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
                column(FORMAT__Posting_Date__0___year4___; FORMAT("Posting Date", 0, '<year4>'))
                {
                }
                column(Cust__Ledger_Entry__Debit_Amount__LCY___Control1000000008; "Debit Amount (LCY)")
                {
                }
                column(Cust__Ledger_Entry__Credit_Amount__LCY___Control1000000009; "Credit Amount (LCY)")
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
                column(Cust__Ledger_Entry_Entry_No_; "Entry No.")
                {
                }
                column(Cust__Ledger_Entry_Customer_No_; "Customer No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //Balance2:=0;
                    //Balance:=Balance+"Customer Ledger Entry".Amount;

                    "Cust. Ledger Entry".CALCFIELDS("Amount (LCY)", "Debit Amount", "Credit Amount");

                    IF "Cust. Ledger Entry"."Currency Code" <> '' THEN BEGIN
                        DAmt := "Cust. Ledger Entry"."Debit Amount";
                        CAmt := "Cust. Ledger Entry"."Credit Amount";

                        IF DAmt <> 0 THEN
                            ExRate := "Cust. Ledger Entry"."Debit Amount (LCY)" / DAmt
                        ELSE
                            IF CAmt <> 0 THEN
                                ExRate := "Cust. Ledger Entry"."Credit Amount (LCY)" / CAmt;
                    END
                    ELSE BEGIN
                        DAmt := 0;
                        CAmt := 0;
                        ExRate := 0;
                    END;



                    IF GLAccountNo <> '' THEN BEGIN
                        GLEntry.RESET;
                        GLEntry.SETRANGE("Entry No.", "Cust. Ledger Entry"."Entry No.");
                        GLEntry.SETFILTER("G/L Account No.", GLAccountNo + '*');
                        IF GLEntry.FIND('-') THEN
                            Balance2 := Balance2 + "Cust. Ledger Entry"."Amount (LCY)"
                        ELSE
                            CurrReport.SKIP;
                    END
                    ELSE
                        Balance2 := Balance2 + "Cust. Ledger Entry"."Amount (LCY)";

                    /*
                    MyEntry.RESET;
                    IF "Cust. Ledger Entry"."Entry No."<>0 THEN
                    MyEntry.SETFILTER(MyEntry."Entry No.",'%1',"Cust. Ledger Entry"."Entry No.");
                    MyEntry.SETRANGE("Date Filter",MinDate,"Cust. Ledger Entry"."Posting Date");
                    IF MyEntry.FIND('-') THEN
                    //REPEAT
                    MyEntry.Amount:=0;
                    MyEntry.CALCFIELDS(MyEntry.Amount,MyEntry."Debit Amount",MyEntry."Credit Amount");
                    "Cust. Ledger Entry".CALCFIELDS("Cust. Ledger Entry".Amount);
                    Balance2:=Balance2+ "Cust. Ledger Entry".Amount;
                    //UNTIL MyEntry.NEXT=0;
                    */

                    IF Balance2 > 0 THEN
                        BalanceStatus := TextCR;
                    IF Balance2 < 0 THEN
                        BalanceStatus := TextDR;
                    IF Balance2 = 0 THEN
                        BalanceStatus := '';

                    Balance1 := ABS(Balance2);

                    //ShowHeader:=FALSE;

                    Desc := Description;
                    IF "External Document No." <> '' THEN
                        Desc := Desc + '(' + "External Document No." + ')';

                    //get voucher no.
                    GLEntry.RESET;
                    IF GLEntry.GET("Entry No.") THEN
                        VoucherNo := GLEntry."Document No.";

                    DepartName := '';
                    Responsibility.SETRANGE(Responsibility.Code, "Cust. Ledger Entry"."Global Dimension 1 Code");
                    IF Responsibility.FIND('-') THEN
                        DepartName := Responsibility.Name;

                end;

                trigger OnPreDataItem()
                begin
                    TempCustLedgerEntry.SETRANGE(TempCustLedgerEntry."Customer No.", Customer."No.");
                    IF SelectDept <> '' THEN
                        TempCustLedgerEntry.SETRANGE(TempCustLedgerEntry."Global Dimension 1 Code", SelectDept);
                    DateFilter := "Cust. Ledger Entry".GETFILTER("Cust. Ledger Entry"."Posting Date");
                    TempCustLedgerEntry.SETFILTER(TempCustLedgerEntry."Posting Date", DateFilter);
                    IF NOT TempCustLedgerEntry.FIND('-') THEN
                        IsPrint := FALSE;

                    LastFieldNo := FIELDNO("Customer No.");
                    //message(LastFieldNo);
                    //CurrReport.CREATETOTALS(Balance2);

                    IF SelectDept <> '' THEN
                        "Cust. Ledger Entry".SETFILTER("Cust. Ledger Entry"."Global Dimension 1 Code", SelectDept);

                    MyEntry.RESET;
                    IF Customer."No." <> '' THEN
                        MyEntry.SETFILTER(MyEntry."Customer No.", Customer."No.");
                    IF SelectDept <> '' THEN
                        MyEntry.SETFILTER(MyEntry."Global Dimension 1 Code", SelectDept);
                    MyEntry.SETRANGE(MyEntry."Date Filter", 0D, (NORMALDATE("Cust. Ledger Entry".GETRANGEMIN("Posting Date")) - 1));
                    IF MyEntry.FIND('-') THEN
                        REPEAT
                            MyEntry.CALCFIELDS(MyEntry."Amount (LCY)", MyEntry."Debit Amount (LCY)", MyEntry."Credit Amount (LCY)");

                            //select G/L Account
                            IF GLAccountNo <> '' THEN BEGIN
                                GLEntry.RESET;
                                GLEntry.SETRANGE("Entry No.", MyEntry."Entry No.");
                                GLEntry.SETFILTER("G/L Account No.", GLAccountNo + '*');
                                IF GLEntry.FIND('-') THEN
                                    FirstBalance := FirstBalance + MyEntry."Debit Amount (LCY)" - MyEntry."Credit Amount (LCY)"
                                //ELSE
                                // FirstBalance:=FirstBalance;
                            END
                            ELSE
                                FirstBalance := FirstBalance + MyEntry."Debit Amount (LCY)" - MyEntry."Credit Amount (LCY)";
                        UNTIL MyEntry.NEXT = 0;


                    MyEntry.RESET;
                    IF Customer."No." <> '' THEN
                        MyEntry.SETFILTER(MyEntry."Customer No.", Customer."No.");
                    IF SelectDept <> '' THEN
                        MyEntry.SETFILTER(MyEntry."Global Dimension 1 Code", SelectDept);
                    MyEntry.SETRANGE("Date Filter", CALCDATE('CY-1Y+1D', "Cust. Ledger Entry".GETRANGEMAX("Posting Date")),
                                       "Cust. Ledger Entry".GETRANGEMAX("Posting Date"));
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
                                //ELSE
                                //message('ok');
                            END
                            ELSE BEGIN
                                SumYear[3] += MyEntry."Debit Amount (LCY)" - MyEntry."Credit Amount (LCY)";
                                SumYear[2] += MyEntry."Credit Amount (LCY)";
                                SumYear[1] += MyEntry."Debit Amount (LCY)";
                            END;
                        UNTIL MyEntry.NEXT = 0;


                    /*
                    MyCustomer.RESET;
                    IF Customer."No."<>'' THEN
                    MyCustomer.SETFILTER(MyCustomer."No.",Customer."No.");
                    IF SelectDept<>'' THEN
                      MyCustomer.SETFILTER(MyCustomer."Global Dimension 1 Filter", SelectDept);
                    MyCustomer.SETRANGE(MyCustomer."Date Filter",0D,(NORMALDATE("Cust. Ledger Entry".GETRANGEMIN("Posting Date"))-1));
                    IF MyCustomer.FIND('-') THEN
                    REPEAT
                    MyCustomer.CALCFIELDS(MyCustomer.Balance,MyCustomer."Debit Amount",MyCustomer."Credit Amount");
                    FirstBalance:=FirstBalance+MyCustomer."Debit Amount" - MyCustomer."Credit Amount";
                    UNTIL MyCustomer.NEXT=0;
                    
                    MyCustomer.RESET;
                    IF Customer."No."<>'' THEN
                    MyCustomer.SETFILTER(MyCustomer."No.",Customer."No.");
                    MyCustomer.SETRANGE(MyCustomer."Date Filter",MinDate,MaxDate);
                    //MESSAGE(FORMAT(CALCDATE('CM-1M+1D',MaxDate)));
                    IF MyCustomer.FIND('-') THEN
                    REPEAT
                    MyCustomer.CALCFIELDS(MyCustomer."Net Change",MyCustomer."Debit Amount",MyCustomer."Credit Amount");
                    SumMonth[3]+=FirstBalance+MyCustomer."Net Change";
                    SumMonth[2]+=MyCustomer."Credit Amount";
                    SumMonth[1]+=MyCustomer."Debit Amount";
                    UNTIL MyCustomer.NEXT=0  ;
                    
                    MyCustomer.RESET;
                    IF Customer."No."<>'' THEN
                    MyCustomer.SETFILTER(MyCustomer."No.",Customer."No.");
                    IF SelectDept<>'' THEN
                      MyCustomer.SETFILTER(MyCustomer."Global Dimension 1 Filter", SelectDept);
                    MyCustomer.SETRANGE("Date Filter",CALCDATE('CY-1Y+1D',"Cust. Ledger Entry".GETRANGEMAX("Posting Date")),
                                       "Cust. Ledger Entry".GETRANGEMAX("Posting Date"));
                    IF MyCustomer.FIND('-') THEN
                    REPEAT
                    MyCustomer.CALCFIELDS(MyCustomer.Balance,MyCustomer."Debit Amount",MyCustomer."Credit Amount");
                    SumYear[3]+=MyCustomer."Debit Amount" - MyCustomer."Credit Amount";
                    SumYear[2]+= MyCustomer."Credit Amount";
                    SumYear[1]+=MyCustomer."Debit Amount";
                    UNTIL MyCustomer.NEXT=0;
                    
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
                    */

                    Balance2 := Balance2 + FirstBalance;

                    IF FirstBalance > 0 THEN
                        FirstStatus := TextDR;
                    IF FirstBalance < 0 THEN
                        FirstStatus := TextCR;
                    IF FirstBalance = 0 THEN
                        FirstStatus := '';

                end;
            }

            trigger OnAfterGetRecord()
            begin
                FirstBalance := 0.0;
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
                IsPrint := TRUE;

                MyEntry.RESET;
                MyEntry.SETRANGE(MyEntry."Posting Date", MinDate, MaxDate);
                IF SelectDept <> '' THEN
                    MyEntry.SETRANGE(MyEntry."Global Dimension 1 Code", SelectDept);
                MyEntry.SETFILTER(MyEntry."Customer No.", Customer."No.");
                IF NOT MyEntry.FIND('-') THEN
                    CurrReport.SKIP;

                CLEAR(GLAccountNo);
                IF CustPostingGroup.GET(Customer."Customer Posting Group") THEN BEGIN
                    IF GLAccount1.GET(CustPostingGroup."Receivables Account") THEN BEGIN
                        GLAccountNo := GLAccount1."No.";
                        GLAccountName := GLAccount1.Name;
                    END;
                END;

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

                IF GLAccountNo <> '' THEN BEGIN
                    TempGLAccountNo := COPYSTR(GLAccountNo, 1, 4);
                    TempGLAccount.SETRANGE(TempGLAccount."No.", TempGLAccountNo);
                    IF TempGLAccount.FIND('-') THEN
                        GLAccountName := TempGLAccount.Name;
                    GLAccount.SETRANGE("No.", GLAccountNo);
                    IF GLAccount.FIND('-') THEN
                        GLAccountName := GLAccountName + '-' + GLAccount.Name;
                END;
            end;

            trigger OnPreDataItem()
            begin
                //IF SelectDept<>'' THEN
                //  Customer.SETFILTER(Customer."Global Dimension 1 Filter", SelectDept);
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
          ERROR('Please select Account Receivable at option tab.');*/

        ShowHeader := TRUE;

        MinDate := NORMALDATE("Cust. Ledger Entry".GETRANGEMIN("Cust. Ledger Entry"."Posting Date"));
        MaxDate := NORMALDATE("Cust. Ledger Entry".GETRANGEMAX("Cust. Ledger Entry"."Posting Date"));
        //DeptCode:="Vendor Ledger Entry".GETRANGEMIN("Vendor Ledger Entry"."Global Dimension 1 Code");
        //DeptCode1:="Vendor Ledger Entry".GETRANGEMAX("Vendor Ledger Entry"."Global Dimension 1 Code");
        //MESSAGE('%1,%2',DeptCode,DeptCode1);

        //check if select a department
        //MyEntry.RESET;
        //IF "Cust. Ledger Entry"."Entry No."<>0 THEN
        //MyEntry.SETFILTER(MyEntry."Entry No.",'%1',"Cust. Ledger Entry"."Entry No.");
        //MyEntry.SETRANGE("Date Filter",MinDate,MaxDate);
        //IF MyEntry.FIND('-') THEN
        //REPEAT
        //  Deptcode:=Myentry."Global Dimension 1 Code";
        //  if deptcode<>deptcode1 then
        //     selectdept=true;
        //  deptcode1:=deptcode;
        //UNTIL MyEntry.NEXT=0;

        //IF DeptCode=DeptCode1 THEN
        //  SelectDept:=TRUE;

    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Balance: Decimal;
        "Bal.AccountNo1": Code[20];
        Balance1: Decimal;
        MyEntry: Record 21;
        Balance2: Decimal;
        Document1: Code[20];
        GLAccountRec: Record 18;
        RecCount: Integer;
        CurrDocNo: Code[20];
        CurrDate: Date;
        MyCustomer: Record 18;
        AccountDesc: Text[200];
        ShowHeader: Boolean;
        FirstBalance: Decimal;
        SumDay: array[3] of Decimal;
        SumMonth: array[3] of Decimal;
        SumYear: array[3] of Decimal;
        MinDate: Date;
        MaxDate: Date;
        Desc: Text[60];
        DeptCode: Text[30];
        DeptCode1: Text[30];
        SelectDept: Text[30];
        CompanyInformation: Record "Company Information";
        Company_Name: Text[30];
        DeptName: Text[30];
        DimensionValue: Record "Dimension Value";
        BalanceStatus: Text[30];
        FirstStatus: Text[30];
        GLEntry: Record "G/L Entry";
        VoucherNo: Text[30];
        GLAccountNo: Text[30];
        GLAccountName: Text[60];
        GLAccount: Record "G/L Account";
        MyBalance: Decimal;
        DepartName: Text[30];
        Responsibility: Record 5714;
        TempCustLedgerEntry: Record 21;
        DateFilter: Text[100];
        IsPrint: Boolean;
        TempGLAccountNo: Text[30];
        TempGLAccount: Record 15;
        CAmt: Decimal;
        DAmt: Decimal;
        ExRate: Decimal;
        TotalFor: Label 'Total for';
        PageCaption_Control1000000104Lbl: Label 'Page';
        BalanceCaption_Control1000000105Lbl: Label 'Balance';
        BalanceCaption_Control1000000106Lbl: Label 'Balance';
        BalanceCaption_Control1000000107Lbl: Label 'DR/CR';
        G_L_AccountCaption_Control1000000141Lbl: Label 'G/L Account';
        LCYCaption_Control1000000111Lbl: Label 'LCY';
        CreditCaption_Control1000000112Lbl: Label 'Credit';
        DCaption_Control1000000113Lbl: Label 'D';
        Detail_Customer_LedgerCaption_Control1000000116Lbl: Label 'Detail Customer Ledger';
        MCaption_Control1000000119Lbl: Label 'M';
        LCYCaption_Control1000000136Lbl: Label 'LCY';
        DebitCaption_Control1000000137Lbl: Label 'Debit';
        YCaption_Control1000000139Lbl: Label 'Y';
        ExplanationCaption_Control1000000143Lbl: Label 'Explanation';
        ExplanationCaption_Control1000000144Lbl: Label 'Description';
        EmptyStringCaption_Control1000000145Lbl: Label 'To';
        DCaption_Control1000000146Lbl: Label 'D';
        No_Caption_Control1000000154Lbl: Label 'No.';
        MCaption_Control1000000149Lbl: Label 'M';
        CustomerCaptionLbl: Label 'Customer';
        YCaption_Control1000000152Lbl: Label 'Y';
        VoucherCaption_Control1000000157Lbl: Label 'Voucher';
        VoucherCaption_Control1000000158Lbl: Label 'Voucher No.';
        DCaption_Control1000000160Lbl: Label 'D';
        DCaption_Control1000000161Lbl: Label 'D';
        MCaption_Control1000000164Lbl: Label 'M';
        MCaption_Control1000000165Lbl: Label 'M';
        For__Curr_Caption_Control1000000174Lbl: Label 'For. Curr.';
        For__Curr_Caption_Control1000000175Lbl: Label 'For. Curr.';
        Curr_Caption_Control1000000176Lbl: Label 'For. Curr.';
        Ex__Rt_Caption_Control1000000177Lbl: Label 'Ex. Rt.';
        Ex__Rt_Caption_Control1000000178Lbl: Label 'Ex. Rt.';
        Curr_Caption_Control1000000179Lbl: Label 'Curr.';
        Year_to_dateCaptionLbl: Label 'Year to Date';
        Begining_BalanceCaptionLbl: Label 'Opening Balance';
        Month_to_dateCaptionLbl: Label 'Month to Date';
        TextCR: Label 'CR';
        TextDR: Label 'DR';
        CustPostingGroup: Record 92;
        GLAccount1: Record 15;
}

