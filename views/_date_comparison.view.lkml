# this is the code for the date comparison tool, which mimics what google 360 does in the browser in comparing two different date ranges. use with _date_dim.view.lkml
# link for this: https://github.com/teamdatatonic/looker-date-comparison/blob/master/_date_comparison.view.lkml
# Implementation: https://github.com/teamdatatonic/looker-date-comparison

# this is the code for the date comparison tool, which mimics what google 360 does in the browser in comparing two different date ranges. use with _date_dim.view.lkml
view: _date_comparison {
  extension: required
  filter: current_date_range {
    view_label: "Date Range Comparison Fields"
    label: "1. Date Range"
    description: "Select the date range you are interested in using this filter, can be used by itself. Make sure any filter on Event Date covers this period, or is removed."
    type: date
  }
  filter: previous_date_range {
    view_label: "Date Range Comparison Fields"
    label: "2b. Compare To (Custom):"
# group_label: "Compare to:"
    description: "Use this if you want to specify a custom date range to compare to (limited to 2 comparison periods). Always use with '1. Date Range' filter (or it will error). Make sure any filter on Event Date covers this period, or is removed."
    type: date
  }

  dimension: days_in_period {
    description: "Gives the number of days in the current period date range"
    type: number
    sql: DATEDIFF({% date_start current_date_range %}, {% date_end current_date_range %}) ;;
    hidden: yes
  }

  dimension: period_1_start {
    description: "Calculates the start of the previous period"
    type: date
    sql:
    {%date_start current_date_range %} ;;
    hidden: yes
  }

  dimension: period_1_end {
    description: "Calculates the start of the previous period"
    type: date
    sql:
    {% date_end current_date_range %} ;;

    hidden: yes
  }

  dimension: period_2_start {
    description: "Calculates the start of the previous period"
    type: date
    sql:
    {% if compare_to._in_query %}
    {% if compare_to._parameter_value == "Period" %}
    DATE_ADD(day, -1*${days_in_period},{% date_start current_date_range %} )

      {% elsif compare_to._parameter_value == "Year" and previous_year_shifted_normal._parameter_value == "Shifted" %}
      DATE_ADD(day,-364,{% date_start current_date_range %} )

      {% elsif compare_to._parameter_value == "Year" and previous_year_shifted_normal._parameter_value == "Normal" %}
      DATE_ADD(day,-365,{% date_start current_date_range %} )

      {% else %}
      DATE_ADD({% parameter compare_to %},-1,{% date_start current_date_range %} )
      {% endif %}
      {% else %}
      {% date_start previous_date_range %}
      {% endif %};;
    hidden: yes
  }

  dimension: period_2_end {
    description: "Calculates the end of the previous period"
    type: date
    sql:
    {% if compare_to._in_query %}
    {% if compare_to._parameter_value == "Period" %}
    DATE_ADD(day,-1,{% date_start current_date_range %})

      {% elsif compare_to._parameter_value == "Year" and previous_year_shifted_normal._parameter_value == "Shifted" %}
      DATE_ADD(day,-364,{% date_end current_date_range %} )

      {% elsif compare_to._parameter_value == "Year" and previous_year_shifted_normal._parameter_value == "Normal" %}
      DATE_ADD(day,-365,{% date_end current_date_range %} )

      {% else %}
      DATE_ADD({% parameter compare_to %},-1,DATE_ADD(day,-1,{% date_end current_date_range %} ) )
      {% endif %}
      {% else %}
      {% date_end previous_date_range %}
      {% endif %};;
    hidden: yes
  }

  dimension: period_3_start {
    description: "Calculates the start of 2 periods ago"
    type: date
    sql:
    {% if compare_to._parameter_value == "Period" %}
    DATE_ADD(day,-2*${days_in_period},{% date_start current_date_range %})
    {% else %}
    DATE_ADD({% parameter compare_to %},-2,{% date_start current_date_range %} )
    {% endif %};;
    hidden: yes

  }

  dimension: period_3_end {
    description: "Calculates the end of 2 periods ago"
    type: date
    sql:
    {% if compare_to._parameter_value == "Period" %}
    DATE_ADD(day,-1,${period_2_start})
    {% else %}
    DATE_ADD({% parameter compare_to %},-2,DATE_ADD(day,-1,{% date_end current_date_range %}) )
    {% endif %};;
    hidden: yes
  }

  dimension: period_4_start {
    description: "Calculates the start of 4 periods ago"
    type: date
    sql:
    {% if compare_to._parameter_value == "Period" %}
    DATE_ADD(day,-3*${days_in_period},{% date_start current_date_range %} )
    {% else %}
    DATE_ADD({% parameter compare_to %},-3,{% date_start current_date_range %} )
    {% endif %};;
    hidden: yes
  }

  dimension: period_4_end {
    description: "Calculates the end of 4 periods ago"
    type: date
    sql:
    {% if compare_to._parameter_value == "Period" %}
    DATE_ADD(day,-1,${period_2_start})
    {% else %}
    DATE_ADD({% parameter compare_to %},-3,DATE_ADD(day,-1,{% date_end current_date_range %}) )
    {% endif %};;
    hidden: yes
  }

  parameter: compare_to {
    description: "Choose the period you would like to compare to. Must be used with Current Date Range filter"
    label: "2a. Compare To (Templated):"
    type: unquoted
    allowed_value: {
      label: "Previous Period"
      value: "Period"
    }
    allowed_value: {
      label: "Previous Week"
      value: "Week"
    }
    allowed_value: {
      label: "Previous Month"
      value: "Month"
    }
    allowed_value: {
      label: "Previous Quarter"
      value: "Quarter"
    }
    allowed_value: {
      label: "Previous Year"
      value: "Year"
    }
    default_value: "Period"
    view_label: "Date Range Comparison Fields"
  }

  parameter: comparison_periods {
    label: "3. Number of Periods"
    description: "Choose the number of periods you would like to compare - defaults to 2. Only works with templated periods from step 2."
    type: unquoted

    allowed_value: {
      label: "1"
      value: "1"
    }

    allowed_value: {
      label: "2"
      value: "2"
    }
    allowed_value: {
      label: "3"
      value: "3"
    }
    allowed_value: {
      label: "4"
      value: "4"
    }
    default_value: "2"
    view_label: "Date Range Comparison Fields"
  }

  parameter: previous_year_shifted_normal {
    description: "Choose this to compare previous year comparison type. Use it with field -
    2a. Compare To (Templated) [compare_to] and 3. Number of Periods[comparison_periods] "
    label: "Previous Year Comparison Type:"
    type: unquoted
    allowed_value: {
      label: "Shifted"
      value: "Shifted"
    }
    allowed_value: {
      label: "Normal"
      value: "Normal"
    }

    default_value: "Normal"
    view_label: "Date Range Comparison Fields"
  }

  dimension: period {
    view_label: "Date Range Comparison Fields"
    label: "Period"
    description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period', 'Previous Period' or '3 Periods Ago'"
    type: string
    order_by_field: order_for_period
    sql:
    {% if current_date_range._is_filtered %}
    CASE
    -- WHEN {% condition current_date_range %} ${event_raw} {% endcondition %}
    WHEN ${event_raw} between ${period_1_start} and ${period_1_end}
    THEN 'Current {% parameter compare_to %}'
    WHEN ${event_raw} between ${period_2_start} and ${period_2_end}
    THEN 'Previous {% parameter compare_to %}'
    WHEN ${event_raw} between ${period_3_start} and ${period_3_end}
    THEN '2 {% parameter compare_to %}s Ago'
    WHEN ${event_raw} between ${period_4_start} and ${period_4_end}
    THEN '3 {% parameter compare_to %}s Ago'
    END
    {% else %}
    NULL
    {% endif %}
    ;;
  }
  dimension: period_pivot {
    view_label: "Date Range Comparison Fields"
    label: "Period Pivot-Use This"
    sql: case when ${period}='Current Period' then 'CP'
      else case when ${period}='Previous Period' then 'PP'
      else ${period} end end ;;
  }

  dimension: order_for_period {
    hidden: yes
    view_label: "Date Range Comparison Fields"
    label: "Period"
    description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period', 'Previous Period' or '3 Periods Ago'"
    type: string
    sql:
    {% if current_date_range._is_filtered %}
    CASE
    WHEN {% condition current_date_range %} (${event_raw}) {% endcondition %}
    THEN 1
    WHEN ${event_raw} between ${period_2_start} and ${period_2_end}
    THEN 2
    WHEN ${event_raw} between ${period_3_start} and ${period_3_end}
    THEN 3
    WHEN ${event_raw} between ${period_4_start} and ${period_4_end}
    THEN 4
    END
    {% else %}
    NULL
    {% endif %}
    ;;
  }

  dimension_group: date_in_period {
    description: "Use this as your date dimension when comparing periods. Aligns the all previous periods onto the current period"
    label: "Current Period"
    type: time
    sql: DATE_ADD(day,${day_in_period}-1,{% date_start current_date_range %} ) ;;
    view_label: "Date Range Comparison Fields"
    timeframes: [date, week, month, quarter, year, month_name, week_of_year,
      fiscal_month_num,fiscal_quarter,fiscal_year,fiscal_quarter_of_year]
  }

  dimension: day_in_period {
    description: "Gives the number of days since the start of each periods. Use this to align the event dates onto the same axis, the axes will read 1,2,3, etc."
    type: number
    sql:
    {% if current_date_range._is_filtered %}
    CASE
    -- WHEN {% condition current_date_range %} (${event_raw}) {% endcondition %}
    WHEN ${event_raw} between ${period_1_start} and ${period_1_end}
    THEN DATEDIFF({% date_start current_date_range %},${event_raw})+1

      WHEN ${event_raw} between ${period_2_start} and ${period_2_end}
      THEN DATEDIFF(${period_2_start},${event_raw})+1

      WHEN ${event_raw} between ${period_3_start} and ${period_3_end}
      THEN DATEDIFF(${period_3_start},${event_raw})+1

      WHEN ${event_raw} between ${period_4_start} and ${period_4_end}
      THEN DATEDIFF(${period_4_start},${event_raw})+1
      END

      {% else %} NULL
      {% endif %}
      ;;
    hidden: yes
  }
# Added by Ameya on 09/27/2022
#Added for Day Level Actuals Dashboard to provide time scale feature
  parameter: date_granularity {

    type: string

    allowed_value: { value: "Day" }

    allowed_value: { value: "Week"}

    allowed_value: { value: "Month" }

    allowed_value: { value: "Quarter" }

    allowed_value: { value: "Year" }
  }

#Added for Day Level Actuals Dashboard to provide time scale feature

  dimension: dynamic_date_created {

    label_from_parameter: date_granularity

    sql:CASE WHEN {% parameter date_granularity %}='Day' THEN CAST(${date_in_period_date} AS STRING)
      WHEN {% parameter date_granularity %}='Month' THEN CAST(${date_in_period_month} AS STRING)
      WHEN {% parameter date_granularity %}='Week' THEN CAST(${date_in_period_week} AS STRING)
      WHEN {% parameter date_granularity %}='Quarter' THEN CAST(${date_in_period_quarter} AS STRING)
      WHEN {% parameter date_granularity %}='Year' THEN CAST(${date_in_period_year} AS STRING)
      ELSE NULL END ;;
  }

}
