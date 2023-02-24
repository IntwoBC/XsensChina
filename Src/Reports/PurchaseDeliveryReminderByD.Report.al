report 50020 "Purchase Delivery Reminder ByD"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\PurchaseDeliveryReminderByD.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = WHERE("Document Type" = FILTER(Order),
                                      "Buy-from Vendor No." = FILTER(<> ''));
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
            column(PurchHeader_No; "Purchase Header"."No.")
            {
            }
            column(Vendor_No; "Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(Vendor_Name; "Purchase Header"."Buy-from Vendor Name")
            {
            }
            column(Vendor_Name2; "Purchase Header"."Buy-from Vendor Name 2")
            {
            }
            column(Vendor_Address; "Purchase Header"."Buy-from Address")
            {
            }
            column(Vendor_Address2; "Purchase Header"."Buy-from Address 2")
            {
            }
            column(Vendor_Contact; "Purchase Header"."Buy-from Contact")
            {
            }
            column(Vendor_PhoneNo; Vendor."Phone No.")
            {
            }
            column(Vendor_FaxNo; Vendor."Fax No.")
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
                column(PurchLineTemp_DocumentNo; PurchLineTemp."Document No.")
                {
                }
                column(PurchLineTemp_Type; PurchLineTemp.Type)
                {
                }
                column(PurchLineTemp_No; PurchLineTemp."No.")
                {
                }
                column(PurchLineTemp_Description; PurchLineTemp.Description)
                {
                }
                column(PurchLineTemp_UoM; PurchLineTemp."Unit of Measure Code")
                {
                }
                column(PurchLineTemp_OutstandingQuantity; PurchLineTemp."Outstanding Quantity")
                {
                }
                column(PurchLineTemp_ExpectedReceiptDate; PurchLineTemp."Expected Receipt Date")
                {
                }
                column(PurchLineTemp_DelayDays; PurchLineTemp."Unit of Measure")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF Number = 1 THEN
                        PurchLineTemp.FIND('-')
                    ELSE
                        PurchLineTemp.NEXT;

                    LineType1 := 2;
                end;

                trigger OnPreDataItem()
                begin
                    SETRANGE(Number, 1, PurchLineTemp.COUNT);
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
                    SETRANGE("No.", CLSetup."PO Delay Reminder Title");
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
                    SETRANGE("No.", CLSetup."PO Delay Reminder Footer");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                PurchLineTemp.SETRANGE("Document No.", "No.");
                IF NOT PurchLineTemp.FIND('-') THEN
                    CurrReport.SKIP;

                VendorCountry := '';
                IF Country.GET("Purchase Header"."Buy-from Country/Region Code") THEN
                    VendorCountry := Country.Name;

                Vendor.GET("Buy-from Vendor No.");
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
        Vendor: Record Vendor;
        Country: Record "Country/Region";
        PurchLineTemp: Record "Purchase Line" temporary;
        CompanyCountry: Text;
        VendorCountry: Text;
        LineType1: Integer;


    internal procedure SetValue(var pPurchLineTemp: Record "Purchase Line" temporary)
    begin
        PurchLineTemp.RESET;
        PurchLineTemp.DELETEALL;

        IF pPurchLineTemp.FINDSET THEN
            REPEAT
                PurchLineTemp.INIT;
                PurchLineTemp := pPurchLineTemp;
                PurchLineTemp.INSERT;
            UNTIL pPurchLineTemp.NEXT = 0;
    end;
}

