pageextension 50014 PostedSalesCreditMemo extends "Posted Sales Credit Memo"
{
    layout
    {
        addlast(General)
        {
            field("Application area"; Rec."Application area")
            {
                ApplicationArea = All;
            }
        }
    }
}
