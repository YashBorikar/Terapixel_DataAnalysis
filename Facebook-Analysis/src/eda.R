library('ProjectTemplate')
load.project()


# two_mins = cluster_a_data[grep('[0|5]$', format(cluster_a_data$Time, '%M')),]distinct(df1)
print(length(distinct(cluster_a_data['Source_IP'])))
n_distinct(cluster_a_data$Source_IP)
n_distinct(cluster_a_data$Destination_IP)


# Source destination pair with packet size in cluster A
src_des_pck_size_a <- as.POSIXct(min(cluster_a_data$Timestamp))
src_des_pck_size_a
time_min <- as.POSIXct(src_des_pck_size_a, format = "%Y-%m-%d %H:%M:%S BST")
typeof(time_min)
add_time <- time_min + (5*60)
data <- cluster_a_data[cluster_a_data$Timestamp >= time_min & cluster_a_data$Timestamp <= add_time,]
data

# Source destination pair with packet size in cluster C
src_des_pck_size_b <- 