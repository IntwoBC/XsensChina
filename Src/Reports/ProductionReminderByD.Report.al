report 50023 "Production Reminder ByD"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\ProductionReminderByD.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = WHERE(Status = FILTER(Released));
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
            column(ProdOrder_No; ProdOrderTemp."No.")
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
            dataitem(ReminderTitle; "Extended Text Line")
            {
                DataItemTableView = SORTING("Table Name", "No.", "Language Code", "Text No.", "Line No.");
                column(LineType1; LineType1)
                {
                }
                column(ReminderTitle_Text; ReminderTitle.Text)
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
            dataitem("Extended Text Line"; "Extended Text Line")
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
                ProdLineTemp.SETRANGE("Prod. Order No.", "No.");
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
        ProdOrderTemp: Record "Production Order";

    internal procedure SetValue(var pProdLineTemp: Record "Prod. Order Line" temporary)
    var
        lProdOrder: Record "Production Order";
    begin
        ProdLineTemp.RESET;
        ProdLineTemp.DELETEALL;

        IF pProdLineTemp.FINDSET THEN
            REPEAT
                ProdLineTemp.INIT;
                ProdLineTemp := pProdLineTemp;
                ProdLineTemp.INSERT;

                IF NOT ProdOrderTemp.GET(pProdLineTemp.Status, pProdLineTemp."Prod. Order No.") THEN BEGIN
                    lProdOrder.GET(pProdLineTemp.Status, pProdLineTemp."Prod. Order No.");
                    ProdOrderTemp.INIT;
                    ProdOrderTemp := lProdOrder;
                    ProdOrderTemp.INSERT;
                END;
            UNTIL pProdLineTemp.NEXT = 0;
    end;
}

