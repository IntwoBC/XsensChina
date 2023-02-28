pageextension 50018 SalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        addafter("FA Posting Date")
        {
            field(ExternalID; Rec.ExternalID)
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
