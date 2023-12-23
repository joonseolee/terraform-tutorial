variable "file_name" {
  default = "step0.txt"
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

resource "local_file" "def" {
  depends_on = [local_file.abc]
  content    = "def!"
  filename   = "${path.module}/def.txt"
}