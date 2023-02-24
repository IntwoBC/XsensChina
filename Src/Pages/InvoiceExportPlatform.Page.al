page 50004 "Invoice Export Platform"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Invoice Export Platform';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Worksheet;
    Permissions = TableData 112 = rm,
                  TableData 113 = rm;
    SourceTable = "Invoice Export Entry";
    SourceTableTemporary = true;
    SourceTableView = SORTING("Sorting Level", "Document Type", "Document No.", "Document Line No.", "Ref. Line No.")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            group(Control66)
            {
                grid(Contro61)
                {
                    GridLayout = Rows;
                    group(Control68)
                    {
                        field(CustNoFilter; CustNoFilter)
                        {
                            Caption = 'Customer No.';
                            TableRelation = Customer;
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Customer No. field.';
                        }
                        field(ExternalDocNoFilter; ExternalDocNoFilter)
                        {
                            Caption = 'External Document No.';
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the External Document No. field.';
                        }
                        field(HandledYN; HandledYN)
                        {
                            Caption = 'Handled Y/N';
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Handled Y/N field.';
                        }
                    }
                    group(Control70)
                    {
                        field(InvNoFilter; InvNoFilter)
                        {
                            Caption = 'Posted Invoice No.';
                            TableRelation = "Sales Invoice Header";
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Posted Invoice No. field.';
                        }
                        field(DateFilter; DateFilter)
                        {
                            Caption = 'Posting Period';
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Posting Period field.';
                            trigger OnValidate()
                            begin
                                IF CHSSetup.MakeDateFilter(DateFilter) = 0 THEN;
                                Cust.SETFILTER("Date Filter", DateFilter);
                                DateFilter := Cust.GETFILTER("Date Filter");
                            end;
                        }
                    }
                }
            }
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Handled No."; Rec."Handled No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Handled No. field.';
                }
                field("Handled by"; Rec."Handled by")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Handled by field.';
                }
                field("Handled Date"; Rec."Handled Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Handled Date field.';
                }
                field("Invoice Type"; Rec."Invoice Type")
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = SetStrong;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Type field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = SetStrong;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = SetStrong;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = SetStrong;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Line No. field.';
                }
                field("Ref. Line No."; Rec."Ref. Line No.")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ref. Line No. field.';
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Code; Rec.Code)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoiced Quantity field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Including VAT field.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.';
                }
                field("VAT %"; Rec."VAT %")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT % field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field(DescriptionCHN; Rec.DescriptionCHN)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DescriptionCHN field.';
                }
                field("Exported by"; Rec."Exported by")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exported by field.';
                }
                field("Exported Date"; Rec."Exported Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exported Date field.';
                }
                field("Exported Number"; Rec."Exported Number")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exported Number field.';
                }
                field("Credit Memo Applied"; Rec."Credit Memo Applied")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Credit Memo Applied field.';
                }
                field("Applied Amount"; Rec."Applied Amount")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Applied Amount field.';
                }
                field("Expansion Status"; Rec."Expansion Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expansion Status field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Registration No. field.';
                }
                field("VAT Address & Telephone"; Rec."VAT Address & Telephone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Address && Telephone field.';
                }
                field("Bank Name & Account"; Rec."Bank Name & Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Name & Account field.';
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remark field.';
                }
                field("Invoice User"; Rec."Invoice User")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice User field.';
                }
                field("Check User"; Rec."Check User")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Check User field.';
                }
                field(Receipt; Rec.Receipt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipt field.';
                }
                field("Bank Account"; Rec."Bank Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Account field.';
                }
                field("Address&Telephone"; Rec."Address&Telephone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address&&Telephone field.';
                }
                field("Invoice Mail Address"; Rec."Invoice Mail Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Mail Address field.';
                }
                field("Contact Information"; Rec."Contact Information")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact Information field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Handle)
            {
                Caption = 'Handle';
                action("Assign Handle No.")
                {
                    Caption = 'Assign Handle No.';
                    Image = ApplyEntries;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Assign Handle No. action.';
                    trigger OnAction()
                    var
                        lExportEntryTemp: Record "Invoice Export Entry" temporary;
                        lSalesInvHeader: Record "Sales Invoice Header";
                        lNoSeriesMgt: Codeunit NoSeriesManagement;
                        lHandleNo: Code[20];
                        lOldDocNo: Code[20];
                        lHandledEntryTemp: Record "Invoice Export Entry" temporary;
                        lExportEntryTemp2: Record "Invoice Export Entry" temporary;
                        lSumAmt: Decimal;
                    begin
                        IF NOT CONFIRM('Do you want to assign handle no. on the selected lines?', FALSE) THEN
                            EXIT;

                        CHSSetup.GET;
                        CHSSetup.TESTFIELD("Invoice Handle Nos.");

                        RecEntryNo := Rec."Entry No.";

                        CurrPage.SETSELECTIONFILTER(Rec);
                        //Rec.MARKEDONLY(TRUE);
                        IF Rec.FINDFIRST THEN
                            REPEAT
                                lExportEntryTemp.INIT;
                                lExportEntryTemp := Rec;
                                lExportEntryTemp.INSERT;

                                lExportEntryTemp2.INIT;
                                lExportEntryTemp2 := Rec;
                                lExportEntryTemp2.INSERT;
                            UNTIL Rec.NEXT = 0;

                        Rec.CLEARMARKS;
                        Rec.MARKEDONLY(FALSE);

                        lExportEntryTemp.SETRANGE("Line Type", lExportEntryTemp."Line Type"::Line);
                        lExportEntryTemp.SETRANGE("Handled No.", '');
                        IF NOT lExportEntryTemp.FINDFIRST THEN BEGIN
                            MESSAGE('There is nothing to handle!');
                            EXIT;
                        END;

                        CHSSetup.TESTFIELD("Max Amount of Export");
                        REPEAT
                            lHandledEntryTemp.SETRANGE("Document No.", lExportEntryTemp."Document No.");
                            IF NOT lHandledEntryTemp.FINDFIRST THEN BEGIN
                                lSumAmt := 0;

                                lHandledEntryTemp.INIT;
                                lHandledEntryTemp := lExportEntryTemp;
                                lHandledEntryTemp.INSERT;

                                lExportEntryTemp2.RESET;
                                lExportEntryTemp2.SETRANGE("Document No.", lExportEntryTemp."Document No.");
                                lExportEntryTemp2.SETRANGE("Line Type", lExportEntryTemp."Line Type"::Line);
                                lExportEntryTemp2.SETRANGE("Handled No.", '');
                                //lExportEntryTemp2.SETRANGE("Entry No.",lExportEntryTemp."Entry No.");
                                IF lExportEntryTemp2.FINDFIRST THEN
                                    REPEAT
                                        lSumAmt += lExportEntryTemp2."Amount Including VAT";
                                    UNTIL lExportEntryTemp2.NEXT = 0;

                                IF lSumAmt > CHSSetup."Max Amount of Export" THEN
                                    ERROR('Warning, Amount including VAT of %1 & %2 cannot exceed the Max Amount of Export (%3) on setup!',
                                      lExportEntryTemp."Document No.", lExportEntryTemp."Document Line No.", CHSSetup."Max Amount of Export");
                            END;
                        UNTIL lExportEntryTemp.NEXT = 0;

                        lExportEntryTemp.FINDFIRST;
                        REPEAT
                            lExportEntryTemp.TESTFIELD("Handled No.", '');

                            IF lOldDocNo <> lExportEntryTemp."Document No." THEN BEGIN
                                lHandleNo := '';
                                lNoSeriesMgt.InitSeries(CHSSetup."Invoice Handle Nos.", CHSSetup."Invoice Handle Nos.",
                                  WORKDATE, lHandleNo, CHSSetup."Invoice Handle Nos.");
                            END;

                            Rec.GET(lExportEntryTemp."Entry No.");
                            Rec.Handled := TRUE;
                            Rec."Handled No." := lHandleNo;
                            Rec."Handled by" := USERID;
                            Rec."Handled Date" := TODAY;
                            Rec."No. Series" := CHSSetup."Invoice Handle Nos.";

                            Rec.Remark := Rec."Document No." + '/' + Rec."Handled No." + '/' + Rec."External Document No.";

                            Rec.MODIFY;

                            InsertExportEntry(Rec);

                            lOldDocNo := lExportEntryTemp."Document No.";
                        UNTIL lExportEntryTemp.NEXT = 0;

                        lExportEntryTemp.FINDFIRST;
                        REPEAT
                            IF lSalesInvHeader.GET(lExportEntryTemp."Document No.") THEN
                                IF lSalesInvHeader."VAT Handled Completely" THEN BEGIN
                                    Rec.GET(lExportEntryTemp."Entry No.");
                                    //Rec."Sorting Level" := 20;
                                    Rec.Handled := TRUE;
                                    Rec.MODIFY;

                                    Rec.GET(lExportEntryTemp."Parent Entry No.");
                                    //Rec."Sorting Level" := 20;
                                    Rec.Handled := TRUE;
                                    Rec.MODIFY;
                                END;
                        UNTIL lExportEntryTemp.NEXT = 0;

                        Rec.GET(RecEntryNo);

                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Cancel Handle No.")
                {
                    Caption = 'Cancel Handle No.';
                    Image = UnApply;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Cancel Handle No. action.';
                    trigger OnAction()
                    var
                        lExportEntryTemp: Record "Invoice Export Entry" temporary;
                    begin
                        RecEntryNo := Rec."Entry No.";

                        IF NOT CONFIRM('Do you want to cancel handle on the selected lines?', FALSE) THEN
                            EXIT;

                        CurrPage.SETSELECTIONFILTER(Rec);
                        //Rec.MARKEDONLY(TRUE);
                        IF Rec.FINDFIRST THEN
                            REPEAT
                                lExportEntryTemp.INIT;
                                lExportEntryTemp := Rec;
                                lExportEntryTemp.INSERT;
                            UNTIL Rec.NEXT = 0;

                        Rec.CLEARMARKS;
                        Rec.MARKEDONLY(FALSE);

                        lExportEntryTemp.SETRANGE("Line Type", Rec."Line Type"::Line);
                        lExportEntryTemp.SETFILTER("Handled No.", '<>%1', '');
                        IF NOT lExportEntryTemp.FINDFIRST THEN BEGIN
                            MESSAGE('There is nothing to cancel!');
                            EXIT;
                        END;

                        REPEAT
                            IF lExportEntryTemp.Exported THEN BEGIN
                                IF NOT CONFIRM('Invoice %1 has already been exported, do you still want to cancel it?', FALSE, Rec."Document No.") THEN
                                    EXIT
                                ELSE BEGIN
                                    //UserSetup.GET(USERID);
                                    //IF NOT UserSetup."Cancel Exported Invoice" THEN
                                    //  ERROR('Error, you have no permission to cancel it!');
                                END;
                            END;

                            Rec.GET(lExportEntryTemp."Entry No.");
                            Rec.Handled := FALSE;
                            Rec."Handled No." := '';
                            Rec."Handled by" := '';
                            Rec."Handled Date" := 0D;
                            Rec.Exported := FALSE;
                            Rec."Exported by" := '';
                            Rec."Exported Date" := 0D;
                            Rec."Exported Number" := 0;
                            Rec."No. Series" := '';
                            Rec."Sorting Level" := 30;
                            Rec.Remark := '';
                            Rec.MODIFY;

                            DeleteExportEntry(Rec);

                            Rec.GET(lExportEntryTemp."Parent Entry No.");
                            Rec.Handled := FALSE;
                            Rec.Exported := FALSE;
                            Rec."Sorting Level" := 30;
                            Rec.MODIFY;

                        UNTIL lExportEntryTemp.NEXT = 0;

                        Rec.GET(RecEntryNo);

                        CurrPage.UPDATE(FALSE);
                    end;
                }
                separator(Separator1)
                {
                }
                action("Handled Entries")
                {
                    Caption = 'Handled Entries';
                    Image = Archive;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Handled Entries action.';
                    trigger OnAction()
                    var
                        lExportEntry: Record "Invoice Export Entry";
                    begin
                        lExportEntry.SETRANGE("Entry No.", Rec."Actual Entry No.");
                        PAGE.RUNMODAL(0, lExportEntry);
                    end;
                }
            }
            group(Functions)
            {
                Caption = 'Functions';
                action(Calculate)
                {
                    Caption = 'Calculate';
                    Image = CalculateDepreciation;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Calculate action.';
                    trigger OnAction()
                    begin
                        Rec.RESET;
                        Rec.DELETEALL;
                        Rec.SETCURRENTKEY("Sorting Level", "Document Type", "Document No.", "Document Line No.", "Ref. Line No.");

                        CalculateEntry;

                        ExportEntryTemp.RESET;
                        IF ExportEntryTemp.FINDFIRST THEN
                            REPEAT
                                Rec.INIT;
                                Rec := ExportEntryTemp;
                                Rec.INSERT;
                            UNTIL ExportEntryTemp.NEXT = 0;

                        IF Rec.FINDFIRST THEN;
                    end;
                }
                separator(Separator2)
                {
                }
                action("Split Line")
                {
                    Caption = 'Split Line';
                    Image = Splitlines;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Split Line action.';
                    trigger OnAction()
                    var
                        lSplitedNewLine: Record "Invoice Export Entry" temporary;
                        lOriginalEntry: Record "Invoice Export Entry" temporary;
                        lSplitLineForm: Page "Split Invoice Line";
                        lEntryNo: Integer;
                    begin
                        Rec.TESTFIELD("Line Type", Rec."Line Type"::Line);

                        lOriginalEntry := Rec;

                        lSplitLineForm.SetValue(Rec);
                        lSplitLineForm.RUNMODAL;
                        lSplitLineForm.ReturnNewLine(lSplitedNewLine);

                        //MESSAGE(FORMAT(lSplitedNewLine.COUNT));

                        //Check if there exist splited new line
                        IF lSplitedNewLine.COUNT <= 1 THEN
                            EXIT;

                        ExportEntryTemp.FINDLAST;
                        lEntryNo := ExportEntryTemp."Entry No.";

                        lSplitedNewLine.FINDFIRST;
                        REPEAT
                            lEntryNo += 1;

                            Rec.INIT;
                            Rec := lSplitedNewLine;
                            Rec."Entry No." := lEntryNo;
                            Rec.INSERT;

                            ExportEntryTemp.INIT;
                            ExportEntryTemp := Rec;
                            ExportEntryTemp.INSERT;
                        UNTIL lSplitedNewLine.NEXT = 0;

                        Rec.GET(lOriginalEntry."Entry No.");
                        Rec.DELETE;

                        ExportEntryTemp.GET(lOriginalEntry."Entry No.");
                        ExportEntryTemp.DELETE;

                        CurrPage.UPDATE(FALSE);
                    end;
                }
                separator(Separator3)
                {
                }
                action("Export to Excel")
                {
                    Caption = 'Export to Excel';
                    Image = ExportFile;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Export to Excel action.';
                    trigger OnAction()
                    var
                        lExportEntry: Record "Invoice Export Entry";
                        lExportEntry2: Record "Invoice Export Entry";
                        lExportEntryTemp: Record "Invoice Export Entry" temporary;
                        lSalesInvHeader: Record "Sales Invoice Header";
                        lSalesInvLine: Record "Sales Invoice Line";
                        ExportedCompletely: Boolean;
                    begin
                        RecEntryNo := Rec."Entry No.";

                        CurrPage.SETSELECTIONFILTER(Rec);
                        //Rec.MARKEDONLY(TRUE);

                        IF Rec.FINDFIRST THEN
                            REPEAT
                                lExportEntryTemp.INIT;
                                lExportEntryTemp := Rec;
                                lExportEntryTemp.INSERT;
                            UNTIL Rec.NEXT = 0;

                        Rec.CLEARMARKS;
                        Rec.MARKEDONLY(FALSE);

                        lExportEntryTemp.SETRANGE("Line Type", Rec."Line Type"::Line);
                        lExportEntryTemp.SETFILTER("Handled No.", '<>%1', '');
                        IF NOT lExportEntryTemp.FINDFIRST THEN BEGIN
                            MESSAGE('There is nothing to export!');
                            EXIT;
                        END;

                        //Export to excel - header
                        MakeExcelDataHeader;

                        REPEAT
                            //Export to excel - line
                            MakeExcelDataBody(lExportEntryTemp);

                            //Update Rec
                            Rec.GET(lExportEntryTemp."Entry No.");
                            Rec.Exported := TRUE;
                            Rec."Exported by" := USERID;
                            Rec."Exported Date" := TODAY;
                            Rec."Exported Number" += 1;
                            Rec."Sorting Level" := 10;
                            Rec.MODIFY;

                            //Update Header
                            IF Rec.GET(lExportEntryTemp."Parent Entry No.") THEN BEGIN
                                Rec.Exported := TRUE;
                                Rec."Sorting Level" := 10;
                                Rec.MODIFY;
                            END;

                            //Update actual record
                            IF lExportEntry.GET(lExportEntryTemp."Actual Entry No.") THEN BEGIN
                                lExportEntry.Exported := TRUE;
                                lExportEntry."Sorting Level" := 10;
                                lExportEntry."Exported by" := USERID;
                                lExportEntry."Exported Date" := TODAY;
                                lExportEntry."Exported Number" += 1;
                                lExportEntry.MODIFY;
                            END;

                            //update sales invoice header if all lines have been exported.
                            lSalesInvHeader.GET(lExportEntry."Document No.");
                            IF NOT lSalesInvHeader."VAT Exported Completely" THEN BEGIN
                                ExportedCompletely := TRUE;
                                lSalesInvLine.SETRANGE("Document No.", lExportEntry."Document No.");
                                lSalesInvLine.SETFILTER(Quantity, '>0');
                                IF lSalesInvLine.FINDFIRST THEN
                                    REPEAT
                                        IF lSalesInvLine.Quantity <> lSalesInvLine."Quantity Handled" THEN
                                            ExportedCompletely := FALSE
                                        ELSE BEGIN
                                            lExportEntry2.SETRANGE("Document No.", lSalesInvLine."Document No.");
                                            lExportEntry2.SETRANGE("Document Line No.", lSalesInvLine."Line No.");
                                            lExportEntry2.SETRANGE(Exported, FALSE);
                                            IF lExportEntry2.FINDFIRST THEN
                                                ExportedCompletely := FALSE;
                                        END;
                                    UNTIL lSalesInvLine.NEXT = 0;

                                IF ExportedCompletely = TRUE THEN BEGIN
                                    lSalesInvHeader."VAT Exported Completely" := TRUE;
                                    lSalesInvHeader.MODIFY;

                                    //lExportEntry."Sorting Level" := 10;
                                    //lExportEntry.MODIFY;
                                END;
                            END;
                        UNTIL lExportEntryTemp.NEXT = 0;

                        CreateExcelbook;

                        IF Rec.GET(RecEntryNo) THEN;

                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
        }
        area(navigation)
        {
            action("Posted Invoice Line")
            {
                Caption = 'Posted Invoice Line';
                Image = Invoice;
                ApplicationArea = All;
                ToolTip = 'Executes the Posted Invoice Line action.';
                trigger OnAction()
                var
                    lSalesInvLine: Record "Sales Invoice Line";
                begin
                    lSalesInvLine.SETRANGE("Document No.", Rec."Document No.");
                    lSalesInvLine.SETRANGE("Line No.", Rec."Document Line No.");
                    PAGE.RUNMODAL(PAGE::"Posted Sales Invoice Lines", lSalesInvLine);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetStrong := Rec."Line Type" = Rec."Line Type"::Header;
    end;

    var
        CHSSetup: Record "Chinese Localization Setup";
        UserSetup: Record "User Setup";
        ExportEntryTemp: Record "Invoice Export Entry" temporary;
        Cust: Record Customer;
        ExcelBuf: Record "Excel Buffer" temporary;
        CustNoFilter: Text[30];
        InvNoFilter: Text[30];
        ExternalDocNoFilter: Text[30];
        DateFilter: Text[30];
        HandledYN: Option All,Yes,No;
        ActualExpansionStatus: Option "Has Children",Expanded,"No Children";
        RecEntryNo: Integer;
        ClosedAmt: Decimal;
        TotalAmt: Decimal;
        CellType: Option Number,Text,Date,Time;
        [InDataSet]
        SetStrong: Boolean;

    //[Scope('Internal')]
    procedure CalculateEntry()
    var
        lCHSSetup: Record "Chinese Localization Setup";
        lSalesInvHeader: Record "Sales Invoice Header";
        lSalesInvLine: Record "Sales Invoice Line";
        lHandledEntry: Record "Invoice Export Entry";
        lExportEntry: Record "Invoice Export Entry";
        lItem: Record Item;
        lEntryNo: Integer;
        lParentEntryNo: Integer;
        lRefLineNo: Integer;
        lAmtHandled: Decimal;
        lAmtIncVATHandled: Decimal;
        lAmtLCYHandled: Decimal;
        lVATAmtHadled: Decimal;
        lWindow: Dialog;
        lRecNum: Integer;
        lRecCount: Integer;
        lText001: Label '@1@@@@@@@@@@@@@@';
        lCreditMemoApplied: Boolean;
    begin
        ExportEntryTemp.RESET;
        ExportEntryTemp.DELETEALL;

        IF CustNoFilter <> '' THEN
            lSalesInvHeader.SETFILTER("Sell-to Customer No.", CustNoFilter);
        IF InvNoFilter <> '' THEN
            lSalesInvHeader.SETFILTER("No.", InvNoFilter);
        IF ExternalDocNoFilter <> '' THEN
            lSalesInvHeader.SETFILTER("External Document No.", ExternalDocNoFilter);
        lSalesInvHeader.SETFILTER("Posting Date", DateFilter);
        IF NOT lSalesInvHeader.FINDFIRST THEN BEGIN
            MESSAGE('There is nothing to calculate!');
            EXIT;
        END;

        lWindow.OPEN(lText001);
        lRecCount := lSalesInvHeader.COUNT;

        REPEAT
            lRecNum += 1;
            lWindow.UPDATE(1, ROUND(lRecNum / lRecCount, 0.0001) * 10000);

            lSalesInvLine.SETRANGE("Document No.", lSalesInvHeader."No.");
            lSalesInvLine.SETFILTER(Quantity, '>0');
            IF HandledYN = HandledYN::Yes THEN
                lSalesInvLine.SETFILTER("Quantity Handled", '<>0');
            IF HandledYN = HandledYN::No THEN
                lSalesInvLine.SETRANGE("Quantity Handled", 0);
            IF lSalesInvLine.FINDFIRST THEN BEGIN
                lSalesInvHeader.CALCFIELDS(Amount, "Amount Including VAT");

                lEntryNo += 1;
                ExportEntryTemp.INIT;
                ExportEntryTemp."Entry No." := lEntryNo;
                ExportEntryTemp."Document Type" := ExportEntryTemp."Document Type"::Invoice;
                ExportEntryTemp."Document No." := lSalesInvHeader."No.";
                ExportEntryTemp."Document Line No." := 0;
                ExportEntryTemp."Ref. Line No." := 0;
                ExportEntryTemp."Posting Date" := lSalesInvHeader."Posting Date";
                ExportEntryTemp."External Document No." := lSalesInvHeader."External Document No.";
                ExportEntryTemp.Code := lSalesInvHeader."Bill-to Customer No.";
                ExportEntryTemp.Description := lSalesInvHeader."Bill-to Name";
                ExportEntryTemp."Customer No." := lSalesInvHeader."Bill-to Customer No.";

                IF NOT Cust.GET(ExportEntryTemp."Customer No.") THEN
                    Cust.INIT;

                /*
                ExportEntryTemp."Customer Name" := Cust."VAT Customer Name";
                ExportEntryTemp."VAT Registration No." := Cust."VAT Registration No.";
                ExportEntryTemp."VAT Address & Telephone" := Cust."VAT Address & Telephone";
                ExportEntryTemp."Bank Name & Account" := Cust."VAT Bank Name & Account";
                ExportEntryTemp."Invoice Mail Address" := Cust."VAT Invoice Mail Address";
                ExportEntryTemp."Contact Information" := Cust."VAT Contact Information";
                */
                ExportEntryTemp."Customer Name" := lSalesInvHeader."VAT Customer Name";
                ExportEntryTemp."VAT Registration No." := lSalesInvHeader."VAT Registration No.";
                ExportEntryTemp."VAT Address & Telephone" := lSalesInvHeader."VAT Address & Telephone";
                ExportEntryTemp."Bank Name & Account" := lSalesInvHeader."VAT Bank Name & Account";
                ExportEntryTemp."Invoice Mail Address" := lSalesInvHeader."VAT Invoice Mail Address";
                ExportEntryTemp."Contact Information" := lSalesInvHeader."VAT Contact Information";

                ExportEntryTemp."Line Amount" := lSalesInvHeader."Amount Including VAT";
                IF lSalesInvHeader."Currency Code" <> '' THEN
                    ExportEntryTemp."Amount (LCY)" := ROUND(lSalesInvHeader."Amount Including VAT" / lSalesInvHeader."Currency Factor", 0.01)
                ELSE
                    ExportEntryTemp."Amount (LCY)" := lSalesInvHeader."Amount Including VAT";
                ExportEntryTemp."VAT Amount" := lSalesInvHeader."Amount Including VAT" - lSalesInvHeader.Amount;
                ExportEntryTemp."Line Type" := ExportEntryTemp."Line Type"::Header;
                ExportEntryTemp."Expansion Status" := ExportEntryTemp."Expansion Status"::Expanded;
                //ExportEntryTemp."Invoice Type" := lSalesInvHeader."Invoice Type";
                IF lSalesInvHeader."VAT Handled Completely" THEN BEGIN
                    ExportEntryTemp."Sorting Level" := 20;
                    ExportEntryTemp.Handled := TRUE;
                END;
                IF lSalesInvHeader."VAT Exported Completely" THEN BEGIN
                    ExportEntryTemp."Sorting Level" := 10;
                    ExportEntryTemp.Exported := TRUE;
                END;

                //Check if there exist credit memo applied
                CheckCrMemoApplied(ExportEntryTemp);

                ExportEntryTemp.INSERT;

                lCreditMemoApplied := ExportEntryTemp."Credit Memo Applied";

                lParentEntryNo := lEntryNo;

                REPEAT
                    lRefLineNo := 0;
                    lAmtHandled := 0;
                    lAmtIncVATHandled := 0;
                    lAmtLCYHandled := 0;
                    lVATAmtHadled := 0;

                    //If there exist handled entry
                    IF lSalesInvLine."Quantity Handled" > 0 THEN BEGIN
                        lHandledEntry.SETRANGE("Document Type", lHandledEntry."Document Type"::Invoice);
                        lHandledEntry.SETRANGE("Document No.", lSalesInvLine."Document No.");
                        lHandledEntry.SETRANGE("Document Line No.", lSalesInvLine."Line No.");
                        IF lHandledEntry.FINDFIRST THEN
                            REPEAT
                                lEntryNo += 1;
                                lRefLineNo += 10000;
                                ExportEntryTemp.INIT;
                                ExportEntryTemp := lHandledEntry;
                                ExportEntryTemp."Entry No." := lEntryNo;
                                ExportEntryTemp."Actual Entry No." := lHandledEntry."Entry No.";
                                ExportEntryTemp.INSERT;

                                lAmtHandled += lHandledEntry.Amount;
                                lAmtIncVATHandled += lHandledEntry."Amount Including VAT";
                                lAmtLCYHandled += lHandledEntry."Amount (LCY)";
                                lVATAmtHadled += lHandledEntry."VAT Amount";
                            UNTIL lHandledEntry.NEXT = 0;
                    END;

                    //Quantity not handled
                    IF (lSalesInvLine.Quantity - lSalesInvLine."Quantity Handled") > 0 THEN BEGIN
                        lEntryNo += 1;
                        lRefLineNo += 10000;

                        ExportEntryTemp.INIT;
                        ExportEntryTemp."Entry No." := lEntryNo;
                        ExportEntryTemp."Document Type" := ExportEntryTemp."Document Type"::Invoice;
                        ExportEntryTemp."Document No." := lSalesInvLine."Document No.";
                        ExportEntryTemp."Document Line No." := lSalesInvLine."Line No.";
                        ExportEntryTemp."Ref. Line No." := lRefLineNo;
                        ExportEntryTemp."External Document No." := lSalesInvHeader."External Document No.";
                        ExportEntryTemp."Line Type" := ExportEntryTemp."Line Type"::Line;
                        ExportEntryTemp.Type := lSalesInvLine.Type;
                        ExportEntryTemp.Code := lSalesInvLine."No.";
                        ExportEntryTemp.Description := lSalesInvLine.Description;
                        ExportEntryTemp."Description 2" := lSalesInvLine."Description 2";
                        IF lItem.GET(ExportEntryTemp.Code) THEN
                            //ExportEntryTemp.DescriptionCHN := lItem.DescriptionCHN;
                            ExportEntryTemp.DescriptionCHN := lItem."Description 2";
                        ExportEntryTemp."Unit of Measure Code" := lSalesInvLine."Unit of Measure Code";
                        ExportEntryTemp."Unit of Measure" := lSalesInvLine."Unit of Measure";
                        ExportEntryTemp."Currency Code" := lSalesInvHeader."Currency Code";
                        ExportEntryTemp."Currency Factor" := lSalesInvHeader."Currency Factor";
                        ExportEntryTemp."Invoiced Quantity" := lSalesInvLine.Quantity - lSalesInvLine."Quantity Handled";
                        ExportEntryTemp."VAT %" := lSalesInvLine."VAT %";
                        ExportEntryTemp."Unit Price" := lSalesInvLine."Unit Price";
                        ExportEntryTemp."Line Amount" := lSalesInvLine."Line Amount" - lSalesInvLine."Amount Handled";
                        ExportEntryTemp.Amount := lSalesInvLine.Amount - lAmtHandled;
                        ExportEntryTemp."Amount Including VAT" := lSalesInvLine."Amount Including VAT" - lAmtIncVATHandled;
                        ExportEntryTemp."VAT Amount" := lSalesInvLine."Amount Including VAT" - lSalesInvLine.Amount - lVATAmtHadled;
                        IF ExportEntryTemp."Currency Factor" <> 0 THEN //not LCY
                            ExportEntryTemp."Amount (LCY)" := ROUND(ExportEntryTemp."Line Amount" / ExportEntryTemp."Currency Factor", 0.01)
                        ELSE  //LCY
                            ExportEntryTemp."Amount (LCY)" := ExportEntryTemp."Line Amount";
                        ExportEntryTemp."Posting Date" := lSalesInvHeader."Posting Date";
                        ExportEntryTemp."Expansion Status" := ExportEntryTemp."Expansion Status"::"No Children";
                        ExportEntryTemp."Parent Entry No." := lParentEntryNo;
                        ExportEntryTemp.Level := 1;

                        IF NOT Cust.GET(lSalesInvLine."Bill-to Customer No.") THEN
                            Cust.INIT;

                        ExportEntryTemp."Order No." := lSalesInvHeader."Order No.";
                        ExportEntryTemp."Customer No." := lSalesInvLine."Bill-to Customer No.";
                        ExportEntryTemp."VAT Registration No." := lSalesInvHeader."VAT Registration No.";

                        /*
                        ExportEntryTemp."Customer Name" := Cust."VAT Customer Name";
                        ExportEntryTemp."VAT Registration No." := Cust."VAT Registration No.";
                        ExportEntryTemp."VAT Address & Telephone" := Cust."VAT Address & Telephone";
                        ExportEntryTemp."Bank Name & Account" := Cust."VAT Bank Name & Account";
                        ExportEntryTemp."Invoice Mail Address" := Cust."VAT Invoice Mail Address";
                        ExportEntryTemp."Contact Information" := Cust."VAT Contact Information";
                        */
                        ExportEntryTemp."Customer Name" := lSalesInvHeader."VAT Customer Name";
                        ExportEntryTemp."VAT Registration No." := lSalesInvHeader."VAT Registration No.";
                        ExportEntryTemp."VAT Address & Telephone" := lSalesInvHeader."VAT Address & Telephone";
                        ExportEntryTemp."Bank Name & Account" := lSalesInvHeader."VAT Bank Name & Account";
                        ExportEntryTemp."Invoice Mail Address" := lSalesInvHeader."VAT Invoice Mail Address";
                        ExportEntryTemp."Contact Information" := lSalesInvHeader."VAT Contact Information";

                        ExportEntryTemp."Credit Memo Applied" := lCreditMemoApplied;

                        lCHSSetup.GET;
                        ExportEntryTemp."Invoice User" := lCHSSetup."Invoice User";
                        ExportEntryTemp."Check User" := lCHSSetup."Check User";
                        ExportEntryTemp.Receipt := lCHSSetup.Receipt;
                        ExportEntryTemp."Bank Account" := lCHSSetup."Bank Account";
                        ExportEntryTemp."Address&Telephone" := lCHSSetup."Address&Telephone";

                        ExportEntryTemp.INSERT;
                    END;
                UNTIL lSalesInvLine.NEXT = 0;
            END;
        UNTIL lSalesInvHeader.NEXT = 0;

        lWindow.CLOSE;

    end;

    //[Scope('Internal')]
    procedure CheckCrMemoApplied(var pInvoiceEntry: Record "Invoice Export Entry")
    var
        lCustLedgEntry: Record "Cust. Ledger Entry";
        lCustLedgEntry2: Record "Cust. Ledger Entry";
        DtldCustLedgEntry1: Record "Detailed Cust. Ledg. Entry";
        DtldCustLedgEntry2: Record "Detailed Cust. Ledg. Entry";
    begin
        Rec.GetCrMemoApplied(pInvoiceEntry, FALSE, ClosedAmt);

        IF ClosedAmt <> 0 THEN BEGIN
            pInvoiceEntry."Applied Amount" := ClosedAmt;
            pInvoiceEntry."Credit Memo Applied" := TRUE;
        END;
    end;

    [Scope('Internal')]
    procedure CalcSelectedTotalAmt()
    var
        lExportEntryTemp: Record "Invoice Export Entry" temporary;
        lExportEntryTemp2: Record "Invoice Export Entry" temporary;
    begin
        TotalAmt := 0;

        lExportEntryTemp2.COPYFILTERS(Rec);

        RecEntryNo := Rec."Entry No.";

        CurrPage.SETSELECTIONFILTER(Rec);
        Rec.MARKEDONLY(TRUE);
        IF Rec.FINDFIRST THEN
            REPEAT
                lExportEntryTemp.INIT;
                lExportEntryTemp := Rec;
                lExportEntryTemp.INSERT;
            UNTIL Rec.NEXT = 0;

        Rec.CLEARMARKS;
        Rec.MARKEDONLY(FALSE);

        lExportEntryTemp.SETRANGE("Line Type", lExportEntryTemp."Line Type"::Line);
        IF lExportEntryTemp.FINDFIRST THEN
            REPEAT
                TotalAmt += lExportEntryTemp."Amount Including VAT";
            UNTIL lExportEntryTemp.NEXT = 0;

        Rec.COPYFILTERS(lExportEntryTemp2);

        IF Rec.GET(RecEntryNo) THEN;
    end;

    //[Scope('Internal')]
    procedure InsertExportEntry(var pExportEntryTemp: Record "Invoice Export Entry" temporary)
    var
        lExportEntry: Record "Invoice Export Entry";
        lEntryNo: Integer;
    begin
        IF lExportEntry.FINDLAST THEN
            lEntryNo := lExportEntry."Entry No.";

        lEntryNo += 1;
        lExportEntry.INIT;
        lExportEntry := pExportEntryTemp;
        lExportEntry."Entry No." := lEntryNo;
        lExportEntry."Sorting Level" := 20;
        lExportEntry.Remark := lExportEntry."Order No." + '/' + lExportEntry."Document No." + '/' +
          lExportEntry."External Document No." + '/' + lExportEntry."Handled No.";
        lExportEntry.INSERT;

        pExportEntryTemp."Actual Entry No." := lEntryNo;
        pExportEntryTemp.Remark := lExportEntry.Remark;
        pExportEntryTemp.MODIFY;

        UpdateSalesInvLines(lExportEntry);
    end;

    //[Scope('Internal')]
    procedure DeleteExportEntry(pExportEntryTemp: Record "Invoice Export Entry" temporary)
    var
        lExportEntry: Record "Invoice Export Entry";
    begin
        IF lExportEntry.GET(pExportEntryTemp."Actual Entry No.") THEN BEGIN
            UpdateSalesInvLines2(lExportEntry);
            lExportEntry.DELETE;
        END;
    end;

    //[Scope('Internal')]
    procedure UpdateSalesInvLines(pExportEntry: Record "Invoice Export Entry")
    var
        lSalesInvHeader: Record "Sales Invoice Header";
        lSalesInvLine: Record "Sales Invoice Line";
        lExportCompletely: Boolean;
    begin
        //Add Handled

        lSalesInvLine.GET(pExportEntry."Document No.", pExportEntry."Document Line No.");
        lSalesInvLine."Quantity Handled" += pExportEntry."Invoiced Quantity";
        lSalesInvLine."Amount Handled" += pExportEntry."Line Amount";
        lSalesInvLine.MODIFY;

        lExportCompletely := TRUE;
        lSalesInvHeader.GET(lSalesInvLine."Document No.");
        lSalesInvLine.SETRANGE("Document No.", lSalesInvHeader."No.");
        lSalesInvLine.SETFILTER(Quantity, '>0');
        IF lSalesInvLine.FINDFIRST THEN
            REPEAT
                IF lSalesInvLine.Quantity > lSalesInvLine."Quantity Handled" THEN
                    lExportCompletely := FALSE;
            UNTIL lSalesInvLine.NEXT = 0;

        IF lExportCompletely THEN BEGIN
            lSalesInvHeader."VAT Handled Completely" := TRUE;
            lSalesInvHeader.MODIFY;
        END;
    end;

    //[Scope('Internal')]
    procedure UpdateSalesInvLines2(pExportEntry: Record "Invoice Export Entry")
    var
        lSalesInvHeader: Record "Sales Invoice Header";
        lSalesInvLine: Record "Sales Invoice Line";
    begin
        //Cancel Handled

        lSalesInvLine.GET(pExportEntry."Document No.", pExportEntry."Document Line No.");
        lSalesInvLine."Quantity Handled" -= pExportEntry."Invoiced Quantity";
        lSalesInvLine."Amount Handled" -= pExportEntry."Line Amount";

        IF lSalesInvLine."Quantity Handled" < 0 THEN
            lSalesInvLine."Quantity Handled" := 0;
        IF lSalesInvLine."Amount Handled" < 0 THEN
            lSalesInvLine."Amount Handled" := 0;

        lSalesInvLine.MODIFY;

        lSalesInvHeader.GET(lSalesInvLine."Document No.");
        lSalesInvHeader."VAT Exported Completely" := FALSE;
        lSalesInvHeader."VAT Handled Completely" := FALSE;
        lSalesInvHeader.MODIFY;
    end;

    local procedure MakeExcelDataHeader()
    begin
        ExcelBuf.RESET;
        ExcelBuf.DELETEALL;

        ExcelBuf.AddColumn('发票种类', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('单据号', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('单据日期', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('客户编号', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('客户名称', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('客户税号', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('客户地址电话', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('客户银行及帐号', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('备注', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('专?梅⑵焙炱蓖ㄖズ?', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('普通发票红票对应正数发票代码', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('普通发票红票对应正数发票号码', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('开票人', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('复核人', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('收款人', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('销方银行及帐号', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('销方地址电话', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('商品编号', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('商品名称', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('规格型号', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('计量单位', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('数量', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('金额（含税）', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('税率', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('税额', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('折扣金额(含税)', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('折扣税额', FALSE, '', TRUE, FALSE, FALSE, '', CellType::Text);
    end;

    local procedure MakeExcelDataBody(var pExportEntryTemp: Record "Invoice Export Entry" temporary)
    var
        lCust: Record Customer;
        lYear: Integer;
        lMonth: Integer;
        lDay: Integer;
        lDateText: Text[30];
        lText000: Label '''';
    begin
        ExcelBuf.NewRow;

        lYear := DATE2DMY(pExportEntryTemp."Handled Date", 3);
        lDateText := FORMAT(lYear) + '-';
        lMonth := DATE2DMY(pExportEntryTemp."Handled Date", 2);
        IF lMonth > 9 THEN
            lDateText := lDateText + FORMAT(lMonth) + '-'
        ELSE
            lDateText := lDateText + '0' + FORMAT(lMonth) + '-';
        lDay := DATE2DMY(pExportEntryTemp."Handled Date", 1);
        IF lDay > 9 THEN
            lDateText := lDateText + FORMAT(lDay)
        ELSE
            lDateText := lDateText + '0' + FORMAT(lDay);

        ExcelBuf.AddColumn(FORMAT(pExportEntryTemp."Invoice Type"), FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(pExportEntryTemp."Handled No.", FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(lDateText, FALSE, '', FALSE, FALSE, FALSE, '', CellType::Date);
        ExcelBuf.AddColumn(pExportEntryTemp."Customer No.", FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        IF lCust.GET(pExportEntryTemp."Customer No.") THEN
            //  ExcelBuf.AddColumn(lCust."Invoice Company Name",FALSE,'',FALSE,FALSE,FALSE,'')
            //ELSE
            ExcelBuf.AddColumn(pExportEntryTemp."Customer Name", FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(lText000 + FORMAT(pExportEntryTemp."VAT Registration No."), FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(pExportEntryTemp."VAT Address & Telephone", FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(pExportEntryTemp."Bank Name & Account", FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(pExportEntryTemp.Remark, FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(pExportEntryTemp."Invoice User", FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(pExportEntryTemp."Check User", FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(pExportEntryTemp.Receipt, FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(lText000 + pExportEntryTemp."Bank Account", FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(pExportEntryTemp."Address&Telephone", FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(lText000 + pExportEntryTemp.Code, FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(pExportEntryTemp.DescriptionCHN, FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(lText000 + pExportEntryTemp.Code, FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        //ExcelBuf.AddColumn(pExportEntryTemp."Unit of Measure",FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn('件', FALSE, '', FALSE, FALSE, FALSE, '', CellType::Text);
        ExcelBuf.AddColumn(FORMAT(pExportEntryTemp."Invoiced Quantity"), FALSE, '', FALSE, FALSE, FALSE, '', CellType::Number);
        ExcelBuf.AddColumn(FORMAT(pExportEntryTemp."Amount Including VAT"), FALSE, '', FALSE, FALSE, FALSE, '', CellType::Number);
        ExcelBuf.AddColumn(FORMAT(pExportEntryTemp."VAT %"), FALSE, '', FALSE, FALSE, FALSE, '', CellType::Number);
        ExcelBuf.AddColumn(FORMAT(pExportEntryTemp."VAT Amount"), FALSE, '', FALSE, FALSE, FALSE, '', CellType::Number);
        ExcelBuf.AddColumn(0, FALSE, '', FALSE, FALSE, FALSE, '', CellType::Number);
        ExcelBuf.AddColumn(0, FALSE, '', FALSE, FALSE, FALSE, '', CellType::Number);
    end;

    local procedure CreateExcelbook()
    begin
        ExcelBuf.CreateNewBook('Invoice');
        ExcelBuf.WriteSheet('Invoice', COMPANYNAME, USERID);
        ExcelBuf.CloseBook;
        ExcelBuf.OpenExcel;
        //ExcelBuf.UpdateBookStream;
    end;
}

