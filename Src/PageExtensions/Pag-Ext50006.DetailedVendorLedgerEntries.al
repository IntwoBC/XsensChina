pageextension 50006 DetailedVendorLedgerEntries extends "Detailed Vendor Ledg. Entries"
{
    layout
    {
        addafter("Posting Date")
        {
            
            field("Vend. Ledg. Entry Is Open"; Rec."Vend. Ledg. Entry Is Open")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Vend. Ledg. Entry Is Open field.';
            }
            field("Vend. Ledg. Entry Doc. Date"; Rec."Vend. Ledg. Entry Doc. Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Document Date field.';
            }
        }
    }
}
