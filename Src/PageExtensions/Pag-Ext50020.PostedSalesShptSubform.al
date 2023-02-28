pageextension 50020 "PostedSalesShpt.Subform" extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter("Planned Shipment Date")
        {
            field(Sorting; Rec.Sorting)
            {
                ApplicationArea = All;
            }
        }
    }
}
