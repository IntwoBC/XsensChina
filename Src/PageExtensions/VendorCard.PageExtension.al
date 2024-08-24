pageextension 50002 VendorExt extends "Vendor Card"
{
    layout
    {
        addafter(Invoicing)
        {
            group("IC Vendor Price")
            {
                field("Price Basis"; rec."Price Basis")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Price Basis field.';
                }
                field(Percentage; rec.Percentage)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
            }
        }
        //#61377: Request to make Vendor Card fields mandatory****Start
        modify("Payment Terms Code")
        {
            Visible = true;
            ShowMandatory = true;
        }
        modify("Payment Method Code")
        {
            Visible = true;
            ShowMandatory = true;
        }
        //#61377: Request to make Vendor Card fields mandatory****End
    }
    //#61377: Request to make Vendor Card fields mandatory****Start
    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        Rec.TestField("Payment Terms Code");
        Rec.TestField("Payment Method Code");
    end;
    //#61377: Request to make Vendor Card fields mandatory****End
}
