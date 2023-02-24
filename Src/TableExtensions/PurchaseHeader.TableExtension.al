tableextension 50003 "Purchase Header Ext" extends "Purchase Header"
{
    fields
    {
        field(50304; "Sales Order no."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'ICPO';
        }
    }

    var
        myInt: Integer;
}