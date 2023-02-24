report 50017 "Sales - Return Receipt2"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\vSalesReturnReceipt2.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Return Receipt Header"; "Return Receipt Header")
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
            column(SalesHeader_No; "Return Receipt Header"."No.")
            {
            }
            column(SalesHeader_ShipDate; "Return Receipt Header"."Posting Date")
            {
            }
            column(SalesHeader_SalesCode; "Return Receipt Header"."Salesperson Code")
            {
            }
            column(SalesHeader_SalesName; SalesName)
            {
            }
            column(SalesHeader_SalesEmail; SalesEmail)
            {
            }
            column(SalesHeader_YourReference; "Return Receipt Header"."Your Reference")
            {
            }
            column(SalesHeader_ShipName; "Return Receipt Header"."Ship-to Name")
            {
            }
            column(SalesHeader_ShipName2; "Return Receipt Header"."Ship-to Name 2")
            {
            }
            column(SalesHeader_ShipAddress; "Return Receipt Header"."Ship-to Address")
            {
            }
            column(SalesHeader_ShipAddress2; "Return Receipt Header"."Ship-to Address 2")
            {
            }
            column(SalesHeader_ShipCity; "Return Receipt Header"."Ship-to City")
            {
            }
            column(SalesHeader_ShipCountryCode; "Return Receipt Header"."Ship-to Country/Region Code")
            {
            }
            column(SalesHeader_ShipContact; "Return Receipt Header"."Ship-to Contact")
            {
            }
            column(SalesHeader_ShipCountryName; ShipCountryName)
            {
            }
            column(SalesHeader_CurrencyCode; CurrencyCode)
            {
            }
            dataitem("Return Receipt Line"; "Return Receipt Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    WHERE(Quantity = FILTER(<> 0));
                column(DocumentNo_ReturnReceiptLine; "Return Receipt Line"."Document No.")
                {
                }
                column(SalesLine_LineNo; "Return Receipt Line"."Line No.")
                {
                }
                column(SalesLine_No; "Return Receipt Line"."No.")
                {
                }
                column(SalesLine_Description; "Return Receipt Line".Description)
                {
                }
                column(SalesLine_Quantity; "Return Receipt Line".Quantity)
                {
                }
                column(Sorting; "Return Receipt Line".Sorting)
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

