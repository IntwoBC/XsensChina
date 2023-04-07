pageextension 50022 "PostedSalesCr.MemoSubform" extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        addafter("IC Partner Code")
        {
            field(Sorting; Rec.Sorting)
            {
                ApplicationArea = All;
            }
        }
    }
}
