page 50019 "Sales Invoice Lines Inquiry"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Sales Invoice Lines Inquiry';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = 113;
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
                    Caption = 'Invoice No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice No. field.';
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
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
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
                field("Currency Code"; CurrencyCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CurrencyCode field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Cost (LCY) field.';
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
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Including VAT field.';
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
                field("Line Discount %"; Rec."Line Discount %")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Discount % field.';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Discount Amount field.';
                }
                field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allow Invoice Disc. field.';
                }
                field("Inv. Discount Amount"; Rec."Inv. Discount Amount")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv. Discount Amount field.';
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
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Category Code field.';
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
                        IF Rec."Document Type" = Rec."Document Type"::Invoice THEN BEGIN
                            IF SalesInvHeader.GET(Rec."Document No.") THEN
                                PAGE.RUN(PAGE::"Posted Sales Invoice", SalesInvHeader);
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Credit Memo" THEN BEGIN
                            IF SalesCrMemoHeader.GET(Rec."Document No.") THEN
                                PAGE.RUN(PAGE::"Posted Sales Credit Memo", SalesCrMemoHeader);
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
                        IF Rec."Document Type" = Rec."Document Type"::Invoice THEN BEGIN
                            IF SalesInvoiceLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                SalesInvoiceLine.ShowDimensions;
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Credit Memo" THEN BEGIN
                            IF SalesCrMemoLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                SalesCrMemoLine.ShowDimensions;
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
                        IF Rec."Document Type" = Rec."Document Type"::Invoice THEN BEGIN
                            IF SalesInvoiceLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                SalesInvoiceLine.ShowItemTrackingLines;
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Credit Memo" THEN BEGIN
                            IF SalesCrMemoLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                SalesCrMemoLine.ShowItemTrackingLines;
                        END;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        AmtLCY := Rec.Amount;
        CustName := '';
        ExternalDocNo := '';
        CurrencyCode := '';
        OrderNo := '';
        CostAmt := 0;
        UnitCost := 0;

        IF Rec."Document Type" = Rec."Document Type"::Invoice THEN BEGIN
            IF SalesInvHeader2.GET(Rec."Document No.") THEN BEGIN
                CustName := SalesInvHeader2."Sell-to Customer Name";
                ExternalDocNo := SalesInvHeader2."External Document No.";
                CurrencyCode := SalesInvHeader2."Currency Code";

                IF SalesInvHeader2."Currency Code" <> '' THEN
                    AmtLCY := ROUND(Rec.Amount / SalesInvHeader2."Currency Factor", 0.01);

                IF SalesInvHeader2."Order No." <> '' THEN
                    OrderNo := SalesInvHeader2."Order No.";
            END;

            IF OrderNo = '' THEN BEGIN
                SalesShptLine.SETRANGE("Document No.", Rec."Shipment No.");
                SalesShptLine.SETRANGE("Line No.", Rec."Shipment Line No.");
                IF SalesShptLine.FINDFIRST THEN
                    OrderNo := SalesShptLine."Order No.";
            END;

            IF Rec.Type = Rec.Type::Item THEN BEGIN
                ValueEntry.SETRANGE("Document Type", ValueEntry."Document Type"::"Sales Invoice");
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

        IF Rec."Document Type" = Rec."Document Type"::"Credit Memo" THEN BEGIN
            IF SalesCrMemoHeader2.GET(Rec."Document No.") THEN BEGIN
                CustName := SalesCrMemoHeader2."Sell-to Customer Name";
                ExternalDocNo := SalesCrMemoHeader2."External Document No.";
                CurrencyCode := SalesCrMemoHeader2."Currency Code";

                IF SalesCrMemoHeader2."Currency Code" <> '' THEN
                    AmtLCY := ROUND(Rec.Amount / SalesCrMemoHeader2."Currency Factor", 0.01);

                IF SalesCrMemoHeader2."Return Order No." <> '' THEN
                    OrderNo := SalesCrMemoHeader2."Return Order No.";
            END;

            IF OrderNo = '' THEN BEGIN
                ReturnRcptLine.SETRANGE("Document No.", Rec."Shipment No.");
                ReturnRcptLine.SETRANGE("Line No.", Rec."Shipment Line No.");
                IF ReturnRcptLine.FINDFIRST THEN
                    OrderNo := ReturnRcptLine."Return Order No.";
            END;

            IF Rec.Type = Rec.Type::Item THEN BEGIN
                ValueEntry.SETRANGE("Document Type", ValueEntry."Document Type"::"Sales Credit Memo");
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
        SalesInvoiceLine: Record 113;
        SalesCrMemoLine: Record 115;
        SalesInvHeader: Record 112;
        SalesCrMemoHeader: Record 114;
        AmtLCY: Decimal;
        CostAmt: Decimal;
        UnitCost: Decimal;
        OrderNo: Code[20];
        CustName: Text[50];
        ExternalDocNo: Text[50];
        CurrencyCode: Code[10];
        SalesInvHeader2: Record 112;
        ValueEntry: Record 5802;
        SalesShptLine: Record 111;
        SalesCrMemoHeader2: Record 114;
        ReturnRcptLine: Record 6661;
        EmployeeName: Text[30];

    //[Scope('Internal')]
    procedure PageRecordFilter()
    var
        lSalesInvoiceLine: Record 113;
        lSalesCrMemoLine: Record 115;
    begin
        Rec.DELETEALL;
        Rec.RESET;
        // Shipement
        lSalesInvoiceLine.RESET;
        //lSalesInvoiceLine.SETRANGE(Type,Type::Item);
        lSalesInvoiceLine.SETFILTER(Quantity, '<>0');
        IF CustomerFilter <> '' THEN lSalesInvoiceLine.SETFILTER("Sell-to Customer No.", CustomerFilter);
        IF SalesOrderFilter <> '' THEN lSalesInvoiceLine.SETFILTER("Document No.", SalesOrderFilter);
        IF ItemNoFilter <> '' THEN lSalesInvoiceLine.SETFILTER("No.", ItemNoFilter);
        IF OrderDateFilter <> '' THEN lSalesInvoiceLine.SETFILTER("Posting Date", OrderDateFilter);
        IF BinCodeFilter <> '' THEN lSalesInvoiceLine.SETFILTER("Bin Code", BinCodeFilter);
        IF lSalesInvoiceLine.FINDSET THEN
            REPEAT
                Rec.INIT;
                Rec.TRANSFERFIELDS(lSalesInvoiceLine);
                Rec."Document Type" := Rec."Document Type"::Invoice;
                Rec.INSERT;
            UNTIL lSalesInvoiceLine.NEXT = 0;

        // Posted Return Receipt
        lSalesCrMemoLine.RESET;
        //lSalesCrMemoLine.SETRANGE(Type,Type::Item);
        lSalesCrMemoLine.SETFILTER(Quantity, '<>0');
        IF CustomerFilter <> '' THEN lSalesCrMemoLine.SETFILTER("Sell-to Customer No.", CustomerFilter);
        IF SalesOrderFilter <> '' THEN lSalesCrMemoLine.SETFILTER("Document No.", SalesOrderFilter);
        IF ItemNoFilter <> '' THEN lSalesCrMemoLine.SETFILTER("No.", ItemNoFilter);
        IF OrderDateFilter <> '' THEN lSalesCrMemoLine.SETFILTER("Posting Date", OrderDateFilter);
        IF BinCodeFilter <> '' THEN lSalesCrMemoLine.SETFILTER("Bin Code", BinCodeFilter);
        IF lSalesCrMemoLine.FINDSET THEN
            REPEAT
                Rec.INIT;
                Rec.TRANSFERFIELDS(lSalesCrMemoLine);
                Rec."Document Type" := Rec."Document Type"::"Credit Memo";
                Rec.Quantity := -lSalesCrMemoLine.Quantity;
                Rec.Amount := -lSalesCrMemoLine.Amount;
                Rec."Amount Including VAT" := -lSalesCrMemoLine."Amount Including VAT";
                Rec.INSERT;
            UNTIL lSalesCrMemoLine.NEXT = 0;

        CurrPage.UPDATE(FALSE);
    end;

    //[Scope('Internal')]
    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        DimMgt: Codeunit 408;
        lSalesInvoiceLine: Record 113;
        lSalesCrMemoLine: Record 115;
    begin
        CLEAR(ShortcutDimCode);
        IF Rec."Document Type" = Rec."Document Type"::Invoice THEN BEGIN
            IF lSalesInvoiceLine.GET(Rec."Document No.", Rec."Line No.") THEN
                DimMgt.GetShortcutDimensions(lSalesInvoiceLine."Dimension Set ID", ShortcutDimCode);
        END;
        IF Rec."Document Type" = Rec."Document Type"::"Credit Memo" THEN BEGIN
            IF lSalesCrMemoLine.GET(Rec."Document No.", Rec."Line No.") THEN
                DimMgt.GetShortcutDimensions(lSalesCrMemoLine."Dimension Set ID", ShortcutDimCode);
        END;
    end;

    //[Scope('Internal')]
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

