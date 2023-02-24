pageextension 50005 DetailedCustomerLedgerEntries extends "Detailed Cust. Ledg. Entries"
{
    layout
    {
        addafter("Posting Date")
        {

            field("Cust. Ledg. Entry Is Open"; Rec."Cust. Ledg. Entry Is Open")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Cust. Ledg. Entry Is Open field.';
            }
            field("Cust. Ledg. Entry Doc. Date"; Rec."Cust. Ledg. Entry Doc. Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Document Date field.';
            }
        }
    }
}
