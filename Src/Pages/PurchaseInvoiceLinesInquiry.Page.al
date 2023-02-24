page 50020 "Purchase Invoice Lines Inquiry"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Purchase Invoice Lines Inquiry';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = 123;
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
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = false;
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
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Direct Unit Cost field.';
                }
                field("Indirect Cost %"; Rec."Indirect Cost %")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Indirect Cost % field.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Cost (LCY) field.';
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price (LCY) field.';
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
                field("Amount (LCY)"; AmtLCY)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AmtLCY field.';
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
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Discount Amount field.';
                }
                field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allow Invoice Disc. field.';
                }
                field("Inv. Discount Amount"; Rec."Inv. Discount Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv. Discount Amount field.';
                }
                field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appl.-to Item Entry field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Insurance No."; Rec."Insurance No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Insurance No. field.';
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
                            IF PurchInvHeader.GET(Rec."Document No.") THEN
                                PAGE.RUN(PAGE::"Posted Purchase Invoice", PurchInvHeader);

                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Credit Memo" THEN BEGIN
                            IF PurchCrMemoHeader.GET(Rec."Document No.") THEN
                                PAGE.RUN(PAGE::"Posted Purchase Credit Memo", PurchCrMemoHeader);
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
                            IF PurchInvoiceLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                PurchInvoiceLine.ShowDimensions;
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Credit Memo" THEN BEGIN
                            IF PurchCrMemoLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                PurchCrMemoLine.ShowDimensions;
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
                            IF PurchInvoiceLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                PurchInvoiceLine.ShowItemTrackingLines;
                        END;
                        IF Rec."Document Type" = Rec."Document Type"::"Credit Memo" THEN BEGIN
                            IF PurchCrMemoLine.GET(Rec."Document No.", Rec."Line No.") THEN
                                PurchCrMemoLine.ShowItemTrackingLines;
                        END;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        PurchaserCode := '';
        VendOrderNo := '';
        YourReference := '';
        CurrencyCode := '';
        AmtLCY := Rec.Amount;

        IF Rec."Document Type" = Rec."Document Type"::Invoice THEN BEGIN
            PurchInvHeader2.GET(Rec."Document No.");

            VendName := PurchInvHeader2."Buy-from Vendor Name";
            PurchaserCode := PurchInvHeader2."Purchaser Code";
            VendOrderNo := PurchInvHeader2."Vendor Order No.";
            YourReference := PurchInvHeader2."Your Reference";
            CurrencyCode := PurchInvHeader2."Currency Code";

            IF PurchInvHeader2."Currency Code" <> '' THEN
                AmtLCY := ROUND(AmtLCY / PurchInvHeader2."Currency Factor", 0.01);
        END;

        IF Rec."Document Type" = Rec."Document Type"::"Credit Memo" THEN BEGIN
            PurchCrMemoHeader2.GET(Rec."Document No.");

            VendName := PurchCrMemoHeader2."Buy-from Vendor Name";
            PurchaserCode := PurchCrMemoHeader2."Purchaser Code";
            //VendOrderNo := PurchCrMemoHeader2."Vendor Order No.";
            YourReference := PurchCrMemoHeader2."Your Reference";
            CurrencyCode := PurchCrMemoHeader2."Currency Code";

            IF PurchCrMemoHeader2."Currency Code" <> '' THEN
                AmtLCY := ROUND(AmtLCY / PurchCrMemoHeader2."Currency Factor", 0.01);
        END;
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
        PurchInvoiceLine: Record 123;
        PurchCrMemoLine: Record 125;
        PurchInvHeader: Record 122;
        PurchCrMemoHeader: Record 124;
        VendName: Text[50];
        Purchaser: Record 13;
        PurchaserCode: Code[20];
        PurchaserName: Text[30];
        PurchaserFilter: Code[20];
        VendOrderNo: Code[20];
        YourReference: Text[30];
        CurrencyCode: Code[10];
        AmtLCY: Decimal;
        PurchInvHeader2: Record 122;
        PurchCrMemoHeader2: Record 124;

    //[Scope('Internal')]
    procedure PageRecordFilter()
    var
        lPurchInvoiceLine: Record 123;
        lPurchCrMemoLine: Record 125;
        lEmployee: Record 5200;
    begin
        Rec.DELETEALL;
        Rec.RESET;
        // Shipement
        lPurchInvoiceLine.RESET;
        //lPurchInvoiceLine.SETRANGE(Type,Type::Item);
        lPurchInvoiceLine.SETFILTER(Quantity, '<>0');
        IF CustomerFilter <> '' THEN lPurchInvoiceLine.SETFILTER("Buy-from Vendor No.", CustomerFilter);
        IF SalesOrderFilter <> '' THEN lPurchInvoiceLine.SETFILTER("Document No.", SalesOrderFilter);
        IF ItemNoFilter <> '' THEN lPurchInvoiceLine.SETFILTER("No.", ItemNoFilter);
        IF OrderDateFilter <> '' THEN lPurchInvoiceLine.SETFILTER("Posting Date", OrderDateFilter);
        IF BinCodeFilter <> '' THEN lPurchInvoiceLine.SETFILTER("Bin Code", BinCodeFilter);
        IF lPurchInvoiceLine.FINDSET THEN
            REPEAT
                Rec.INIT;
                Rec.TRANSFERFIELDS(lPurchInvoiceLine);
                Rec."Document Type" := Rec."Document Type"::Invoice;
                Rec.INSERT;
            UNTIL lPurchInvoiceLine.NEXT = 0;

        // Posted Return Receipt
        lPurchCrMemoLine.RESET;
        //lPurchCrMemoLine.SETRANGE(Type,Type::Item);
        lPurchCrMemoLine.SETFILTER(Quantity, '<>0');
        IF CustomerFilter <> '' THEN lPurchCrMemoLine.SETFILTER("Buy-from Vendor No.", CustomerFilter);
        IF SalesOrderFilter <> '' THEN lPurchCrMemoLine.SETFILTER("Document No.", SalesOrderFilter);
        IF ItemNoFilter <> '' THEN lPurchCrMemoLine.SETFILTER("No.", ItemNoFilter);
        IF OrderDateFilter <> '' THEN lPurchCrMemoLine.SETFILTER("Posting Date", OrderDateFilter);
        IF BinCodeFilter <> '' THEN lPurchCrMemoLine.SETFILTER("Bin Code", BinCodeFilter);
        IF lPurchCrMemoLine.FINDSET THEN
            REPEAT
                Rec.INIT;
                Rec.TRANSFERFIELDS(lPurchCrMemoLine);
                Rec."Document Type" := Rec."Document Type"::"Credit Memo";
                Rec.INSERT;
            UNTIL lPurchCrMemoLine.NEXT = 0;

        CurrPage.UPDATE(FALSE);
    end;

    //[Scope('Internal')]
    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    var
        DimMgt: Codeunit 408;
        lPurchInvoiceLine: Record 123;
        lPurchCrMemoLine: Record 125;
    begin
        CLEAR(ShortcutDimCode);
        IF Rec."Document Type" = Rec."Document Type"::Invoice THEN BEGIN
            IF lPurchInvoiceLine.GET(Rec."Document No.", Rec."Line No.") THEN
                DimMgt.GetShortcutDimensions(lPurchInvoiceLine."Dimension Set ID", ShortcutDimCode);
        END;
        IF Rec."Document Type" = Rec."Document Type"::"Credit Memo" THEN BEGIN
            IF lPurchCrMemoLine.GET(Rec."Document No.", Rec."Line No.") THEN
                DimMgt.GetShortcutDimensions(lPurchCrMemoLine."Dimension Set ID", ShortcutDimCode);
        END;
    end;
}

