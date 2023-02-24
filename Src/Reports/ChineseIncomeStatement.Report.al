report 50002 "Chinese Income Statement"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\ChineseIncomeStatement.rdlc';

    Caption = 'Chinese Income Statement';

    dataset
    {
        dataitem("Acc. Schedule Line"; "Acc. Schedule Line")
        {
            DataItemTableView = SORTING("Schedule Name", "Line No.")
                                ORDER(Ascending);
            RequestFilterFields = "Dimension 1 Filter", "Dimension 2 Filter", "Business Unit Filter";

            trigger OnPreDataItem()
            begin
                //#1-->
                "Acc. Schedule Line".SETFILTER("Acc. Schedule Line"."Date Filter", DateFilter);
                //#1<--
                IF "Acc. Schedule Line".GETFILTER("Date Filter") = '' THEN
                    ERROR(Text50010);
                DateFilterMax := "Acc. Schedule Line".GETRANGEMAX("Date Filter");
                //#3-->
                DateFilterMin := "Acc. Schedule Line".GETRANGEMIN("Date Filter");
                //#3<--
            end;
        }
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number)
                                ORDER(Ascending);
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(FORMAT_DateFilterMax_0___Year4___; FORMAT(DateFilterMax, 0, '<Year4>年'))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(CompanyInfo_Name_Control1117700005; CompanyInfo.Name)
            {
            }
            column(FORMAT_DateFilterMax_0___Year4___Month___; FORMAT(DateFilterMax, 0, '<Year4>年<Month>月'))
            {
            }
            column(CurrReport_PAGENO1; CurrReport.PAGENO)
            {
            }
            column(Period; Period)
            {
            }
            column(CompanyInfo_Name_Control1000000001; CompanyInfo.Name)
            {
            }
            column(FORMAT_DateFilterMin_0___Year4___Month___Day___; FORMAT(DateFilterMin, 0, '<Year4>年<Month>月<Day>日'))
            {
            }
            column(FORMAT_DateFilterMax_0___Year4___Month___Day___; FORMAT(DateFilterMax, 0, '<Year4>年<Month>月<Day>日'))
            {
            }
            column(CurrReport_PAGENO2; CurrReport.PAGENO)
            {
            }
            column(ColAmount2; ColAmount2)
            {
                DecimalPlaces = 2 : 2;
            }
            column(ColAmount; ColAmount)
            {
                DecimalPlaces = 2 : 2;
            }
            column(vRaw; vRaw)
            {
            }
            column(vDescription; vDescription)
            {
            }
            column(Income_StatementCaption; Income_StatementCaptionLbl)
            {
            }
            column(Company_Name_Caption; Company_Name_CaptionLbl)
            {
            }
            column(Unit______YuanCaption; Unit______YuanCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Income_StatementCaption_Control1117700000; Income_StatementCaption_Control1117700000Lbl)
            {
            }
            column(Company_Name_Caption_Control1117700004; Company_Name_Caption_Control1117700004Lbl)
            {
            }
            column(Unit______YuanCaption_Control1117700009; Unit______YuanCaption_Control1117700009Lbl)
            {
            }
            column(CurrReport_PAGENOCaption1; CurrReport_PAGENOCaption1Lbl)
            {
            }
            column(Company_Name_Caption_Control1000000000; Company_Name_Caption_Control1000000000Lbl)
            {
            }
            column(Income_StatementCaption_Control1000000002; Income_StatementCaption_Control1000000002Lbl)
            {
            }
            column(Unit______YuanCaption_Control1000000009; Unit______YuanCaption_Control1000000009Lbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption2; CurrReport_PAGENOCaption2Lbl)
            {
            }
            column(Line_No_Caption; Line_No_CaptionLbl)
            {
            }
            column(ItemCaption; ItemCaptionLbl)
            {
            }
            column(Month_To_DateCaption; Month_To_DateCaptionLbl)
            {
            }
            column(Year_To_DateCaption; Year_To_DateCaptionLbl)
            {
            }
            column(Integer_Number; Number)
            {
            }

            trigger OnAfterGetRecord()
            begin

                IF Number = 1 THEN BEGIN
                    AccLine1.FIND('-');
                END ELSE BEGIN
                    IF Number <= LeftRaws THEN
                        AccLine1.NEXT;
                END;

                IF (Number <= LeftRaws) AND (AccLine1.Show = AccLine1.Show::Yes) THEN BEGIN
                    //IF "Use Description 2" THEN
                    //   vDescription := AccLine1."Description 2"
                    //ELSE
                    vDescription := AccLine1.Description;
                    vRaw := AccLine1."Row No.";
                    CASE AccLine1."Row Type" OF
                        AccLine1."Row Type"::"Balance at Date":
                            TempColumn1.SETRANGE("Column No.", 'YEARTODATE');
                        AccLine1."Row Type"::"Beginning Balance":
                            TempColumn1.SETRANGE("Column No.", 'YEARBEGIN');
                        AccLine1."Row Type"::"Net Change":
                            TempColumn1.SETRANGE("Column No.", 'MONTHCHANG');
                    END;
                    IF TempColumn1.FIND('-') THEN;
                    ColAmount := AccSchMgt.CalcCell(AccLine1, TempColumn1, FALSE);
                    ColAmount2 := AccSchMgt.CalcCell(AccLine1, TempColumn2, FALSE);
                END;
            end;

            trigger OnPreDataItem()
            begin
                //>>#4 Tectura
                LocalizationPackageSetup.GET;
                IF NOT ChineseReportSetup.GET(LocalizationPackageSetup."Account Schedule Name-IS") THEN
                    ERROR(Text50000);
                IF NOT ColumnLayout.GET(LocalizationPackageSetup."Column Layout Name-IS") THEN
                    ERROR(Text6000);
                TempColumn1.SETRANGE("Column Layout Name", LocalizationPackageSetup."Column Layout Name-IS");
                TempColumn2.SETRANGE("Column Layout Name", LocalizationPackageSetup."Column Layout Name-IS");

                AccLine1.COPYFILTERS("Acc. Schedule Line");
                AccLine1.SETRANGE("Schedule Name", LocalizationPackageSetup."Account Schedule Name-IS");
                //<<# Tectura
                TempColumn1.SETRANGE("Column No.", 'monthchang');
                IF NOT TempColumn1.FIND('-') THEN
                    ERROR(Text50012, 'monthchang');
                TempColumn1.SETRANGE("Column No.", 'YEARBEGIN');
                IF NOT TempColumn1.FIND('-') THEN
                    ERROR(Text50012, 'YEARBEGIN');

                //TempColumn2.SETRANGE("Column Layout Name",'CHSREPORT');
                TempColumn2.SETRANGE("Column No.", 'yeartodate');
                IF NOT TempColumn2.FIND('-') THEN
                    ERROR(Text50012, 'yeartodate');

                //AccLine1.SETRANGE("Schedule Name",'CHS-PL');
                AccLine1.SETRANGE(Show, AccLine1.Show::Yes);
                //AccLine1.SETRANGE("Line No.",ChineseReportSetup."Left Starting Line",ChineseReportSetup."Left Ending Line");

                LeftRaws := AccLine1.COUNT;

                Integer.SETRANGE(Number, 1, LeftRaws);

                ColumnCap1 := Text50001;
                ColumnCap2 := Text50002;
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
                    field(Year; Period)
                    {
                        Caption = '期间类型';
                        OptionCaption = 'Year,Month,Day';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the 期间类型 field.';
                        trigger OnValidate()
                        begin
                            IF Period = Period::Day THEN
                                DayPeriodOnValidate;
                            IF Period = Period::Month THEN
                                MonthPeriodOnValidate;
                            IF Period = Period::Year THEN
                                YearPeriodOnValidate;
                        end;
                    }
                    field(RecYear; RecYear)
                    {
                        Caption = '年';
                        Enabled = RecYearEnable;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the 年 field.';
                        trigger OnValidate()
                        begin
                            //#1-->
                            StringYear := FORMAT(RecYear);

                            PreYear := COPYSTR(FORMAT((DATE2DMY(TODAY, 3))), 1, 3);
                            IF STRLEN(StringYear) > 4 THEN
                                ERROR(Text0002);

                            IF STRLEN(StringYear) = 1 THEN
                                StringYear := PreYear + StringYear;

                            EVALUATE(RecYear, StringYear);



                            IF Period = Period::Year THEN BEGIN
                                BeginDay := DMY2DATE(1, 1, RecYear);
                                EndDay := DMY2DATE(31, 12, RecYear);
                                "Acc. Schedule Line".SETFILTER("Acc. Schedule Line"."Date Filter", '%1..%2', BeginDay, EndDay);
                                DateFilter := "Acc. Schedule Line".GETFILTER("Acc. Schedule Line"."Date Filter");

                            END;

                            IF (Period = Period::Month) AND (RecMonth <> 0) THEN BEGIN
                                IF RecYear = 0 THEN
                                    ERROR(Text0001);

                                BeginDay := DMY2DATE(1, RecMonth, RecYear);
                                CASE RecMonth OF
                                    1:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    3:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    5:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    7:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    8:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    10:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    12:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    4:
                                        EndDay := DMY2DATE(30, RecMonth, RecYear);
                                    6:
                                        EndDay := DMY2DATE(30, RecMonth, RecYear);
                                    9:
                                        EndDay := DMY2DATE(30, RecMonth, RecYear);
                                    11:
                                        EndDay := DMY2DATE(30, RecMonth, RecYear);
                                END;

                                IF ((RecYear MOD 4) = 0) AND (RecMonth = 2) THEN
                                    EndDay := DMY2DATE(29, RecMonth, RecYear);

                                IF ((RecYear MOD 4) <> 0) AND (RecMonth = 2) THEN
                                    EndDay := DMY2DATE(28, RecMonth, RecYear);

                                "Acc. Schedule Line".SETFILTER("Acc. Schedule Line"."Date Filter", '%1..%2', BeginDay, EndDay);
                                DateFilter := "Acc. Schedule Line".GETFILTER("Acc. Schedule Line"."Date Filter");
                            END;
                            //#1<--
                        end;
                    }
                    field(RecMonth; RecMonth)
                    {
                        Caption = '月';
                        Enabled = RecMonthEnable;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the 月 field.';
                        trigger OnValidate()
                        begin
                            //#1-->
                            IF Period = Period::Month THEN BEGIN
                                IF RecYear = 0 THEN
                                    ERROR(Text0001);

                                BeginDay := DMY2DATE(1, RecMonth, RecYear);
                                CASE RecMonth OF
                                    1:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    3:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    5:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    7:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    8:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    10:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    12:
                                        EndDay := DMY2DATE(31, RecMonth, RecYear);
                                    4:
                                        EndDay := DMY2DATE(30, RecMonth, RecYear);
                                    6:
                                        EndDay := DMY2DATE(30, RecMonth, RecYear);
                                    9:
                                        EndDay := DMY2DATE(30, RecMonth, RecYear);
                                    11:
                                        EndDay := DMY2DATE(30, RecMonth, RecYear);
                                END;

                                IF ((RecYear MOD 4) = 0) AND (RecMonth = 2) THEN
                                    EndDay := DMY2DATE(29, RecMonth, RecYear);

                                IF ((RecYear MOD 4) <> 0) AND (RecMonth = 2) THEN
                                    EndDay := DMY2DATE(28, RecMonth, RecYear);

                                "Acc. Schedule Line".SETFILTER("Acc. Schedule Line"."Date Filter", '%1..%2', BeginDay, EndDay);
                                DateFilter := "Acc. Schedule Line".GETFILTER("Acc. Schedule Line"."Date Filter");
                            END;
                            //#1<--
                        end;
                    }
                    field(RecDay; DateFilter)
                    {
                        Caption = '日';
                        Enabled = RecDayEnable;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the 日 field.';
                        trigger OnValidate()
                        begin
                            //#1-->
                            IF LocalizationPackageSetup.MakeDateFilter(DateFilter) = 0 THEN;
                            "Acc. Schedule Line".SETFILTER("Acc. Schedule Line"."Date Filter", DateFilter);
                            //#1<--
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            RecDayEnable := TRUE;
            RecMonthEnable := TRUE;
            RecYearEnable := TRUE;
        end;

        trigger OnOpenPage()
        begin
            //#1-->
            Period := Period::Month;
            RecMonthEnable := FALSE;
            RecYearEnable := FALSE;
            RecDayEnable := FALSE;

            IF Period = Period::Year THEN BEGIN
                RecYearEnable := TRUE;
                RecMonthEnable := FALSE;
                RecDayEnable := FALSE;
            END;
            IF Period = Period::Month THEN BEGIN
                RecMonthEnable := TRUE;
                RecYearEnable := TRUE;
                RecDayEnable := FALSE;
            END;

            IF Period = Period::Day THEN BEGIN
                RecDayEnable := TRUE;
                RecMonthEnable := FALSE;
                RecYearEnable := FALSE;
            END;
            //#1<--
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInfo.GET
    end;

    var
        ChineseReportSetup: Record "Acc. Schedule Name";
        TempColumn1: Record "Column Layout";
        TempColumn2: Record "Column Layout";
        AccLine1: Record "Acc. Schedule Line";
        ColAmount: Decimal;
        ColAmount2: Decimal;
        vDescription: Text[80];
        vRaw: Code[10];
        LeftRaws: Integer;
        AccSchMgt: Codeunit AccSchedManagement;
        Text50000: Label '请在本地化包设置中指定会计分析工具名称';
        DateFilterMax: Date;
        Text50001: Label '本年累计';
        Text50002: Label '上年金额';
        Text50003: Label '月累计';
        Text50010: Label '请先定义日期过滤!';
        ColumnCap1: Text[30];
        ColumnCap2: Text[30];
        "Use Description 2": Boolean;
        Text50012: Label '找不到CHSREPORT栏格式或 %1栏!';
        CompanyInfo: Record "Company Information";
        "---Tectura---": Integer;
        BeginDay: Date;
        EndDay: Date;
        RecYear: Integer;
        RecMonth: Option " ","1","2","3","4","5","6","7","8","9","10","11","12";
        DateFilter: Text[80];
        Period: Option Year,Month,Day;
        Text0001: Label '请先输入年！';
        StringYear: Text[30];
        PreYear: Text[30];
        Text0002: Label '无效日期!';
        DateFilterMin: Date;
        LocalizationPackageSetup: Record "Chinese Localization Setup";
        ColumnLayout: Record "Column Layout Name";
        Text6000: Label '请在本地化包设置中指定列名称';
        [InDataSet]
        RecYearEnable: Boolean;
        [InDataSet]
        RecMonthEnable: Boolean;
        [InDataSet]
        RecDayEnable: Boolean;
        Text19014658: Label '日期过滤';
        Income_StatementCaptionLbl: Label '利润表';
        Company_Name_CaptionLbl: Label '编制单位:';
        Unit______YuanCaptionLbl: Label '单位： 元';
        CurrReport_PAGENOCaptionLbl: Label '页';
        Income_StatementCaption_Control1117700000Lbl: Label '利润及利润分配表';
        Company_Name_Caption_Control1117700004Lbl: Label '编制单位:';
        Unit______YuanCaption_Control1117700009Lbl: Label '单位： 元';
        CurrReport_PAGENOCaption1Lbl: Label '页';
        Company_Name_Caption_Control1000000000Lbl: Label '编制单位:';
        Income_StatementCaption_Control1000000002Lbl: Label '利润表';
        Unit______YuanCaption_Control1000000009Lbl: Label '单位： 元';
        EmptyStringCaptionLbl: Label '至';
        CurrReport_PAGENOCaption2Lbl: Label '页';
        Line_No_CaptionLbl: Label '行  次';
        ItemCaptionLbl: Label '项                      目';
        Month_To_DateCaptionLbl: Label '本  月';
        Year_To_DateCaptionLbl: Label '本年累计';

    local procedure YearPeriodOnValidate()
    begin
        //#1-->
        IF Period = Period::Year THEN BEGIN
            RecYearEnable := TRUE;
            RecMonthEnable := FALSE;
            RecDayEnable := FALSE;
        END;
        IF Period = Period::Month THEN BEGIN
            RecMonthEnable := TRUE;
            RecYearEnable := TRUE;
            RecDayEnable := FALSE;
        END;

        IF Period = Period::Day THEN BEGIN
            RecDayEnable := TRUE;
            RecMonthEnable := FALSE;
            RecYearEnable := FALSE;
        END;
        //#1<--
    end;

    local procedure MonthPeriodOnValidate()
    begin

        //#1-->
        IF Period = Period::Year THEN BEGIN
            RecYearEnable := TRUE;
            RecMonthEnable := FALSE;
            RecDayEnable := FALSE;
        END;
        IF Period = Period::Month THEN BEGIN
            RecMonthEnable := TRUE;
            RecYearEnable := TRUE;
            RecDayEnable := FALSE;
        END;

        IF Period = Period::Day THEN BEGIN
            RecDayEnable := TRUE;
            RecMonthEnable := FALSE;
            RecYearEnable := FALSE;
        END;
        //#1<--
    end;

    local procedure DayPeriodOnValidate()
    begin

        //#1-->
        IF Period = Period::Year THEN BEGIN
            RecYearEnable := TRUE;
            RecMonthEnable := FALSE;
            RecDayEnable := FALSE;
        END;
        IF Period = Period::Month THEN BEGIN
            RecMonthEnable := TRUE;
            RecYearEnable := TRUE;
            RecDayEnable := FALSE;
        END;

        IF Period = Period::Day THEN BEGIN
            RecYear := 0;
            RecMonth := 0;
            RecDayEnable := TRUE;
            RecMonthEnable := FALSE;
            RecYearEnable := FALSE;
        END;
        //#1<--
    end;
}

