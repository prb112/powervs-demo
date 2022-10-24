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
# Configure the IBM Cloud provider
################################################################
variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API key associated with user's identity"
  default     = "<key>"
}

variable "service_instance_id" {
  type        = string
  description = "The cloud instance ID of your account"
  default     = ""
}

variable "ibmcloud_region" {
  type        = string
  description = "The IBM Cloud region where you want to create the resources"
  default     = ""
}

variable "ibmcloud_zone" {
  type        = string
  description = "The zone of an IBM Cloud region where you want to create Power System resources"
  default     = ""
}

################################################################
# Configure the Instance details
################################################################
variable "quay" {
  type    = object({ count = number, memory = string, processors = string })
  default = {
    count      = 1
    memory     = "16"
    processors = "1"
  }
  validation {
    condition     = lookup(var.quay, "count", 1) >= 1 && lookup(var.quay, "count", 1) <= 2
    error_message = "The quay.count value must be either 1 or 2."
  }
}

variable "rhel_image_name" {
  type        = string
  description = "Name of the RHEL image that you want to use for the quay node"
  default     = "rhel-8.3"
}

variable "processor_type" {
  type        = string
  description = "The type of processor mode (shared/dedicated)"
  default     = "shared"
}

variable "system_type" {
  type        = string
  description = "The type of system (s922/e980)"
  default     = "s922"
}

variable "network_name" {
  type        = string
  description = "The name of the network to be used for deploy operations"
  default     = "ocp-net"

  validation {
    condition     = var.network_name != ""
    error_message = "The network_name is required and cannot be empty."
  }
}

variable "rhel_username" {
  type    = string
  default = "root"
}

variable "public_key_file" {
  type        = string
  description = "Path to public key file"
  default     = "data/id_rsa.pub"
  # if empty, will default to ${path.cwd}/data/id_rsa.pub
}

variable "private_key_file" {
  type        = string
  description = "Path to private key file"
  default     = "data/id_rsa"
  # if empty, will default to ${path.cwd}/data/id_rsa
}

variable "private_key" {
  type        = string
  description = "content of private ssh key"
  default     = ""
  # if empty, will read contents of file at var.private_key_file
}

variable "public_key" {
  type        = string
  description = "Public key"
  default     = ""
  # if empty, will read contents of file at var.public_key_file
}

variable "rhel_subscription_username" {
  type    = string
  default = ""
}

variable "rhel_subscription_password" {
  type    = string
  default = ""
}

variable "rhel_subscription_org" {
  type    = string
  default = ""
}

variable "rhel_subscription_activationkey" {
  type    = string
  default = ""
}
variable "rhel_smt" {
  type        = number
  description = "SMT value to set on the quay node. Eg: on,off,2,4,8"
  default     = 4
}

################################################################
### Fips Configuration
################################################################
variable "fips_compliant" {
  type        = bool
  description = "Set to true to enable usage of FIPS for OCP deployment."
  default     = false
}

################################################################
### Extras
################################################################
variable "ssh_agent" {
  type        = bool
  description = "Enable or disable SSH Agent. Can correct some connectivity issues. Default: false"
  default     = false
}

variable "connection_timeout" {
  description = "Timeout in minutes for SSH connections"
  default     = 30
}

variable "dns_forwarders" {
  type    = string
  default = "8.8.8.8; 8.8.4.4"
}

variable "private_network_mtu" {
  type        = number
  description = "MTU value for the private network interface on RHEL and RHCOS nodes"
  default     = 1450
}

variable "ansible_repo_name" {
  default = "ansible-2.9-for-rhel-8-ppc64le-rpms"
}

variable "public_key_name" {
  default = "<none>"
}
############
# Local Variables
locals {
  private_key_file = var.private_key_file == "" ? "${path.cwd}/data/id_rsa" : var.private_key_file
  public_key_file  = var.public_key_file == "" ? "${path.cwd}/data/id_rsa.pub" : var.public_key_file
  private_key      = var.private_key == "" ? file(coalesce(local.private_key_file, "/dev/null")) : var.private_key
  public_key       = var.public_key == "" ? file(coalesce(local.public_key_file, "/dev/null")) : var.public_key
}