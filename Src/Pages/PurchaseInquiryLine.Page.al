page 50008 "Purchase Inquiry Line"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Purchase Inquiry Line';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    ShowFilter = false;
    SourceTable = "Purchase Line";
    SourceTableTemporary = false;
    SourceTableView = SORTING("Document Type", "Document No.", "Line No.")
                      WHERE("Document Type" = CONST(Order));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                FreezeColumn = "No.";
                IndentationControls = "Document No.";
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document number.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line''s number.';
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code of the currency of the amounts on the purchase line.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line type.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the blanket purchase order.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies information in addition to the description.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the location where the items on the line will be located.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of the purchase order line.';
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many units of the item on the line have been posted as received.';
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many units of the item on the line have been posted as invoiced.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the item or resource''s unit of measure, such as piece or hour.';
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date you expect the items to be available in your warehouse.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the price, in LCY, of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the sum of amounts in the Line Amount field on the purchase order lines.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the net amount, including VAT, for this line.';
                }
                field("Outstanding Amount (LCY)"; Rec."Outstanding Amount (LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount for the items on the order that have not yet been received in LCY.';
                }
                field(InvoiceNo; InvoiceNo)
                {
                    Caption = 'InvoiceNo';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the InvoiceNo field.';
                    trigger OnValidate()
                    begin
                        PurchInvHdr.RESET;
                        PurchInvHdr.SETFILTER("No.", InvoiceNo);
                        IF NOT PurchInvHdr.ISEMPTY THEN
                            PAGE.RUNMODAL(146, PurchInvHdr);
                    end;
                }
                field(InvoiceAmount; InvoiceAmount)
                {
                    Caption = 'InvoiceAmount';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the InvoiceAmount field.';
                }
                field(AmountPaid; AmountPaid)
                {
                    Caption = 'AmountPaid';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AmountPaid field.';
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many units on the order line have not yet been received.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was created.';
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date that you want the vendor to deliver to the ship-to address. The value in the field is used to calculate the latest date you can order the items to have them delivered on the requested receipt date. If you do not need delivery on a specific date, you can leave the field blank.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrDocNo := Rec."Document No.";
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);

        InvoiceNo := '';
        InvoiceAmount := 0;
        AmountPaid := 0;

        PurchInvLine.RESET;
        PurchInvLine.SETCURRENTKEY("Order No.", "Order Line No.", "Posting Date");
        PurchInvLine.SETRANGE("Order No.", Rec."Document No.");
        PurchInvLine.SETRANGE("Order Line No.", Rec."Line No.");
        PurchInvLine.SETFILTER(Quantity, '<>%1', 0);
        IF PurchInvLine.FINDSET THEN BEGIN
            REPEAT
                InvoiceNo := InvoiceNo + '|' + PurchInvLine."Document No.";
                //InvoiceAmount +=PurchInvLine."Amount Including VAT";
                VendorLedEntry.RESET;
                VendorLedEntry.SETCURRENTKEY("Document No.");
                VendorLedEntry.SETRANGE("Document No.", PurchInvLine."Document No.");
                VendorLedEntry.SETRANGE("Document Type", VendorLedEntry."Document Type"::Invoice);
                VendorLedEntry.SETRANGE("Vendor No.", PurchInvLine."Buy-from Vendor No.");
                VendorLedEntry.SETRANGE("Posting Date", PurchInvLine."Posting Date");
                VendorLedEntry.SETRANGE("Date Filter", 0D, 99991231D);
                IF VendorLedEntry.FINDSET THEN BEGIN
                    REPEAT
                        VendorLedEntry.CALCFIELDS(VendorLedEntry."Amount (LCY)", VendorLedEntry."Remaining Amt. (LCY)");
                        InvoiceAmount += -VendorLedEntry."Amount (LCY)";
                        AmountPaid += -VendorLedEntry."Amount (LCY)" + VendorLedEntry."Remaining Amt. (LCY)";
                    UNTIL VendorLedEntry.NEXT = 0;
                END;
            UNTIL PurchInvLine.NEXT = 0;
        END;
        InvoiceNo := DELCHR(InvoiceNo, '<>', '|');
    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        TmpRec.COPY(Rec);
        IF NOT TmpRec.FIND(Which) THEN
            EXIT(FALSE);
        Rec := TmpRec;
        EXIT(TRUE);
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        TmpRec.COPY(Rec);
        CurrentSteps := TmpRec.NEXT(Steps);
        IF CurrentSteps <> 0 THEN
            Rec := TmpRec;
        EXIT(CurrentSteps);
    end;

    var
        InvoiceNo: Text[50];
        InvoiceAmount: Decimal;
        AmountPaid: Decimal;
        TmpRec: Record "Purchase Line" temporary;
        CurrentSteps: Integer;
        PurchLine: Record "Purchase Line";
        PurchInvLine: Record "Purch. Inv. Line";
        VendorLedEntry: Record "Vendor Ledger Entry";
        CurrDocNo: Code[20];
        PurchInvHdr: Record "Purch. Inv. Header";
        ShortcutDimCode: array[8] of Code[20];

    //[Scope('Internal')]
    procedure FilterData(VendorNoFilter: Code[20]; OrderDateFilter1: Date; OrderDateFilter2: Date; ReceiptDateFilter: Date; ItemCategoryFilter: Code[20]; ItemNoFilter: Code[20]; BUCodeFilter: Code[20]; PurchaserFilter: Code[20]; StatusFilter: Option Open,Released,Closed,All; CreateUserFilter: Code[40]; pS_ProjectNo: Text[40]; PS_description: Text[100]; pS_OrderNo: Text[50])
    var
        FromDateL: Date;
        ToDateL: Date;
        PurchHdrL: Record "Purchase Header";
        ItemL: Record Item;
        ToInsert: Boolean;
    begin
        IF OrderDateFilter2 = 0D THEN OrderDateFilter2 := 99991231D;
        TmpRec.DELETEALL;
        PurchLine.RESET;
        PurchLine.SETRANGE("Document Type", PurchLine."Document Type"::Order);
        //PurchLine.SETRANGE(Type,PurchLine.Type::Item);
        PurchLine.SETFILTER(Type, '<>%1', PurchLine.Type::" ");
        IF VendorNoFilter <> '' THEN
            PurchLine.SETRANGE("Buy-from Vendor No.", VendorNoFilter);
        IF ItemNoFilter <> '' THEN
            PurchLine.SETFILTER("No.", ItemNoFilter);


        IF pS_OrderNo <> '' THEN
            PurchLine.SETFILTER("Document No.", pS_OrderNo);

        /*
        IF BUCodeFilter <> '' THEN
          PurchLine.SETRANGE("Shortcut Dimension 1 Code",BUCodeFilter);
        */

        //add by korla
        IF pS_ProjectNo <> '' THEN
            PurchLine.SETFILTER("Shortcut Dimension 2 Code", pS_ProjectNo);

        IF PS_description <> '' THEN
            PurchLine.SETFILTER(Description, PS_description);
        //--------------

        IF ReceiptDateFilter <> 0D THEN
            PurchLine.SETRANGE("Expected Receipt Date", ReceiptDateFilter);
        IF PurchLine.FINDSET THEN BEGIN
            REPEAT
                ToInsert := TRUE;
                IF (OrderDateFilter1 <> 0D) AND (OrderDateFilter2 <> 99991231D) THEN BEGIN
                    IF PurchHdrL.GET(PurchLine."Document Type", PurchLine."Document No.") THEN BEGIN
                        IF NOT (PurchHdrL."Order Date" IN [OrderDateFilter1 .. OrderDateFilter2]) THEN ToInsert := FALSE;
                    END;
                END;
                IF ToInsert AND (ItemCategoryFilter <> '') THEN BEGIN
                    IF ItemL.GET(PurchLine."No.") THEN BEGIN
                        IF ItemL."Item Category Code" <> ItemCategoryFilter THEN ToInsert := FALSE;
                    END;
                END;
                IF ToInsert AND (PurchaserFilter <> '') THEN BEGIN
                    IF PurchHdrL.GET(PurchLine."Document Type", PurchLine."Document No.") THEN BEGIN
                        IF PurchHdrL."Purchaser Code" <> PurchaserFilter THEN ToInsert := FALSE;
                    END;
                END;
                IF ToInsert AND (StatusFilter <> StatusFilter::All) THEN BEGIN
                    IF PurchHdrL.GET(PurchLine."Document Type", PurchLine."Document No.") THEN BEGIN
                        CASE StatusFilter OF
                            StatusFilter::Open:
                                BEGIN
                                    IF PurchHdrL.Status <> PurchHdrL.Status::Open THEN ToInsert := FALSE;
                                END;
                            StatusFilter::Released:
                                BEGIN
                                    IF PurchHdrL.Status <> PurchHdrL.Status::Released THEN ToInsert := FALSE;
                                END;
                        //StatusFilter::Closed : BEGIN
                        //  IF PurchHdrL.Status <> PurchHdrL.Status::Closed THEN ToInsert :=FALSE;
                        //END;
                        END;
                    END;
                END;
                IF ToInsert THEN BEGIN
                    TmpRec.INIT;
                    TmpRec.TRANSFERFIELDS(PurchLine);
                    TmpRec.INSERT;
                END;
            UNTIL PurchLine.NEXT = 0;
        END;

    end;

    //[Scope('Internal')]
    procedure OpenPurchOrder()
    var
        PurchHdrL: Record "Purchase Header";
    begin
        PurchHdrL.RESET;
        PurchHdrL.SETRANGE("Document Type", PurchHdrL."Document Type"::Order);
        PurchHdrL.SETRANGE("No.", CurrDocNo);
        IF PurchHdrL.FINDSET THEN
            PAGE.RUNMODAL(50, PurchHdrL);
    end;
}

