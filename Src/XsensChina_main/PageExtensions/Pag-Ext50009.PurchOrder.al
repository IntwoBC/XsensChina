pageextension 50009 PurchOrder extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("Sales Order no."; Rec."Sales Order no.")
            {
                ApplicationArea = All;
            }
        }
    }
}
