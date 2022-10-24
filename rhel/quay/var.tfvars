### IBM Cloud details
ibmcloud_api_key    = "<key>"
ibmcloud_region     = "<region>"
ibmcloud_zone       = "<zone>"
service_instance_id = "<cloud_instance_ID>"

# Machine Details
quay = { memory = "16", processors = "1", "count" = 1 }

rhel_image_name = "rhel-8.3"

# PowerVS configuration
processor_type = "shared"
system_type    = "s922"
network_name   = "ocp-net"

rhel_username = "root" #Set it to an appropriate username for non-root user access

public_key_file                 = "data/id_rsa.pub"
private_key_file                = "data/id_rsa"
rhel_subscription_username      = "<subscription-id>"       #Leave this as-is if using CentOS as bastion image
rhel_subscription_password      = "<subscription-password>" #Leave this as-is if using CentOS as bastion image
rhel_subscription_org           = ""                        # Define it only when using activationkey for RHEL subscription
rhel_subscription_activationkey = ""                        # Define it only when using activationkey for RHEL subscription
rhel_smt                        = 4

connection_timeout = 30     # minutes