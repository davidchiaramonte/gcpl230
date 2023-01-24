view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]


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

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
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
