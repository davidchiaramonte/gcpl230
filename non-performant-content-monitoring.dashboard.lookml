- dashboard: nonperformant_content_monitoring
  title: Non-Performant Content Monitoring
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: w6v9xONWvPp1Sv4MDDx2xv
  elements:
  - title: Dashboards with >25 Tiles
    name: Dashboards with >25 Tiles
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard.title, dashboard.link, dashboard_element.count_look, dashboard_element.count_lookless,
      dashboard_element.count_text, dashboard_element.count_merge_query, dashboard_element.count,
      query.count]
    filters:
      dashboard_element.count: ">25"
      dashboard.deleted_date: 'NULL'
      dashboard.moved_to_trash: 'No'
    sorts: [query.count desc]
    limit: 100
    dynamic_fields: [{table_calculation: total_query_tiles, label: Total Query Tiles,
        expression: "${dashboard_element.count}-${dashboard_element.count_text}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 592616d0-58e4-4968-9030-928ef38b7b50
      palette_id: e7303a54-e53e-4cf0-abc9-2f175c1128e0
    show_sql_query_menu_options: false
    column_order: [dashboard.title, dashboard.link, total_query_tiles, query.count,
      dashboard_element.count, dashboard_element.count_look, dashboard_element.count_lookless,
      dashboard_element.count_text, dashboard_element.count_merge_query]
    show_totals: true
    show_row_totals: true
    series_labels:
      query.count: Total Queries Generated
      dashboard_element.count_look: Look Tiles
      dashboard_element.count_lookless: Lookless Tiles
      dashboard_element.count_text: Text Tiles
      dashboard_element.count: Total Tiles
      dashboard_element.count_merge_query: Merge Query Tiles
    series_column_widths:
      total_query_tiles: 130
      dashboard_element.count: 89
      dashboard.title: 142
      dashboard.link: 88
      dashboard_element.count_look: 89
      query.count: 194
      dashboard_element.count_text: 89
      dashboard_element.count_lookless: 117
      dashboard_element.count_merge_query: 137
    series_cell_visualizations:
      dashboard_element.count_look:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1D98D3",
        font_color: !!null '', color_application: {collection_id: 592616d0-58e4-4968-9030-928ef38b7b50,
          palette_id: 721299c7-f114-43fc-926f-5bf0462bbfca, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 22}, max: {type: number,
                value: 25}}, mirror: false, reverse: true, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: [total_query_tiles]}]
    truncate_column_names: true
    series_types: {}
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Load times and general instance health may be impacted on dashboards
      with more than 25 tiles.
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 2
    col: 0
    width: 12
    height: 6
  - title: Dashboards with Merge Results
    name: Dashboards with Merge Results
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard.title, dashboard.link, dashboard_element.count_merge_query,
      dashboard_element.count, query.count, merge_query_source_query.count]
    filters:
      dashboard.deleted_date: 'NULL'
      dashboard.moved_to_trash: 'No'
      dashboard_element.count_merge_query: ">0"
    sorts: [merge_query_source_query.count desc]
    limit: 100
    dynamic_fields: [{table_calculation: total_query_tiles, label: Total Query Tiles,
        expression: "${dashboard_element.count}-${dashboard_element.count_text}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 592616d0-58e4-4968-9030-928ef38b7b50
      palette_id: e7303a54-e53e-4cf0-abc9-2f175c1128e0
    show_sql_query_menu_options: false
    column_order: [dashboard.title, dashboard.link, total_query_tiles, query.count,
      dashboard_element.count, dashboard_element.count_look, dashboard_element.count_lookless,
      dashboard_element.count_text, dashboard_element.count_merge_query]
    show_totals: true
    show_row_totals: true
    series_labels:
      query.count: Total Queries Generated
      dashboard_element.count_look: Look Tiles
      dashboard_element.count_lookless: Lookless Tiles
      dashboard_element.count_text: Text Tiles
      dashboard_element.count: Total Tiles
      dashboard_element.count_merge_query: Merge Query Tiles
    series_column_widths:
      total_query_tiles: 130
      dashboard_element.count: 89
      dashboard.title: 142
      dashboard.link: 88
      dashboard_element.count_look: 89
      query.count: 194
      dashboard_element.count_text: 89
      dashboard_element.count_lookless: 117
      dashboard_element.count_merge_query: 137
    series_cell_visualizations:
      dashboard_element.count_look:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1D98D3",
        font_color: !!null '', color_application: {collection_id: 592616d0-58e4-4968-9030-928ef38b7b50,
          palette_id: 721299c7-f114-43fc-926f-5bf0462bbfca, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 22}, max: {type: number,
                value: 25}}, mirror: false, reverse: true, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: []}]
    truncate_column_names: true
    series_types: {}
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Load times and general instance health may be impacted on dashboards
      with more than 25 tiles.
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 2
    col: 12
    width: 12
    height: 6
  - title: Long-Running Schedules
    name: Long-Running Schedules
    model: system__activity
    explore: scheduled_plan
    type: looker_grid
    fields: [scheduled_job_stage.started_time, scheduled_job_stage.completed_time,
      scheduled_job_stage.scheduled_job_id, scheduled_job_stage.avg_runtime, scheduled_plan.id,
      scheduled_plan.name, scheduled_plan.content_type_id]
    filters:
      scheduled_job_stage.stage: execute
    sorts: [scheduled_job_stage.avg_runtime desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 16
    col: 12
    width: 12
    height: 6
  - title: Long-Running Dashboards
    name: Long-Running Dashboards
    model: system__activity
    explore: history
    type: looker_grid
    fields: [dashboard.id, dashboard.title, dashboard.link, history.average_runtime,
      history.query_run_count, history.cache_result_query_count, history.database_result_query_count]
    filters:
      query.model: ''
      dashboard.id: NOT NULL
    sorts: [history.average_runtime desc]
    limit: 500
    dynamic_fields: [{measure: median_of_runtime_in_seconds, based_on: history.runtime,
        expression: '', label: Median of Runtime in Seconds, type: median, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 10
    col: 0
    width: 12
    height: 6
  - title: Long-Running Looks
    name: Long-Running Looks
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.average_runtime, history.query_run_count, history.cache_result_query_count,
      history.database_result_query_count, look.id, look.title, look.link]
    filters:
      query.model: ''
      look.id: NOT NULL
    sorts: [history.average_runtime desc]
    limit: 500
    dynamic_fields: [{measure: median_of_runtime_in_seconds, based_on: history.runtime,
        expression: '', label: Median of Runtime in Seconds, type: median, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 10
    col: 12
    width: 12
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Heavy Query Concurrency"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Long-Running Content"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 8
    col: 0
    width: 24
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Database Performance"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 22
    col: 0
    width: 24
    height: 2
  - title: Top Explores
    name: Top Explores
    model: system__activity
    explore: history
    type: looker_grid
    fields: [query.view, query.model, history.average_runtime, history.query_run_count,
      user.count]
    filters:
      history.created_date: 30 days
      history.source: explore
    sorts: [history.average_runtime desc, history.query_run_count desc]
    limit: 15
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_totals: true
    show_row_totals: true
    series_labels:
      user.count: User Count
    series_cell_visualizations:
      history.query_run_count:
        is_active: true
      user.count:
        is_active: true
    truncate_column_names: false
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 16
    col: 0
    width: 12
    height: 6
  - title: Results from Cache
    name: Results from Cache
    model: system__activity
    explore: history
    type: single_value
    fields: [history.query_run_count, history.cache_result_query_count, history.created_date]
    fill_fields: [history.created_date]
    filters:
      history.is_single_query: 'Yes'
      history.created_date: 60 days
    sorts: [history.created_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: from_cache_last_30, label: "% From Cache\
          \ last 30", expression: 'sum(if(row() < 30, ${history.cache_result_query_count},
          0)) / sum(if(row() < 30, ${history.query_run_count}, 0))', value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: prior_30, label: "% Prior 30", expression: 'sum(if(row()
          > 30 AND row() <= 60, ${history.cache_result_query_count}, 0)) / sum(if(row()
          > 30 AND row() <= 60, ${history.query_run_count}, 0))', value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: from_last_period, label: From Last Period, expression: "${from_cache_last_30}\
          \ - ${prior_30}", value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: false
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: forestgreen
    single_value_title: Results from Cache
    series_types: {}
    hidden_fields: [history.query_run_count, history.created_date, history.cache_result_query_count,
      prior_30]
    note_state: collapsed
    note_display: hover
    note_text: Percentage of total queries returned from Looker cache.
    defaults_version: 1
    listen: {}
    row: 24
    col: 0
    width: 8
    height: 6
  - title: Query Runtimes by Issuer Source
    name: Query Runtimes by Issuer Source
    model: system__activity
    explore: history
    type: looker_donut_multiples
    fields: [history.issuer_source, history.query_run_count, history.runtime_tiers]
    pivots: [history.runtime_tiers]
    filters:
      history.is_single_query: 'Yes'
      history.runtime_tiers: "-Undefined,-Below 0"
      history.issuer_source: "-Other"
      history.completed_date: 30 days
    sorts: [history.issuer_source desc, history.runtime_tiers 0]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_colors:
      0 to 4 - 1 - history.query_run_count: "#75E2E2"
      5 to 9 - 2 - history.query_run_count: "#72D16D"
      10 to 29 - 3 - history.query_run_count: "#C2DD67"
      30 to 119 - 4 - history.query_run_count: "#FFD95F"
      120 to 299 - 5 - history.query_run_count: "#E57947"
      300 or Above - 6 - history.query_run_count: "#B32F37"
    series_labels:
      0 to 4 - 1 - history.query_run_count: 0 to 4s
      5 to 9 - 2 - history.query_run_count: 5 to 9s
      10 to 29 - 3 - history.query_run_count: 10 to 29s
      30 to 119 - 4 - history.query_run_count: 30 to 119s
      120 to 299 - 5 - history.query_run_count: 120 to 299s
      300 or Above - 6 - history.query_run_count: 300s or Above
    value_labels: legend
    label_type: per
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    note_state: collapsed
    note_display: below
    note_text: |-
      Click here to expand source details...

      User Sources: dashboards, drill downs, explores, looks, private/public embeds,  sql_runner, suggest_filters, merge_queries, renderer.

      System Sources: scheduled_tasks, pdt_regenerator, data_download_api (csv downloads).

      Action Hub Sources: authenticated_download.

      API sources: API 3.0, dashboard_prefetch.
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 24
    col: 8
    width: 16
    height: 6
  - title: Top 15 Users by Query Count (Last 7 Days)
    name: Top 15 Users by Query Count (Last 7 Days)
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.query_run_count, history.created_day_of_week, user_query_rank.user_name]
    pivots: [user_query_rank.user_name]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [history.created_day_of_week, user_query_rank.user_name desc]
    limit: 500
    column_limit: 15
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      history.created_day_of_week: Created
      zz_user_query_rank.user_query_rank: Rank
      user_query_rank.user_query_rank: Rank
      history.query_run_count: Queries Ran
    series_column_widths:
      history.created_day_of_week: 83
    series_cell_visualizations:
      history.query_run_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null '', color_application: {collection_id: legacy, custom: {id: 85ebde76-7c6b-6970-071e-79fda2ac49b3,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    truncate_column_names: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 30
    col: 0
    width: 24
    height: 6
  - title: Top 10 Sources by Query Count (Last 7 Days)
    name: Top 10 Sources by Query Count (Last 7 Days)
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.query_run_count, history.created_day_of_week, source_query_rank.sorted_source]
    pivots: [source_query_rank.sorted_source]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [history.created_day_of_week, source_query_rank.sorted_source desc]
    limit: 500
    column_limit: 10
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      zz_source_rank.source_rank: Rank
      zz_source_query_rank.source_query_rank: Rank
      history.source: Source
      history.created_day_of_week: Created
      source_query_rank.source_query_rank: Rank
      history.query_run_count: Queries Ran
    series_column_widths:
      history.created_day_of_week: 85
    series_cell_visualizations:
      history.query_run_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"]}, bold: false, italic: false, strikethrough: false,
        fields: !!null '', color_application: {collection_id: legacy, custom: {id: 95f8f710-092a-a7e2-9207-021d209d7377,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true, stepped: false}}}]
    truncate_column_names: true
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 36
    col: 0
    width: 24
    height: 6
  - title: Hourly PDT Builds by Connection
    name: Hourly PDT Builds by Connection
    model: system__activity
    explore: pdt_event_log
    type: looker_area
    fields: [pdt_event_log.count, pdt_event_log.connection, pdt_event_log.created_hour_of_day]
    pivots: [pdt_event_log.connection]
    fill_fields: [pdt_event_log.created_hour_of_day]
    filters:
      pdt_event_log.action: create begin
      pdt_event_log.created_date: 7 days
    sorts: [pdt_event_log.connection, pdt_event_log.created_hour_of_day]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: PDT Builds, orientation: left, showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Created Hour of Day - UTC
    colors: ["#75E2E2", "#3EB0D5", "#4276BE", "#462C9D", "#9174F0", "#B1399E", "#B32F37",
      "#E57947", "#FBB555", "#FFD95F", "#C2DD67", "#72D16D"]
    series_types: {}
    series_colors: {}
    ordering: asc
    show_null_labels: false
    note_state: collapsed
    note_display: hover
    note_text: ''
    hidden_fields: []
    defaults_version: 1
    listen: {}
    row: 42
    col: 0
    width: 16
    height: 6
  - title: PDT Average Build Time
    name: PDT Average Build Time
    model: system__activity
    explore: pdt_builds
    type: looker_grid
    fields: [pdt_builds.view_name, pdt_builds.connection, pdt_builds.model_name, pdt_builds.average_build_time_minutes]
    filters:
      pdt_builds.start_date: 7 days
    sorts: [pdt_builds.average_build_time_minutes desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      pdt_builds.average_build_time_seconds: Avg Build Seconds
      pdt_builds.average_build_time_minutes: Avg Build Minutes
    series_cell_visualizations:
      pdt_builds.average_build_time_minutes:
        is_active: true
        palette:
          palette_id: 175d5ab4-cb7c-69cc-970a-5ef98d345ba2
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - yellow
          - orange
          - red
    truncate_column_names: false
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen: {}
    row: 42
    col: 16
    width: 8
    height: 6
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Taxing Content"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 48
    col: 0
    width: 24
    height: 2
  - title: Dashboards with Auto-Refresh On
    name: Dashboards with Auto-Refresh On
    model: system__activity
    explore: dashboard
    type: looker_grid
    fields: [dashboard.title, dashboard.refresh_interval_ordered, user.name, dashboard.link,
      dashboard.id, dashboard_element.count, dashboard_element.count_text]
    filters:
      dashboard.refresh_interval_ordered: NOT NULL
      dashboard.deleted_date: 'NULL'
      dashboard.moved_to_trash: 'No'
    sorts: [dashboard.refresh_interval_ordered]
    limit: 100
    dynamic_fields: [{table_calculation: non_text_tiles, label: Non-Text Tiles, expression: "${dashboard_element.count}-${dashboard_element.count_text}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 592616d0-58e4-4968-9030-928ef38b7b50
      palette_id: e7303a54-e53e-4cf0-abc9-2f175c1128e0
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      dashboard_element.count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1D98D3",
        font_color: !!null '', color_application: {collection_id: 592616d0-58e4-4968-9030-928ef38b7b50,
          custom: {id: e73dc266-945c-2a12-887f-a7f608e56229, label: Custom, type: continuous,
            stops: [{color: "#F36254", offset: 0}, {color: "#FCF758", offset: 50},
              {color: "#4FBC89", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: middle}, max: {type: number, value: 3200}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [dashboard.refresh_interval_ordered]}, {type: along
          a scale..., value: !!null '', background_color: !!null '', font_color: !!null '',
        color_application: {collection_id: 592616d0-58e4-4968-9030-928ef38b7b50, palette_id: 721299c7-f114-43fc-926f-5bf0462bbfca,
          options: {steps: 5, reverse: true, constraints: {max: {type: number, value: 24}},
            stepped: false}}, bold: false, italic: false, strikethrough: false, fields: [
          non_text_tiles]}]
    series_value_format:
      dashboard.id:
        name: id
        format_string: '0'
        label: ID
    hidden_fields: [dashboard_element.count, dashboard_element.count_text]
    note_state: collapsed
    note_display: hover
    note_text: |-
      Frequent dashboard updates, especially on large dashboards, can place a significant strain on some database systems.

      At minimum, avoid setting a refresh interval that is shorter than your database update interval, because there is no new data to refresh and it creates unnecessary queries.
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
  - title: Most Frequently Scheduled Content
    name: Most Frequently Scheduled Content
    model: system__activity
    explore: scheduled_plan
    type: looker_column
    fields: [scheduled_job.created_date, scheduled_job.count, scheduled_job_rank.content_type_id]
    pivots: [scheduled_job_rank.content_type_id]
    fill_fields: [scheduled_job.created_date]
    filters:
      scheduled_job.created_date: 14 days
      scheduled_plan.run_once: 'No'
    sorts: [scheduled_job.created_date desc, zz_content_schedule_rank.content_schedule_rank,
      scheduled_job_rank.content_type_id desc]
    limit: 500
    column_limit: 25
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Scheduled Job Count, orientation: left, series: [{axisId: Look
              17235 - 14002 - scheduled_job.count, id: Look 17235 - 14002 - scheduled_job.count,
            name: Look 17235}, {axisId: Look 17243 - 13537 - scheduled_job.count,
            id: Look 17243 - 13537 - scheduled_job.count, name: Look 17243}, {axisId: Look
              17847 - 13524 - scheduled_job.count, id: Look 17847 - 13524 - scheduled_job.count,
            name: Look 17847}, {axisId: Look 17236 - 12880 - scheduled_job.count,
            id: Look 17236 - 12880 - scheduled_job.count, name: Look 17236}, {axisId: Look
              17806 - 5152 - scheduled_job.count, id: Look 17806 - 5152 - scheduled_job.count,
            name: Look 17806}, {axisId: Look 7954 - 3828 - scheduled_job.count, id: Look
              7954 - 3828 - scheduled_job.count, name: Look 7954}, {axisId: Look 37540
              - 3816 - scheduled_job.count, id: Look 37540 - 3816 - scheduled_job.count,
            name: Look 37540}, {axisId: Look 40257 - 2795 - scheduled_job.count, id: Look
              40257 - 2795 - scheduled_job.count, name: Look 40257}, {axisId: Look
              37253 - 2262 - scheduled_job.count, id: Look 37253 - 2262 - scheduled_job.count,
            name: Look 37253}, {axisId: Look 41300 - 2041 - scheduled_job.count, id: Look
              41300 - 2041 - scheduled_job.count, name: Look 41300}, {axisId: Look
              42777 - 1235 - scheduled_job.count, id: Look 42777 - 1235 - scheduled_job.count,
            name: Look 42777}, {axisId: Look 41902 - 1215 - scheduled_job.count, id: Look
              41902 - 1215 - scheduled_job.count, name: Look 41902}, {axisId: Look
              38085 - 861 - scheduled_job.count, id: Look 38085 - 861 - scheduled_job.count,
            name: Look 38085}, {axisId: Look 42596 - 840 - scheduled_job.count, id: Look
              42596 - 840 - scheduled_job.count, name: Look 42596}, {axisId: Look
              39006 - 626 - scheduled_job.count, id: Look 39006 - 626 - scheduled_job.count,
            name: Look 39006}, {axisId: Look 36981 - 594 - scheduled_job.count, id: Look
              36981 - 594 - scheduled_job.count, name: Look 36981}, {axisId: Look
              42614 - 465 - scheduled_job.count, id: Look 42614 - 465 - scheduled_job.count,
            name: Look 42614}, {axisId: Look 37146 - 335 - scheduled_job.count, id: Look
              37146 - 335 - scheduled_job.count, name: Look 37146}, {axisId: Look
              37998 - 325 - scheduled_job.count, id: Look 37998 - 325 - scheduled_job.count,
            name: Look 37998}, {axisId: Look 37997 - 325 - scheduled_job.count, id: Look
              37997 - 325 - scheduled_job.count, name: Look 37997}, {axisId: Look
              9830 - 322 - scheduled_job.count, id: Look 9830 - 322 - scheduled_job.count,
            name: Look 9830}, {axisId: Look 42226 - 322 - scheduled_job.count, id: Look
              42226 - 322 - scheduled_job.count, name: Look 42226}, {axisId: Look
              42159 - 322 - scheduled_job.count, id: Look 42159 - 322 - scheduled_job.count,
            name: Look 42159}, {axisId: Look 39826 - 322 - scheduled_job.count, id: Look
              39826 - 322 - scheduled_job.count, name: Look 39826}, {axisId: Look
              39178 - 322 - scheduled_job.count, id: Look 39178 - 322 - scheduled_job.count,
            name: Look 39178}, {axisId: Look 37187 - 322 - scheduled_job.count, id: Look
              37187 - 322 - scheduled_job.count, name: Look 37187}, {axisId: Look
              37186 - 322 - scheduled_job.count, id: Look 37186 - 322 - scheduled_job.count,
            name: Look 37186}, {axisId: Look 37185 - 322 - scheduled_job.count, id: Look
              37185 - 322 - scheduled_job.count, name: Look 37185}, {axisId: Look
              37184 - 322 - scheduled_job.count, id: Look 37184 - 322 - scheduled_job.count,
            name: Look 37184}, {axisId: Look 30297 - 322 - scheduled_job.count, id: Look
              30297 - 322 - scheduled_job.count, name: Look 30297}, {axisId: Look
              30015 - 322 - scheduled_job.count, id: Look 30015 - 322 - scheduled_job.count,
            name: Look 30015}, {axisId: Look 29512 - 322 - scheduled_job.count, id: Look
              29512 - 322 - scheduled_job.count, name: Look 29512}, {axisId: Look
              25988 - 322 - scheduled_job.count, id: Look 25988 - 322 - scheduled_job.count,
            name: Look 25988}, {axisId: Look 24961 - 322 - scheduled_job.count, id: Look
              24961 - 322 - scheduled_job.count, name: Look 24961}, {axisId: Look
              17234 - 322 - scheduled_job.count, id: Look 17234 - 322 - scheduled_job.count,
            name: Look 17234}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: See which pieces of content make up the majority of scheduled jobs.
      In this tile schedule job counts are shown broken down by Content Type ID (i.e.
      “Look 546”). Individual stacks are ordered to show most frequently scheduled
      pieces of content at the top of each stack.
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
  - title: Unlimited Downloads
    name: Unlimited Downloads
    model: system__activity
    explore: history
    type: looker_grid
    fields: [history.created_time, query.link, user.id, user.name]
    filters:
      query.limit: "-1"
    sorts: [history.created_time desc]
    limit: 100
    column_limit: 50
    show_view_names: true
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    hidden_fields: []
    series_types: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Downloading or Scheduling with the All Results option (Unlimited Download)  can
      potentially result in reduced performance on the Looker server.
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
