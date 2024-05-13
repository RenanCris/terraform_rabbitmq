# Terraform EC2 - Configuração Multiambiente

## Descrição

Este projeto Terraform tem como objetivo criar uma instância RabbitMQ na AWS. A estrutura do projeto é projetada para suportar múltiplos ambientes, incluindo desenvolvimento (dev) e homologação (hom), com arquivos de configuração específicos para cada ambiente, como `terraform.dev.tfvars` e `terraform.hom.tfvars`.

## Estrutura do Projeto

```
/nome-terraform-ec2
|-- main.tf
|-- terraform.dev.tfvars
|-- terraform.hom.tfvars
|-- .gitignore
|-- README.md
|-- .env
```

- **main.tf:** Arquivo principal na raiz que define a infraestrutura do broker.

- **terraform.dev.tfvars:** Arquivo de variáveis específicas para o ambiente de desenvolvimento.

- **terraform.hom.tfvars:** Arquivo de variáveis específicas para o ambiente de homologação.

- **.gitignore:** Lista de padrões de arquivos/diretórios a serem ignorados pelo Git.

- **README.md:** Documentação do projeto (este arquivo).

- **.env:** Arquivo para armazenar variáveis de ambiente sensíveis, como AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY e AWS_DEFAULT_REGION.

## Pré-requisitos

Antes de executar o Terraform, certifique-se de ter as variáveis de ambiente AWS configuradas no arquivo `.env`:

```env
# .env
AWS_ACCESS_KEY_ID=seu_access_key_id
AWS_SECRET_ACCESS_KEY=seu_secret_access_key
AWS_DEFAULT_REGION=sua_regiao_preferida
```

OBS: Para execução no **WINDOWS** => EXECUTAR **set-env.ps1**. Executar o registro das variáveis descritas em **.env**

## Como Executar

-**Inicialize o Terraform:**
Execute o seguinte comando para inicializar o Terraform:

```bash
terraform init
Executar o Terraform para o Ambiente de Desenvolvimento (dev):


terraform workspace new dev
terraform workspace select dev

terraform plan -var-file="terraform.dev.tfvars"
terraform apply -var-file="terraform.dev.tfvars"

Executar o Terraform para o Ambiente de Homologação (hom):


terraform workspace new hom
terraform workspace select hom
terraform plan -var-file="terraform.hom.tfvars"
terraform apply -var-file="terraform.hom.tfvars"
```


## Variáveis por ambiente
    
prefix_enviroment = "Dev"

# VPC
cidr_block_vpc = ""

# Sucurity Group
name_security_group = "meu-security-group"

# RabbitMQ
instance_type     = "mq.m5.large"
rabbitmq_user     = "admin"
rabbitmq_password = ""
