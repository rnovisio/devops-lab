import os
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {"message": "hello from devops-lab", "version": os.getenv("APP_VERSION", "1")}

@app.get("/health")
def health():
    return {"status": "ok"}
