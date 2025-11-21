from fastapi import FastAPI
from .service import process_data

app = FastAPI()

@app.get("/")
async def read_root():
    return {"Hello": "World"}

@app.get("/items/{item_id}")
async def read_item(item_id: int, q: str | None = None):
    result = await process_data(item_id)
    return {"item_id": item_id, "q": q, "processed": result}

