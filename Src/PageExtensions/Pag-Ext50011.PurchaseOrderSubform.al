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
        //Movella: #62116: Error receiving order in within MCB HK Start
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
            Enabled = true;
        }
        //Movella: #62116: Error receiving order in within MCB HK End
    }
}
