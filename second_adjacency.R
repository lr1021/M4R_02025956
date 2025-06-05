require(data.table) # for data mangling require(tidyverse) # for data mangling require(ggplot2) # for plotting require(hexbin) # for plotting require(bayesplot) # for plotting Stan outputs require(knitr) # for Rmarkdown require(kableExtra) # for Rmarkdown require(cmdstanr) # for Stan
require(tidyverse) # data mangling
require(ggplot2) # plotting
require(hexbin) # plotting
require(bayesplot) # Stan plotting
require(knitr)
require(kableExtra)
require(cmdstanr)
library(readr)
library(dplyr)
library(stringr)
library(glue)
library(posterior)

# set_cmdstan_path("/Users/lucaratzinger/cmdstan/cmdstan-2.36.0")
home.dir <- "/Volumes/KINGSTON/M4R_usb"

zone = 0

# Zone Full Geography Data (c3_ALMA_1966_06): one time step
zone_data <- read_csv(glue("{home.dir}/6_all_data_table/zone_0/c3_ABLE_1950_08.csv"),
                      col_select = c("time_step", "latitude_rank", "longitude_rank", "coord_index"))
zone_data <- zone_data %>% filter(time_step == min(zone_data$time_step))

# Full nodes
node_path <- glue("{home.dir}/10_nodes/nodes_zone_{zone}.csv")
node <- read_csv(node_path, col_select = c("node1", "node2"))
node1 <- node$node1
node2 <- node$node2

N_nodes <- max(node2)

node1_diag <- c(node1, 1:N_nodes)
node2_diag <- c(node2, 1:N_nodes)

N_edges <- length(node1)
N_edges_diag <- length(node1_diag)

# # Edge adjacency
# edge_metric <- function(a, b, c, d) {
#   if (a==c){if (b!=d){return(1)}}
#   if (a==d){if (b!=c){return(1)}}
#   if (b==c){if (a!=d){return(1)}}
#   if (b==d){if (a!=c){return(1)}}
#   return(0)
# }
# 
# # intra
# wedge1 <- c()
# wedge2 <- c()
# for (i in 1:(N_edges-1)){
#   for (j in (i+1):N_edges){
#     edge_distance <- edge_metric(node1[i], node2[i], node1[j], node2[j])
#     if (edge_distance==1){
#       wedge1 <- c(wedge1, i)
#       wedge2 <- c(wedge2, j)
#     }
#   }
# }
# 
# # inter
# pedge1 <- c()
# pedge2 <- c()
# for (i in 1:(N_edges_diag-1)){
#   for (j in (i+1):N_edges_diag){
#     edge_distance <- edge_metric(node1_diag[i], node2_diag[i], node1_diag[j], node2_diag[j])
#     if (edge_distance==1){
#       pedge1 <- c(pedge1, i)
#       pedge2 <- c(pedge2, j)
#     }
#   }
# }
# temp_wdf <- data.frame(wedge1 = wedge1, wedge2 = wedge2)
# temp_pdf <- data.frame(pedge1 = pedge1, pedge2 = pedge2)
# write.csv(temp_wdf, glue("{home.dir}/11_edges/wedges_zone_{zone}.csv"), row.names = FALSE)
# write.csv(temp_pdf, glue("{home.dir}/11_edges/pedges_zone_{zone}.csv"), row.names = FALSE)

wedge_data <- read_csv(glue("{home.dir}/11_edges/wedges_zone_{zone}.csv"),
                       col_select = c("wedge1", "wedge2"))
wedge1 = wedge_data$wedge1
wedge2 = wedge_data$wedge2

pedge_data <- read_csv(glue("{home.dir}/11_edges/pedges_zone_{zone}.csv"),
                       col_select = c("pedge1", "pedge2"))
pedge1 = pedge_data$pedge1
pedge2 = pedge_data$pedge2
