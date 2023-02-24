page 50013 "Sales Inquiry Line"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Sales Inquiry Line';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    ShowFilter = false;
    SourceTable = "Sales Line";
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
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document number.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the customer.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the record.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the item or service on the line.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the inventory location from which the items sold should be picked and where the inventory decrease is registered.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of the sales order line.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the item or resource''s unit of measure, such as piece or hour.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the price for one unit on the sales line.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currency code for the amount on this line.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the sum of amounts in the Line Amount field on the sales order lines.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Including VAT field.';
                }
                field("Quantity Shipped"; Rec."Quantity Shipped")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many units of the item on the line have been posted as shipped.';
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how many units of the item on the line have been posted as invoiced.';
                }
                field(InvoiceNo; InvoiceNo)
                {
                    Caption = 'InvoiceNo';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the InvoiceNo field.';
                    trigger OnDrillDown()
                    begin
                        SalesInvHdr.RESET;
                        SalesInvHdr.SETFILTER("No.", InvoiceNo);
                        IF NOT SalesInvHdr.ISEMPTY THEN
                            PAGE.RUNMODAL(143, SalesInvHdr);
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
                field(ShortcutDimCode3; ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[3] field.';
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

        SalesInvLine.RESET;
        SalesInvLine.SETCURRENTKEY("Sales Order No.", "Sales Order Line No.", "Posting Date");
        SalesInvLine.SETRANGE("Sales Order No.", Rec."Document No.");
        SalesInvLine.SETRANGE("Sales Order Line No.", Rec."Line No.");
        SalesInvLine.SETFILTER(Quantity, '<>%1', 0);
        IF SalesInvLine.FINDSET THEN BEGIN
            REPEAT
                InvoiceNo := InvoiceNo + '|' + SalesInvLine."Document No.";
                //InvoiceAmount +=SalesInvLine."Amount Including VAT";
                CustLedEntry.RESET;
                CustLedEntry.SETCURRENTKEY("Document No.");
                CustLedEntry.SETRANGE("Document No.", SalesInvLine."Document No.");
                CustLedEntry.SETRANGE("Document Type", CustLedEntry."Document Type"::Invoice);
                CustLedEntry.SETRANGE("Customer No.", SalesInvLine."Bill-to Customer No.");
                CustLedEntry.SETRANGE("Posting Date", SalesInvLine."Posting Date");
                CustLedEntry.SETRANGE("Date Filter", 0D, 99991231D);
                IF CustLedEntry.FINDSET THEN BEGIN
                    REPEAT
                        CustLedEntry.CALCFIELDS(CustLedEntry."Amount (LCY)", CustLedEntry."Remaining Amt. (LCY)");
                        InvoiceAmount += CustLedEntry."Amount (LCY)";
                        AmountPaid += CustLedEntry."Amount (LCY)" - CustLedEntry."Remaining Amt. (LCY)";
                    UNTIL CustLedEntry.NEXT = 0;
                END;
            UNTIL SalesInvLine.NEXT = 0;
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
        TmpRec: Record 37 temporary;
        CurrentSteps: Integer;
        SalesLine: Record 37;
        SalesInvLine: Record 113;
        CustLedEntry: Record 21;
        CurrDocNo: Code[20];
        SalesInvHdr: Record 112;
        ShortcutDimCode: array[8] of Code[20];

    //[Scope('Internal')]
    procedure FilterData(CustomerNoFilter: Code[20]; OrderDateFilter1: Date; OrderDateFilter2: Date; DeliveryDateFilter: Date; ItemCategoryFilter: Code[20]; ItemNoFilter: Code[20]; BUCodeFilter: Code[20]; SalespersonFilter: Code[20]; StatusFilter: Option Open,Released,Closed,All; CreateUserFilter: Code[40])
    var
        FromDateL: Date;
        ToDateL: Date;
        SalesHdrL: Record 36;
        ItemL: Record 27;
        ToInsert: Boolean;
        UserSetup: Record 91;
    begin
        IF OrderDateFilter2 = 0D THEN OrderDateFilter2 := 99991231D;
        UserSetup.GET(USERID);
        TmpRec.DELETEALL;
        SalesLine.RESET;
        SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
        //SalesLine.SETRANGE(Type,SalesLine.Type::Item);
        SalesLine.SETFILTER("No.", '<>%1', '');
        IF CustomerNoFilter <> '' THEN
            SalesLine.SETRANGE("Sell-to Customer No.", CustomerNoFilter);
        IF ItemNoFilter <> '' THEN
            SalesLine.SETFILTER("No.", ItemNoFilter);
        IF BUCodeFilter <> '' THEN
            SalesLine.SETRANGE("Shortcut Dimension 1 Code", BUCodeFilter);
        //IF UserSetup."Shortcut Dimension 1 Code"<>'' THEN BEGIN
        //  SETRANGE("Shortcut Dimension 1 Code",UserSetup."Shortcut Dimension 1 Code");
        //END;
        IF DeliveryDateFilter <> 0D THEN
            SalesLine.SETRANGE("Requested Delivery Date", DeliveryDateFilter);
        IF SalesLine.FINDSET THEN BEGIN
            REPEAT
                ToInsert := TRUE;
                IF (OrderDateFilter1 <> 0D) AND (OrderDateFilter2 <> 99991231D) THEN BEGIN
                    IF SalesHdrL.GET(SalesLine."Document Type", SalesLine."Document No.") THEN BEGIN
                        IF NOT (SalesHdrL."Order Date" IN [OrderDateFilter1 .. OrderDateFilter2]) THEN ToInsert := FALSE;
                    END;
                END;
                IF ToInsert AND (ItemCategoryFilter <> '') THEN BEGIN
                    IF ItemL.GET(SalesLine."No.") THEN BEGIN
                        IF ItemL."Item Category Code" <> ItemCategoryFilter THEN ToInsert := FALSE;
                    END;
                END;
                IF ToInsert AND (SalespersonFilter <> '') THEN BEGIN
                    IF SalesHdrL.GET(SalesLine."Document Type", SalesLine."Document No.") THEN BEGIN
                        IF SalesHdrL."Salesperson Code" <> SalespersonFilter THEN ToInsert := FALSE;
                    END;
                END;
                IF ToInsert AND (UserSetup."Sales Resp. Ctr. Filter" <> '') THEN BEGIN
                    IF SalesHdrL.GET(SalesLine."Document Type", SalesLine."Document No.") THEN BEGIN
                        IF SalesHdrL."Responsibility Center" <> UserSetup."Sales Resp. Ctr. Filter" THEN ToInsert := FALSE;
                    END;
                END;
                IF ToInsert AND (StatusFilter <> StatusFilter::All) THEN BEGIN
                    IF SalesHdrL.GET(SalesLine."Document Type", SalesLine."Document No.") THEN BEGIN
                        CASE StatusFilter OF
                            StatusFilter::Open:
                                BEGIN
                                    IF SalesHdrL.Status <> SalesHdrL.Status::Open THEN ToInsert := FALSE;
                                END;
                            StatusFilter::Released:
                                BEGIN
                                    IF SalesHdrL.Status <> SalesHdrL.Status::Released THEN ToInsert := FALSE;
                                END;
                            StatusFilter::Closed:
                                BEGIN
                                    IF SalesHdrL.Status <> SalesHdrL.Status::Closed THEN ToInsert := FALSE;
                                END;
                        END;
                    END;
                END;
                IF ToInsert THEN BEGIN
                    TmpRec.INIT;
                    TmpRec.TRANSFERFIELDS(SalesLine);
                    TmpRec.INSERT;
                END;
            UNTIL SalesLine.NEXT = 0;
        END;
    end;

    //[Scope('Internal')]
    procedure OpenSalesOrder()
    var
        SalesHdrL: Record 36;
        SalesLineL: Record 37;
    begin
        //CurrPage.SETSELECTIONFILTER(SalesLineL);
        SalesHdrL.RESET;
        SalesHdrL.SETRANGE("Document Type", SalesHdrL."Document Type"::Order);
        SalesHdrL.SETRANGE("No.", CurrDocNo);
        IF SalesHdrL.FINDSET THEN
            PAGE.RUNMODAL(42, SalesHdrL);
    end;
}