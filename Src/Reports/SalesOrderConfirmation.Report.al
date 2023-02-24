report 50012 "Sales - Order Confirmation"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\Reports\SalesOrderConfirmation.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.")
                                WHERE("Document Type" = FILTER(Order));
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
            column(SalesHeader_VATREgistrationNo; Cust."VAT Registration No.")
            {
            }
            column(SalesHeader_No; "Sales Header"."No.")
            {
            }
            column(SalesHeader_OrderDate; "Sales Header"."Order Date")
            {
            }
            column(SalesHeader_SalesCode; "Sales Header"."Salesperson Code")
            {
            }
            column(SalesHeader_SalesName; SalesName)
            {
            }
            column(SalesHeader_SalesEmail; SalesEmail)
            {
            }
            column(SalesHeader_CustNo; "Sales Header"."Bill-to Customer No.")
            {
            }
            column(SalesHeader_CustName; "Sales Header"."Bill-to Name")
            {
            }
            column(SalesHeader_CustName2; "Sales Header"."Bill-to Name 2")
            {
            }
            column(SalesHeader_CustAddress; "Sales Header"."Bill-to Address")
            {
            }
            column(SalesHeader_CustAddress2; "Sales Header"."Bill-to Address 2")
            {
            }
            column(SalesHeader_BillToPostCode; "Sales Header"."Bill-to Post Code")
            {
            }
            column(SalesHeader_CustCity; "Sales Header"."Bill-to City")
            {
            }
            column(SalesHeader_CustCountryCode; "Sales Header"."Bill-to Country/Region Code")
            {
            }
            column(SalesHeader_YourReference; "Sales Header"."Your Reference")
            {
            }
            column(SalesHeader_ShipName; "Sales Header"."Ship-to Name")
            {
            }
            column(SalesHeader_ShipName2; "Sales Header"."Ship-to Name 2")
            {
            }
            column(SalesHeader_ShipAddress; "Sales Header"."Ship-to Address")
            {
            }
            column(SalesHeader_ShipAddress2; "Sales Header"."Ship-to Address 2")
            {
            }
            column(SalesHeader_ShipCity; "Sales Header"."Ship-to City")
            {
            }
            column(SalesHeader_ShipToPostCode; "Sales Header"."Ship-to Post Code")
            {
            }
            column(SalesHeader_ShipCountryCode; "Sales Header"."Ship-to Country/Region Code")
            {
            }
            column(SalesHeader_CustContact; "Sales Header"."Bill-to Contact")
            {
            }
            column(SalesHeader_ShipContact; "Sales Header"."Ship-to Contact")
            {
            }
            column(SalesHeader_SellContact; "Sales Header"."Sell-to Contact")
            {
            }
            column(SalesHeader_Comment; "Sales Header".Comment)
            {
            }
            column(SalesForce_Comment; "Sales Header"."SalesForce Comment")
            {
            }
            column(SalesHeader_ShipCountryName; ShipCountryName)
            {
            }
            column(SalesHeader_CustCountryName; CustCountryName)
            {
            }
            column(SalesHeader_CurrencyCode; CurrencyCode)
            {
            }
            column(SalesHeader_PaymentTermCode; "Sales Header"."Payment Terms Code")
            {
            }
            column(PaymentTermDescription; PaymentTermDescription)
            {
            }
            column(PaymentMethodName; PaymentMethodName)
            {
            }
            column(ShipmentMethodName; ShipmentMethodName)
            {
            }
            column(SalesHeader_ShipmentDate; "Sales Header"."Shipment Date")
            {
            }
            column(TotalAmt; TotalAmt)
            {
            }
            column(TotalInclVATAmt; TotalInclVATAmt)
            {
            }
            column(TotalVATAmt; TotalVATAmt)
            {
            }
            column(TotalExclVATAmt; TotalExclVATAmt)
            {
            }
            column(VATRate; gs_VATRate)
            {
            }
            column(UnitPriceLabel; gs_UnitPriceLabel)
            {
            }
            column(BankName; BankInfo1[1])
            {
            }
            column(BankAccountNo; BankInfo1[2])
            {
            }
            column(IBAN; BankInfo1[3])
            {
            }
            column(BankInfo11; BankInfo[1] [1])
            {
            }
            column(BankInfo12; BankInfo[1] [2])
            {
            }
            column(BankInfo13; BankInfo[1] [3])
            {
            }
            column(BankInfo14; BankInfo[1] [4])
            {
            }
            column(BankInfo21; BankInfo[2] [1])
            {
            }
            column(BankInfo22; BankInfo[2] [2])
            {
            }
            column(BankInfo23; BankInfo[2] [3])
            {
            }
            column(BankInfo24; BankInfo[2] [4])
            {
            }
            column(BankInfo31; BankInfo[3] [1])
            {
            }
            column(BankInfo32; BankInfo[3] [2])
            {
            }
            column(BankInfo33; BankInfo[3] [3])
            {
            }
            column(BankInfo34; BankInfo[3] [4])
            {
            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"),
                               "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.");
                column(DocumentNo_SalesLine; "Sales Line"."Document No.")
                {
                }
                column(SalesLine_LineNo; "Sales Line"."Line No.")
                {
                }
                column(SalesLine_No; "Sales Line"."No.")
                {
                }
                column(SalesLine_Description; "Sales Line".Description)
                {
                }
                column(SalesLine_Quantity; "Sales Line".Quantity)
                {
                }
                column(SalesLine_DirectUnitCost; "Sales Line"."Unit Price")
                {
                }
                column(SalesLine_LineAmount; "Sales Line"."Line Amount")
                {
                }
                column(SalesLine_Description2; "Sales Line"."Description 2")
                {
                }
                column(SalesLine_Discount; "Sales Line"."Line Discount %")
                {
                }
                column(SalesLine_DicountAmount; "Sales Line"."Line Discount Amount")
                {
                }
                column(SalesLine_VATPercent; "Sales Line"."VAT %")
                {
                }
                column(Sorting; SalesLine.Sorting)
                {
                }

                trigger OnPreDataItem()
                begin
                    SETCURRENTKEY("Document No.", Sorting, "Line No.");
                end;
            }

            trigger OnAfterGetRecord()
            var
                ldc_VATRate: Decimal;
            begin
                SalesName := '';
                SalesEmail := '';
                IF SalesPerson.GET("Salesperson Code") THEN BEGIN
                    SalesName := SalesPerson.Name;
                    SalesEmail := SalesPerson."E-Mail";
                END;

                CLEAR(CustCountryName);
                CLEAR(ShipCountryName);
                IF Country.GET("Bill-to Country/Region Code") THEN
                    CustCountryName := Country.Name;

                IF Country.GET("Ship-to Country/Region Code") THEN
                    ShipCountryName := Country.Name;

                PaymentTermDescription := '';
                IF PaymentTerms.GET("Payment Terms Code") THEN
                    PaymentTermDescription := PaymentTerms.Description;

                PaymentMethodName := '';
                IF PaymentMethod.GET("Payment Method Code") THEN
                    PaymentMethodName := PaymentMethod.Description;
                ShipmentMethodName := '';
                IF ShipmentMethod.GET("Shipment Method Code") THEN
                    ShipmentMethodName := ShipmentMethod.Description;

                IF "Currency Code" <> '' THEN
                    CurrencyCode := "Currency Code"
                ELSE BEGIN
                    GLSetup.GET;
                    CurrencyCode := GLSetup."LCY Code";
                END;

                SalesLine.SETRANGE("Document Type", "Document Type");
                SalesLine.SETRANGE("Document No.", "No.");
                SalesLine.SETFILTER(Quantity, '<>%1', 0);
                IF SalesLine.FINDSET THEN
                    REPEAT
                        IF gs_VATRate = '' THEN BEGIN
                            gs_VATRate := FORMAT(SalesLine."VAT %");
                            ldc_VATRate := SalesLine."VAT %";
                        END ELSE BEGIN
                            IF ldc_VATRate <> SalesLine."VAT %" THEN BEGIN
                                gs_VATRate := 'MIX VAT';
                            END;
                        END;
                        TotalAmt += SalesLine."Line Amount";
                        TotalInclVATAmt += SalesLine."Amount Including VAT";
                        TotalExclVATAmt += SalesLine.Amount;


                    UNTIL SalesLine.NEXT = 0;
                TotalVATAmt := TotalInclVATAmt - TotalExclVATAmt;
                IF gs_VATRate = 'MIX VAT' THEN
                    gs_VATRate := ''
                ELSE
                    gs_VATRate := gs_VATRate + '%';
                //MESSAGE(FORMAT(TotalInclVATAmt));
                IF Cust.GET("Bill-to Customer No.") THEN;

                IF "Sales Header"."Prices Including VAT" THEN
                    gs_UnitPriceLabel := 'Unit Price' // (Incl. VAT)
                ELSE
                    gs_UnitPriceLabel := 'Unit Price'; // (Excl. VAT)

                //LT>>
                UpdateDateOrderConfirmation("Sales Header")
                //LT<<
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
        BankInfo1[1] := CompanyInfo."Bank Name";
        BankInfo1[2] := CompanyInfo."Bank Account No.";
        BankInfo1[3] := CompanyInfo.IBAN;



        BankFilter := CompanyInfo."Bank Branch No.";

        BankRec.RESET;
        BankRec.SETFILTER("No.", BankFilter);
        BankIndex := 0;
        IF BankRec.FIND('-') THEN BEGIN
            REPEAT
                IF BankIndex < 3 THEN BEGIN
                    BankIndex += 1;
                    BankInfo[BankIndex] [1] := BankRec."Currency Code";
                    BankInfo[BankIndex] [2] := BankRec.Name;
                    BankInfo[BankIndex] [3] := BankRec."Name 2";
                    BankInfo[BankIndex] [4] := BankRec."Bank Account No.";
                END;
            UNTIL BankRec.NEXT = 0;
        END;
    end;

    var
        CompanyInfo: Record "Company Information";
        GLSetup: Record "General Ledger Setup";
        Cust: Record Customer;
        SalesPerson: Record "Salesperson/Purchaser";
        Country: Record "Country/Region";
        SalesLine: Record "Sales Line";
        PaymentTerms: Record "Payment Terms";
        PaymentMethod: Record "Payment Method";
        ShipmentMethod: Record "Shipment Method";
        SalesName: Text;
        SalesEmail: Text;
        CountryName: Text;
        CustCountryName: Text;
        CurrencyCode: Code[10];
        PaymentTermDescription: Text;
        ShipCountryName: Text;
        PaymentMethodName: Text;
        ShipmentMethodName: Text;
        TotalAmt: Decimal;
        TotalInclVATAmt: Decimal;
        TotalVATAmt: Decimal;
        TotalExclVATAmt: Decimal;
        gs_VATRate: Text;
        gs_UnitPriceLabel: Text[30];
        BankInfo1: array[3] of Text;
        BankInfo: array[3, 4] of Text;
        BankRec: Record "Bank Account";
        BankIndex: Integer;
        BankFilter: Text;

    local procedure UpdateDateOrderConfirmation(RecSalesHeader: Record "Sales Header")
    begin
        IF RecSalesHeader."Date Order Confirmation" <> 0D THEN
            EXIT;
        RecSalesHeader."Date Order Confirmation" := WORKDATE;
        RecSalesHeader.MODIFY;
    end;
}

