connection: "thelook"

include: "/views/navigation.view.lkml"
include: "/views/orders_pdt.view.lkml"
# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: navigation {}

explore: orders_pdt {}
