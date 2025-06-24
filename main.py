import functions_framework
from google.cloud import storage
from datetime import datetime

@functions_framework.http
def write_to_storage(request):
    client = storage.Client()
    bucket = client.bucket("shivani-project-logs-12345")  # Use your bucket name
    blob = bucket.blob(f"logs/hello_{datetime.now().isoformat()}.txt")
    blob.upload_from_string("Hello, Shivani! Triggered by Cloud Scheduler.")
    return "Done", 200
