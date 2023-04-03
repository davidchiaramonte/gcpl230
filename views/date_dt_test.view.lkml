view: date_dt_test {
  derived_table: {
    sql: SELECT *
          FROM demo_db.orders
          WHERE  (orders.created_at) >= ({% date_start date_filter %},INTERVAL -1 day) AND ( orders.created_at  ) < (({% date_end date_filter %},INTERVAL -6 day),INTERVAL 1 day)
      ;;
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

  filter: date_filter {
    type: date
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
