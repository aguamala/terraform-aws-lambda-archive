variable "lambda_name" {
    description = "Lambda function name"
}

variable "lambda_requirements" {
    description = "Lambda function requirements"
    default = "requirements.txt"
}

variable "lambda_path" {
    description = "Lambda function path"
    default = ""
}

variable "lambda_archive_path" {
    description = "Lambda function archive path"
    default = ""
}

variable "lambda_runtime" {
    description = "Lambda function runtime"
}

variable "lambda_script" {
    description = "Lambda function script file trigger"
    default = "main.py"
}

