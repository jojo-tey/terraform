resource "aws_vpc_peering_connection_accepter" "prod_eucentral1" {
  vpc_peering_connection_id = var.vpc_peer_connection_id_prod_eucentral1
  auto_accept               = true
}
