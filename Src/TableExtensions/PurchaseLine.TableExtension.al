tableextension 50004 "Purchase Line Ext" extends "Purchase Line"
{
    fields
    {
        field(50305; "Sorting"; Integer)
        {
            Description = 'Added on 20JAN2022 for sorting lines in report';
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}