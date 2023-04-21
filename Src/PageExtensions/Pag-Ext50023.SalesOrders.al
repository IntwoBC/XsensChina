pageextension 50023 "Sales Orders Ext" extends "Sales Order List"
{
    layout
    {
        addafter("No.")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
        }
    }

}