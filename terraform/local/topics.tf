
variable "bootstrap_server" {
  default = "172.31.46.234:9092"
}

resource "null_resource" "topic_orders" {
  triggers = {
    topic_name  = "orders"
    partitions  = "3"
    replication = "1"
  }

  provisioner "local-exec" {
    command = <<EOT
docker exec broker kafka-topics \
  --create \
  --if-not-exists \
  --topic orders \
  --partitions 3 \
  --replication-factor 1 \
  --bootstrap-server ${var.bootstrap_server}
EOT
  }
}

resource "null_resource" "topic_payments" {
  triggers = {
    topic_name  = "payments"
    partitions  = "6"
    replication = "1"
  }

  provisioner "local-exec" {
    command = <<EOT
docker exec broker kafka-topics \
  --create \
  --if-not-exists \
  --topic payments \
  --partitions 6 \
  --replication-factor 1 \
  --bootstrap-server ${var.bootstrap_server}
EOT
  }
}

resource "null_resource" "topic_orders_avro" {
  triggers = {
    topic_name  = "orders-avro"
    partitions  = "3"
    replication = "1"
  }

  provisioner "local-exec" {
    command = <<EOT
docker exec broker kafka-topics \
  --create \
  --if-not-exists \
  --topic orders-avro \
  --partitions 3 \
  --replication-factor 1 \
  --bootstrap-server ${var.bootstrap_server}
EOT
  }
}
