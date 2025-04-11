

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDk4/+bLOZvAX1LH+uQDvG4RrQNFquSpO43XIWyZ0P95nar43cCEQ1fT58bXcJbtuxTLmf8ifKUIS1lQcR11eNTkSKhKHlgFGEhF+urLBkrI4rKRJtdt3Q0xUG1zTXs3FeHkU65PxXzDsmqI8UEWqBcNsn0CrPHhWO6OwjfCNUmHHgRudEn3QRndq6djQWWs4+3FgcEhuzPiXLES/ma66mTUmd+ApuGSEwXScBysWQIaW5t1wKB+sGq26V/Vt9jWMu05dQWAHqf/JjsXd+vV6ygjnSLiei60D/KCURqsxAsAlk1f3iGiMFtQVm1XPpRrzwU8E7QcgYFL8w8xYkAofR9B9uN30Ni23pCfxyGTakh1B32cOzHNps5ZGJ7rEdOCj/f1rpz9b6mMw2ExrbBJYtKcCCwBlqcU6pTDqxU0QGpDpIpV66BasDnKE6ZZeGO1WpXm5EoOXwFzLilvNpwxQMl04U0WQidS5wbjaoU15yfNLHmG0BKXQal8aZB6xoWudc="
  description = "ssh-keygen -t ed25519"
}
