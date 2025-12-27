resource "aws_key_pair" "key-tf" {
   key_name = var.key_name
   public_key = var.key
} 

resource "aws_instance" "web" {
    ami = var.image_id
    instance_type = var.instance_type
    key_name = aws_key_pair.key-tf.key_name
    subnet_id = var.subnet_id
    associate_public_ip_address = true
    vpc_security_group_ids = [var.security_group_id]
}
