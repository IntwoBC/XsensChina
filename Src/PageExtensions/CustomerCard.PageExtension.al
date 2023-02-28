pageextension 50000 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addafter(AdjProfitPct)
        {

            field("Application area"; Rec."Application area")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Application area field.';
            }
            field(ExternalID; Rec.ExternalID)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the ExternalID field.';
            }
            field("Name 3"; Rec."Name 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Name 3 field.';
            }
            field("Territory Code"; Rec."Territory Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Territory Code field.';
            }
        }
    }
}