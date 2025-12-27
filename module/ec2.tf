module "mywebserver" {
    source = "./modules/webserver"
    image_id = var.image_id
    instance_type = var.instance_type
    key = file("${path.module}/id_rsa.pub")
    key_name = vt_idar.key_name
    subnet_id = var.subne
    security_group_id = aws_security_group.sg-tf.id
}

output mypublicIP {
  value = module.mywebserver.publicIP
}
