module Subject exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Fakturoid.Subject exposing (..)
import Json.Decode exposing (..)


testSuccessfulDecoding =
    test "Decode valid JSON" <|
        \_ ->
            let
                json =
                    """
                {
                    "id": 28,
                    "custom_id": null,
                    "type": "both",
                    "name": "MICROSOFT s.r.o.",
                    "street": "Vyskočilova 1461/2a",
                    "street2": null,
                    "city": "Praha",
                    "zip": "14000",
                    "country": "Česká republika",
                    "registration_no": "47123737",
                    "vat_no": "CZ47123737",
                    "bank_account": "",
                    "iban": "",
                    "variable_symbol": "1234567890",
                    "full_name": "",
                    "email": "",
                    "email_copy": "",
                    "phone": "",
                    "web": "",
                    "avatar_url": "https://ssl.fakturoid.cz/images/company-contact.png",
                    "html_url": "https://app.fakturoid.cz/applecorp/subjects/28",
                    "url": "https://app.fakturoid.cz/api/v2/accounts/applecorp/subjects/28.json",
                    "updated_at": "2012-06-02T09:34:47+02:00"
                }
                """

                output =
                    decodeString subjectDecoder json
            in
                Expect.equal output
                    (Ok
                        { id = 28
                        , name = "MICROSOFT s.r.o."
                        , email = Just ""
                        , privateNote = Nothing
                        }
                    )
