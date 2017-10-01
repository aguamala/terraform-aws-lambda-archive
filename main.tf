
#--------------------------------------------------------------
# zip lambda function
#--------------------------------------------------------------
resource "null_resource" "zip_lambda" {
  provisioner "local-exec" {
    command = "bash ${path.module}/scripts/package.sh ${var.lambda_name} ${var.lambda_runtime} ${path.cwd} ${var.lambda_path} ${var.lambda_script} ${var.lambda_archive_path}"
  }

  triggers {
    lambda_script_requirements = "${base64sha256(file("${var.lambda_path}${var.lambda_requirements}"))}"
    lambda_script              = "${base64sha256(file("${var.lambda_path}${var.lambda_script}"))}"
  }
}

