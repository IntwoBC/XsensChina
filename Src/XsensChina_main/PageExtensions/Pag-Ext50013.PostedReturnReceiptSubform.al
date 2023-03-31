pageextension 50013 ReturnReturnReceiptSubform extends "Posted Return Receipt Subform"
{
    layout
    {
        addafter("Units per Parcel")
        {
            field(Sorting; Rec.Sorting)
            {
                ApplicationArea = All;
            }
        }
    }
}
