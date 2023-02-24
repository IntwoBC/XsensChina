page 50012 "Sales Line Inquiry"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Sales Line Inquiry';
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
                group(Control18)
                {
                    field(CustomerNoFilter; CustomerNoFilter)
                    {
                        Caption = 'Sell-to Customer No.';
                        TableRelation = Customer;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Sell-to Customer No. field.';
                        trigger OnValidate()
                        begin
                            IF Customer.GET(CustomerNoFilter) THEN CustomerName := Customer.Name ELSE CustomerName := '';
                            CurrPage.UPDATE(FALSE);
                        end;
                    }
                    field(CustomerName; CustomerName)
                    {
                        Caption = 'Sell-to Customer Name';
                        Editable = false;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Sell-to Customer Name field.';
                    }
                    group(Control8)
                    {
                        grid(Control9)
                        {
                            GridLayout = Rows;
                            group(Control10)
                            {
                                field(OrderDateFilter1; OrderDateFilter1)
                                {
                                    Caption = 'Order Date From';
                                    ApplicationArea = All;
                                    ToolTip = 'Specifies the value of the Order Date From field.';
                                }
                                field(OrderDateFilter2; OrderDateFilter2)
                                {
                                    Caption = 'To';
                                    ApplicationArea = All;
                                    ToolTip = 'Specifies the value of the To field.';
                                }
                            }
                        }
                    }
                    field(CreateUserFilter; CreateUserFilter)
                    {
                        Caption = 'Create User';
                        TableRelation = "User Setup";
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Create User field.';
                    }
                    field(DeliveryDateFilter; DeliveryDateFilter)
                    {
                        Caption = 'Delivery Date';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery Date field.';
                    }
                }
                group(Control5)
                {
                    field(ItemCategoryFilter; ItemCategoryFilter)
                    {
                        Caption = 'Item Category';
                        TableRelation = "Item Category";
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Item Category field.';
                    }
                    field(ItemNoFilter; ItemNoFilter)
                    {
                        Caption = 'Item No';
                        TableRelation = Item;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Item No field.';
                    }
                    field(BUCodeFilter; BUCodeFilter)
                    {
                        CaptionClass = '1,2,1';
                        Caption = 'BU Code';
                        Editable = BUCodeEditable;
                        TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the BU Code field.';
                    }
                    field(SalespersonFilter; SalespersonFilter)
                    {
                        Caption = 'Salesperson';
                        TableRelation = "Salesperson/Purchaser";
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Salesperson field.';
                    }
                    field(StatusFilter; StatusFilter)
                    {
                        Caption = 'Status';
                        OptionCaption = 'Open,Released,Closed,All';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Status field.';
                    }
                }
            }
            part(LinePart; "Sales Inquiry Line")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("查询")
            {
                Caption = '查询';
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Executes the 查询 action.';
                trigger OnAction()
                begin
                    CurrPage.LinePart.PAGE.FilterData(CustomerNoFilter, OrderDateFilter1, OrderDateFilter2, DeliveryDateFilter, ItemCategoryFilter, ItemNoFilter, BUCodeFilter, SalespersonFilter, StatusFilter, CreateUserFilter)
                end;
            }
            action("销售订单")
            {
                Caption = '销售订单';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Executes the 销售订单 action.';
                trigger OnAction()
                begin
                    CurrPage.LinePart.PAGE.OpenSalesOrder;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        UserSetup.GET(USERID);
        //IF UserSetup."Shortcut Dimension 1 Code"<>'' THEN BEGIN
        //  BUCodeFilter :=UserSetup."Shortcut Dimension 1 Code";
        //  BUCodeEditable :=FALSE;
        //END ELSE
        //  BUCodeEditable :=TRUE;

        OrderDateFilter1 := DMY2DATE(1, DATE2DMY(WORKDATE, 2), DATE2DMY(WORKDATE, 3));
        OrderDateFilter2 := CALCDATE('CM', WORKDATE);
    end;

    var
        CustomerNoFilter: Code[20];
        CustomerName: Text[50];
        OrderDateFilter1: Date;
        OrderDateFilter2: Date;
        DeliveryDateFilter: Date;
        ItemCategoryFilter: Code[20];
        ItemNoFilter: Code[20];
        BUCodeFilter: Code[20];
        SalespersonFilter: Code[20];
        StatusFilter: Option Open,Released,Closed,All;
        CreateUserFilter: Code[40];
        Customer: Record 18;
        UserSetup: Record 91;
        BUCodeEditable: Boolean;
}

