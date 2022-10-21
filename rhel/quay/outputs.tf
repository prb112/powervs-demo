################################################################
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# ©Copyright IBM Corp. 2022
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################

output "bastion_private_vip" {
  value = ibm_pi_network_port.bastion_internal_vip[0].pi_network_port_ipaddress
}
#ibm_pi_network_port.bastion_vip[0].pi_network_port_ipaddress

output "bastion_external_vip" {
  value = ibm_pi_network_port.bastion_internal_vip[0].public_ip
}

output "bastion_private_ip" {
  value = join(", ", data.ibm_pi_instance_ip.bastion_ip.*.ip)
}

output "bastion_public_ip" {
  value = join(", ", data.ibm_pi_instance_ip.bastion_public_ip.*.external_ip)
}

output "gateway_ip" {
  value = data.ibm_pi_network.network.gateway
}

output "cidr" {
  value = data.ibm_pi_network.network.cidr
}

output "public_cidr" {
  value = ibm_pi_network.public_network.pi_cidr
}