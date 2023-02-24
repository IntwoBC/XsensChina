page 50017 "Posted Shipment Lines Inquiry"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Posted Shipment Lines Inquiry';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = 111;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(SalesOrderFilter; SalesOrderFilter)
                {
                    Caption = 'Posted Shipment No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Shipment No. field.';
                    trigger OnValidate()
                    begin
                        //PageRecordFilter;
                    end;
                }
                field(CustomerFilter; CustomerFilter)
                {
                    Caption = 'Customer No.';
                    TableRelation = Customer."No.";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    trigger OnValidate()
                    begin
                        //PageRecordFilter;
                    end;
                }
                field(OrderDateFilter; OrderDateFilter)
                {
                    Caption = 'Posting Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                    trigger OnValidate()
                    var
                        lItem: Record 27;
                    begin
                        IF CHCLSetup.MakeDateFilter(OrderDateFilter) = 0 THEN;
                        lItem.SETFILTER("Date Filter", OrderDateFilter);
                        OrderDateFilter := lItem.GETFILTER("Date Filter");
                        //CurrPage.UPDATE;

                        //PageRecordFilter;
                    end;
                }
                field(ItemNoFilter; ItemNoFilter)
                {
                    Caption = 'Item No';
                    TableRelation = Item."No.";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No field.';
                    trigger OnValidate()
                    begin
                        //PageRecordFilter;
                    end;
                }
                field(BinCodeFilter; BinCodeFilter)
                {
                    Caption = 'Bin Code';
                    TableRelation = Bin.Code;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bin Code field.';
                    trigger OnValidate()
                    begin
                        //PageRecordFilter;
                    end;
                }
            }
            repeater(Control1)
            {
                Editable = false;
                field("Document Type"; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sell-to Customer No. field.';
                }
                field("Sell-to Customer Name"; CustName)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CustName field.';
                }
                field("External Document No."; ExternalDocNo)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ExternalDocNo field.';
                }
                field("Sales Order No."; OrderNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the OrderNo field.';
                }
                field("Currency Code"; CurrencyCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CurrencyCode field.';
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Variant Code field.';
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    Editable = false;
                    Visible = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Amount (LCY)"; AmtLCY)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AmtLCY field.';
                }
                field("Unit Cost"; UnitCost)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the UnitCost field.';
                }
                field("Cost Amount"; CostAmt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CostAmt field.';
                }
                field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appl.-to Item Entry field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shipment Date field.';
                }
                field("Requested Delivery Date"; RDD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the RDD field.';
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity Invoiced field.';
                }
                field(ShortcutDimCode3; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[3] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //LookupShortcutDimCode(3,ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        //ValidateShortcutDimCode(3,ShortcutDimCode[3]);
                    end;
                }
                field(ShortcutDimCode4; ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[4] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //LookupShortcutDimCode(4,ShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        //ValidateShortcutDimCode(4,ShortcutDimCode[4]);
                    end;
                }
                field(ShortcutDimCode5; ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[5] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //LookupShortcutDimCode(5,ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        //ValidateShortcutDimCode(5,ShortcutDimCode[5]);
                    end;
                }
                field(ShortcutDimCode6; ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[6] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //LookupShortcutDimCode(6,ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        //ValidateShortcutDimCode(6,ShortcutDimCode[6]);
                    end;
                }
                field(ShortcutDimCode7; ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[7] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //LookupShortcutDimCode(7,ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        //ValidateShortcutDimCode(7,ShortcutDimCode[7]);
                    end;
                }
                field(ShortcutDimCode8; ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[8] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //LookupShortcutDimCode(8,ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        //ValidateShortcutDimCode(8,ShortcutDimCode[8]);
                    end;
                }
            }
        }
        area(factboxes)
        {
            systempart(Links; Links)
            {
                Visible = false;
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Function)
            {
                Caption = 'Function';
                action("Find Record")
                {
                    Caption = 'Find Record';
                    Image = FilterLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Find Record action.';
                    trigger OnAction()
                    begin
                        PageRecordFilter;
                    end;
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Show Document")
                {
                    Caption = 'Show Document';
                    Image = View;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+F7';
                    ApplicationArea = All;
                    ToolTip = 'Executes the Show Document action.';
                    trigger OnAction()
                    begin
                        IF Rec."Document Type" = Rec."Document Type"::Shipment THEN BEGIN
                            IF SalesShptHeader.GET(Rec."Document No.") THEN
                                PAGE.RUN(PAGE::"Posted Sales Shipment", SalesShptHeader);
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Return Receipt" THEN BEGIN
                            IF ReturnRcptHeader.GET(Rec."Document No.") THEN
                                PAGE.RUN(PAGE::"Posted Return Receipt", ReturnRcptHeader);
                        END;
                    end;
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = All;
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        //ShowDimensions;
                        IF Rec."Document Type" = Rec."Document Type"::Shipment THEN BEGIN
                            IF SalesShipLin.GET(Rec."Document No.", Rec."Line No.") THEN
                                SalesShipLin.ShowDimensions;
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Return Receipt" THEN BEGIN
                            IF SalesRetShupLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                SalesRetShupLine.ShowDimensions;
                        END;
                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+I';
                    ApplicationArea = All;
                    ToolTip = 'Executes the Item &Tracking Lines action.';
                    trigger OnAction()
                    begin
                        //ShowItemTrackingLines;
                        IF Rec."Document Type" = Rec."Document Type"::Shipment THEN BEGIN
                            IF SalesShipLin.GET(Rec."Document No.", Rec."Line No.") THEN
                                SalesShipLin.ShowItemTrackingLines;
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Return Receipt" THEN BEGIN
                            IF SalesRetShupLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                SalesRetShupLine.ShowItemTrackingLines;
                        END;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCodeL(ShortcutDimCode);

        AmtLCY := Rec."Unit Price" * Rec.Quantity;
        CustName := '';
        ExternalDocNo := '';
        CurrencyCode := '';
        OrderNo := '';
        CostAmt := 0;
        UnitCost := 0;
        RDD := 0D;

        IF Rec."Document Type" = Rec."Document Type"::Shipment THEN BEGIN
            IF SalesShptHeader2.GET(Rec."Document No.") THEN BEGIN
                CustName := SalesShptHeader2."Sell-to Customer Name";
                ExternalDocNo := SalesShptHeader2."External Document No.";
                CurrencyCode := SalesShptHeader2."Currency Code";

                IF SalesShptHeader2."Currency Code" <> '' THEN
                    AmtLCY := ROUND(AmtLCY / SalesShptHeader2."Currency Factor", 0.01);

                IF SalesShptHeader2."Order No." <> '' THEN
                    OrderNo := SalesShptHeader2."Order No.";
            END;

            IF Rec.Type = Rec.Type::Item THEN BEGIN
                ValueEntry.SETRANGE("Document Type", ValueEntry."Document Type"::"Sales Shipment");
                ValueEntry.SETRANGE("Document No.", Rec."Document No.");
                ValueEntry.SETRANGE("Document Line No.", Rec."Line No.");
                IF ValueEntry.FINDFIRST THEN
                    REPEAT
                        CostAmt += ValueEntry."Cost Amount (Actual)";
                    UNTIL ValueEntry.NEXT = 0;

                CostAmt := -CostAmt;
                IF Rec.Quantity <> 0 THEN
                    UnitCost := ROUND(CostAmt / Rec.Quantity, 0.00001);
            END;

            IF SalesHeader.GET(SalesHeader."Document Type"::Order, OrderNo) THEN
                RDD := SalesHeader."Requested Delivery Date";
        END;

        IF Rec."Document Type" = Rec."Document Type"::"Return Receipt" THEN BEGIN
            IF ReturnRcptHeader2.GET(Rec."Document No.") THEN BEGIN
                CustName := ReturnRcptHeader2."Sell-to Customer Name";
                ExternalDocNo := ReturnRcptHeader2."External Document No.";
                CurrencyCode := ReturnRcptHeader2."Currency Code";

                IF ReturnRcptHeader2."Currency Code" <> '' THEN
                    AmtLCY := ROUND(AmtLCY / ReturnRcptHeader2."Currency Factor", 0.01);

                IF ReturnRcptHeader2."Return Order No." <> '' THEN
                    OrderNo := ReturnRcptHeader2."Return Order No.";
            END;

            IF Rec.Type = Rec.Type::Item THEN BEGIN
                ValueEntry.SETRANGE("Document Type", ValueEntry."Document Type"::"Sales Return Receipt");
                ValueEntry.SETRANGE("Document No.", Rec."Document No.");
                ValueEntry.SETRANGE("Document Line No.", Rec."Line No.");
                IF ValueEntry.FINDFIRST THEN
                    REPEAT
                        CostAmt += ValueEntry."Cost Amount (Actual)";
                    UNTIL ValueEntry.NEXT = 0;

                CostAmt := -CostAmt;
                IF Rec.Quantity <> 0 THEN
                    UnitCost := ROUND(CostAmt / Rec.Quantity, 0.00001);
            END;
        END;

        ShowEmployeeName;
    end;

    var
        CHCLSetup: Record 50000;
        SalesShptHeader: Record 110;
        CustomerFilter: Code[20];
        SalesOrderFilter: Code[20];
        ItemNoFilter: Code[20];
        OrderDateFilter: Text[250];
        LocationCodeFilter: Code[20];
        BinCodeFilter: Code[20];
        ShortcutDimCode: array[8] of Code[20];
        DocumentType: Option Shipment,"Return Shipment";
        SalesShipLin: Record 111;
        SalesRetShupLine: Record 6661;
        ReturnRcptHeader: Record 6660;
        AmtLCY: Decimal;
        CostAmt: Decimal;
        UnitCost: Decimal;
        OrderNo: Code[20];
        CustName: Text[50];
        ExternalDocNo: Text[50];
        CurrencyCode: Code[10];
        SalesShptHeader2: Record 110;
        ValueEntry: Record 5802;
        ReturnRcptHeader2: Record 6660;
        RDD: Date;
        SalesHeader: Record 36;
        EmployeeName: Text[30];

    // [Scope('Internal')]
    procedure PageRecordFilter()
    var
        lSalesShipLin: Record 111;
        lSalesRetShupLine: Record 6661;
    begin
        Rec.DELETEALL;
        Rec.RESET;
        // Shipement
        lSalesShipLin.RESET;
        //lSalesShipLin.SETRANGE(Type,Type::Item);
        lSalesShipLin.SETFILTER(Quantity, '<>0');
        IF CustomerFilter <> '' THEN lSalesShipLin.SETFILTER("Sell-to Customer No.", CustomerFilter);
        IF SalesOrderFilter <> '' THEN lSalesShipLin.SETFILTER("Document No.", SalesOrderFilter);
        IF ItemNoFilter <> '' THEN lSalesShipLin.SETFILTER("No.", ItemNoFilter);
        IF OrderDateFilter <> '' THEN lSalesShipLin.SETFILTER("Posting Date", OrderDateFilter);
        IF BinCodeFilter <> '' THEN lSalesShipLin.SETFILTER("Bin Code", BinCodeFilter);
        IF lSalesShipLin.FINDSET THEN
            REPEAT
                Rec.INIT;
                Rec.TRANSFERFIELDS(lSalesShipLin);
                Rec."Document Type" := Rec."Document Type"::Shipment;
                Rec.INSERT;
            UNTIL lSalesShipLin.NEXT = 0;

        // Posted Return Receipt
        lSalesRetShupLine.RESET;
        //lSalesRetShupLine.SETRANGE(Type,Type::Item);
        lSalesRetShupLine.SETFILTER(Quantity, '<>0');
        IF CustomerFilter <> '' THEN lSalesRetShupLine.SETFILTER("Sell-to Customer No.", CustomerFilter);
        IF SalesOrderFilter <> '' THEN lSalesRetShupLine.SETFILTER("Document No.", SalesOrderFilter);
        IF ItemNoFilter <> '' THEN lSalesRetShupLine.SETFILTER("No.", ItemNoFilter);
        IF OrderDateFilter <> '' THEN lSalesRetShupLine.SETFILTER("Posting Date", OrderDateFilter);
        IF BinCodeFilter <> '' THEN lSalesRetShupLine.SETFILTER("Bin Code", BinCodeFilter);
        IF lSalesRetShupLine.FINDSET THEN
            REPEAT
                Rec.INIT;
                Rec.TRANSFERFIELDS(lSalesRetShupLine);
                Rec."Document Type" := Rec."Document Type"::"Return Receipt";
                Rec.INSERT;
            UNTIL lSalesRetShupLine.NEXT = 0;

        CurrPage.UPDATE(FALSE);
    end;

    //[Scope('Internal')]
    procedure ShowShortcutDimCodeL(var ShortcutDimCode: array[8] of Code[20])
    var
        DimMgt: Codeunit 408;
        lSalesShipLin: Record 111;
        lSalesRetShupLine: Record 6661;
    begin
        CLEAR(ShortcutDimCode);
        IF Rec."Document Type" = Rec."Document Type"::Shipment THEN BEGIN
            IF lSalesShipLin.GET(Rec."Document No.", Rec."Line No.") THEN
                DimMgt.GetShortcutDimensions(lSalesShipLin."Dimension Set ID", ShortcutDimCode);
        END;
        IF Rec."Document Type" = Rec."Document Type"::"Return Receipt" THEN BEGIN
            IF lSalesRetShupLine.GET(Rec."Document No.", Rec."Line No.") THEN
                DimMgt.GetShortcutDimensions(lSalesRetShupLine."Dimension Set ID", ShortcutDimCode);
        END;
    end;

    // [Scope('Internal')]
    procedure ShowEmployeeName()
    var
        lGLSetup: Record 98;
        lDimValue: Record 349;
        lEmployeeDimCode: Code[20];
    begin
        EmployeeName := '';

        lGLSetup.GET;
        IF lGLSetup."Shortcut Dimension 8 Code" = '' THEN
            EXIT;

        lEmployeeDimCode := ShortcutDimCode[8];
        IF lEmployeeDimCode <> '' THEN
            IF lDimValue.GET(lGLSetup."Shortcut Dimension 8 Code", lEmployeeDimCode) THEN
                EmployeeName := lDimValue.Name;
    end;
}

