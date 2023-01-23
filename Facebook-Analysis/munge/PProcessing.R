# Columns names
col_name <- c("Timestamp","Packet_Length","Source_IP","Destination_IP",
        "Source_L4_Port", "Destination L4 Port", "IP_protocol", 
        "Source_Hostprefix","Destination_hostprefix",
        "Source_Rack", "Destination_Rack",
        "Source_Pod", "Destination_Pod",
        "Intercluster", "Interdatacenter")

# Assign column names
colnames(X10000000_183453745395047_5277553940995506176_n) <- col_name
colnames(X10000000_285913731807310_7357025347344269312_n) <- col_name
colnames(X10000000_321929591496191_6386372367764946944_n) <- col_name
colnames(X10000000_342423096094003_8905061200115531776_n) <- col_name
colnames(X10000000_538907286298295_2100867541848031232_n) <- col_name

# Combining all data-file of cluster A
cluster_a_data = rbind(X10000000_183453745395047_5277553940995506176_n,
                       X10000000_285913731807310_7357025347344269312_n,
                       X10000000_321929591496191_6386372367764946944_n,
                       X10000000_342423096094003_8905061200115531776_n,
                       X10000000_538907286298295_2100867541848031232_n
                        )

# Convert Time stamp
cluster_a_data$Timestamp <- as.POSIXct(cluster_a_data$Timestamp, origin = "1970-01-01")
#Removing NA values from data set
cluster_a_data <- subset(cluster_a_data, !grepl('\\N', Destination_Pod))
# Arranging records in descending order of Time stamp
cluster_a_data <- cluster_a_data %>% arrange(desc(ymd_hms(Timestamp)))

# Assign column names
colnames(X10000000_297743010611337_296246898249957376_n) <- col_name
colnames(X10000000_313485885684915_2821160804659757056_n) <- col_name
colnames(X10000000_390290874635322_4151848458732437504_n) <- col_name
colnames(X10000000_1082294968505483_1087203793398923264_n) <- col_name
colnames(X10000000_1475041669179819_5579678115442982912_n) <- col_name

# Combining all data-file of cluster C
cluster_c_data = bind_rows(X10000000_297743010611337_296246898249957376_n,
                          X10000000_313485885684915_2821160804659757056_n,
                          X10000000_390290874635322_4151848458732437504_n,
                          X10000000_1082294968505483_1087203793398923264_n,
                          X10000000_1475041669179819_5579678115442982912_n
                          )

# Assign column names
colnames(cluster_c_data) <- col_name
# Convert Time stamp
cluster_c_data$Timestamp <- as.POSIXct(cluster_c_data$Timestamp, origin = "1970-01-01")
#Removing NA values from data set
cluster_c_data <- subset(cluster_c_data, !grepl('\\N', Destination_Pod))
# Arranging records in descending order of Time stamp
cluster_c_data <- cluster_c_data %>% arrange(desc(ymd_hms(Timestamp)))

