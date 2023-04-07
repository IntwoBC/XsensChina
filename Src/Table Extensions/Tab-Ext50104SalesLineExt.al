tableextension 50104 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50450; Sorting; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Added on 20JAN2022 for sorting Lines on report';

            trigger OnValidate()
            var
                SalesLineL: Record "Sales Line";
            begin
                //<LT 01.22.2022>
                //Checking sorting no to avoid same value
                IF Rec.Sorting = 0 THEN
                    EXIT;
                SalesLineL.SETCURRENTKEY("Document Type", "Document No.", Sorting);
                SalesLineL.SETRANGE("Document Type", SalesLineL."Document Type"::Order);
                SalesLineL.SETRANGE("Document No.", "Document No.");
                SalesLineL.SETRANGE(Sorting, Sorting);
                IF SalesLineL.FINDSET THEN
                    REPEAT
                        ERROR('Sorting number %1 is already in use.', SalesLineL.Sorting);
                    UNTIL SalesLineL.NEXT = 0;
                //<LT 01.22.2022>
            end;
        }
        field(50451; ExternalID; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}