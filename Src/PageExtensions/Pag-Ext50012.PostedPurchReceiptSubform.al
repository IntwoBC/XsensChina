pageextension 50012 PurchReceiptSubform extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        addafter("Prod. Order No.")
        {
            field("Document Type"; Rec."Document Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
