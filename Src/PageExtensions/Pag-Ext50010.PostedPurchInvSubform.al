pageextension 50010 PostedPurchInvSubform extends "Posted Purch. Invoice Subform"
{
    layout
    {
        addafter("IC Partner Code")
        {
            
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Currency Code field.';
            }
            field("Document Type"; Rec."Document Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Document Type field.';
            }
            field("Purch. Order No."; Rec."Purch. Order No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Order No. field.';
            }
            field("Purch. Order Line No."; Rec."Purch. Order Line No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Order Line No. field.';
            }
        }
    }
}
