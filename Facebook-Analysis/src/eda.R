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
add_time <- time_min + (10*60)
data <- cluster_a_data[cluster_a_data$Timestamp >= time_min & cluster_a_data$Timestamp <= add_time,]
data <- data %>% arrange(desc(Packet_Length))

# Source destination pair with packet size in cluster C
src_des_pck_size_c <- as.POSIXct(min(cluster_c_data$Timestamp))
src_des_pck_size_c
time_min_c <- as.POSIXct(src_des_pck_size_c, format = "%Y-%m-%d %H:%M:%S BST")
typeof(time_min_c)
add_time_c <- time_min_c + (10*60)
data_c <- cluster_c_data[cluster_c_data$Timestamp >= time_min & cluster_c_data$Timestamp <= add_time,]
data_c <- data_c %>% arrange(desc(Packet_Length))


# draw the cdf plot
plot(ecdf(data$Packet_Length), col="red", lwd=3.0,
     xlab="Packet Size (bytes)",
     main="",
     ylab="CDF",)
lines(ecdf(data_c$Packet_Length), col="cyan", lwd=3.0)
legend('bottomright', 
       legend=c("Database","Hadoop"),  # text in the legend
       col=c("red","purple"),  # point colors
       pch=15)

# draw the cdf plot
plot(ecdf(cluster_a_data$Timestamp), col="red", lwd=3.0,
     xlab="Packet Size (bytes)",
     main="",
     ylab="CDF",)
lines(ecdf(cluster_c_data$Timestamp), col="cyan", lwd=3.0)
legend('bottomright', 
       legend=c("Database","Hadoop"),  # text in the legend
       col=c("red","purple"),  # point colors
       pch=15)

index_90 <- 0.1*(nrow(data))
data_90 <- data[1:index_90,]
data_c_90 <- data_c[1:index_90,]
