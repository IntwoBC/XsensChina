report 50024 "Production Reminder ByI"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\ProductionReminderByI.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(Item; Item)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            UseTemporary = true;
            column(CompanInfo_Picture; CompanInfo.Picture)
            {
            }
            column(CompanInfo_Name; CompanInfo.Name)
            {
            }
            column(CompanInfo_Name2; CompanInfo."Name 2")
            {
            }
            column(CompanInfo_Address; CompanInfo.Address)
            {
            }
            column(CompanInfo_Address2; CompanInfo."Address 2")
            {
            }
            column(CompanInfo_Country; CompanyCountry)
            {
            }
            column(ItemTemp_No; ItemTemp."No.")
            {
            }
            column(ItemTemp_Description; ItemTemp.Description)
            {
            }
            column(WorkDate; WORKDATE)
            {
            }
            dataitem(DataItem2; Integer)
            {
                DataItemTableView = SORTING(Number);
                column(LineType2; LineType1)
                {
                }
                column(ProdLineTemp_ProdOrderNo; ProdLineTemp."Prod. Order No.")
                {
                }
                column(ProdLineTemp_ItemNo; ProdLineTemp."Item No.")
                {
                }
                column(ProdLineTemp_Description; ProdLineTemp.Description)
                {
                }
                column(ProdLineTemp_UoM; ProdLineTemp."Unit of Measure Code")
                {
                }
                column(ProdLineTemp_RemainingQuantity; ProdLineTemp."Remaining Quantity")
                {
                }
                column(ProdLineTemp_DueDate; ProdLineTemp."Due Date")
                {
                }
                column(ProdLineTemp_DelayDays; ProdLineTemp."Routing Version Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number = 1 THEN
                        ProdLineTemp.FIND('-')
                    ELSE
                        ProdLineTemp.NEXT;

                    LineType1 := 2;
                end;

                trigger OnPreDataItem()
                begin
                    SETRANGE(Number, 1, ProdLineTemp.COUNT);
                end;
            }
            dataitem("Extended Text Line"; "Extended Text Line")
            {
                DataItemTableView = SORTING("Table Name", "No.", "Language Code", "Text No.", "Line No.");
                column(LineType1; LineType1)
                {
                }
                column(ReminderTitle_Text; Text)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    LineType1 := 1;
                end;

                trigger OnPreDataItem()
                begin
                    SETRANGE("Table Name", "Table Name"::"Standard Text");
                    SETRANGE("No.", CLSetup."MO Delay Reminder Title");
                end;
            }
            dataitem("Extended Text Line1"; "Extended Text Line")
            {
                DataItemTableView = SORTING("Table Name", "No.", "Language Code", "Text No.", "Line No.");
                column(LineType3; LineType1)
                {
                }
                column(ReminderFooter_Text; Text)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    LineType1 := 3;
                end;

                trigger OnPreDataItem()
                begin
                    SETRANGE("Table Name", "Table Name"::"Standard Text");
                    SETRANGE("No.", CLSetup."MO Delay Reminder Footer");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                ProdLineTemp.SETRANGE("Item No.", "No.");
                IF NOT ProdLineTemp.FIND('-') THEN
                    CurrReport.SKIP;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanInfo.GET;
        CompanInfo.CALCFIELDS(Picture);

        IF Country.GET(CompanInfo."Country/Region Code") THEN
            CompanyCountry := Country.Name;

        CLSetup.GET;
    end;

    var
        CompanInfo: Record "Company Information";
        CLSetup: Record "Chinese Localization Setup";
        Country: Record "Country/Region";
        ProdLineTemp: Record "Prod. Order Line" temporary;
        CompanyCountry: Text;
        LineType1: Integer;
        ItemTemp: Record Item;

    internal procedure SetValue(var pProdLineTemp: Record "Prod. Order Line" temporary)
    var
        lItem: Record Item;
    begin
        ProdLineTemp.RESET;
        ProdLineTemp.DELETEALL;

        IF pProdLineTemp.FINDSET THEN
            REPEAT
                ProdLineTemp.INIT;
                ProdLineTemp := pProdLineTemp;
                ProdLineTemp.INSERT;

                IF NOT ItemTemp.GET(pProdLineTemp."Item No.") THEN BEGIN
                    lItem.GET(pProdLineTemp."Item No.");
                    ItemTemp.INIT;
                    ItemTemp := lItem;
                    ItemTemp.INSERT;
                END;
            UNTIL pProdLineTemp.NEXT = 0;
    end;
}

