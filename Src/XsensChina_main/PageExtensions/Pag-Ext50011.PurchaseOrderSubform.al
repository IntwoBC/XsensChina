pageextension 50011 PurchaseOrderSubform extends "Purchase Order Subform"
{
    layout
    {
        addafter("FA Posting Date")
        {
            field(Sorting; Rec.Sorting)
            {
                ApplicationArea = All;
            }
        }
    }
}
