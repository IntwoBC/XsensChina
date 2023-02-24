page 50014 "Customer Aging"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Customer Aging';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = ListPlus;
    SaveValues = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(CustNoFilter; CustNoFilter)
                {
                    Caption = 'Customer No.';
                    TableRelation = Customer;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    trigger OnValidate()
                    var
                        lCust: Record Customer;
                    begin
                        IF lCust.GET(CustNoFilter) THEN
                            CustName := lCust.Name
                        ELSE
                            CustName := '';

                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field(CustName; CustName)
                {
                    Caption = 'Customer Name';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field(CustGroupFilter; CustGroupFilter)
                {
                    Caption = 'Customer Posting Group';
                    TableRelation = "Customer Price Group";
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Posting Group field.';
                }
                field(CalculateTypeFilter; CalculateTypeFilter)
                {
                    Caption = 'Calculate Type';
                    OptionCaption = 'Grouped by Customer,Detail';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Calculate Type field.';
                    trigger OnValidate()
                    begin
                        IF (CalculateTypeFilter <> CalculateTypeFilter::"Grouped by Customer") AND LinePart1Visible THEN BEGIN
                            LinePart1Visible := FALSE;
                            LinePart2Visible := TRUE;
                            CurrPage.UPDATE;
                        END;
                        IF (CalculateTypeFilter = CalculateTypeFilter::"Grouped by Customer") AND LinePart2Visible THEN BEGIN
                            LinePart1Visible := TRUE;
                            LinePart2Visible := FALSE;
                            CurrPage.UPDATE;
                        END;
                    end;
                }
                field(CalculateDate; CalculateDate)
                {
                    Caption = 'Calculation Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Calculation Date field.';
                }
            }
            part(LinePart1; "Customer Aging by Customer")
            {
                Visible = LinePart1Visible;
                ApplicationArea = All;
            }
            part(LinePart2; "Customer Aging by Detail")
            {
                Visible = LinePart2Visible;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Query)
            {
                Caption = 'Query';
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Executes the Query action.';
                trigger OnAction()
                begin
                    IF CalculateTypeFilter = CalculateTypeFilter::"Grouped by Customer" THEN BEGIN
                        CurrPage.LinePart1.PAGE.SetValue(CalculateDate);
                        CurrPage.LinePart1.PAGE.FilterData(CustNoFilter, CustGroupFilter, FALSE);
                        CurrPage.LinePart1.PAGE.UpdateForm(FALSE);
                    END ELSE BEGIN
                        CurrPage.LinePart2.PAGE.SetValue(CalculateDate);
                        CurrPage.LinePart2.PAGE.FilterData(CustNoFilter, CustGroupFilter, FALSE)
                    END;
                end;
            }
            action("Customer Card")
            {
                Caption = 'Customer Card';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Executes the Customer Card action.';
                trigger OnAction()
                begin
                    IF CalculateTypeFilter = CalculateTypeFilter::"Grouped by Customer" THEN
                        CurrPage.LinePart2.PAGE.OpenCustomerCard
                    ELSE
                        CurrPage.LinePart2.PAGE.OpenCustomerCard;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        LinePart1Visible := CalculateTypeFilter = CalculateTypeFilter::"Grouped by Customer";
        LinePart2Visible := CalculateTypeFilter <> CalculateTypeFilter::"Grouped by Customer";

        CalculateDate := WORKDATE;
    end;

    var
        CustNoFilter: Code[20];
        CustName: Text[50];
        CustGroupFilter: Code[20];
        CalculateTypeFilter: Option "Grouped by Customer",Detail;
        Customer: Record Customer;
        LinePart1Visible: Boolean;
        LinePart2Visible: Boolean;
        CalculateDate: Date;
}

