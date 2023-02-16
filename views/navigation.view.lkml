view: navigation {
  sql_table_name: demo_db.orders ;;

  dimension: link_1 {
    type: string
    sql: 1 ;;
    html: <a href="https://www.google.com">Click me to go to Google!</a> ;;
    label: "Link to Google"
  }

  dimension: link_2 {
    type: string
    sql: 1 ;;
    html: <a href="https://www.looker.com">Click me to go to Looker!</a> ;;
    label: "Link to Looker"
  }

  dimension: link_3 {
    type: string
    sql: 1 ;;
    html: <a href="/dashboards/1">Click me to go to Dashboard 1!</a> ;;
    label: "Dashboard 1 Link"
  }
}
