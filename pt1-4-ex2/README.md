# VPC y Subredes con Terraform  
![](/pt1-4-ex2/assets/topologia.png)  
En **_AWS_** crearemos una **VPC** con **3 subredes**:  
- VPC_Terraform: 10.0.0.0/16
   - Subnet_A: 10.0.32.0/25
   - Subnet_B: 10.0.30.0/23
   - Subnet_C: 10.0.33.0/28  

![](/pt1-4-ex2/assets/vpc_subnets.png)  
Cada subred tendra 2 instancias **EC2** assignadas:  
- Subnet_A
   - ServersDylan1
   - ServersDylan2
- Subnet_B
   - AdminDylan1
   - AdminDylan2
- Subnet_C
   - WebDylan1
   - WebDylan2  
En total son 6 instancias EC2 de tipo t3.micro
![](/pt1-4-ex2/assets/ec2_instances.png)  