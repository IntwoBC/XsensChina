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
            field(Tmp_Balance; Rec.Tmp_Balance)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Tmp_Balance field.';
            }
            field(Tmp_OverDue; Rec.Tmp_OverDue)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Tmp_OverDue field.';
            }
            field("Territory Code"; Rec."Territory Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Territory Code field.';
            }
            field(Tmp_BalanceEUR; Rec.Tmp_BalanceEUR)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Balance EUR field.';
            }
            field(Tmp_BalanceLCY; Rec.Tmp_BalanceLCY)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Balance (LCY) field.';
            }
            field(Tmp_BalanceRMB; Rec.Tmp_BalanceRMB)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Balance RMB field.';
            }
            field(Tmp_BalanceUSD; Rec.Tmp_BalanceUSD)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Balance USD field.';
            }
            field(BalanceEUR; Rec.BalanceEUR)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Balance EUR field.';
            }
            field(BalanceLCY; Rec.BalanceLCY)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Balance (LCY) field.';
            }
            field(BalanceRMB; Rec.BalanceRMB)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Balance RMB field.';
            }
            field(BalanceUSD; Rec.BalanceUSD)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Balance USD field.';
            }
            field("VAT Customer Name"; Rec."VAT Customer Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Customer Name field.';
            }
            field("VAT Address & Telephone"; Rec."VAT Address & Telephone")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Address & Telephone field.';
            }
            field("VAT Bank Name & Account"; Rec."VAT Bank Name & Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Bank Name & Account field.';
            }
            field("VAT Contact Information"; Rec."VAT Contact Information")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Contact Information field.';
            }
            field("VAT Invoice Mail Address"; Rec."VAT Invoice Mail Address")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Invoice Mail Address field.';
            }
        }
    }
}