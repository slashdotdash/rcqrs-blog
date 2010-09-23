Date::DATE_FORMATS[:ordinal] = lambda {|date| date.strftime("%B #{date.day.ordinalize}, %Y") }
Time::DATE_FORMATS[:ordinal] = lambda {|time| time.strftime("%B #{time.day.ordinalize}, %Y at %H:%M") }