report 50013 "Sales - Shipment2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\SalesShipment2.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header"
        )
        {
            RequestFilterFields = "No.";
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Name; CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Name2; CompanyInfo."Name 2")
            {
            }
            column(CompanyInfo_Address; CompanyInfo.Address)
            {
            }
            column(CompanyInfo_Address2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfo_City; CompanyInfo.City)
            {
            }
            column(CompanyInfo_PhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyInfo_FaxNo; CompanyInfo."Fax No.")
            {
            }
            column(CompanyInfo_CountryCode; CompanyInfo."Country/Region Code")
            {
            }
            column(CompanyInfo_CountryName; CountryName)
            {
            }
            column(CompanyInfo_VATRegistrationNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(SalesHeader_No; "Sales Shipment Header"."No.")
            {
            }
            column(SalesHeader_ShipDate; TODAY)
            {
            }
            column(SalesHeader_SalesCode; "Sales Shipment Header"."Salesperson Code")
            {
            }
            column(SalesHeader_SalesName; SalesName)
            {
            }
            column(SalesHeader_SalesEmail; SalesEmail)
            {
            }
            column(SalesHeader_YourReference; "Sales Shipment Header"."Your Reference")
            {
            }
            column(SalesHeader_ShipName; "Sales Shipment Header"."Ship-to Name")
            {
            }
            column(SalesHeader_ShipName2; "Sales Shipment Header"."Ship-to Name 2")
            {
            }
            column(SalesHeader_ShipAddress; "Sales Shipment Header"."Ship-to Address")
            {
            }
            column(SalesHeader_ShipAddress2; "Sales Shipment Header"."Ship-to Address 2")
            {
            }
            column(SalesHeader_ShipCity; "Sales Shipment Header"."Ship-to City")
            {
            }
            column(SalesHeader_ShipCountryCode; "Sales Shipment Header"."Ship-to Country/Region Code")
            {
            }
            column(SalesHeader_ShipContact; "Sales Shipment Header"."Ship-to Contact")
            {
            }
            column(OrderNo; "Sales Shipment Header"."Order No.")
            {
            }
            column(SalesHeader_ShipCountryName; ShipCountryName)
            {
            }
            column(SalesHeader_CurrencyCode; CurrencyCode)
            {
            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    WHERE(Quantity = FILTER(<> 0));
                column(DocumentNo_SalesShipmentLine; "Sales Shipment Line"."Document No.")
                {
                }
                column(SalesLine_LineNo; "Sales Shipment Line"."Line No.")
                {
                }
                column(SalesLine_No; "Sales Shipment Line"."No.")
                {
                }
                column(SalesLine_Description; "Sales Shipment Line".Description)
                {
                }
                column(SalesLine_CrossNo; "Sales Shipment Line"."Cross-Reference No.")
                {
                }
                column(SalesLine_Quantity; "Sales Shipment Line".Quantity)
                {
                }
                column(SalesLine_Description2; "Sales Shipment Line"."Description 2")
                {
                }
                column(Sorting; "Sales Shipment Line".Sorting)
                {
                }

                trigger OnPreDataItem()
                begin
                    SETCURRENTKEY("Document No.", Sorting, "Line No.");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                SalesName := '';
                SalesEmail := '';
                IF SalesPerson.GET("Salesperson Code") THEN BEGIN
                    SalesName := SalesPerson.Name;
                    SalesEmail := SalesPerson."E-Mail";
                END;

                ShipCountryName := '';
                IF Country.GET("Ship-to Country/Region Code") THEN
                    ShipCountryName := Country.Name;

                IF "Currency Code" <> '' THEN
                    CurrencyCode := "Currency Code"
                ELSE BEGIN
                    GLSetup.GET;
                    CurrencyCode := GLSetup."LCY Code";
                END;
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
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);

        CountryName := '';
        IF Country.GET(CompanyInfo."Country/Region Code") THEN
            CountryName := Country.Name;
    end;

    var
        CompanyInfo: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        Cust: Record Customer;
        SalesPerson: Record "Salesperson/Purchaser";
        Country: Record "Country/Region";
        SalesName: Text;
        SalesEmail: Text;
        CountryName: Text;
        CurrencyCode: Code[10];
        ShipCountryName: Text;
}

