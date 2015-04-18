Time::DATE_FORMATS[:day] = '%d'
Time::DATE_FORMATS[:month] = '%B'
Time::DATE_FORMATS[:year] = '%Y'
Time::DATE_FORMATS[:short_ordinal]  = ->(time) { time.strftime("%B #{time.day.ordinalize}") }
