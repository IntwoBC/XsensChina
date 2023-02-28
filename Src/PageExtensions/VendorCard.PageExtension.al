pageextension 50002 VendorExt extends "Vendor Card"
{
    layout
    {
        addafter(Invoicing)
        {
            group("IC Vendor Price")
            {
                field("Price Basis"; rec."Price Basis")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Price Basis field.';
                }
                field(Percentage; rec.Percentage)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
                field(Tmp_Balance; Rec.Tmp_Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field(Tmp_OverDue; Rec.Tmp_OverDue)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Over Due field.';
                }
                field(Tmp_BalanceEUR; Rec.Tmp_BalanceEUR)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_BalanceEUR field.';
                }
                field(Tmp_BalanceLCY; Rec.Tmp_BalanceLCY)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_BalanceLCY field.';
                }
                field(Tmp_BalanceRMB; Rec.Tmp_BalanceRMB)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_BalanceRMB field.';
                }
                field(Tmp_BalanceUSD; Rec.Tmp_BalanceUSD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_BalanceUSD field.';
                }
                field("Tmp_OverDue(LCY)"; Rec."Tmp_OverDue(LCY)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Over Due (LCY) field.';
                }
                field(BalanceEUR; Rec.BalanceEUR)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BalanceEUR field.';
                }
                field(BalanceLCY; Rec.BalanceLCY)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_BalanceEUR field.';
                }
                field(BalanceRMB; Rec.BalanceRMB)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tmp_BalanceEUR field.';
                }
                field(BalanceUSD; Rec.BalanceUSD)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BalanceUSD field.';
                }
            }
        }
    }
}
