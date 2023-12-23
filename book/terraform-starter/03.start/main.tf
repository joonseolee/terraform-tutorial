variable "file_name" {
  default = "step6.txt"
}

resource "local_file" "abc" {
  content  = "lifecycle~~222!"
  filename = "${path.module}/${var.file_name}"

  lifecycle {
    precondition {
      condition     = var.file_name == "step6.txt"
      error_message = "file name is not \"step06.txt\""
    }
  }
}

output "file_id" {
  value = local_file.abc.id
}

output "file_abspath" {
  value = abspath(local_file.abc.filename)
}

resource "local_file" "def" {
  depends_on = [local_file.abc]
  content    = "def!"
  filename   = "${path.module}/def.txt"
}

variable "names" {
  type = list(string)
  default = [ "a", "b", "c" ]
}

resource "local_file" "name_index_file" {
  count = length(var.names)
  content = "looping!"
  filename = "${path.module}/abc-${count.index}.txt"
}

resource "local_file" "name_file" {
  count = length(var.names)
  content = "looping!"
  filename = "${path.module}/abc-name-${element(var.names, count.index)}.txt"
}

variable "members" {
  type = map(object({
    role = string
  }))

  default = {
    "ab" = {
      role = "member", group = "dev"
    }
    "cd" = {
      role = "admin", group = "dev"
    }
    "ef" = {
      role = "member", group = "ops"
    }
  }
}

output "A_to_tuple" {
  value = [for k, v in var.members: "${k} is ${v.role}"]
}

output "B_get_only_role" {
  value = {
    for name, user in var.members: name => user.role
    if user.role == "admin"
  }
}

output "C_group" {
  value = {
    for name, user in var.members: user.role => name...
  }
}