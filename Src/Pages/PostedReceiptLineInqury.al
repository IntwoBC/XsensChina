page 50018 "Posted Receipt Lines Inquiry"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Posted Receipt Lines Inquiry';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = 121;
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
                    Caption = 'Posted Receipt No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Receipt No. field.';
                    trigger OnValidate()
                    begin
                        //PageRecordFilter;
                    end;
                }
                field(CustomerFilter; CustomerFilter)
                {
                    Caption = 'Vendor No.';
                    TableRelation = Vendor."No.";
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
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
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Buy-from Vendor No. field.';
                }
                field("Buy-from Vendor Name"; VendName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VendName field.';
                }
                field("Purchaser Code"; PurchaserCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PurchaserCode field.';
                }
                field("Currency Code"; CurrencyCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CurrencyCode field.';
                }
                field("Your Reference"; YourReference)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the YourReference field.';
                }
                field("Vendor Order No."; VendOrderNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VendOrderNo field.';
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
                field("Amount (LCY)"; AmtLCY)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AmtLCY field.';
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
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected Receipt Date field.';
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
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
                field("Order No."; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field("Order Line No."; Rec."Order Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Line No. field.';
                }
                field("Purch.Order Qty."; PurchOrderQty)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PurchOrderQty field.';
                }
                field("Purch.Order Date"; PurchOrderDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PurchOrderDate field.';
                }
                field("Purch.Expected Recpt. Date"; PurchExpectedRecptDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PurchExpectedRecptDate field.';
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
                        IF Rec."Document Type" = Rec."Document Type"::Receipt THEN BEGIN
                            IF PurchRcptHeader.GET(Rec."Document No.") THEN
                                PAGE.RUN(PAGE::"Posted Purchase Receipt", PurchRcptHeader);
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Return Shipment" THEN BEGIN
                            IF ReturnShptHeader.GET(Rec."Document No.") THEN
                                PAGE.RUN(PAGE::"Posted Return Shipment", ReturnShptHeader);
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
                        IF Rec."Document Type" = Rec."Document Type"::Receipt THEN BEGIN
                            IF PurchRcptLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                PurchRcptLine.ShowDimensions;
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Return Shipment" THEN BEGIN
                            IF PurchRetRcptLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                PurchRetRcptLine.ShowDimensions;
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
                        IF Rec."Document Type" = Rec."Document Type"::Receipt THEN BEGIN
                            IF PurchRcptLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                PurchRcptLine.ShowItemTrackingLines;
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Return Shipment" THEN BEGIN
                            IF PurchRetRcptLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                PurchRetRcptLine.ShowItemTrackingLines;
                        END;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        lPurchLine: Record 39;
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        PurchaserCode := '';
        VendOrderNo := '';
        YourReference := '';
        CurrencyCode := '';
        AmtLCY := Rec."Direct Unit Cost" * Rec.Quantity;

        IF Rec."Document Type" = Rec."Document Type"::Receipt THEN BEGIN
            PurchRcptHeader2.GET(Rec."Document No.");

            VendName := PurchRcptHeader2."Buy-from Vendor Name";
            PurchaserCode := PurchRcptHeader2."Purchaser Code";
            VendOrderNo := PurchRcptHeader2."Vendor Order No.";
            YourReference := PurchRcptHeader2."Your Reference";
            CurrencyCode := PurchRcptHeader2."Currency Code";

            IF PurchRcptHeader2."Currency Code" <> '' THEN
                AmtLCY := ROUND(AmtLCY / PurchRcptHeader2."Currency Factor", 0.01);
        END;

        IF Rec."Document Type" = Rec."Document Type"::"Return Shipment" THEN BEGIN
            ReturnShptHeader2.GET(Rec."Document No.");

            VendName := ReturnShptHeader2."Buy-from Vendor Name";
            PurchaserCode := ReturnShptHeader2."Purchaser Code";
            //VendOrderNo := ReturnShptHeader2."Vendor Order No.";
            YourReference := ReturnShptHeader2."Your Reference";
            CurrencyCode := ReturnShptHeader2."Currency Code";

            IF ReturnShptHeader2."Currency Code" <> '' THEN
                AmtLCY := ROUND(AmtLCY / ReturnShptHeader2."Currency Factor", 0.01);
        END;

        //CH-20150509-01: Begin
        PurchOrderQty := 0;
        PurchOrderDate := 0D;
        PurchExpectedRecptDate := 0D;
        IF lPurchLine.GET(lPurchLine."Document Type"::Order, Rec."Order No.", Rec."Order Line No.") THEN BEGIN
            PurchOrderQty := lPurchLine.Quantity;
            PurchOrderDate := lPurchLine."Order Date";
            PurchExpectedRecptDate := lPurchLine."Expected Receipt Date";
        END;
        //CH-20150509-01: End
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
        PurchRcptLine: Record 121;
        PurchRetRcptLine: Record 6651;
        PurchRcptHeader: Record 120;
        ReturnShptHeader: Record 6650;
        VendName: Text[50];
        Purchaser: Record 13;
        PurchaserCode: Code[20];
        PurchaserName: Text[30];
        PurchaserFilter: Code[20];
        VendOrderNo: Code[20];
        YourReference: Text[30];
        CurrencyCode: Code[10];
        AmtLCY: Decimal;
        PurchRcptHeader2: Record 120;
        ReturnShptHeader2: Record 6650;
        PurchOrderQty: Decimal;
        PurchOrderDate: Date;
        PurchExpectedRecptDate: Date;

    //[Scope('Internal')]
    procedure PageRecordFilter()
    var
        lPurchRcptLine: Record 121;
        lPurchRetRcptLine: Record 6651;
    begin
        Rec.DELETEALL;
        Rec.RESET;
        // Shipement
        lPurchRcptLine.RESET;
        //lPurchRcptLine.SETRANGE(Type,Type::Item);
        lPurchRcptLine.SETFILTER(Quantity, '<>0');
        IF CustomerFilter <> '' THEN lPurchRcptLine.SETFILTER("Buy-from Vendor No.", CustomerFilter);
        IF SalesOrderFilter <> '' THEN lPurchRcptLine.SETFILTER("Document No.", SalesOrderFilter);
        IF ItemNoFilter <> '' THEN lPurchRcptLine.SETFILTER("No.", ItemNoFilter);
        IF OrderDateFilter <> '' THEN lPurchRcptLine.SETFILTER("Posting Date", OrderDateFilter);
        IF BinCodeFilter <> '' THEN lPurchRcptLine.SETFILTER("Bin Code", BinCodeFilter);
        IF lPurchRcptLine.FINDSET THEN
            REPEAT
                Rec.INIT;
                Rec.TRANSFERFIELDS(lPurchRcptLine);
                Rec."Document Type" := Rec."Document Type"::Receipt;
                Rec.INSERT;
            UNTIL lPurchRcptLine.NEXT = 0;

        // Posted Return Receipt
        lPurchRetRcptLine.RESET;
        //lPurchRetRcptLine.SETRANGE(Type,Type::Item);
        lPurchRetRcptLine.SETFILTER(Quantity, '<>0');
        IF CustomerFilter <> '' THEN lPurchRetRcptLine.SETFILTER("Buy-from Vendor No.", CustomerFilter);
        IF SalesOrderFilter <> '' THEN lPurchRetRcptLine.SETFILTER("Document No.", SalesOrderFilter);
        IF ItemNoFilter <> '' THEN lPurchRetRcptLine.SETFILTER("No.", ItemNoFilter);
        IF OrderDateFilter <> '' THEN lPurchRetRcptLine.SETFILTER("Posting Date", OrderDateFilter);
        IF BinCodeFilter <> '' THEN lPurchRetRcptLine.SETFILTER("Bin Code", BinCodeFilter);
        IF lPurchRetRcptLine.FINDSET THEN
            REPEAT
                Rec.INIT;
                Rec.TRANSFERFIELDS(lPurchRetRcptLine);
                Rec."Document Type" := Rec."Document Type"::"Return Shipment";
                Rec.INSERT;
            UNTIL lPurchRetRcptLine.NEXT = 0;

        CurrPage.UPDATE(FALSE);
    end;

    //[Scope('Internal')]
    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        DimMgt: Codeunit 408;
        lPurchRcptLine: Record 121;
        lPurchRetRcptLine: Record 6651;
    begin
        CLEAR(ShortcutDimCode);
        IF Rec."Document Type" = Rec."Document Type"::Receipt THEN BEGIN
            IF lPurchRcptLine.GET(Rec."Document No.", Rec."Line No.") THEN
                DimMgt.GetShortcutDimensions(lPurchRcptLine."Dimension Set ID", ShortcutDimCode);
        END;
        IF Rec."Document Type" = Rec."Document Type"::"Return Shipment" THEN BEGIN
            IF lPurchRetRcptLine.GET(Rec."Document No.", Rec."Line No.") THEN
                DimMgt.GetShortcutDimensions(lPurchRetRcptLine."Dimension Set ID", ShortcutDimCode);
        END;
    end;
}

