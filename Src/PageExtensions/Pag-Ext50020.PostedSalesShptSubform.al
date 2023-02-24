pageextension 50020 "PostedSalesShpt.Subform" extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter("Planned Shipment Date")
        {
            field("Document Type"; Rec."Document Type")
            {
                ApplicationArea = All;
            }
            field(Sorting; Rec.Sorting)
            {
                ApplicationArea = All;
            }
        }
    }
}
