tableextension 50013 "DetailedCustLedgerEntry Ext" extends "Detailed Cust. Ledg. Entry"
{
    fields
    {
        field(50000; "Cust. Ledg. Entry Is Open"; Boolean)
        {
            CalcFormula = Lookup("Cust. Ledger Entry".Open WHERE("Entry No." = FIELD("Cust. Ledger Entry No.")));
            Caption = 'Cust. Ledg. Entry Is Open';
            Description = 'CHCL21.5';
            FieldClass = FlowField;
        }
        field(50001; "Cust. Ledg. Entry Doc. Date"; Date)
        {
            CalcFormula = Lookup("Cust. Ledger Entry"."Document Date" WHERE("Entry No." = FIELD("Cust. Ledger Entry No.")));
            Caption = 'Document Date';
            Description = 'CHCL21.5';
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}