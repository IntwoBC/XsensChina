report 50001 "Chinese Balance Sheet"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\ChineseBalanceSheet.rdlc';

    Caption = 'Chinese Balance Sheet';

    dataset
    {
        dataitem("Acc. Schedule Line"; "Acc. Schedule Line")
        {
            RequestFilterFields = "Date Filter", "Dimension 1 Filter", "Dimension 2 Filter", "Business Unit Filter";
        }
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number)
                                ORDER(Ascending);
            column(companyinfo_Name; companyinfo.Name)
            {
            }
            column(FORMAT_DateFilterMax_0___Year4___Month___Day___; FORMAT(DateFilterMax, 0, '<Year4>年<Month>月<Day>日'))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(vDescription; vDescription)
            {
            }
            column(vRaw; vRaw)
            {
            }
            column(LColAmount; LColAmount)
            {
            }
            column(LColAmount2; LColAmount2)
            {
            }
            column(RColAmount2; RColAmount2)
            {
            }
            column(RColAmount; RColAmount)
            {
            }
            column(vRaw2; vRaw2)
            {
            }
            column(vDescription2; vDescription2)
            {
            }
            column(Company_Name_Caption; Company_Name_CaptionLbl)
            {
            }
            column(Unit___YuanCaption; Unit___YuanCaptionLbl)
            {
            }
            column(Balance_SheetCaption; Balance_SheetCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(AssetCaption; AssetCaptionLbl)
            {
            }
            column(Beginning_BalanceCaption; Beginning_BalanceCaptionLbl)
            {
            }
            column(Closing_BalaceCaption; Closing_BalaceCaptionLbl)
            {
            }
            column(Liability_And_EquityCaption; Liability_And_EquityCaptionLbl)
            {
            }
            column(Line_No_Caption; Line_No_CaptionLbl)
            {
            }
            column(Beginning_BalanceCaption_Control1000000018; Beginning_BalanceCaption_Control1000000018Lbl)
            {
            }
            column(Closing_BalanceCaption; Closing_BalanceCaptionLbl)
            {
            }
            column(Line_No_Caption_Control1000000020; Line_No_Caption_Control1000000020Lbl)
            {
            }
            column(Integer_Number; Number)
            {
            }

            trigger OnAfterGetRecord()
            begin
                IF Number = 1 THEN BEGIN
                    AccLine1.FIND('-');
                    AccLine2.FIND('-');
                END ELSE BEGIN
                    IF Number <= LeftRaws THEN
                        AccLine1.NEXT;
                    IF Number <= RightRaws THEN
                        AccLine2.NEXT;
                END;
                //Get Left Side
                IF (Number <= LeftRaws) THEN BEGIN
                    //IF "Use Description 2" THEN
                    //   vDescription := AccLine1."Description 2"
                    //ELSE
                    vDescription := AccLine1.Description;
                    vRaw := AccLine1."Row No.";
                    LColAmount := AccSchMgt.CalcCell(AccLine1, TempColumn1, FALSE);
                    LColAmount2 := AccSchMgt.CalcCell(AccLine1, TempColumn2, FALSE);
                END ELSE BEGIN
                    vDescription := '';
                    vRaw := '';
                    LColAmount := 0;
                    LColAmount2 := 0;
                END;
                //Get Right Side
                IF (Number <= RightRaws) THEN BEGIN
                    //IF "Use Description 2" THEN
                    //   vDescription2 := AccLine2."Description 2"
                    //ELSE
                    vDescription2 := AccLine2.Description;
                    vRaw2 := AccLine2."Row No.";
                    RColAmount := AccSchMgt.CalcCell(AccLine2, TempColumn1, FALSE);
                    RColAmount2 := AccSchMgt.CalcCell(AccLine2, TempColumn2, FALSE);
                END ELSE BEGIN
                    vDescription2 := '';
                    vRaw2 := '';
                    RColAmount := 0;
                    RColAmount2 := 0;
                END;
            end;

            trigger OnPreDataItem()
            begin
                LocalizationPackageSetup.GET;
                IF NOT ChineseReportSetup.GET(LocalizationPackageSetup."Account Schedule Name-BS") THEN
                    ERROR(Text50000);
                IF NOT ColumnLayout.GET(LocalizationPackageSetup."Column Layout Name-BS") THEN
                    ERROR(Text6000);

                TempColumn1.SETRANGE("Column Layout Name", LocalizationPackageSetup."Column Layout Name-BS");
                TempColumn2.SETRANGE("Column Layout Name", LocalizationPackageSetup."Column Layout Name-BS");
                AccLine1.COPYFILTERS("Acc. Schedule Line");
                AccLine2.COPYFILTERS("Acc. Schedule Line");

                AccLine1.SETRANGE("Schedule Name", LocalizationPackageSetup."Account Schedule Name-BS");
                AccLine2.SETRANGE("Schedule Name", LocalizationPackageSetup."Account Schedule Name-BS");

                //#1-1 Begin
                //TempColumn1.SETRANGE("Column No.",'YEARTODATE');
                TempColumn1.SETRANGE("Column No.", 'YEARBEGIN');
                //#1-1 END
                IF NOT TempColumn1.FIND('-') THEN
                    ERROR(Text50012, 'YEARTODATE');

                //TempColumn2.SETRANGE("Column Layout Name",'CHSREPORT');
                //#1-2 Begin
                //TempColumn2.SETRANGE("Column No.",'LASTYEAR');
                TempColumn2.SETRANGE("Column No.", 'BALANCE');
                //#1-2 END
                IF NOT TempColumn2.FIND('-') THEN
                    ERROR(Text50012, 'BALANCE');

                //AccLine1.SETRANGE("Schedule Name",'CHS-ASSETS');
                AccLine1.SETRANGE(Show, AccLine1.Show::Yes);
                AccLine1.SETRANGE("Line No.", LocalizationPackageSetup."Left Starting Line-BS", LocalizationPackageSetup."Left Ending Line-BS");

                //AccLine2.SETRANGE("Schedule Name",'CHS-ASSETS');
                AccLine2.SETRANGE(Show, AccLine2.Show::Yes);
                AccLine2.SETRANGE("Line No.", LocalizationPackageSetup."Right Starting Line-BS", LocalizationPackageSetup."Right Ending Line-BS");

                LeftRaws := AccLine1.COUNT;
                RightRaws := AccLine2.COUNT;
                IF RightRaws > LeftRaws THEN
                    Integer.SETRANGE(Number, 1, RightRaws)
                ELSE
                    Integer.SETRANGE(Number, 1, LeftRaws);
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
                    field("Use Description 2"; "Use Description 2")
                    {
                        Caption = 'Use Description 2';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Use Description 2 field.';
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
        IF "Acc. Schedule Line".GETFILTER("Date Filter") = '' THEN
            ERROR(Text50010);
        DateFilterMax := "Acc. Schedule Line".GETRANGEMAX("Date Filter");
        companyinfo.GET
    end;

    var
        ChineseReportSetup: Record "Acc. Schedule Name";
        TempColumn1: Record "Column Layout";
        TempColumn2: Record "Column Layout";
        AccLine1: Record "Acc. Schedule Line";
        AccLine2: Record "Acc. Schedule Line";
        LColAmount: Decimal;
        LColAmount2: Decimal;
        RColAmount: Decimal;
        RColAmount2: Decimal;
        vDescription: Text[80];
        vDescription2: Text[80];
        vRaw: Code[10];
        vRaw2: Code[10];
        LeftRaws: Integer;
        RightRaws: Integer;
        AccSchMgt: Codeunit AccSchedManagement;
        DateFilterMax: Date;
        "Use Description 2": Boolean;
        Text50000: Label '请指定会计分析工具名称';
        Text50010: Label '请先定义日期过滤!';
        Text50012: Label '找不到CHSREPORT栏格式或 %1栏!';
        companyinfo: Record "Company Information";
        LocalizationPackageSetup: Record "Chinese Localization Setup";
        ColumnLayout: Record "Column Layout Name";
        Text6000: Label '请在本地化包设置中指定列名称';
        Company_Name_CaptionLbl: Label '编制单位:';
        Unit___YuanCaptionLbl: Label '货币单位：元';
        Balance_SheetCaptionLbl: Label '资产负债表';
        CurrReport_PAGENOCaptionLbl: Label '页';
        AssetCaptionLbl: Label '资             产';
        Beginning_BalanceCaptionLbl: Label '年初数';
        Closing_BalaceCaptionLbl: Label '期末数';
        Liability_And_EquityCaptionLbl: Label '  负 债 和 股 东 权 益';
        Line_No_CaptionLbl: Label '行次';
        Beginning_BalanceCaption_Control1000000018Lbl: Label '年初数';
        Closing_BalanceCaptionLbl: Label '期末数';
        Line_No_Caption_Control1000000020Lbl: Label '行次';
}

