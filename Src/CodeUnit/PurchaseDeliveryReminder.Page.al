page 50021 "Purchase Delivery Reminder"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = 39;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(VendFilter; VendFilter)
                {
                    Caption = 'Vendor No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field(DateFilter; DateFilter)
                {
                    ApplicationArea = Planning;
                    Caption = 'Expected Receipt Date';
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
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    Caption = 'Vendor No.';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field(VendName1; VendName1)
                {
                    Caption = 'Vendor Name';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field(VendName2; VendName2)
                {
                    Caption = 'Vendor Name 2';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name 2 field.';
                }
                field(PurchaserName; PurchaserName)
                {
                    Caption = 'Purchaser';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purchaser field.';
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
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expected Receipt Date field.';
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
                action("Print Reminder by Vendor")
                {
                    Caption = 'Print Reminder by Vendor';
                    Image = PrintDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Print Reminder by Vendor action.';
                    trigger OnAction()
                    var
                        lReminder: Report 50019;
                    begin
                        CLEAR(lReminder);
                        lReminder.SetValue(Rec);
                        lReminder.RUN;
                    end;
                }
                separator(Control1)
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
                        lReminder: Report 50020;
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
        VendName1 := '';
        VendName2 := '';
        PurchaserName := '';

        IF PurchHeader.GET(Rec."Document Type", Rec."Document No.") THEN BEGIN
            VendName1 := PurchHeader."Buy-from Vendor Name";
            VendName2 := PurchHeader."Buy-from Vendor Name 2";
            PurchaserName := PurchHeader."Purchaser Code";
            IF (PurchaserName <> '') AND Purchaser.GET(PurchaserName) THEN
                PurchaserName += ' ' + Purchaser.Name;
        END;
    end;

    var
        Vendor: Record 23;
        PurchHeader: Record 38;
        Purchaser: Record 13;
        VendName1: Text;
        VendName2: Text;
        PurchaserName: Text;
        DelayDays: Code[10];
        VendFilter: Text[30];
        DateFilter: Text[30];
        DelayFormula: DateFormula;

    local procedure CalculateLine()
    var
        lPurchLine: Record 39;
        lEndDate: Date;
        lStartDate: Date;
        lWindow: Dialog;
        lRecNum: Integer;
        lRecCount: Integer;
    begin
        Rec.RESET;
        Rec.DELETEALL;

        lPurchLine.SETRANGE("Document Type", lPurchLine."Document Type"::Order);
        IF VendFilter <> '' THEN
            lPurchLine.SETFILTER("Buy-from Vendor No.", VendFilter);
        IF DateFilter <> '' THEN BEGIN
            Vendor.SETFILTER("Date Filter", DateFilter);
            lStartDate := Vendor.GETRANGEMIN("Date Filter");
        END ELSE
            lStartDate := 0D;

        IF FORMAT(DelayFormula) <> '' THEN
            lEndDate := CALCDATE('-' + FORMAT(DelayFormula), WORKDATE)
        ELSE
            lEndDate := WORKDATE;
        lEndDate := CALCDATE('-1D', lEndDate);

        lPurchLine.SETRANGE("Expected Receipt Date", lStartDate, lEndDate);
        lPurchLine.SETFILTER("Outstanding Quantity", '>0');
        IF NOT lPurchLine.FINDSET THEN BEGIN
            MESSAGE('There is nothing to calculate!');
            EXIT;
        END;

        lWindow.OPEN('@1@@@@@@@@@@@@@@@@');
        lRecCount := lPurchLine.COUNT;

        REPEAT
            lRecNum += 1;
            lWindow.UPDATE(1, ROUND(lRecNum / lRecCount, 0.0001) * 10000);

            Rec.INIT;
            Rec := lPurchLine;

            Rec."Unit of Measure" := FORMAT(WORKDATE - Rec."Expected Receipt Date") + 'D';

            Rec.INSERT;
        UNTIL lPurchLine.NEXT = 0;

        IF Rec.FIND('-') THEN;

        lWindow.CLOSE;
    end;
}

