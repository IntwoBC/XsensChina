tableextension 50005 "AccScheduleLine Ext" extends "Acc. Schedule Line"
{
    fields
    {
        field(50100; "Description 2"; Text[80])
        {
            DataClassification = ToBeClassified;
            Description = 'CHCL21.5';
        }
    }

    var
        myInt: Integer;
}