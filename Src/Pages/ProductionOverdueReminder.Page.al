page 50023 "Production Overdue Reminder"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = "Prod. Order Line";
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(DateFilter; DateFilter)
                {
                    ApplicationArea = Planning;
                    Caption = 'Due Date';
                    ToolTip = 'Specifies the dates that will be used to filter the amounts in the window.';

                    trigger OnValidate()
                    var
                        TextManagement: Codeunit "Filter Tokens";
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
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the related production order.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the item that is to be produced.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field on the item card. If you enter a variant code, the variant description is copied to this field instead.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies an additional description.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity to be produced if you manually fill in this line.';
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the difference between the finished and planned quantities, or zero if the finished quantity is greater than the remaining quantity.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies how each unit of the item is measured, such as in pieces or tons. By default, the value in the Base Unit of Measure field on the item card is inserted. It will be changed if you switch Product BOM or Production BOM Version.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the produced item must be available. The date is copied from the header of the production order.';
                }
                field(DelayDays; Rec."Routing Version Code")
                {
                    Caption = 'Delay Days';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the version number of the routing.';
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
                action("Print Reminder by Item")
                {
                    Caption = 'Print Reminder by Item';
                    Image = PrintDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    ToolTip = 'Executes the Print Reminder by Item action.';
                    trigger OnAction()
                    var
                        lReminder: Report "Production Reminder ByI";
                    begin
                        CLEAR(lReminder);
                        lReminder.SetValue(Rec);
                        lReminder.RUN;
                    end;
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
                        lReminder: Report "Production Reminder ByD";
                    begin
                        CLEAR(lReminder);
                        lReminder.SetValue(Rec);
                        lReminder.RUN;
                    end;
                }
            }
        }
    }

    var
        Item: Record Item;
        DelayDays: Code[10];
        DateFilter: Text[30];
        DelayFormula: DateFormula;

    local procedure CalculateLine()
    var
        lProdLine: Record "Prod. Order Line";
        lEndDate: Date;
        lStartDate: Date;
        lWindow: Dialog;
        lRecNum: Integer;
        lRecCount: Integer;
    begin
        Rec.RESET;
        Rec.DELETEALL;

        lProdLine.SETRANGE(Status, lProdLine.Status::Released);
        IF DateFilter <> '' THEN BEGIN
            Item.SETFILTER("Date Filter", DateFilter);
            lStartDate := Item.GETRANGEMIN("Date Filter");
        END ELSE
            lStartDate := 0D;

        IF FORMAT(DelayFormula) <> '' THEN
            lEndDate := CALCDATE('-' + FORMAT(DelayFormula), WORKDATE)
        ELSE
            lEndDate := WORKDATE;
        lEndDate := CALCDATE('-1D', lEndDate);

        lProdLine.SETRANGE("Due Date", lStartDate, lEndDate);
        lProdLine.SETFILTER("Remaining Quantity", '>0');
        IF NOT lProdLine.FINDSET THEN BEGIN
            MESSAGE('There is nothing to calculate!');
            EXIT;
        END;

        lWindow.OPEN('@1@@@@@@@@@@@@@@@@');
        lRecCount := lProdLine.COUNT;

        REPEAT
            lRecNum += 1;
            lWindow.UPDATE(1, ROUND(lRecNum / lRecCount, 0.0001) * 10000);

            Rec.INIT;
            Rec := lProdLine;

            Rec."Routing Version Code" := FORMAT(WORKDATE - Rec."Due Date") + 'D';

            Rec.INSERT;
        UNTIL lProdLine.NEXT = 0;

        IF Rec.FIND('-') THEN;

        lWindow.CLOSE;
    end;
}

