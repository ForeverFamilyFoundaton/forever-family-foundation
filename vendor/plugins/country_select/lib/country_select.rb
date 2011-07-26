# CountrySelect
module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using country_options_for_select to generate the list of option tags.
      def country_select(object, method, priority_countries = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_country_select_tag(priority_countries, options, html_options)
      end
      # Returns a string of option tags for pretty much any country in the world. Supply a country name as +selected+ to
      # have it marked as the selected option tag. You can also supply an array of countries as +priority_countries+, so
      # that they will be listed above the rest of the (long) list.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
      def country_options_for_select(selected = nil, priority_countries = nil)
        country_options = ""

        if priority_countries
          country_options += options_for_select(priority_countries, selected)
          country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
        end

        return country_options + options_for_select(COUNTRIES, selected)
      end
      # All the countries included in the country_options output.
      COUNTRIES = [["Afghanistan", "AF"], ["Albania", "AL"], ["Algeria", "DZ"], ["American Samoa", "AS"], ["Andorra", "AD"], ["Angola", "AO"], ["Anguilla", "AI"], ["Antigua and Barbuda", "AG"], ["Argentina", "AR"], ["Armenia", "AM"], ["Aruba", "AW"], ["Australia", "AU"], ["Austria", "AT"], ["Azerbaijan", "AZ"], ["Bahamas", "BS"], ["Bahrain", "BH"], ["Bangladesh", "BD"], ["Barbados", "BB"], ["Belarus", "BY"], ["Belgium", "BE"], ["Belize", "BZ"], ["Benin", "BJ"], ["Bermuda", "BM"], ["Bhutan", "BT"], ["Bolivia", "BO"], ["Bosnia and Herzegovina", "BA"], ["Botswana", "BW"], ["Brazil", "BR"], ["Brunei Darussalam", "BN"], ["Bulgaria", "BG"], ["Burkina Faso", "BF"], ["Burundi", "BI"], ["Cambodia", "KH"], ["Cameroon", "CM"], ["Canada", "CA"], ["Cape Verde", "CV"], ["Cayman Islands", "KY"], ["Central African Republic", "CF"], ["Chad", "TD"], ["Chile", "CL"], ["China", "CN"], ["Colombia", "CO"], ["Comoros", "KM"], ["Congo", "CG"], ["Congo, the Democratic Republic of the", "CD"], ["Cook Islands", "CK"], ["Costa Rica", "CR"], ["Cote D'Ivoire", "CI"], ["Croatia", "HR"], ["Cuba", "CU"], ["Cyprus", "CY"], ["Czech Republic", "CZ"], ["Denmark", "DK"], ["Djibouti", "DJ"], ["Dominica", "DM"], ["Dominican Republic", "DO"], ["Ecuador", "EC"], ["Egypt", "EG"], ["El Salvador", "SV"], ["Equatorial Guinea", "GQ"], ["Eritrea", "ER"], ["Estonia", "EE"], ["Ethiopia", "ET"], ["Falkland Islands (Malvinas)", "FK"], ["Faroe Islands", "FO"], ["Fiji", "FJ"], ["Finland", "FI"], ["France", "FR"], ["French Guiana", "GF"], ["French Polynesia", "PF"], ["Gabon", "GA"], ["Gambia", "GM"], ["Georgia", "GE"], ["Germany", "DE"], ["Ghana", "GH"], ["Gibraltar", "GI"], ["Greece", "GR"], ["Greenland", "GL"], ["Grenada", "GD"], ["Guadeloupe", "GP"], ["Guam", "GU"], ["Guatemala", "GT"], ["Guinea", "GN"], ["Guinea-Bissau", "GW"], ["Guyana", "GY"], ["Haiti", "HT"], ["Holy See (Vatican City State)", "VA"], ["Honduras", "HN"], ["Hong Kong", "HK"], ["Hungary", "HU"], ["Iceland", "IS"], ["India", "IN"], ["Indonesia", "ID"], ["Iran, Islamic Republic of", "IR"], ["Iraq", "IQ"], ["Ireland", "IE"], ["Israel", "IL"], ["Italy", "IT"], ["Jamaica", "JM"], ["Japan", "JP"], ["Jordan", "JO"], ["Kazakhstan", "KZ"], ["Kenya", "KE"], ["Kiribati", "KI"], ["Korea, Democratic People's Republic of", "KP"], ["Korea, Republic of", "KR"], ["Kuwait", "KW"], ["Kyrgyzstan", "KG"], ["Lao People's Democratic Republic", "LA"], ["Latvia", "LV"], ["Lebanon", "LB"], ["Lesotho", "LS"], ["Liberia", "LR"], ["Libyan Arab Jamahiriya", "LY"], ["Liechtenstein", "LI"], ["Lithuania", "LT"], ["Luxembourg", "LU"], ["Macao", "MO"], ["Macedonia, the Former Yugoslav Republic of", "MK"], ["Madagascar", "MG"], ["Malawi", "MW"], ["Malaysia", "MY"], ["Maldives", "MV"], ["Mali", "ML"], ["Malta", "MT"], ["Marshall Islands", "MH"], ["Martinique", "MQ"], ["Mauritania", "MR"], ["Mauritius", "MU"], ["Mexico", "MX"], ["Micronesia, Federated States of", "FM"], ["Moldova, Republic of", "MD"], ["Monaco", "MC"], ["Mongolia", "MN"], ["Montserrat", "MS"], ["Morocco", "MA"], ["Mozambique", "MZ"], ["Myanmar", "MM"], ["Namibia", "NA"], ["Nauru", "NR"], ["Nepal", "NP"], ["Netherlands", "NL"], ["Netherlands Antilles", "AN"], ["New Caledonia", "NC"], ["New Zealand", "NZ"], ["Nicaragua", "NI"], ["Niger", "NE"], ["Nigeria", "NG"], ["Niue", "NU"], ["Norfolk Island", "NF"], ["Northern Mariana Islands", "MP"], ["Norway", "NO"], ["Oman", "OM"], ["Pakistan", "PK"], ["Palau", "PW"], ["Panama", "PA"], ["Papua New Guinea", "PG"], ["Paraguay", "PY"], ["Peru", "PE"], ["Philippines", "PH"], ["Pitcairn", "PN"], ["Poland", "PL"], ["Portugal", "PT"], ["Puerto Rico", "PR"], ["Qatar", "QA"], ["Reunion", "RE"], ["Romania", "RO"], ["Russian Federation", "RU"], ["Rwanda", "RW"], ["Saint Helena", "SH"], ["Saint Kitts and Nevis", "KN"], ["Saint Lucia", "LC"], ["Saint Pierre and Miquelon", "PM"], ["Saint Vincent and the Grenadines", "VC"], ["Samoa", "WS"], ["San Marino", "SM"], ["Sao Tome and Principe", "ST"], ["Saudi Arabia", "SA"], ["Senegal", "SN"], ["Seychelles", "SC"], ["Sierra Leone", "SL"], ["Singapore", "SG"], ["Slovakia", "SK"], ["Slovenia", "SI"], ["Solomon Islands", "SB"], ["Somalia", "SO"], ["South Africa", "ZA"], ["Spain", "ES"], ["Sri Lanka", "LK"], ["Sudan", "SD"], ["Suriname", "SR"], ["Svalbard and Jan Mayen", "SJ"], ["Swaziland", "SZ"], ["Sweden", "SE"], ["Switzerland", "CH"], ["Syrian Arab Republic", "SY"], ["Taiwan, Province of China", "TW"], ["Tajikistan", "TJ"], ["Tanzania, United Republic of", "TZ"], ["Thailand", "TH"], ["Togo", "TG"], ["Tokelau", "TK"], ["Tonga", "TO"], ["Trinidad and Tobago", "TT"], ["Tunisia", "TN"], ["Turkey", "TR"], ["Turkmenistan", "TM"], ["Turks and Caicos Islands", "TC"], ["Tuvalu", "TV"], ["Uganda", "UG"], ["Ukraine", "UA"], ["United Arab Emirates", "AE"], ["United Kingdom", "GB"], ["United States", "US"], ["Uruguay", "UY"], ["Uzbekistan", "UZ"], ["Vanuatu", "VU"], ["Venezuela", "VE"], ["Viet Nam", "VN"], ["Virgin Islands, British", "VG"], ["Virgin Islands, U.s.", "VI"], ["Wallis and Futuna", "WF"], ["Western Sahara", "EH"], ["Yemen", "YE"], ["Zambia", "ZM"], ["Zimbabwe", "ZW"]]unless const_defined?("COUNTRIES")
    end
    
    class InstanceTag
      def to_country_select_tag(priority_countries, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            country_options_for_select(value, priority_countries),
            options, value
          ), html_options
        )
      end
    end
    
    class FormBuilder
      def country_select(method, priority_countries = nil, options = {}, html_options = {})
        @template.country_select(@object_name, method, priority_countries, options.merge(:object => @object), html_options)
      end
    end
  end
end
