report 50022 "Sales Delivery Reminder ByD"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\SalesDeliveryReminderByD.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = WHERE("Document Type" = FILTER(Order),
                                      "Sell-to Customer No." = FILTER(<> ''));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
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
            column(CompanInfo_PhoneNo; CompanInfo."Phone No.")
            {
            }
            column(CompanInfo_FaxNo; CompanInfo."Fax No.")
            {
            }
            column(PurchHeader_No; "Sales Header"."No.")
            {
            }
            column(Vendor_No; "Sales Header"."Sell-to Customer No.")
            {
            }
            column(Vendor_Name; "Sales Header"."Sell-to Customer Name")
            {
            }
            column(Vendor_Name2; "Sales Header"."Sell-to Customer Name 2")
            {
            }
            column(Vendor_Address; "Sales Header"."Sell-to Address")
            {
            }
            column(Vendor_Address2; "Sales Header"."Sell-to Address 2")
            {
            }
            column(Vendor_Contact; "Sales Header"."Sell-to Contact")
            {
            }
            column(Vendor_PhoneNo; Cust."Phone No.")
            {
            }
            column(Vendor_FaxNo; Cust."Fax No.")
            {
            }
            column(Vendor_Country; VendorCountry)
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
                column(PurchLineTemp_DocumentNo; SalesLineTemp."Document No.")
                {
                }
                column(PurchLineTemp_Type; SalesLineTemp.Type)
                {
                }
                column(PurchLineTemp_No; SalesLineTemp."No.")
                {
                }
                column(PurchLineTemp_Description; SalesLineTemp.Description)
                {
                }
                column(PurchLineTemp_UoM; SalesLineTemp."Unit of Measure Code")
                {
                }
                column(PurchLineTemp_OutstandingQuantity; SalesLineTemp."Outstanding Quantity")
                {
                }
                column(PurchLineTemp_ExpectedReceiptDate; SalesLineTemp."Shipment Date")
                {
                }
                column(PurchLineTemp_DelayDays; SalesLineTemp."Unit of Measure")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number = 1 THEN
                        SalesLineTemp.FIND('-')
                    ELSE
                        SalesLineTemp.NEXT;

                    LineType1 := 2;
                end;

                trigger OnPreDataItem()
                begin
                    SETRANGE(Number, 1, SalesLineTemp.COUNT);
                end;
            }
            dataitem("Extended Text Line"; "Extended Text Line"
            )
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
                    SETRANGE("No.", CLSetup."SO Delay Reminder Title");
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
                    SETRANGE("No.", CLSetup."SO Delay Reminder Footer");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                SalesLineTemp.SETRANGE("Document No.", "No.");
                IF NOT SalesLineTemp.FIND('-') THEN
                    CurrReport.SKIP;

                VendorCountry := '';
                IF Country.GET("Sales Header"."Sell-to Country/Region Code") THEN
                    VendorCountry := Country.Name;

                Cust.GET("Sell-to Customer No.");
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
        Cust: Record Customer;
        Country: Record "Country/Region";
        SalesLineTemp: Record "Sales Line" temporary;
        CompanyCountry: Text;
        VendorCountry: Text;
        LineType1: Integer;


    internal procedure SetValue(var pSalesLineTemp: Record "Sales Line" temporary)
    begin
        SalesLineTemp.RESET;
        SalesLineTemp.DELETEALL;

        IF pSalesLineTemp.FINDSET THEN
            REPEAT
                SalesLineTemp.INIT;
                SalesLineTemp := pSalesLineTemp;
                SalesLineTemp.INSERT;
            UNTIL pSalesLineTemp.NEXT = 0;
    end;
}

