page 50009 "Vendor Aging"
{
    // --------------------------------------------------------------------------------
    // CHCL - Chinese Localization Pack
    // --------------------------------------------------------------------------------

    Caption = 'Vendor Aging';
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
                field(VendorNoFilter; VendorNoFilter)
                {
                    Caption = 'Vendor No.';
                    TableRelation = Customer;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                    trigger OnValidate()
                    begin
                        IF Vendor.GET(VendorNoFilter) THEN VendorName := Vendor.Name ELSE VendorName := '';
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field(VendorName; VendorName)
                {
                    Caption = 'Vendor Name';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field(VendorGroupFilter; VendorGroupFilter)
                {
                    Caption = 'Vendor Group Code';
                    TableRelation = "Customer Price Group";
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Group Code field.';
                }
                field(CalculateTypeFilter; CalculateTypeFilter)
                {
                    Caption = 'Calculate Type';
                    OptionCaption = 'Grouped by Vendor,Detail';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Calculate Type field.';
                    trigger OnValidate()
                    begin
                        IF (CalculateTypeFilter <> CalculateTypeFilter::"Grouped by Vendor") AND LinePart1Visible THEN BEGIN
                            LinePart1Visible := FALSE;
                            LinePart2Visible := TRUE;
                            CurrPage.UPDATE;
                        END;
                        IF (CalculateTypeFilter = CalculateTypeFilter::"Grouped by Vendor") AND LinePart2Visible THEN BEGIN
                            LinePart1Visible := TRUE;
                            LinePart2Visible := FALSE;
                            CurrPage.UPDATE;
                        END;
                    end;
                }
            }
            part(LinePart1; 50010)
            {
                Visible = LinePart1Visible;
                ApplicationArea = All;
            }
            part(LinePart2; 50011)
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
                    IF CalculateTypeFilter = CalculateTypeFilter::"Grouped by Vendor" THEN
                        CurrPage.LinePart1.PAGE.FilterData(VendorNoFilter, VendorGroupFilter)
                    ELSE
                        CurrPage.LinePart2.PAGE.FilterData(VendorNoFilter, VendorGroupFilter)
                end;
            }
            action("Vendor Card")
            {
                Caption = 'Vendor Card';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Executes the Vendor Card action.';
                trigger OnAction()
                begin
                    IF CalculateTypeFilter = CalculateTypeFilter::"Grouped by Vendor" THEN
                        CurrPage.LinePart1.PAGE.OpenVendorCard
                    ELSE
                        CurrPage.LinePart2.PAGE.OpenVendorCard;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        LinePart1Visible := CalculateTypeFilter = CalculateTypeFilter::"Grouped by Vendor";
        LinePart2Visible := CalculateTypeFilter <> CalculateTypeFilter::"Grouped by Vendor";
    end;

    var
        VendorNoFilter: Code[20];
        VendorName: Text[50];
        VendorGroupFilter: Code[20];
        CalculateTypeFilter: Option "Grouped by Vendor",Detail;
        Vendor: Record Vendor;
        LinePart1Visible: Boolean;
        LinePart2Visible: Boolean;
}

