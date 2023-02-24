pageextension 50021 VendorLedgerEntries extends "Vendor Ledger Entries"
{
    layout
    {
        addafter("Posting Date")
        {

            field(Tmp_InvAmt; Rec.Tmp_InvAmt)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Invoice Amounts field.';
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
            field(Tmp_RemainingAmount; Rec.Tmp_RemainingAmount)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Remaining Amounts field.';
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
            field(DebitAmtFilter; Rec.DebitAmtFilter)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the DebitAmtFilter field.';
            }
        }
    }
}
