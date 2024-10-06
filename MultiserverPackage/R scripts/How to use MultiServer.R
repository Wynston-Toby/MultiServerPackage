arrival_time <- cumsum(rexp(100, 1/60))
service_time <- rexp(100, 1/150) + 20
result <- Multiserver(arrival_time, service_time, NumServers = 3)

print(result)

