from fastapi import FastAPI
from prometheus_client import start_http_server, Summary
import time
import random

app = FastAPI()
REQUEST_TIME = Summary('request_processing_seconds', 'Time spent processing request')

@app.get("/")
@REQUEST_TIME.time()
def read_root():
    time.sleep(random.uniform(0.1, 0.5))  # Simulate random latency
    return {"Hello": "World"}

if __name__ == "__main__":
    import uvicorn
    start_http_server(8000)  # Metrics at :8000/metrics
    uvicorn.run(app, host="0.0.0.0", port=80)

