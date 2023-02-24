page 50022 "Sales Delivery Reminder"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = 37;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(CustFilter; CustFilter)
                {
                    Caption = 'Customer No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field(DateFilter; DateFilter)
                {
                    ApplicationArea = Planning;
                    Caption = 'Shipment Date';
                    ToolTip = 'Specifies the dates that will be used to filter the amounts in the window.';

                    trigger OnValidate()
                    var
                        TextManagement: Codeunit 41;
                    begin
                        TextManagement.MakeDateFilter(DateFilter);
                    end;
                }
                field(WORKDATE; WORKDATE)
                {
                    Caption = 'Work Date';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work Date field.';
                }
                field(DelayFormula; DelayFormula)
                {
                    Caption = 'Delay Formula';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delay Formula field.';
                }
            }
            repeater(Group)
            {
                Editable = false;
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Caption = 'Customer No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field(CustName1; CustName1)
                {
                    Caption = 'Custome Name';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Custome Name field.';
                }
                field(CustName2; CustName2)
                {
                    Caption = 'Customer Name 2';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name 2 field.';
                }
                field(PurchaserName; PurchaserName)
                {
                    Caption = 'Sales Person';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Person field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outstanding Quantity field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shipment Date field.';
                }
                field(DelayDays; Rec."Unit of Measure")
                {
                    Caption = 'Delay Days';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delay Days field.';
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
                    Image = CalculateCalendar;
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
            group(Print)
            {
                Caption = 'Print';
                action("Print Reminder by Customer")
                {
                    Caption = 'Print Reminder by Customer';
                    Image = PrintDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Print Reminder by Customer action.';
                    trigger OnAction()
                    var
                        lReminder: Report 50021;
                    begin
                        CLEAR(lReminder);
                        lReminder.SetValue(Rec);
                        lReminder.RUN;
                    end;
                }
                separator(COntrol1)
                {
                }
                action("Print Reminder by Order")
                {
                    Caption = 'Print Reminder by Order';
                    Image = PrintDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Print Reminder by Order action.';
                    trigger OnAction()
                    var
                        lReminder: Report 50022;
                    begin
                        CLEAR(lReminder);
                        lReminder.SetValue(Rec);
                        lReminder.RUN;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CustName1 := '';
        CustName2 := '';
        PurchaserName := '';

        IF SalesHeader.GET(Rec."Document Type", Rec."Document No.") THEN BEGIN
            CustName1 := SalesHeader."Sell-to Customer Name";
            CustName2 := SalesHeader."Sell-to Customer Name 2";
            PurchaserName := SalesHeader."Salesperson Code";
            IF (PurchaserName <> '') AND Purchaser.GET(PurchaserName) THEN
                PurchaserName += ' ' + Purchaser.Name;
        END;
    end;

    var
        Cust: Record 18;
        SalesHeader: Record 36;
        Purchaser: Record 13;
        CustName1: Text;
        CustName2: Text;
        PurchaserName: Text;
        DelayDays: Code[10];
        CustFilter: Text[30];
        DateFilter: Text[30];
        DelayFormula: DateFormula;

    local procedure CalculateLine()
    var
        lSalesLine: Record 37;
        lEndDate: Date;
        lStartDate: Date;
        lWindow: Dialog;
        lRecNum: Integer;
        lRecCount: Integer;
    begin
        Rec.RESET;
        Rec.DELETEALL;

        lSalesLine.SETRANGE("Document Type", lSalesLine."Document Type"::Order);
        IF CustFilter <> '' THEN
            lSalesLine.SETFILTER("Sell-to Customer No.", CustFilter);
        IF DateFilter <> '' THEN BEGIN
            Cust.SETFILTER("Date Filter", DateFilter);
            lStartDate := Cust.GETRANGEMIN("Date Filter");
        END ELSE
            lStartDate := 0D;

        IF FORMAT(DelayFormula) <> '' THEN
            lEndDate := CALCDATE('-' + FORMAT(DelayFormula), WORKDATE)
        ELSE
            lEndDate := WORKDATE;
        lEndDate := CALCDATE('-1D', lEndDate);

        lSalesLine.SETRANGE("Shipment Date", lStartDate, lEndDate);
        lSalesLine.SETFILTER("Outstanding Quantity", '>0');

        IF NOT lSalesLine.FINDSET THEN BEGIN
            MESSAGE('There is nothing to calculate!');
            EXIT;
        END;

        lWindow.OPEN('@1@@@@@@@@@@@@@@@@');
        lRecCount := lSalesLine.COUNT;

        REPEAT
            lRecNum += 1;
            lWindow.UPDATE(1, ROUND(lRecNum / lRecCount, 0.0001) * 10000);

            Rec.INIT;
            Rec := lSalesLine;

            Rec."Unit of Measure" := FORMAT(WORKDATE - Rec."Shipment Date") + 'D';

            Rec.INSERT;
        UNTIL lSalesLine.NEXT = 0;

        IF Rec.FIND('-') THEN;

        lWindow.CLOSE;
    end;
}

