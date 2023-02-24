report 50004 "Voucher (FCY)-A4"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\vVoucherFCYA4.rdlc';

    Caption = 'Voucher (FCY)-A4';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING("Document No.", "Posting Date");
            RequestFilterFields = "Document No.", "Posting Date";
            column(RegNo; RegNo)
            {
            }
            column(Pno; Pno)
            {
            }
            column(ComName; ComName)
            {
            }
            column(FORMAT__Posting_Date__0___Year4___; FORMAT("Posting Date", 0, '<Year4>/<Month>/<Day>'))
            {
            }
            column(FORMAT__Posting_Date__0___Year4____Control1000000010; FORMAT("Posting Date", 0, '<Year4>/<Month>/<Day>'))
            {
            }
            column(ComName_Control1000000090; ComName)
            {
            }
            column(Pno_Control1000000057; Pno)
            {
            }
            column(RegNo_Control1000000098; RegNo)
            {
            }
            column(PageNo; PageNo)
            {
            }
            column(AccountName; AccountName)
            {
            }
            column(G_L_Entry__Debit_Amount_; "Debit Amount")
            {
            }
            column(G_L_Entry__Credit_Amount_; "Credit Amount")
            {
            }
            column(GetAccountName__G_L_Account_No___; GetAccountName("G/L Account No."))
            {
            }
            column(GetAccountNo__G_L_Account_No________DimensionDesc1_____DimensionDesc2_____DimensionDesc3_____DimensionDesc4; GetAccountNo("G/L Account No.") + ' ' + DimensionDesc1 + ' ' + DimensionDesc2 + ' ' + DimensionDesc3 + ' ' + DimensionDesc4)
            {
            }
            column(ForeignAmt; ForeignAmt)
            {
            }
            column(ExcRate; ExcRate)
            {
            }
            column(CurrCode; CurrCode)
            {
            }
            column(TotalFor___FIELDCAPTION__Document_No___; TotalFor + FIELDCAPTION("Document No."))
            {
            }
            column(TotalCaption; TotalFor)
            {
            }
            column(G_L_Entry__Debit_Amount__Control1000000029; "Debit Amount")
            {
            }
            column(G_L_Entry__Credit_Amount__Control1000000030; "Credit Amount")
            {
            }
            column(PreparedName; PreparedName)
            {
            }
            column(Manager; Manager)
            {
            }
            column(CheckedName; CheckedName)
            {
            }
            column(Voucher_No__Caption; Voucher_No__CaptionLbl)
            {
            }
            column(Reg__No__Caption; Reg__No__CaptionLbl)
            {
            }
            column(Page_Caption; Page_CaptionLbl)
            {
            }
            column(VoucherCaption; VoucherCaptionLbl)
            {
            }
            column(Company_NameCaption; Company_NameCaptionLbl)
            {
            }
            column(Attachment__Caption; Attachment__CaptionLbl)
            {
            }
            column(VoucherCaption_Control1000000006; VoucherCaption_Control1000000006Lbl)
            {
            }
            column(Voucher_No__Caption_Control1000000036; Voucher_No__Caption_Control1000000036Lbl)
            {
            }
            column(Company_NameCaption_Control1000000069; Company_NameCaption_Control1000000069Lbl)
            {
            }
            column(Page_Caption_Control1000000091; Page_Caption_Control1000000091Lbl)
            {
            }
            column(Reg__No__Caption_Control1000000097; Reg__No__Caption_Control1000000097Lbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(Attachment__Caption_Control1117700020; Attachment__Caption_Control1117700020Lbl)
            {
            }
            column(CreditCaption; CreditCaptionLbl)
            {
            }
            column(ExplanationCaption; ExplanationCaptionLbl)
            {
            }
            column(Gen_Leg_Acct_Caption; Gen_Leg_Acct_CaptionLbl)
            {
            }
            column(FCY_Amt_Caption; FCY_Amt_CaptionLbl)
            {
            }
            column(Exc_RatCaption; Exc_RatCaptionLbl)
            {
            }
            column(FCY_CodeCaption; FCY_CodeCaptionLbl)
            {
            }
            column(Amount__LCY_Caption; Amount__LCY_CaptionLbl)
            {
            }
            column(DebitCaption; DebitCaptionLbl)
            {
            }
            column(Manager__Caption; Manager__CaptionLbl)
            {
            }
            column(Checked__Caption; Checked__CaptionLbl)
            {
            }
            column(Prepared__Caption; Prepared__CaptionLbl)
            {
            }
            column(G_L_Entry_Entry_No_; "Entry No.")
            {
            }
            column(FIELDCAPTION__Document_No___; FIELDCAPTION("Document No."))
            {
            }
            column(G_L_Entry_Document_No__; "Document No.")
            {
            }
            dataitem(Integer; Integer)
            {
                DataItemTableView = SORTING(Number)
                                    WHERE(Number = FILTER(1 ..));
                column(Integer_Number; Number)
                {
                }

                trigger OnPreDataItem()
                begin
                    IF (LineInt = TotalLine) AND (FixLine = TRUE) THEN BEGIN
                        IF ((TotalLine MOD LineCount) <> 0) THEN
                            Integer.SETRANGE(Integer.Number, 1, LineCount - (LineInt MOD LineCount))
                        ELSE
                            Integer.SETRANGE(Integer.Number, 1, 0);
                    END ELSE
                        Integer.SETRANGE(Integer.Number, 1, 0);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                DimensionDesc1 := '';
                DimensionDesc2 := '';
                DimensionDesc3 := '';
                DimensionDesc4 := '';
                PreparedName := '';
                CheckedName := '';
                Manager := '';

                IF LocalizationPackageSetup.GET THEN BEGIN
                    IF LocalizationPackageSetup."Dimension Print Code 1" <> '' THEN
                        IF DimSetEntry.GET("G/L Entry"."Dimension Set ID", LocalizationPackageSetup."Dimension Print Code 1") THEN
                            IF DimensionValue.GET(LocalizationPackageSetup."Dimension Print Code 1", DimSetEntry."Dimension Value Code") THEN
                                DimensionDesc1 := DimensionValue.Name;

                    IF LocalizationPackageSetup."Dimension Print Code 2" <> '' THEN
                        IF DimSetEntry.GET("G/L Entry"."Dimension Set ID", LocalizationPackageSetup."Dimension Print Code 2") THEN
                            IF DimensionValue.GET(LocalizationPackageSetup."Dimension Print Code 2", DimSetEntry."Dimension Value Code") THEN
                                DimensionDesc2 := DimensionValue.Name;

                    IF LocalizationPackageSetup."Dimension Print Code 3" <> '' THEN
                        IF DimSetEntry.GET("G/L Entry"."Dimension Set ID", LocalizationPackageSetup."Dimension Print Code 3") THEN
                            IF DimensionValue.GET(LocalizationPackageSetup."Dimension Print Code 3", DimSetEntry."Dimension Value Code") THEN
                                DimensionDesc3 := DimensionValue.Name;

                    IF LocalizationPackageSetup."Dimension Print Code 4" <> '' THEN
                        IF DimSetEntry.GET("G/L Entry"."Dimension Set ID", LocalizationPackageSetup."Dimension Print Code 4") THEN
                            IF DimensionValue.GET(LocalizationPackageSetup."Dimension Print Code 4", DimSetEntry."Dimension Value Code") THEN
                                DimensionDesc4 := DimensionValue.Name;
                END;

                User := "G/L Entry"."User ID";
                ForeignAmt := 0;
                CurrCode := '';
                ExcRate := 0;

                IF "G/L Entry"."Source Type" IN ["G/L Entry"."Source Type"::Customer, "G/L Entry"."Source Type"::Vendor,
                                                       "G/L Entry"."Source Type"::"Bank Account"] THEN BEGIN
                    CASE "G/L Entry"."Source Type" OF
                        "G/L Entry"."Source Type"::Customer:
                            BEGIN
                                CustLE.RESET;
                                CustLE.SETRANGE(CustLE."Transaction No.", "G/L Entry"."Transaction No.");
                                CustLE.SETFILTER(CustLE."Currency Code", '<>%1', '');
                                CustLE.SETRANGE(CustLE."Entry No.", "G/L Entry"."Entry No.");
                                IF CustLE.FIND('-') THEN
                                    IF CustLE."Currency Code" <> '' THEN BEGIN
                                        CustLE.CALCFIELDS(Amount, "Amount (LCY)");
                                        ForeignAmt := ABS(CustLE.Amount);
                                        IF CustLE.Amount <> 0 THEN BEGIN
                                            CurrCode := CustLE."Currency Code";
                                            ExcRate := CustLE."Amount (LCY)" / CustLE.Amount;
                                        END;
                                    END;
                            END;
                        "G/L Entry"."Source Type"::Vendor:
                            BEGIN
                                VendorLE.RESET;
                                VendorLE.SETRANGE(VendorLE."Transaction No.", "G/L Entry"."Transaction No.");
                                VendorLE.SETRANGE(VendorLE."Entry No.", "G/L Entry"."Entry No.");
                                VendorLE.SETFILTER(VendorLE."Currency Code", '<>%1', '');
                                IF VendorLE.FIND('-') THEN
                                    IF VendorLE."Currency Code" <> '' THEN BEGIN
                                        VendorLE.CALCFIELDS(Amount, "Amount (LCY)");
                                        ForeignAmt := ABS(VendorLE.Amount);
                                        IF VendorLE.Amount <> 0 THEN BEGIN
                                            CurrCode := VendorLE."Currency Code";
                                            ExcRate := VendorLE."Amount (LCY)" / VendorLE.Amount;
                                        END;
                                    END;
                            END;
                        "G/L Entry"."Source Type"::"Bank Account":
                            BEGIN
                                BankLE.RESET;
                                BankLE.SETRANGE(BankLE."Transaction No.", "G/L Entry"."Transaction No.");
                                BankLE.SETFILTER(BankLE."Currency Code", '<>%1', '');
                                BankLE.SETRANGE(BankLE."Entry No.", "G/L Entry"."Entry No.");
                                IF BankLE.FIND('-') THEN
                                    IF BankLE."Currency Code" <> '' THEN //JC
                                      BEGIN
                                        ForeignAmt := ABS(BankLE.Amount);
                                        IF BankLE.Amount <> 0 THEN BEGIN
                                            CurrCode := BankLE."Currency Code";
                                            ExcRate := BankLE."Amount (LCY)" / BankLE.Amount;
                                        END;
                                    END;
                            END;
                    END;
                END;

                GLRegister.RESET;
                GLRegister.SETFILTER(GLRegister."From Entry No.", '<=%1', "G/L Entry"."Entry No.");
                GLRegister.SETFILTER(GLRegister."To Entry No.", '>=%1', "G/L Entry"."Entry No.");
                IF GLRegister.FIND('-') THEN
                    RegNo := GLRegister."No.";

                //Print Fixed Line in report.
                IF LocalizationPackageSetup.GET THEN BEGIN
                    LineCount := LocalizationPackageSetup."Line Count -A4";
                    FixLine := LocalizationPackageSetup."Fixed Line";
                END;


                GLEntry2.COPYFILTERS("G/L Entry");
                GLEntry2.SETRANGE(GLEntry2."Document No.", "G/L Entry"."Document No.");
                TotalLine := GLEntry2.COUNT;


                IF DocumentNo <> "G/L Entry"."Document No." THEN BEGIN
                    LineInt := 1;
                    DocumentNo := "G/L Entry"."Document No.";
                END ELSE
                    LineInt := LineInt + 1;


                IF (FixLine = TRUE) THEN BEGIN
                    IF (((LineInt - 1) MOD LineCount) = 0) AND (LineInt > LineCount) THEN
                        CurrReport.NEWPAGE;
                    PageNo := ROUND(TotalLine / LineCount, 1, '>');
                END;
                //JC 2013-2-1 Update
                RecUser.RESET;
                RecUser.SETRANGE(RecUser."User Name", "G/L Entry"."User ID");
                IF RecUser.FIND('-') THEN
                    PreparedName := RecUser."Full Name";

                RecUser.RESET;
                RecUser.SETRANGE(RecUser."User Name", "G/L Entry"."User ID");
                IF RecUser.FIND('-') THEN
                    CheckedName := RecUser."Full Name";



                /*
                IF RecUser.GET("G/L Entry".Prepared) THEN
                  PreparedName :=RecUser."Full Name";
                
                IF RecUser.GET("G/L Entry"."User ID") THEN
                  CheckedName :=RecUser."Full Name"; */

                IF LocalizationPackageSetup.GET THEN BEGIN
                    Manager := LocalizationPackageSetup.Manager;

                    //CASE  "Voucher Description" OF
                    //"Voucher Description"::"Entry Description":
                    //  AccountName:="G/L Entry".Description;
                    //"Voucher Description"::"Cascade Account Name": BEGIN
                    //  AccountName:=ShowCascadeDesc("G/L Entry"."G/L Account No.",FALSE);
                    //  IF "Use Account Description 2" THEN AccountName:=ShowCascadeDesc("G/L Entry"."G/L Account No.",TRUE);
                    //END;
                    //"Voucher Description"::"Entry Desc+Cascade Acct. Name": BEGIN
                    //   AccountName:="G/L Entry".Description+ShowCascadeDesc("G/L Entry"."G/L Account No.",FALSE);
                    //   IF "Use Account Description 2" THEN
                    //     AccountName:="G/L Entry".Description+ShowCascadeDesc("G/L Entry"."G/L Account No.",TRUE);
                    //END;
                    //"Voucher Description"::"Cascade Acct. Name+Entry Desc": BEGIN
                    //modi by korla, -----20160518
                    AccountName := ShowCascadeDesc("G/L Entry"."G/L Account No.", FALSE) + "G/L Entry".Description;
                    AccountName := "G/L Entry".Description;
                    //
                    //IF "Use Account Description 2" THEN
                    //  AccountName:=ShowCascadeDesc("G/L Entry"."G/L Account No.",TRUE)+"G/L Entry".Description;
                    //END;

                    //END;

                END;

            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Posting Date");
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
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
        CompanyInfo.FIND('-');
        ComName := CompanyInfo.Name;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: Label 'Total';
        DimensionDesc1: Text[50];
        DimensionDesc2: Text[50];
        DimensionValue: Record "Dimension Value";
        DimensionDesc3: Text[50];
        DimensionDesc4: Text[50];
        DimSetEntry: Record "Dimension Set Entry";
        User: Code[50];
        Pno: Integer;
        ComName: Text[50];
        CompanyInfo: Record "Company Information";
        ForeignAmt: Decimal;
        ExcRate: Decimal;
        CurrCode: Code[10];
        GLEntry: Record "G/L Entry";
        CustLE: Record "Cust. Ledger Entry";
        VendorLE: Record "Vendor Ledger Entry";
        BankLE: Record "Bank Account Ledger Entry";
        RegNo: Integer;
        GLRegister: Record "G/L Register";
        FixLine: Boolean;
        LineCount: Integer;
        LineInt: Integer;
        GLEntry2: Record "G/L Entry";
        TotalLine: Integer;
        PreparedName: Text[80];
        CheckedName: Text[80];
        Manager: Text[80];
        RecUser: Record User;
        DocumentNo: Code[20];
        Text0001: Label 'You can not set more than 8 lines!';
        PageNo: Integer;
        LocalizationPackageSetup: Record "Chinese Localization Setup";
        BankAccount: Record "Bank Account";
        AccountName: Text[250];
        PageGroupNo: Integer;
        NextPageGroupNo: Integer;
        Voucher_No__CaptionLbl: Label 'Voucher No.';
        Reg__No__CaptionLbl: Label 'Reg. No.';
        Page_CaptionLbl: Label 'Page No.';
        VoucherCaptionLbl: Label 'Voucher';
        Company_NameCaptionLbl: Label 'Company Name';
        Attachment__CaptionLbl: Label 'Attachment';
        VoucherCaption_Control1000000006Lbl: Label 'Voucher';
        Voucher_No__Caption_Control1000000036Lbl: Label 'Voucher No.';
        Company_NameCaption_Control1000000069Lbl: Label 'Company Name';
        Page_Caption_Control1000000091Lbl: Label 'Page No.';
        Reg__No__Caption_Control1000000097Lbl: Label 'Reg. No.';
        EmptyStringCaptionLbl: Label '-';
        Attachment__Caption_Control1117700020Lbl: Label 'Attachment';
        CreditCaptionLbl: Label 'Credit';
        ExplanationCaptionLbl: Label 'Description';
        Gen_Leg_Acct_CaptionLbl: Label 'Account';
        FCY_Amt_CaptionLbl: Label 'Amount(FCY)';
        Exc_RatCaptionLbl: Label 'Exchange Rate';
        FCY_CodeCaptionLbl: Label 'FCY';
        Amount__LCY_CaptionLbl: Label 'Amount (LCY)';
        DebitCaptionLbl: Label 'Debit';
        Manager__CaptionLbl: Label 'Manager';
        Checked__CaptionLbl: Label 'Checked';
        Prepared__CaptionLbl: Label 'Prepared';


    internal procedure GetAccountName("Account No": Code[20]): Text[100]
    var
        "G/L Account": Record "G/L Account";
        _LocalPackageSetup: Record "Chinese Localization Setup";
    begin
        _LocalPackageSetup.GET;
        IF "Account No" <> '' THEN BEGIN
            "G/L Account".GET("Account No");
            //IF _LocalPackageSetup."Use Account Description 2" THEN
            //  EXIT("G/L Account".Description2);
            EXIT("G/L Account".Name);
        END;
    end;


    internal procedure ShowCascadeDesc("@GLAccNo": Code[20]; "@BlnShowDesc2": Boolean): Text[250]
    var
        _GLAccount: Record "G/L Account";
        _xGLAccount: Record "G/L Account";
        _AccCascadeDesc: Text[250];
        _BlnBreak: Boolean;
        _LastStep: Integer;
        _BlnLastLevel: Boolean;
    begin
        _AccCascadeDesc := '';
        _xGLAccount.GET("@GLAccNo");
        _GLAccount.RESET;
        _GLAccount := _xGLAccount;
        _BlnBreak := TRUE;

        WHILE (_GLAccount.Indentation <> 0) AND _BlnBreak DO BEGIN
            _GLAccount.SETRANGE(Indentation, _GLAccount.Indentation - 1, _GLAccount.Indentation);
            IF _GLAccount.FIND THEN
                REPEAT
                    _LastStep := _GLAccount.NEXT(-1);
                    _BlnLastLevel := _GLAccount.Indentation = (_xGLAccount.Indentation - 1);
                    IF _BlnLastLevel THEN
                        //IF "@BlnShowDesc2" THEN
                        //  _AccCascadeDesc:=_GLAccount.Description2+'-'+_AccCascadeDesc
                        //ELSE
                        _AccCascadeDesc := _GLAccount.Name + '-' + _AccCascadeDesc;
                UNTIL _BlnLastLevel OR (_LastStep = 0);

            IF (_LastStep = 0) AND (_GLAccount.Indentation = _xGLAccount.Indentation) THEN
                _BlnBreak := FALSE;

            _xGLAccount := _GLAccount;
        END;

        _xGLAccount.GET("@GLAccNo");
        //IF "@BlnShowDesc2" THEN
        //  _AccCascadeDesc+=_xGLAccount.Description2
        //ELSE
        _AccCascadeDesc += _xGLAccount.Name;

        EXIT(_AccCascadeDesc);
    end;


    internal procedure GetAccountNo("Account No": Code[20]): Text[100]
    var
        "G/L Account": Record "G/L Account";
        _LocalPackageSetup: Record "Chinese Localization Setup";
    begin
        _LocalPackageSetup.GET;
        IF "Account No" <> '' THEN BEGIN
            "G/L Account".GET("Account No");
            //IF _LocalPackageSetup."Use Account No. 2" THEN
            //  EXIT("G/L Account"."No.2");
            EXIT("G/L Account"."No.");
        END;
    end;
}

