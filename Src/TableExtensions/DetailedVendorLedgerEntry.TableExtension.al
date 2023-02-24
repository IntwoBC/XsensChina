tableextension 50014 "DetailedVendorLedger Ext" extends "Detailed Vendor Ledg. Entry"
{
    fields
    {
        field(50000; "Vend. Ledg. Entry Is Open"; Boolean)
        {
            CalcFormula = Lookup("Vendor Ledger Entry".Open WHERE("Entry No." = FIELD("Vendor Ledger Entry No.")));
            Caption = 'Vend. Ledg. Entry Is Open';
            Description = 'CHCL21.5';
            FieldClass = FlowField;
        }
        field(50001; "Vend. Ledg. Entry Doc. Date"; Date)
        {
            CalcFormula = Lookup("Vendor Ledger Entry"."Document Date" WHERE("Entry No." = FIELD("Vendor Ledger Entry No.")));
            Caption = 'Document Date';
            Description = 'CHCL21.5';
            FieldClass = FlowField;
        }
    }

    var
        myInt: Integer;
}