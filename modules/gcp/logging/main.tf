variable "sink_name" { type=string }
variable "destination" { type=string }
variable "filter" { type=string default="" }
resource "google_logging_project_sink" "this" { name=var.sink_name destination=var.destination filter=var.filter unique_writer_identity=true }
output "writer_identity" { value=google_logging_project_sink.this.writer_identity }
