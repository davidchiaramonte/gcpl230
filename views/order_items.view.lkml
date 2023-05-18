include: "_date_comparison.view"
view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]
  extends: [_date_comparison]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: event_raw {
    sql: ${TABLE}.returned_at ;;
    type: date_raw
    hidden: yes
  }

  dimension: html_test {
    type: string
    sql: '1' ;;
    html: <i class="fa-solid fa-dinosaur">{{rendered_value}}</i>;;
    #html: <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" /> ;;
    #html: <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /> ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }

  #dimension_group: date {
   # label: "Date"
    #type: time
    #timeframes: [
     # raw,
      #time,
      #date,
     # week,
    #  month,
    #  quarter,
    #  year
    #]
    #sql: ${TABLE}."DATE" ;;
   # convert_tz: no
  #}

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
    convert_tz: no
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
