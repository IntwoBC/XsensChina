report 50005 "Voucher (LCY)-A4"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\VoucherLCYA4.rdlc';

    Caption = 'Voucher (LCY)-A4';

    dataset
    {
        dataitem("G/L Entry"; "G/L Entry")
        {
            DataItemTableView = SORTING("Document No.", "Posting Date");
            RequestFilterFields = "Document No.", "Posting Date"; //Field50001;
            column(ComName; ComName)
            {
            }
            column(FORMAT__Posting_Date__0___Year4___Month___Day___; FORMAT("Posting Date", 0, '<Year4>/<Month>/<Day>'))
            {
            }
            column(Pno; Pno)
            {
            }
            column(FORMAT__Posting_Date__0___Year4___Month___Day____Control1000000010; FORMAT("Posting Date", 0, '<Year4>/<Month>/<Day>'))
            {
            }
            column(Pno_Control1000000057; Pno)
            {
            }
            column(ComName_Control1000000002; ComName)
            {
            }
            column(PageNo; PageNo)
            {
            }
            column(G_L_Entry__Document_No__; "Document No.")
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
            column(GetAccountNo__G_L_Account_No________DimensionDesc1_____DimensionDesc2_____DimensionDesc3_____DimensionDesc4; GetAccountNo("G/L Account No.") + ' ' + DimensionDesc1 + ' ' + DimensionDesc2 + ' ' + DimensionDesc3 + ' ' + DimensionDesc4)
            {
            }
            column(GetAccountName__G_L_Account_No___; GetAccountName("G/L Account No."))
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
            column(Manager; Manager)
            {
            }
            column(CheckedName; CheckedName)
            {
            }
            column(PreparedName; PreparedName)
            {
            }
            column(Company_Name_Caption; Company_Name_CaptionLbl)
            {
            }
            column(Voucher__LCY_Caption; Voucher__LCY_CaptionLbl)
            {
            }
            column(Voucher_No__Caption; Voucher_No__CaptionLbl)
            {
            }
            column(Page_Caption; Page_CaptionLbl)
            {
            }
            column(Attachment__Caption; Attachment__CaptionLbl)
            {
            }
            column(Voucher__LCY_Caption_Control1000000006; Voucher__LCY_Caption_Control1000000006Lbl)
            {
            }
            column(Voucher_No_Caption; Voucher_No_CaptionLbl)
            {
            }
            column(Company_Name_Caption_Control1000000069; Company_Name_Caption_Control1000000069Lbl)
            {
            }
            column(Page_Caption_Control1000000091; Page_Caption_Control1000000091Lbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(Attachment__Caption_Control1117700029; Attachment__Caption_Control1117700029Lbl)
            {
            }
            column(ExplanationCaption; ExplanationCaptionLbl)
            {
            }
            column(Gen_Leg_AccCaption; Gen_Leg_AccCaptionLbl)
            {
            }
            column(DebitCaption; DebitCaptionLbl)
            {
            }
            column(CreditCaption; CreditCaptionLbl)
            {
            }
            column(Amount__LCY_Caption; Amount__LCY_CaptionLbl)
            {
            }
            column(G_L_Entry__Document_No__Caption; FIELDCAPTION("Document No."))
            {
            }
            column(Manager_Caption; Manager_CaptionLbl)
            {
            }
            column(CheckedCaption; CheckedCaptionLbl)
            {
            }
            column(Prepared_Caption; Prepared_CaptionLbl)
            {
            }
            column(G_L_Entry_Entry_No_; "Entry No.")
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

                IF LocalizationPackageSetup.GET THEN BEGIN
                    LineCount := LocalizationPackageSetup."Line Count -A4";
                    FixLine := LocalizationPackageSetup."Fixed Line";
                END;

                GLEntry.COPYFILTERS("G/L Entry");
                GLEntry.SETRANGE(GLEntry."Document No.", "G/L Entry"."Document No.");
                TotalLine := GLEntry.COUNT;

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
                //RecUser.SETRANGE(RecUser."User Name","G/L Entry".Prepared);
                RecUser.SETRANGE(RecUser."User Name", "G/L Entry"."User ID");
                IF RecUser.FIND('-') THEN
                    PreparedName := RecUser."Full Name";

                RecUser.RESET;
                RecUser.SETRANGE(RecUser."User Name", "G/L Entry"."User ID");
                IF RecUser.FIND('-') THEN
                    CheckedName := RecUser."Full Name";

                IF LocalizationPackageSetup.GET THEN BEGIN
                    Manager := LocalizationPackageSetup.Manager;

                    //CASE  "Voucher Description" OF
                    //  "Voucher Description"::"Entry Description":
                    //    AccountName:="G/L Entry".Description;
                    //  "Voucher Description"::"Cascade Account Name": BEGIN
                    //    AccountName:=ShowCascadeDesc("G/L Entry"."G/L Account No.",FALSE);
                    //    IF "Use Account Description 2" THEN AccountName:=ShowCascadeDesc("G/L Entry"."G/L Account No.",TRUE);
                    //  END;
                    //  "Voucher Description"::"Entry Desc+Cascade Acct. Name": BEGIN
                    //     AccountName:="G/L Entry".Description+ShowCascadeDesc("G/L Entry"."G/L Account No.",FALSE);
                    //     IF "Use Account Description 2" THEN
                    //       AccountName:="G/L Entry".Description+ShowCascadeDesc("G/L Entry"."G/L Account No.",TRUE);
                    //  END;
                    //  "Voucher Description"::"Cascade Acct. Name+Entry Desc": BEGIN
                    //modi by korla ---160518
                    //    AccountName:=ShowCascadeDesc("G/L Entry"."G/L Account No.",FALSE)+"G/L Entry".Description;
                    AccountName := "G/L Entry".Description;
                    //--------------------------
                    //    IF "Use Account Description 2" THEN
                    //      AccountName:=ShowCascadeDesc("G/L Entry"."G/L Account No.",TRUE)+"G/L Entry".Description;
                    //  END;

                    //END;

                END;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FIELDNO("Posting Date");

                LineInt := 0;
                DocumentNo := '';
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
        name: Code[10];
        ComName: Text[50];
        CompanyInfo: Record "Company Information";
        FixLine: Boolean;
        LineCount: Integer;
        Text0001: Label 'You can not setmore than 8 lines!';
        LineInt: Integer;
        GLEntry: Record "G/L Entry";
        TotalLine: Integer;
        PreparedName: Text[80];
        CheckedName: Text[80];
        Manager: Text[80];
        RecUser: Record User;
        DocumentNo: Code[20];
        PageNo: Integer;
        LocalizationPackageSetup: Record "Chinese Localization Setup";
        AccountName: Text[250];
        Company_Name_CaptionLbl: Label 'Company Name';
        Voucher__LCY_CaptionLbl: Label 'Voucher';
        Voucher_No__CaptionLbl: Label 'Voucher No.';
        Page_CaptionLbl: Label 'Page No.';
        Attachment__CaptionLbl: Label 'Attachment';
        Voucher__LCY_Caption_Control1000000006Lbl: Label 'Voucher';
        Voucher_No_CaptionLbl: Label 'Voucher No.';
        Company_Name_Caption_Control1000000069Lbl: Label 'Company Name';
        Page_Caption_Control1000000091Lbl: Label 'Page No.';
        EmptyStringCaptionLbl: Label '/';
        Attachment__Caption_Control1117700029Lbl: Label 'Attachment';
        ExplanationCaptionLbl: Label 'Description';
        Gen_Leg_AccCaptionLbl: Label 'Account';
        DebitCaptionLbl: Label 'Debit';
        CreditCaptionLbl: Label 'Credit';
        Amount__LCY_CaptionLbl: Label 'Amount';
        Manager_CaptionLbl: Label 'Manager';
        CheckedCaptionLbl: Label 'Checked';
        Prepared_CaptionLbl: Label 'Prepared';


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

