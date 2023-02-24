page 50024 "PO Performance Platform"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = "Purchase Line";
    SourceTableTemporary = true;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(PONoFilter; PONoFilter)
                {
                    Caption = 'PO No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PO No. field.';
                }
                field(VendNoFilter; VendNoFilter)
                {
                    Caption = 'Vendor No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field(OrderDateFilter; OrderDateFilter)
                {
                    Caption = 'Order Date Filter';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Date Filter field.';
                    trigger OnValidate()
                    var
                        TextManagement: Codeunit "Filter Tokens";
                        lItem: Record Item;
                    begin
                        TextManagement.MakeDateFilter(OrderDateFilter);
                        lItem.SETFILTER("Date Filter", OrderDateFilter);
                        OrderDateFilter := lItem.GETFILTER("Date Filter");
                    end;
                }
            }
            repeater(Group)
            {
                Editable = false;
                field("Document No."; Rec."Document No.")
                {
                    Caption = 'PO No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document number.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the order was created.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line''s number.';
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field(VendName; VendName)
                {
                    Caption = 'Vendor Name';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
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
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the code for the location where the items on the line will be located.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of the purchase order line.';
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many units on the order line have not yet been received.';
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date you expect the items to be available in your warehouse.';
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    BlankZero = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many units of the item on the line have been posted as received.';
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    Caption = 'Receipt Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date that you want the vendor to deliver to the ship-to address. The value in the field is used to calculate the latest date you can order the items to have them delivered on the requested receipt date. If you do not need delivery on a specific date, you can leave the field blank.';
                }
                field("Return Qty. Shipped"; Rec."Return Qty. Shipped")
                {
                    BlankZero = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many units of the item on the line have been posted as shipped.';
                }
                field("Promised Receipt Date"; Rec."Promised Receipt Date")
                {
                    Caption = 'Return Shipment Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date that the vendor has promised to deliver the order.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action(Calculate)
                {
                    Caption = 'Calculate';
                    Image = CalculateShipment;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Calculate action.';
                    trigger OnAction()
                    begin
                        CalculateLine;

                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Vendor.GET(Rec."Buy-from Vendor No.") THEN
            VendName := Vendor.Name
        ELSE
            VendName := '';
    end;

    var
        Vendor: Record Vendor;
        PONoFilter: Text[50];
        VendNoFilter: Text[50];
        OrderDateFilter: Text[20];
        VendName: Text;

    local procedure CalculateLine()
    var
        lPurchHeader: Record "Purchase Header";
        lPurchLine: Record "Purchase Line";
        lText001: Label 'There is nothing to calcuate!';
        lPurchLineTemp: Record "Purchase Line" temporary;
        lPurchRcptLine: Record "Purch. Rcpt. Line";
        lReturnShptLine: Record "Return Shipment Line";
        lReturnShptLineTemp: Record "Return Shipment Line" temporary;
        lWindow: Dialog;
        lRecNum: Integer;
        lRecCount: Integer;
        lReturnDate: Date;
        lReturnQty: Decimal;
        PurchReceiptHeaderL: Record "Purch. Rcpt. Header";
    begin
        Rec.RESET;
        Rec.DELETEALL;

        lPurchHeader.SETRANGE("Document Type", lPurchHeader."Document Type"::Order);

        IF PONoFilter <> '' THEN
            lPurchHeader.SETFILTER("No.", PONoFilter);
        IF VendNoFilter <> '' THEN
            lPurchHeader.SETFILTER("Buy-from Vendor No.", VendNoFilter);
        IF OrderDateFilter <> '' THEN
            lPurchHeader.SETFILTER("Order Date", OrderDateFilter);

        IF NOT lPurchHeader.FINDSET THEN BEGIN
            MESSAGE(lText001);
            EXIT;
        END;

        lWindow.OPEN('@1@@@@@@@@@@@@@@@@@@@@');
        lRecCount := lPurchHeader.COUNT;

        REPEAT
            lRecNum += 1;
            lWindow.UPDATE(1, ROUND(lRecNum / lRecCount, 0.0001) * 10000);

            lPurchLine.SETRANGE("Document Type", lPurchHeader."Document Type");
            lPurchLine.SETRANGE("Document No.", lPurchHeader."No.");
            lPurchLine.SETFILTER(Quantity, '<>0');
            IF lPurchLine.FINDSET THEN
                REPEAT
                    lPurchLineTemp.INIT;
                    lPurchLineTemp := lPurchLine;
                    lPurchLineTemp.INSERT;
                    //Based on client feedback commiting below lines and mapping order date from purchase header
                    /*
                    lPurchRcptLine.SETRANGE("Order No.",lPurchLine."Document No.");
                    lPurchRcptLine.SETRANGE("Order Line No.",lPurchLine."Line No.");
                    lPurchRcptLine.SETFILTER(Quantity,'<>0');
                    IF lPurchRcptLine.FINDFIRST THEN BEGIN
                      lPurchLineTemp."Order Date" := lPurchRcptLine."Posting Date";
                    */
                    //LT27072022>>
                    PurchReceiptHeaderL.SETRANGE("Order No.", lPurchHeader."No.");
                    IF PurchReceiptHeaderL.FINDFIRST THEN
                        lPurchLineTemp."Requested Receipt Date" := PurchReceiptHeaderL."Posting Date";
                    //LT27072022<<
                    lPurchLineTemp."Order Date" := lPurchHeader."Order Date";
                    lPurchLineTemp.MODIFY;
                    //END;

                    lReturnDate := 0D;
                    lReturnQty := 0;
                    lReturnShptLine.SETRANGE("Buy-from Vendor No.", lPurchLine."Buy-from Vendor No.");
                    lReturnShptLine.SETFILTER("Posting Date", '>=%1', lPurchLineTemp."Order Date");
                    lReturnShptLine.SETRANGE(Type, lPurchLine.Type);
                    lReturnShptLine.SETRANGE("No.", lPurchLine."No.");
                    lReturnShptLine.SETFILTER(Quantity, '<>0');
                    IF lReturnShptLine.FINDSET THEN BEGIN
                        IF NOT lReturnShptLineTemp.GET(lReturnShptLine."Document No.", lReturnShptLine."Line No.") THEN
                            lReturnDate := lReturnShptLine."Posting Date";

                        REPEAT
                            IF NOT lReturnShptLineTemp.GET(lReturnShptLine."Document No.", lReturnShptLine."Line No.") THEN BEGIN
                                IF lReturnDate = 0D THEN
                                    lReturnDate := lReturnShptLine."Posting Date";

                                lReturnQty += lReturnShptLine.Quantity;

                                lReturnShptLineTemp.INIT;
                                lReturnShptLineTemp := lReturnShptLine;
                                lReturnShptLineTemp.INSERT;
                            END;
                        UNTIL lReturnShptLine.NEXT = 0;

                        IF lReturnQty <> 0 THEN BEGIN
                            lPurchLineTemp."Return Qty. Shipped" := lReturnQty;
                            lPurchLineTemp."Promised Receipt Date" := lReturnDate;
                            lPurchLineTemp.MODIFY;
                        END;
                    END;
                UNTIL lPurchLine.NEXT = 0;
        UNTIL lPurchHeader.NEXT = 0;

        lWindow.CLOSE;

        IF NOT lPurchLineTemp.FINDSET THEN BEGIN
            MESSAGE(lText001);
            EXIT;
        END;

        REPEAT
            Rec.INIT;
            Rec := lPurchLineTemp;
            Rec.INSERT;
        UNTIL lPurchLineTemp.NEXT = 0;

        IF Rec.FIND('-') THEN;

    end;
}

