page 50007 "Purchase Line Inquiry"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Purchase Line Inquiry';
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
                Caption = 'General';
                group(Control18)
                {
                    field(ProjectNoFilter; ProjectNoFilter)
                    {
                        Caption = 'Project No.';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Project No. field.';
                    }
                    field(VendorNoFilter; VendorNoFilter)
                    {
                        Caption = 'Buy-from Vendor No.';
                        TableRelation = Vendor;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buy-from Vendor No. field.';
                        trigger OnValidate()
                        begin
                            IF Vendor.GET(VendorNoFilter) THEN VendorName := Vendor.Name ELSE VendorName := '';
                            CurrPage.UPDATE(FALSE);
                        end;
                    }
                    field("<OrderNoFilter>"; gs_OrderNo)
                    {
                        Caption = 'Order No';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Order No field.';
                    }
                    field(VendorName; VendorName)
                    {
                        Caption = 'Vendor Name';
                        Editable = false;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Vendor Name field.';
                    }
                    group(Control8)
                    {
                        grid(control9)
                        {
                            GridLayout = Rows;
                            group(Control10)
                            {
                                field(OrderDateFilter1; OrderDateFilter1)
                                {
                                    Caption = 'OrderDate From';
                                    ApplicationArea = All;
                                    ToolTip = 'Specifies the value of the OrderDate From field.';
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
                    field(ReceiptDateFilter; ReceiptDateFilter)
                    {
                        Caption = 'Receipt Date';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Receipt Date field.';
                    }
                }
                group(Control5)
                {
                    field(ItemNoFilter; ItemNoFilter)
                    {
                        Caption = 'Item No';
                        TableRelation = Item;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Item No field.';
                    }
                    field(PurchaserFilter; PurchaserFilter)
                    {
                        Caption = 'Purchaser';
                        TableRelation = "Salesperson/Purchaser";
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Purchaser field.';
                    }
                    field(StatusFilter; StatusFilter)
                    {
                        Caption = 'Status';
                        OptionCaption = 'Open,Released,Closed,All';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Status field.';
                    }
                    field("<Description>"; gs_Description)
                    {
                        Caption = 'Description';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Description field.';
                    }
                }
            }
            part(LinePart; "Purchase Inquiry Line")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Inquiry)
            {
                Caption = 'Inquiry';
                Image = Find;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Executes the Inquiry action.';
                trigger OnAction()
                begin
                    CurrPage.LinePart.PAGE.FilterData(VendorNoFilter, OrderDateFilter1, OrderDateFilter2, ReceiptDateFilter, ItemCategoryFilter, ItemNoFilter, BUCodeFilter, PurchaserFilter, StatusFilter, CreateUserFilter, ProjectNoFilter, gs_Description, gs_OrderNo)
                end;
            }
            action("Purchase Order")
            {
                Caption = 'Purchase Order';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Executes the Purchase Order action.';
                trigger OnAction()
                begin
                    CurrPage.LinePart.PAGE.OpenPurchOrder;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        //OrderDateFilter1 :=DMY2DATE(1,DATE2DMY(WORKDATE, 2) , DATE2DMY(WORKDATE, 3));
        OrderDateFilter2 := CALCDATE('CM', WORKDATE);
        StatusFilter := StatusFilter::Released;
    end;

    var
        VendorNoFilter: Code[20];
        VendorName: Text[50];
        OrderDateFilter1: Date;
        OrderDateFilter2: Date;
        ReceiptDateFilter: Date;
        ItemCategoryFilter: Code[20];
        ItemNoFilter: Code[20];
        BUCodeFilter: Code[20];
        PurchaserFilter: Code[20];
        StatusFilter: Option Open,Released,Closed,All;
        CreateUserFilter: Code[40];
        Vendor: Record Vendor;
        gS_Department: Text[100];
        gs_Description: Text[100];
        gs_OrderNo: Text[50];
        ProjectNoFilter: Text[40];
}

