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
    }
}
