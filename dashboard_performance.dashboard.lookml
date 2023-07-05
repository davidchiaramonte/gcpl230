- dashboard: dashboard_performance
  title: Dashboard Performance
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 3BwyabXU9TpZsMe6bp1dcD
  elements:
  - title: 'Dashboard Session - Max times '
    name: 'Dashboard Session - Max times '
    model: system__activity
    explore: query_metrics
    type: looker_grid
    fields: [dashboard.id, user.timezone, user.id, history.created_minute, history.dashboard_session,
      total_runtime_tile_max, async_processing_max, explore_init_from_cache_max, model_init_from_cache_max,
      prepare_time_max, execute_main_query_time_max, stream_to_cache_max]
    filters: {}
    sorts: [history.created_minute desc]
    limit: 500
    dynamic_fields:
    - category: measure
      expression:
      label: Total Runtime - Tile (max)
      value_format:
      value_format_name:
      based_on: history.runtime
      _kind_hint: measure
      measure: total_runtime_tile_max
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: Async Processing (max)
      value_format:
      value_format_name:
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: async_processing_max
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: Explore Init from Cache (max)
      value_format:
      value_format_name:
      based_on: query_metrics.marshalled_cache_load
      _kind_hint: measure
      measure: explore_init_from_cache_max
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: Model init from Cache (max)
      value_format:
      value_format_name:
      based_on: query_metrics.model_init_cache
      _kind_hint: measure
      measure: model_init_from_cache_max
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: Prepare time (max)
      value_format:
      value_format_name:
      based_on: query_metrics.prepare
      _kind_hint: measure
      measure: prepare_time_max
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: Execute Main Query Time (max)
      value_format:
      value_format_name:
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: execute_main_query_time_max
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: Stream to Cache (max)
      value_format:
      value_format_name:
      based_on: query_metrics.stream_to_cache
      _kind_hint: measure
      measure: stream_to_cache_max
      type: max
      _type_hint: number
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
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    swap_axes: true
    show_null_points: true
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Completed Date: history.completed_date
      Query ID: query.id
      Attempted Cache (Yes / No): history.cache
      Dashboard Name: dashboard.title
      Dashboard ID: dashboard.id
    row: 37
    col: 0
    width: 24
    height: 7
  - title: Dashboard Session - Each Query Metrics
    name: Dashboard Session - Each Query Metrics
    model: system__activity
    explore: query_metrics
    type: looker_grid
    fields: [dashboard.id, user.id, history.completed_minute, history.dashboard_session,
      history.id, query.id, query_metrics.queued, query_metrics.async_processing,
      query_metrics.marshalled_cache_load, query_metrics.model_init_cache, query_metrics.prepare,
      query_metrics.execute_main_query, query_metrics.stream_to_cache, query_metrics.execute_totals_query,
      query.count, history.query_run_count_drill, history.cache_result_query_count,
      history.database_result_query_count]
    filters: {}
    sorts: [history.completed_minute desc]
    limit: 1000
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      history.id: History ID
      query.id: Query ID
      dashboard.id: Dashboard ID
      user.id: User ID
    series_cell_visualizations:
      query.count:
        is_active: true
    defaults_version: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Completed Date: history.completed_date
      Query ID: query.id
      Attempted Cache (Yes / No): history.cache
      Dashboard Name: dashboard.title
      Dashboard ID: dashboard.id
    row: 44
    col: 0
    width: 24
    height: 10
  - title: Dashboard Session Async Times
    name: Dashboard Session Async Times
    model: system__activity
    explore: query_metrics
    type: looker_scatter
    fields: [dashboard.id, history.completed_minute, history.dashboard_session, maxasyncprocessing]
    filters: {}
    sorts: [history.completed_minute desc]
    limit: 5000
    dynamic_fields:
    - category: measure
      expression:
      label: MaxAsyncProcessing
      value_format:
      value_format_name:
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: maxasyncprocessing
      type: max
      _type_hint: number
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: bottom, series: [{axisId: maxasyncprocessing,
            id: maxasyncprocessing, name: MaxAsyncProcessing}], showLabels: true,
        showValues: true, maxValue: 150, unpinAxis: false, tickDensity: default, tickDensityCustom: 33,
        type: linear}]
    hide_legend: false
    series_colors:
      maxasyncprocessing: "#E57947"
    swap_axes: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [dashboard.id, history.dashboard_session]
    interpolation: linear
    listen:
      Completed Date: history.completed_date
      Query ID: query.id
      Attempted Cache (Yes / No): history.cache
      Dashboard Name: dashboard.title
      Dashboard ID: dashboard.id
    row: 0
    col: 0
    width: 24
    height: 12
  - title: Dashboard Session Lifecycle - Max times
    name: Dashboard Session Lifecycle - Max times
    model: system__activity
    explore: query_metrics
    type: looker_column
    fields: [dashboard.id, history.dashboard_session, maxasyncproc_ss, maxprepare_ss,
      maxexploreinitfromcache, maxexecutemainquery_ss, maxstreamtocache_ss, history.completed_minute,
      maxexecutetotalstime]
    filters: {}
    sorts: [history.completed_minute desc]
    limit: 500
    dynamic_fields:
    - category: measure
      expression:
      label: MaxAsyncProc_SS
      value_format:
      value_format_name:
      based_on: query_metrics.async_processing
      _kind_hint: measure
      measure: maxasyncproc_ss
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: MaxPrepare_SS
      value_format:
      value_format_name:
      based_on: query_metrics.prepare
      _kind_hint: measure
      measure: maxprepare_ss
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: MaxExploreInitFromCache
      value_format:
      value_format_name:
      based_on: query_metrics.marshalled_cache_load
      _kind_hint: measure
      measure: maxexploreinitfromcache
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: MaxExecuteMainQuery_SS
      value_format:
      value_format_name:
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: maxexecutemainquery_ss
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: MaxStreamToCache_SS
      value_format:
      value_format_name:
      based_on: query_metrics.stream_to_cache
      _kind_hint: measure
      measure: maxstreamtocache_ss
      type: max
      _type_hint: number
    - category: measure
      expression:
      label: MaxExecuteTotalsTime
      value_format:
      value_format_name:
      based_on: query_metrics.execute_totals_query
      _kind_hint: measure
      measure: maxexecutetotalstime
      type: max
      _type_hint: number
    x_axis_gridlines: true
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
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: maxprepare_ss, id: maxprepare_ss,
            name: MaxPrepare_SS}, {axisId: maxexploreinitfromcache, id: maxexploreinitfromcache,
            name: MaxExploreInitFromCache}, {axisId: maxexecutemainquery_ss, id: maxexecutemainquery_ss,
            name: MaxExecuteMainQuery_SS}, {axisId: maxstreamtocache_ss, id: maxstreamtocache_ss,
            name: MaxStreamToCache_SS}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '50'
    reference_lines: [{reference_type: margins, line_value: mean, range_start: max,
        range_end: min, margin_top: deviation, margin_value: median, margin_bottom: deviation,
        label_position: right, color: "#FBB555", label: Median Deviation Range}]
    trend_lines: []
    column_spacing_ratio: 0.1
    column_group_spacing_ratio: 0.3
    show_null_points: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [dashboard.id, history.dashboard_session, maxasyncproc_ss]
    interpolation: linear
    listen:
      Completed Date: history.completed_date
      Query ID: query.id
      Attempted Cache (Yes / No): history.cache
      Dashboard Name: dashboard.title
      Dashboard ID: dashboard.id
    row: 26
    col: 0
    width: 24
    height: 11
  - title: Prepare Time per session
    name: Prepare Time per session
    model: system__activity
    explore: query_metrics
    type: looker_scatter
    fields: [dashboard.id, history.completed_minute, maxprepare]
    filters: {}
    sorts: [history.completed_minute desc]
    limit: 5000
    dynamic_fields:
    - category: measure
      expression:
      label: MaxPrepare
      value_format:
      value_format_name:
      based_on: query_metrics.prepare
      _kind_hint: measure
      measure: maxprepare
      type: max
      _type_hint: number
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    series_colors:
      maxprepare: "#3EB0D5"
    swap_axes: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [dashboard.id]
    listen:
      Completed Date: history.completed_date
      Query ID: query.id
      Attempted Cache (Yes / No): history.cache
      Dashboard Name: dashboard.title
      Dashboard ID: dashboard.id
    row: 19
    col: 0
    width: 8
    height: 7
  - title: Explore Init From Cache Time per session
    name: Explore Init From Cache Time per session
    model: system__activity
    explore: query_metrics
    type: looker_scatter
    fields: [dashboard.id, history.created_minute, maxexploreinitfromcache]
    filters: {}
    sorts: [history.created_minute desc]
    limit: 5000
    dynamic_fields:
    - category: measure
      expression:
      label: MaxExploreInitFromCache
      value_format:
      value_format_name:
      based_on: query_metrics.marshalled_cache_load
      _kind_hint: measure
      measure: maxexploreinitfromcache
      type: max
      _type_hint: number
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    series_colors:
      maxexploreinitfromcache: "#B1399E"
    swap_axes: true
    hidden_fields: [dashboard.id]
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Completed Date: history.completed_date
      Query ID: query.id
      Attempted Cache (Yes / No): history.cache
      Dashboard Name: dashboard.title
      Dashboard ID: dashboard.id
    row: 12
    col: 0
    width: 8
    height: 7
  - title: Stream To Cache Time per session
    name: Stream To Cache Time per session
    model: system__activity
    explore: query_metrics
    type: looker_scatter
    fields: [dashboard.id, history.created_minute, maxstreamtocache]
    filters: {}
    sorts: [history.created_minute desc]
    limit: 5000
    dynamic_fields:
    - category: measure
      expression:
      label: MaxStreamToCache
      value_format:
      value_format_name:
      based_on: query_metrics.stream_to_cache
      _kind_hint: measure
      measure: maxstreamtocache
      type: max
      _type_hint: number
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    series_colors:
      maxstreamtocache: "#592EC2"
    swap_axes: true
    hidden_fields: [dashboard.id]
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Completed Date: history.completed_date
      Query ID: query.id
      Attempted Cache (Yes / No): history.cache
      Dashboard Name: dashboard.title
      Dashboard ID: dashboard.id
    row: 19
    col: 8
    width: 8
    height: 7
  - title: Main Query Execution Time per session
    name: Main Query Execution Time per session
    model: system__activity
    explore: query_metrics
    type: looker_scatter
    fields: [dashboard.id, history.created_minute, maxexecutemainquery]
    filters: {}
    sorts: [history.created_minute desc]
    limit: 5000
    dynamic_fields:
    - category: measure
      expression:
      label: MaxExecuteMainQuery
      value_format:
      value_format_name:
      based_on: query_metrics.execute_main_query
      _kind_hint: measure
      measure: maxexecutemainquery
      type: max
      _type_hint: number
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    series_colors:
      maxexecutemainquery: "#FFD95F"
    swap_axes: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [dashboard.id]
    listen:
      Completed Date: history.completed_date
      Query ID: query.id
      Attempted Cache (Yes / No): history.cache
      Dashboard Name: dashboard.title
      Dashboard ID: dashboard.id
    row: 12
    col: 16
    width: 8
    height: 7
  - title: Queued Time per session
    name: Queued Time per session
    model: system__activity
    explore: query_metrics
    type: looker_scatter
    fields: [dashboard.id, history.created_minute, maxqueuedtime]
    filters: {}
    sorts: [history.created_minute desc]
    limit: 5000
    dynamic_fields:
    - category: measure
      expression:
      label: MaxQueuedTime
      value_format:
      value_format_name:
      based_on: query_metrics.queued
      _kind_hint: measure
      measure: maxqueuedtime
      type: max
      _type_hint: number
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    series_colors:
      maxqueuedtime: "#B32F37"
    swap_axes: true
    hidden_fields: [dashboard.id]
    defaults_version: 1
    listen:
      Completed Date: history.completed_date
      Query ID: query.id
      Attempted Cache (Yes / No): history.cache
      Dashboard Name: dashboard.title
      Dashboard ID: dashboard.id
    row: 12
    col: 8
    width: 8
    height: 7
  - title: Execute Totals time per sesion
    name: Execute Totals time per sesion
    model: system__activity
    explore: query_metrics
    type: looker_scatter
    fields: [dashboard.id, max_execute_totals_time, history.completed_minute]
    filters: {}
    sorts: [max_execute_totals_time desc]
    limit: 500
    dynamic_fields:
    - category: measure
      expression:
      label: Max Execute Totals Time
      value_format:
      value_format_name:
      based_on: query_metrics.execute_totals_query
      _kind_hint: measure
      measure: max_execute_totals_time
      type: max
      _type_hint: number
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    swap_axes: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [dashboard.id]
    listen:
      Completed Date: history.completed_date
      Query ID: query.id
      Attempted Cache (Yes / No): history.cache
      Dashboard Name: dashboard.title
      Dashboard ID: dashboard.id
    row: 19
    col: 16
    width: 8
    height: 7
  - title: Dashboard Mapping
    name: Dashboard Mapping
    model: system__activity
    explore: query_metrics
    type: table
    fields: [dashboard.title, dashboard.id]
    limit: 500
    listen:
      Dashboard ID: dashboard.id
    row: 54
    col: 0
    width: 8
    height: 5
  filters:
  - name: Completed Date
    title: Completed Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.completed_date
  - name: Dashboard Name
    title: Dashboard Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: dashboard.title
  - name: Dashboard ID
    title: Dashboard ID
    type: field_filter
    default_value: not null
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: dashboard.id
  - name: Attempted Cache (Yes / No)
    title: Attempted Cache (Yes / No)
    type: field_filter
    default_value: 'Yes'
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: inline
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: history.cache
  - name: Query ID
    title: Query ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options:
      - '1'
      - '2'
      - '3'
    model: system__activity
    explore: query_metrics
    listens_to_filters: []
    field: query.id
