view: orders_pdt {
  derived_table: {
    sql: SELECT * FROM orders ;;
    persist_for: "1 hour"
    indexes: ["id"]
  }
  drill_fields: [id]

  parameter: relative_period {
    type: unquoted
    label: "Relative Period"
    description: "'All 'TD' filters exclude current day."
    allowed_value: {
      label: "Today"
      value: "Today"
    }

    allowed_value: {
      label: "Yesterday"
      value: "Yesterday"
    }
    allowed_value: {
      label: "WTD"
      value: "Week_To_Date"
    }

    allowed_value: {
      label: "LW"
      value: "Last Week"
    }

    allowed_value: {
      label: "L4W"
      value: "Last 4 Week"
    }
    allowed_value: {
      label: "MTD"
      value: "Month To Date"
    }
    allowed_value: {
      label: "QTD"
      value: "Quarter To Date"
    }
    allowed_value: {
      label: "STD"
      value: "Season To Date"
    }
    allowed_value: {
      label: "YTD"
      value: "Year To Date"
    }

    allowed_value: {
      label: "LY WTD"
      value: "LY Week To Date"
    }

    allowed_value: {
      label: "LY MTD"
      value: "LY Month To Date"
    }

    allowed_value: {
      label: "LY QTD"
      value: "LY Quarter To Date"
    }

    allowed_value: {
      label: "LY STD"
      value: "LY Season To Date"
    }

    allowed_value: {
      label: "LY YTD"
      value: "LY Year To Date"
    }

    allowed_value: {
      label: "None"
      value: "None"
    }
  }

  dimension: dynamic_pop_filter {
    #hidden: yes
    type: yesno
    sql: {% if relative_period._parameter_value == 'Today' %}  'today'
          {% elsif relative_period._parameter_value == 'Yesterday' %} 'yesterday'
          {% elsif relative_period._parameter_value == 'Week_To_Date' %} 'week to date'
          {% elsif relative_period._parameter_value == 'Last Week' %} 'last week'
                 {% elsif relative_period._parameter_value == 'Last 4  Week' %} 'last 4 weeks'
                 {% elsif relative_period._parameter_value == 'Month To Date' %}  'month to date'
                 {% elsif relative_period._parameter_value == 'Quarter To Date' %} 'quarter to date'
                 {% elsif relative_period._parameter_value == 'Season To Date' %}  'season to date'
                 {% elsif relative_period._parameter_value == 'Year To Date' %} 'year to date'
                 {% elsif relative_period._parameter_value == 'LY Week To Date' %} 'ly week to date'
                 {% elsif relative_period._parameter_value == 'LY Month To Date' %} 'ly month to date'
                 {% elsif relative_period._parameter_value == 'LY Quarter To Date'%}  'ly quarter to date'
                 {% elsif relative_period._parameter_value == 'LY Season To Date' %} 'ly season to date'
                 {% elsif relative_period._parameter_value == 'LY Year To Date' %} 'ly year to date'
                 {% else %}
            1=1
            {% endif %} ;;
  }


  parameter: select_timeframe_extended {
    type: unquoted
    allowed_value: {
      value: "year"
    }
    allowed_value: {
      value: "month"
    }
    allowed_value: {
      value: "week"
    }
    allowed_value: {
      value: "quarter"
    }
    allowed_value: {
      value: "preyear"
    }
  }

  dimension: label_test {
    type: string
    sql: ${TABLE}.status ;;
    label: "Sales {% if select_timeframe_extended._parameter_value == 'year' %}
    {{ 'now' | date: '%Y' }}
    {% elsif select_timeframe_extended._parameter_value == 'month' %}
    {{ 'now' | date: '%b %Y' }}
    {% elsif select_timeframe_extended._parameter_value == 'week' %}
    Week {{ 'now' | date: '%W %Y' }}
    {% elsif select_timeframe_extended._parameter_value == 'quarter' %}
    {% assign month = 'now' | date: '%m' %}
    {% if month == '01' or month == '02' or month == '03' %}Q1
    {% elsif month == '04' or month == '05' or month == '06' %}Q2
    {% elsif month == '07' or month == '08' or month == '09' %}Q3
    {% else %}Q4
    {% endif %}
    {{ 'now' | date: '%Y' }}
    {% elsif select_timeframe_extended._parameter_value == 'preyear' %}
    {{ 'now' | date: '%Y' | minus:1 }}
    {% endif %}"
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: test_created_raw {
    type: date_raw
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: case_when_status {
    type: string
    sql: CASE WHEN ${status} = 'complete' THEN 'Complete'
      ELSE 'Other' END;;
  }

  dimension: one_hundred {
    type: number
    sql: '100' ;;
  }

  measure: sum_of_one_million {
    type: sum
    sql: ${one_hundred} ;;
  }

  dimension: user_id {
    view_label: "Basket Data"
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: _select_me_for_more_info {
    view_label: " Need Help With This Explore?"
    type: string
    sql: 'Click here for metric definitions!' ;;
    html: <a href="https://helpful-link.walmart.com">{{rendered_value}}</a> ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      order_items_vijaya.count,
      ten_million_orders.count
    ]
  }
}
